Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408911CBE8D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 14:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731853002; cv=none; b=R2b4CxjwW/Mtj12rtf10A5+S9QHMtlpAnNTIZ5c8/9mPrnh1Jv6KpEIl6IVLx7C7CEXigsZvy8GffN9nZM8zpT5O3KdUUb5mSSTno3noMn3EyoC/OcjsLzlVpQ6Cct3q+MCA1t3HuCrigQWuXP0zWDGSTcLBWTVCCl/FrHyZEbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731853002; c=relaxed/simple;
	bh=EXUzlyIBL5JgOOJLPTo2wIb6PqI5xflcc4it6s1E29M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEbUmYV0pErTyQb3KpVg7lJWUKvAPVaTEPrl98cuJZflkvfJaXxNuKZ+wMDL4dGqLLrzu0tAFc5/XqeABrBMqV0mIFpR3LpdGyOCscEXy2YEgcU3RdZjol23yvkZIhXIhyMirvFfXpTG6TpkoRWJUBpNWAtZi5czYzqsLkIpNVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDP9lVV3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDP9lVV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731853002; x=1763389002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EXUzlyIBL5JgOOJLPTo2wIb6PqI5xflcc4it6s1E29M=;
  b=WDP9lVV3MVkt4byyrf1SwEcfDiZEqCR6GTXNHLQxx3AXppgl7GD0hgvH
   naeID3on8BdDC3muGTCAfTO/NBXa3N8dFrRofwTbxO24WgRG//pFv5ugg
   kad4epO/ziKXdb00JDcyYf8kcaRDDKlfSNrrAxPG8X2RZQp/xPfsfuKi3
   F5ORxf/vyFt8frm0D0yQozV3Gv0El50xWUBtfWVX6CJ9tXtbH7R7CfDdm
   kAZT0atNxiF/haVFAbQ1U5sx3W6C7xhstNjwOHHpvyv9+1qz2gBWnahiV
   Tb222sVFDMIMsH4aQJ6xBYgQX+CMIc6ZzroglqBICyhu0rlcwNL1XSltr
   Q==;
X-CSE-ConnectionGUID: pSDhhzRVR9m6Jxc0YQ+DnQ==
X-CSE-MsgGUID: Is17HGtiQkGZBZUHXolsuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49246571"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="49246571"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 06:16:41 -0800
X-CSE-ConnectionGUID: EzkkFkYRT/ah+30aPbVxNg==
X-CSE-MsgGUID: vXr3C8EITpiILJSfsrveEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="93452257"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 06:16:40 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCg4r-0001n9-0z;
	Sun, 17 Nov 2024 14:16:37 +0000
Date: Sun, 17 Nov 2024 22:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 87/119]
 sound/soc/codecs/tas2770.c:172:13: warning: variable 'ret' set but not used
Message-ID: <202411172243.wZyTtHcA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   3a76f715b4795098c50db9f139c961b292cb13a6
commit: b181a019cf62ab12ac884c123d3b1e56f8253c11 [87/119] ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
config: x86_64-buildonly-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241117/202411172243.wZyTtHcA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172243.wZyTtHcA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411172243.wZyTtHcA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/tas2770.c: In function 'sense_event':
>> sound/soc/codecs/tas2770.c:172:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     172 |         int ret = 0;
         |             ^~~


vim +/ret +172 sound/soc/codecs/tas2770.c

   161	
   162	static const struct snd_kcontrol_new isense_switch =
   163		SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 3, 1, 1);
   164	static const struct snd_kcontrol_new vsense_switch =
   165		SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 2, 1, 1);
   166	
   167	static int sense_event(struct snd_soc_dapm_widget *w,
   168	                          struct snd_kcontrol *kcontrol, int event)
   169	{
   170		struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
   171		struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
 > 172		int ret = 0;
   173	
   174		/*
   175		 * Powering up ISENSE/VSENSE requires a trip through the shutdown state.
   176		 * Do that here to ensure that our changes are applied properly, otherwise
   177		 * we might end up with non-functional IVSENSE if playback started earlier,
   178		 * which would break software speaker protection.
   179		 */
   180	
   181		switch (event) {
   182		case SND_SOC_DAPM_PRE_REG:
   183			ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
   184							    TAS2770_PWR_CTRL_MASK,
   185							    TAS2770_PWR_CTRL_SHUTDOWN);
   186			break;
   187		case SND_SOC_DAPM_POST_REG:
   188			ret = tas2770_update_pwr_ctrl(tas2770);
   189			break;
   190		}
   191	
   192		return 0;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
