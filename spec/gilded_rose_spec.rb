require 'gilded_rose.rb'
require 'regular_item.rb'
require 'aged_brie.rb'
require 'legendary_item.rb'
require 'backstage_pass.rb'
require 'conjured_item.rb'

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [RegularItem.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end
end

describe Item do
  let(:item) { Item.new('Plutonium', 10, 10) }

  it "initializes an item with attributes" do
    expect(item.name).to eq('Plutonium')
    expect(item.sell_in).to eq(10)
    expect(item.quality).to eq(10)
  end

  it "prints values for an item object" do
    expect(item.to_s).to eq("Plutonium, 10, 10")
  end
end

describe RegularItem do
  let(:regular_item) { RegularItem.new('Plutonium', 10, 10) }

  it "initializes an item with attributes" do
    expect(regular_item.name).to eq('Plutonium')
    expect(regular_item.sell_in).to eq(10)
    expect(regular_item.quality).to eq(10)
  end

  it "prints values for an item object" do
    expect(regular_item.to_s).to eq("Plutonium, 10, 10")
  end

  it "decreases quality by 1" do
    regular_item.end_of_day_update
    expect(regular_item.quality).to eq(9)
  end

  it "decreases sell_in by 1" do
    regular_item.end_of_day_update
    expect(regular_item.sell_in).to eq(9)
  end

  it "decreases quality twice as fast because of sell_in" do
    item = RegularItem.new('Plutonium', 0, 10)
    item.end_of_day_update
    expect(item.quality).to eq(8)
  end

  it "never makes the quality negative" do
    item = RegularItem.new('Plutonium', 0, 0)
    item.end_of_day_update
    expect(item.quality).to eq(0)
  end
end

describe AgedBrie do
  let(:aged_brie) { AgedBrie.new('', 10, 10) }

  it "initializes an item with attributes" do
    expect(aged_brie.name).to eq('Aged Brie')
    expect(aged_brie.sell_in).to eq(10)
    expect(aged_brie.quality).to eq(10)
  end

  it "prints values for an item object" do
    expect(aged_brie.to_s).to eq("Aged Brie, 10, 10")
  end

  it "increases quality when update occurs" do
    aged_brie.end_of_day_update
    expect(aged_brie.quality).to eq(11)
  end

  it "quality doesn't surpass 50" do
    item = AgedBrie.new('', 0, 50)
    item.end_of_day_update
    expect(item.quality).to eq(50)
  end
end

describe LegendaryItem do
  let(:legendary_item) { LegendaryItem.new('Sulfuras', 10, 10) }

  it "initializes an item with attributes" do
    expect(legendary_item.name).to eq('Sulfuras')
    expect(legendary_item.sell_in).to eq(10)
    expect(legendary_item.quality).to eq(10)
  end

  it "prints values for an item object" do
    expect(legendary_item.to_s).to eq("Sulfuras, 10, 10")
  end

  it "never decreases quality" do
    legendary_item.end_of_day_update
    expect(legendary_item.quality).to eq(10)
  end
end

describe BackstagePass do
  let(:backstage_pass) { BackstagePass.new('Backstage Pass', 10, 10) }

  it "initializes an item with attributes" do
    expect(backstage_pass.name).to eq('Backstage Pass')
    expect(backstage_pass.sell_in).to eq(10)
    expect(backstage_pass.quality).to eq(10)
  end

  it "prints values for an item object" do
    expect(backstage_pass.to_s).to eq("Backstage Pass, 10, 10")
  end

  it "increases quality twice because sell in is 10 days or less" do
    backstage_pass.end_of_day_update
    expect(backstage_pass.quality).to eq(12)
  end

  it "increases quality triple because sell in is 5 days or less" do
    item = BackstagePass.new('Backstage Pass', 5, 10)
    item.end_of_day_update
    expect(item.quality).to eq(13)
  end

  it "drops quality to 0 because concert already passed (sell_in is 0)" do
    item = BackstagePass.new('Backstage Pass', 0, 10)
    item.end_of_day_update
    expect(item.quality).to eq(0)
  end

  it "increases quality by 1 only" do
    item = BackstagePass.new('Backstage Pass', 12, 10)
    item.end_of_day_update
    expect(item.quality).to eq(11)
  end
end

describe ConjuredItem do
  let(:conjured_item) { ConjuredItem.new('Conjured', 10, 10) }

  it "initializes an item with attributes" do
    expect(conjured_item.name).to eq('Conjured')
    expect(conjured_item.sell_in).to eq(10)
    expect(conjured_item.quality).to eq(10)
  end

  it "prints values for an item object" do
    expect(conjured_item.to_s).to eq("Conjured, 10, 10")
  end

  it "decreases quality twice as fast always" do
    conjured_item.end_of_day_update
    expect(conjured_item.quality).to eq(8)
  end
end
