class Human

	def initialize(opts)
		opts.each { |key, val| instance_variable_set("@" + key.to_s, val) }
	end

	def who_are_you?
		questions = [what_is_your_name?, how_old_are_you?,
			what_are_you?, where_are_you?, what_are_your_skills?,
			what_is_your_background?]
		questions.join(" ")
	end

	def what_is_your_name?
		@name ? "My name is #{@name}." : "I don't remember my name."
	end

	def how_old_are_you?
		age = (Date.parse(@birthdate) - Date.today).to_i.abs / 365 if @birthdate
		age ? "I'm #{age} years old." : "I don't remember how old I am."
	end

	def what_is_your_background?
		@bio ? @bio : "I've done nothing up to this point."
	end

	def where_are_you?
		@location ? "I live in #{@location}." : "I'm homeless."
	end

	def what_are_you?
		if @title && @status
			"I'm a #{@title} and am #{@status}."
		elsif @title
			"I'm a #{@title}."
		elsif @status
			"I'm #{@status}."
		else
			"I don't know what I am."
		end
	end

	def what_are_your_skills?
		return "I have no skills." unless @skills
		case @skills.length
		when 1
			"My skill is #{@skills[0]}."
		when 2
			"My skills are #{@skills.join(" and ")}."
		else
			"My skills are #{@skills[0..-2].join(", ")}, and #{@skills[-1]}."
		end
	end

	def what_are_you_good_at?
		@skills ? "I'm good at #{@skills.sample}." : "I'm not good at anything." 
	end

	def are_you_good_at?(skill)
		if @skills && @skills.include?(skill)
			"I am good at #{skill}."
		else
			"I'm not good at #{skill}...yet."
		end
	end

end

name 			= "Dom Kiva-Meyer"
birthdate = "1989-08-04"
title 		= "World-Class Beginner"
status 		= "on the hunt for an awesome job"
skills 		= %w{Ruby Rails JavaScript HTML CSS HAML RSpec SQL TDD BDD} +
						['Pair Programming', 'Web Development', 'Problem Solving', 'Critical Thinking']
location 	= "San Francisco (Singapore, soon)"
bio 			= "Full bio coming soon."

dom = Human.new(name: name, birthdate: birthdate, skills: skills, status: status, bio: bio, location: location, title: title)
dom.who_are_you?