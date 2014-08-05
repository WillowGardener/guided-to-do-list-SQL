require 'rspec'
require 'pg'
require 'task'
require 'list'

DB = PG.connect({:dbname => 'to_do_test'})

Rspec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe Task do
  it 'starts off with no tasks' do
    expect(Task.all).to eq []
  end

  it 'is initialized with a name' do
    task = Task.new('learn SQL')
    expect task.to be_an_instance_of Task
  end

  it 'tells you its name' do
    task = Task.new('learn SQL')
    expect task.name.to eq 'learn SQL'
  end

  it 'lets you save tasks to the database' do
    task = Task.new('learn SQL')
    task.save
    expect Task.all.to eq [task]
  end

  it 'is the same task if it has the same name' do
    task1 = Task.new('learn SQL')
    task2 = task.new('learn SQL')
    expect task1.to eq task2
  end
   it 'is initialized with a name and a list ID' do
    task = Task.new('learn SQL', 1)
    expect task.to be_an_instance_of Task
  end

  it 'tells you its name' do
    task = Task.new('learn SQL', 1)
    expect task.name.to eq 'learn SQL'
  end

  it 'tells you its list ID' do
    task = Task.new('learn SQL', 1)
    expect task.list_id.to eq 1
  end

  it 'starts off with no tasks' do
    expect Task.all.to eq []
  end

  it 'lets you save tasks to the database' do
    task = Task.new('learn SQL', 1)
    task.save
    expect Task.all.to eq [task]
  end

  it 'is the same task if it has the same name and ID' do
    task1 = Task.new('learn SQL', 1)
    task2 = Task.new('learn SQL', 1)
    expect task1.to eq task2
  end
end

describe List do
  it 'starts off with no lists' do
    expect List.all.to eq []
  end

  it 'is initialized with a name' do
    list = List.new('Epicodus stuff')
    expect list.name.to be_an_instance_of List
  end

  it 'tells you its name' do
    list = List.new('Epicodus stuff')
    expect list.name.to eq 'Epicodus stuff'
  end

  it 'is the same list if it has the same name' do
    list1 = List.new('yo mama stuff')
    list2 = List.new('yo mama stuff')
    expect list1.to eq list2
  end

  it 'lets you save lists to the database' do
    list = List.new('learn SQL')
    list.save
    List.all.should eq [list]
  end

  it 'sets its ID when you save it' do
    list = List.new('lear SQL')
    list.save
    expect list.to be_an_instance_of Fixnum
  end

  it 'can be initialized with its database ID' do
    list = List.new('Epicodus stuff', 1)
    expect list.to be_an_instance_of List
  end
end















