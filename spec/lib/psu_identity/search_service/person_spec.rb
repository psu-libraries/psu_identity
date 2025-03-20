# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PsuIdentity::SearchService::Person do
  describe '#psu_id' do
    subject { described_class.new('psuid' => 'abc123') }

    its(:psu_id) { is_expected.to eq('abc123') }
  end

  describe '#user_id' do
    subject { described_class.new('userid' => 'abc123') }

    its(:user_id) { is_expected.to eq('abc123') }
  end

  describe '#cpr_id' do
    subject { described_class.new('cprid' => 'abc123') }

    its(:cpr_id) { is_expected.to eq('abc123') }
  end

  describe '#given_name' do
    subject { described_class.new('givenName' => 'abc123') }

    its(:given_name) { is_expected.to eq('abc123') }
  end

  describe '#middle_name' do
    subject { described_class.new('middleName' => 'abc123') }

    its(:middle_name) { is_expected.to eq('abc123') }
  end

  describe '#family_name' do
    subject { described_class.new('familyName' => 'abc123') }

    its(:family_name) { is_expected.to eq('abc123') }
  end

  describe '#honorific_suffix' do
    subject { described_class.new('honorificSuffix' => 'abc123') }

    its(:honorific_suffix) { is_expected.to eq('abc123') }
  end

  describe '#preferred_given_name' do
    context 'when preferredGivenName is present' do
      subject { described_class.new('preferredGivenName' => 'abc123', 'givenName' => 'def321') }

      its(:preferred_given_name) { is_expected.to eq('abc123') }
    end

    context 'when preferredGivenName is not present' do
      context 'when givenName is not present' do
        subject { described_class.new }

        its(:preferred_given_name) { is_expected.to be_nil }
      end

      context 'when givenName is present' do
        subject { described_class.new('givenName' => 'abc123') }

        its(:preferred_given_name) { is_expected.to eq('abc123') }
      end
    end

    context 'when preferredGivenName is an empty string' do
      context 'when givenName is not present' do
        subject { described_class.new('preferredGivenName' => '') }

        its(:preferred_given_name) { is_expected.to be_nil }
      end

      context 'when givenName is present' do
        subject { described_class.new('preferredGivenName' => '', 'givenName' => 'abc123') }

        its(:preferred_given_name) { is_expected.to eq('abc123') }
      end
    end
  end

  describe '#preferred_middle_name' do
    context 'when preferredMiddleName is present' do
      subject { described_class.new('preferredMiddleName' => 'abc123', 'middleName' => 'def321') }

      its(:preferred_middle_name) { is_expected.to eq('abc123') }
    end

    context 'when preferredMiddleName is not present' do
      context 'when middleName is not present' do
        subject { described_class.new }

        its(:preferred_middle_name) { is_expected.to be_nil }
      end

      context 'when middleName is present' do
        subject { described_class.new('middleName' => 'abc123') }

        its(:preferred_middle_name) { is_expected.to eq('abc123') }
      end
    end

    context 'when preferredMiddleName is an empty string' do
      context 'when middleName is not present' do
        subject { described_class.new('preferredMiddleName' => '') }

        its(:preferred_middle_name) { is_expected.to be_nil }
      end

      context 'when middleName is present' do
        subject { described_class.new('preferredMiddleName' => '', 'middleName' => 'abc123') }

        its(:preferred_middle_name) { is_expected.to eq('abc123') }
      end
    end
  end

  describe '#preferred_family_name' do
    context 'when preferredFamilyName is present' do
      subject { described_class.new('preferredFamilyName' => 'abc123', 'familyName' => 'def321') }

      its(:preferred_family_name) { is_expected.to eq('abc123') }
    end

    context 'when preferredFamilyName is not present' do
      context 'when familyName is not present' do
        subject { described_class.new }

        its(:preferred_family_name) { is_expected.to be_nil }
      end

      context 'when familyName is present' do
        subject { described_class.new('familyName' => 'abc123') }

        its(:preferred_family_name) { is_expected.to eq('abc123') }
      end
    end

    context 'when preferredFamilyName is an empty string' do
      context 'when familyName is not present' do
        subject { described_class.new('preferredFamilyName' => '') }

        its(:preferred_family_name) { is_expected.to be_nil }
      end

      context 'when familyName is present' do
        subject { described_class.new('preferredFamilyName' => '', 'familyName' => 'abc123') }

        its(:preferred_family_name) { is_expected.to eq('abc123') }
      end
    end
  end

  describe '#preferred_honorific_suffix' do
    context 'when preferredHonorificSuffix is present' do
      subject { described_class.new('preferredHonorificSuffix' => 'abc123', 'honorificSuffix' => 'def321') }

      its(:preferred_honorific_suffix) { is_expected.to eq('abc123') }
    end

    context 'when preferredHonorificSuffix is not present' do
      context 'when honorificSuffix is not present' do
        subject { described_class.new }

        its(:preferred_honorific_suffix) { is_expected.to be_nil }
      end

      context 'when honorificSuffix is present' do
        subject { described_class.new('honorificSuffix' => 'abc123') }

        its(:preferred_honorific_suffix) { is_expected.to eq('abc123') }
      end
    end

    context 'when preferredHonorificSuffix is an empty string' do
      context 'when honorificSuffix is not present' do
        subject { described_class.new('preferredHonorificSuffix' => '') }

        its(:preferred_honorific_suffix) { is_expected.to be_nil }
      end

      context 'when honorificSuffix is present' do
        subject { described_class.new('preferredHonorificSuffix' => '', 'honorificSuffix' => 'abc123') }

        its(:preferred_honorific_suffix) { is_expected.to eq('abc123') }
      end
    end
  end

  describe '#university_email' do
    subject { described_class.new('universityEmail' => 'abc123') }

    its(:university_email) { is_expected.to eq('abc123') }
  end

  describe '#other_email' do
    subject { described_class.new('otherEmail' => 'abc123') }

    its(:other_email) { is_expected.to eq('abc123') }
  end

  describe '#display_name' do
    subject { described_class.new('displayName' => 'abc123') }

    its(:display_name) { is_expected.to eq('abc123') }
  end

  describe 'active?' do
    context 'when set to "true"' do
      subject { described_class.new('active' => 'true') }

      it { is_expected.to be_active }
    end

    context 'when set to a boolean true' do
      subject { described_class.new('active' => true) }

      it { is_expected.to be_active }
    end

    context 'when set to "false"' do
      subject { described_class.new('active' => 'false') }

      it { is_expected.not_to be_active }
    end

    context 'when set to a boolean false' do
      subject { described_class.new('active' => false) }

      it { is_expected.not_to be_active }
    end
  end

  describe 'conf_hold?' do
    context 'when there is a conf hold' do
      subject { described_class.new('confHold' => 'true') }

      it { is_expected.to be_conf_hold }
    end

    context 'when there is NOT a conf hold' do
      subject { described_class.new('confHold' => 'false') }

      it { is_expected.not_to be_conf_hold }
    end
  end

  describe '#affiliation' do
    context 'when there is an affiliation' do
      subject { described_class.new('affiliation' => ['some affiliation']) }

      its(:affiliation) { is_expected.to eq(['some affiliation']) }
    end

    context 'when there is NO affiliation' do
      its(:affiliation) { is_expected.to be_empty }
    end
  end

  describe '#link' do
    its(:link) { is_expected.to be_an(PsuIdentity::SearchService::AtomicLink) }
  end
end
