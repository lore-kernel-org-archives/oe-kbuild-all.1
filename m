Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4574E1F611
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkgbG8fo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699031759; x=1730567759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b+58yn4T4OH9fZU6Vrtmuz9/COCZYgeGsBqyTwqBFY8=;
  b=mkgbG8fo4rC4TtNBdpS9YoVbf3XIq85M7F+1/nM+DXzc0bVVjoooPtqW
   7pu5DW8ysyVOvgNxEGndbVRW2K9O/ZaO7FGPGEjgVEpxjY3Xc8Xusx0gj
   kPDoVYPNV6g4TaVcPTF1gQHZLHyXuVfvQU4Ab49/ylLGZyeHsZPQxLYJ2
   LyfiisfUTfYB93aFL3Tw28JvhLCqym7at8T6/46ukPOni9CaWl+3pbMJg
   E5+hV3SrTVBji87PZfKcexXFHZFsCKgRstCORxNVq6PuGv8RrCjzJyHyu
   CxR1indunGUkd6jpjrxnMndGlGlXxwnkrj8J3jr2eajHpiea6uSxB+DxA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="374023453"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="374023453"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 10:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="796682024"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="796682024"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Nov 2023 10:15:57 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyxlz-0002kD-0b;
	Fri, 03 Nov 2023 17:15:55 +0000
Date: Sat, 4 Nov 2023 01:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 64/98] sound/soc/apple/macaudio.c:1026:5:
 warning: no previous prototype for 'macaudio_sss_get'
Message-ID: <202311040047.FU266Qkt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   42d4cb0399b59f4577a8aff577906e3829ff7477
commit: 39926630e338021a106492c609369d74b4419be8 [64/98] ASoC: macaudio: Add 'Speakers Up Indicator' control
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311040047.FU266Qkt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040047.FU266Qkt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040047.FU266Qkt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/apple/macaudio.c:1016:5: warning: no previous prototype for 'macaudio_sss_info' [-Wmissing-prototypes]
    1016 | int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
         |     ^~~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1026:5: warning: no previous prototype for 'macaudio_sss_get' [-Wmissing-prototypes]
    1026 | int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~


vim +/macaudio_sss_get +1026 sound/soc/apple/macaudio.c

  1025	
> 1026	int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1027	{
  1028		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1029		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1030	
  1031		/*
  1032		 * TODO: Check if any locking is in order here. I would
  1033		 * assume there is some ALSA-level lock, but DAPM implementations
  1034		 * of kcontrol ops do explicit locking, so look into it.
  1035		 */
  1036		uvalue->value.integer.value[0] = ma->speakers_streaming;
  1037	
  1038		return 0;
  1039	}
  1040	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
