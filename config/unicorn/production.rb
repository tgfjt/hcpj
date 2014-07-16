RAILS_ROOT = File.expand_path("../../..", __FILE__)
# RAILS_ROOT = "/var/www/hcpj"

# Number of worker process
worker_processes 3

# listen "#{RAILS_ROOT}/tmp/unicorn.sock", :backlog => 64
# listen 8080, :tcp_nopush
listen "/tmp/unicorn.sock"
#pid "#{RAILS_ROOT}/tmp/pids/unicorn.pid"
pid "/var/www/hcpj/shared/pids/unicorn.pid"

# 60 seconds (the default)
# timeout 30


# By default, the Unicorn Logger will write to stderr.
stderr_path "#{RAILS_ROOT}/log/unicorn.log"
stdout_path "#{RAILS_ROOT}/log/unicorn.log"

preload_app true
# check_client_connection false

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "#{server.config[:pid] }.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end

  sleep 1
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
