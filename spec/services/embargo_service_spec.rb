require 'spec_helper'

describe Hydra::EmbargoService do
  let(:future_date) { 2.days.from_now }
  let(:past_date) { 2.days.ago }

  let!(:work_with_expired_embargo1) do
    FactoryBot.build(:asset, embargo_release_date: past_date.to_s).tap do |work|
      work.save(validate:false)
    end
  end

  let!(:work_with_expired_embargo2) do
    FactoryBot.build(:asset, embargo_release_date: past_date.to_s).tap do |work|
      work.save(validate:false)
    end
  end

  let!(:work_with_embargo_in_effect) { FactoryBot.create(:asset, embargo_release_date: future_date.to_s)}
  let!(:work_without_embargo) { FactoryBot.create(:asset)}

  describe "#assets_with_expired_embargoes" do
    it "returns an array of assets with expired embargoes" do
      returned_pids = subject.assets_with_expired_embargoes.map {|a| a.pid}
      expect(returned_pids).to include work_with_expired_embargo1.pid,work_with_expired_embargo2.pid
      expect(returned_pids).to_not include work_with_embargo_in_effect.pid,work_without_embargo.pid
    end
  end

  describe "#assets_under_embargo" do
    it "returns all assets with embargo release date set" do
      result = subject.assets_under_embargo
      returned_pids = subject.assets_under_embargo.map {|a| a.pid}
      expect(returned_pids).to include work_with_expired_embargo1.pid,work_with_expired_embargo2.pid,work_with_embargo_in_effect.pid
      expect(returned_pids).to_not include work_without_embargo.pid
    end
  end
end
