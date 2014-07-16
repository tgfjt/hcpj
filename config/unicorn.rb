RAILS_ROOT = File.expand_path("../..", __FILE__)

# Number of worker process
worker_processes 3

# listen "#{RAILS_ROOT}/tmp/unicorn.sock", :backlog => 64
# listen 8080, :tcp_nopush
# listen "/tmp/unicorn.sock"
# pid "#{RAILS_ROOT}/shared/pids/unicorn.pid"

# 60 seconds (the default)
# timeout 30


# By default, the Unicorn Logger will write to stderr.
stderr_path "#{RAILS_ROOT}/shared/log/unicorn.log"
stdout_path "#{RAILS_ROOT}/shared/log/unicorn.log"

preload_app true
# check_client_connection false

before_fork do |server, worker|
	old_pid = "#{RAILS_ROOT}/shared/pids/unicorn.pid.oldbin"
	if File.exists?(old_pid) && server.pid != old_pid
		begin
			Process.kill("QUIT", File.read(old_pid).to_i)
		rescue Errno::ENOENT, Errno::ESRCH
		end
	end
end

after_fork do |server, worker|
	defined?(ActiveRecord::Base) and
			ActiveRecord::Base.establish_connection
end