Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DC34AB3AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637690; cv=none; b=Sn9Z2mCaxknVH69tiaUpd48TU20wk9QqucjS5tv5on+SURueIzI+wUg7O2s9Au/nkkH9ieFGcUtvLNIfngYxbvizCkl2DgPXamzjUBPTdeIHQsph+y4kIcRbsXIjMcyhvp1JhUSpxxPIzGr6VnJzueppKR9AFh8Z7ZhO/N4xilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637690; c=relaxed/simple;
	bh=FGNo5QxWE28WVaYBEt1/ZSkgCWtFvkM6Ytp/mHzI8ko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PceL4jlJGTWr06Fdm5vgcmaygsS2XEVNgMNGS1hu1xyrzuXWylY4HrOyqscep9ePkt3G02lEtjonx6vVS4C2F55lGu4kJA76mxdzkBED6qG8FBkeInimpMh+LoGm3mCVx3yWf4UQPL28bVw+1kUA3ZtWuZjBLXFPbL+ctnMwRRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Exeto+eX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Exeto+eX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789637669; x=1821173669;
  h=date:from:to:cc:subject:message-id;
  bh=FGNo5QxWE28WVaYBEt1/ZSkgCWtFvkM6Ytp/mHzI8ko=;
  b=Exeto+eX84+6Ox29Xx/YiWgeBA8GzRkyiZWPC3b2CLG+UTgkqxj3l6hm
   hZSgFcA/Z+2hb3ILVi3gHuAGcmbpSQOlFJ8hW/MsJtqT6AJOUoBb6CQN9
   ocwTfK3qEH9PBadRzucjJpMeOFwdjjwcrzcq7BAxFM59YC4MGcslBMACZ
   ty2YzDeiWtx9JJqIFRXiA/PknpPd1xcn/6MySrraRn/PIO6/BLXQzyp7v
   bIoFDE69IRDuIRG+wpyPhVi9L+z6VYSrBso2VXGRWWWFzwDv7mZ+qYdw5
   KdCFD6ncoJSA7oenCsZtKd6+AX0I5NjlU1A9OolzACvxeNla6MpoPArsu
   A==;
X-CSE-ConnectionGUID: YBB19timR8Krg35VyDkPzw==
X-CSE-MsgGUID: gSx/iBQHS2WxktVkWAYA2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88977041"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88977041"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:34:22 -0700
X-CSE-ConnectionGUID: vlbBWb9STaqNrPZenFIx2w==
X-CSE-MsgGUID: CLQlSQ9kRpCDdef5Cx5w0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297167386"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2026 02:34:20 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x78VW-000000000XA-1t7Z;
	Thu, 17 Sep 2026 09:34:18 +0000
Date: Thu, 17 Sep 2026 11:33:42 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] kismet: WARNING: unmet
 direct dependencies detected for SND_HDA_ALIGNED_MMIO when selected by
 GKI_HIDDEN_SND_CONFIGS
Message-ID: <202609171144.JOJ4SjYI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e79b240621d00138a771678eb0b1728f4351c23d
commit: 7ae1ce18e14d5a7eea5e69e2c3ce9c4316ee4a04 [3/3] ANDROID: Enable SND HDA ALIGNED MMIO
config: i386-kismet-CONFIG_SND_HDA_ALIGNED_MMIO-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260917/202609171144.JOJ4SjYI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260917/202609171144.JOJ4SjYI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171144.JOJ4SjYI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_HDA_ALIGNED_MMIO when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for SND_HDA_ALIGNED_MMIO
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
