def full_backtrace(ex)
  backtrace = String.new
  backtrace_for(ex, backtrace)

  # Avoid circular causes
  causes = {}
  causes[ex] = true

  while (cause = ex.cause) && !causes.key?(cause)
    backtrace_for(cause, backtrace)
    causes[cause] = true
  end

  backtrace
end

def backtrace_for(ex, backtrace)
  trace = ex.backtrace
  return unless trace

  if trace[0]
    backtrace << trace[0]
    backtrace << ': '
    backtrace << ex.message
    backtrace << ' ('
    backtrace << ex.class.to_s
    backtrace << ')'
  end

  if trace[1]
    trace[1..-1].each do |line|
      backtrace << "\n\tfrom "
      backtrace << line
    end
  end

  backtrace << "\n"
end

class Test
  def root
    raise 'root cause'
  end

  def wrapper
    root
  rescue
    raise 'wrapper layer'
  end

  def call
    wrapper
  rescue => e
    e
  end
end

ex = Test.new.call

for _i in 1..3000000 do
  full_backtrace(ex)
end
