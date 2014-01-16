require 'spec_helper'

Person = Struct.new(:name, :age)

describe 'Single local, single example' do
  let_local(:a) { Person.new('Bob', 25) }

  it 'will be 25' do
    expect(a.age).to eq(25)
  end
end

describe 'Single local, multiple example' do
  let_local(:a) { Person.new('Jim', 20) }

  it 'will be 20' do
    expect(a.age).to eq(20)
  end

  it 'will be named Jim' do
    expect(a.name).to eq('Jim')
  end
end

describe 'Single local, multiple nested example, same local name' do
  let_local(:a) { Person.new('Doctor', 900) }

  it 'will be 900' do
    expect(a.age).to eq(900)
  end
  
  it 'will be named Doctor' do
    expect(a.name).to eq('Doctor')
  end

  context 'Doc got old' do
    let_local(:a) { Person.new('Doctor', 1000) }

    it 'should now be 1000' do
      expect(a.age).to eq(1000)
    end

    context 'And older still!' do
      let_local(:a) { Person.new('Doctor', 1100) }

      it 'will now be 1100' do
        expect(a.age).to eq(1100)
      end
    end

    it 'will still be 1000' do
      expect(a.age).to eq(1000)
    end
  end

  it 'will still be 900' do
    expect(a.age).to eq(900)
  end
end