Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0465E3CBE6D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966305; cv=none; b=IRrhasaFRcrrtNZGPgETUQbgxpZGK5mCzJcYWg/ZA4wVSUb9AahGZNJK1Yp/37nTMVs5utFEg9ghZG7MFua/mWU93+eqeF0f5Yp9U18h/GNHeTBzCTDzXvPX/TQmSZFhvVJG6ZWn2oyxosH/kwH+JPZqjks6iOBz3eNPEDZrPEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966305; c=relaxed/simple;
	bh=cw2NZRyv0KETdOCkRHCdPTj8XE5TG5K2DD7G2AiUinw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sw2sQR4xgu1SuEbrGgu7uRBjh7l9fGOGk2Wd4uhWtiiLld/VM5GQ42LaaVvHob6TMqiZmUkIAd/eOf42m/v++CQEvr/z/t9fMefAzwyhHKUqrOr66GwUXSAJchltW7BM3+42ub1fbOjKt15mnPTtb+jof3+NLJH0FBCjhgguioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVoovIJr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVoovIJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774966303; x=1806502303;
  h=date:from:to:cc:subject:message-id;
  bh=cw2NZRyv0KETdOCkRHCdPTj8XE5TG5K2DD7G2AiUinw=;
  b=PVoovIJrDNekQ7wgWu4KU3ncFZfL9pF2Ec/u/PNB1VMzny/MeicGoUWC
   Qtpf/U1ddwK2vIhPZmNFkU+R3b9v4IhIPhC5FXxldPU2wze7U7KjHwkyC
   PHNbPikL3ToLpDZEQ/ZMi/rpjxEHqF0NxV7IGsVuJNdbEWy9JzlYNpgl9
   f8/GcI8imu80i4g2ru3qJ8o2sxg8jLA3F1asB6//6sike0BiFsEGKgt/0
   z7z6Ni4swzKkTt1WURlEodMLep1cDquCXLv8xEnDt90xd/QO5crTGzm8n
   CiaP88T4h8MYoW7fC8NAFTCSuOuMkajhJbSic++L0nITTIUmOMjEP4rld
   A==;
X-CSE-ConnectionGUID: eOIHr4OtQlSiwlHTU+a8ZA==
X-CSE-MsgGUID: qrWY7z5ZQ5u6WrGm2ucf4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87056791"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87056791"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:11:42 -0700
X-CSE-ConnectionGUID: xB+wZnhITv2a/zFwjBz3Ng==
X-CSE-MsgGUID: LfvP649ETYSFnhVTWL7MPw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2026 07:11:41 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Zog-000000002kP-1Vgd;
	Tue, 31 Mar 2026 14:11:38 +0000
Date: Tue, 31 Mar 2026 22:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-11 0/1]
 include/sound/tas2781-tlv.h:18:35: warning: 'dvc_tlv' defined but not used
Message-ID: <202603312241.JDu5DmbK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gergo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-11
head:   8afee3a5a02e86617a56f39a05fbdfe3e2d5a469
commit: b999e77ecf3a30e03f023c0acc1d97dbd5d42087 [0/1] ALSA: hda/tas2781: remove digital gain kcontrol
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603312241.JDu5DmbK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312241.JDu5DmbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312241.JDu5DmbK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/sound/tlv.h:10,
                    from sound/pci/hda/tas2781_hda_i2c.c:22:
>> include/sound/tas2781-tlv.h:18:35: warning: 'dvc_tlv' defined but not used [-Wunused-const-variable=]
      18 | static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
         |                                   ^~~~~~~
   include/uapi/sound/tlv.h:53:22: note: in definition of macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      53 |         unsigned int name[] = { \
         |                      ^~~~
   include/sound/tas2781-tlv.h:18:14: note: in expansion of macro 'DECLARE_TLV_DB_SCALE'
      18 | static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +/dvc_tlv +18 include/sound/tas2781-tlv.h

678f38eba1f2fe Shenghao Ding 2023-06-18  17  
678f38eba1f2fe Shenghao Ding 2023-06-18 @18  static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
678f38eba1f2fe Shenghao Ding 2023-06-18  19  static const DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
678f38eba1f2fe Shenghao Ding 2023-06-18  20  

:::::: The code at line 18 was first introduced by commit
:::::: 678f38eba1f2fe33ff700e85390ac98393e609ef ASoC: tas2781: Add Header file for tas2781 driver

:::::: TO: Shenghao Ding <13916275206@139.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
