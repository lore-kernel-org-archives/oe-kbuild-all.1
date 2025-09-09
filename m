Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533EF219A86
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 03:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757389718; cv=none; b=sQhsv00BCCmrldX4qg1WhUja3a1mfLAgZhiKZqISyyTiQ5CTSPp1Lb3WRCunE1OIPxndj0ekOUmlXbTQJHzTM7WIwjCr3iJEFwvJSPXut7S1Bkh5lnrOOF5BstpZ43n9nqhEoXAXBXXCliJp4Y0EQe7QY7ghuEWGQ15LM7NQ9Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757389718; c=relaxed/simple;
	bh=6ZF2IbQUBqLBbgy/XTVznBMuJGVlXWVn2ITum77v/oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlhnwJG7dhHI/7lwkrVVr3Ok+hrdd98bBi3ijB6n7VIzoVGmy2L84x56oRsUUknj9e7IYEAbR9+Sf/2m++hFxPVgaAisnwy47kZCIbDfS6IUhiGTPaT6PzRzP54SSQpYEy8dXYrPQs0/XAx+OioN0B1TeEnCrrCm2t/h17iNprQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXJSHbOS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXJSHbOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757389716; x=1788925716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ZF2IbQUBqLBbgy/XTVznBMuJGVlXWVn2ITum77v/oM=;
  b=DXJSHbOSMEIYI3A4k2ZrKv/+YMIE5NT+gjaL2gLOVXymxuz0EWnWEiED
   V+ywLDiXsUiHyBJgwfBddIruXGnhvOSrbTbGzUoN/k4ydVS6PhNDajC0l
   AfKsMawuXk2wsz5YeiWabnHI5nUvd16dVX4blm3l+hochIJoe80XKML98
   eOag2r2me3vUkqCV65Yy2RPCA2gmk2BCqGrcH047szKS7LYNpL2aUHNpw
   xGcNH2fJB7/Q1pGoQLrtLKKM1hLYr/FsHSJMdSumhOu0RIw8ekcR5JhmH
   fFuD+d5/aNgAAvvE/BSfoAO8BPLZanxfBdCqLkxNmH34oa0dx1OeyU0eQ
   A==;
X-CSE-ConnectionGUID: E/K1OCQhRV2nCs4D2Dj51w==
X-CSE-MsgGUID: UBB+vLS8QLua5OJN1Mx3Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58877401"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="58877401"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 20:48:36 -0700
X-CSE-ConnectionGUID: AdcnYy/vRhOvHu84U5P6Qg==
X-CSE-MsgGUID: 6Rfws4pPTdiOFkPcz6P/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="173767554"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2025 20:48:35 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvpLM-0004Ox-2P;
	Tue, 09 Sep 2025 03:48:32 +0000
Date: Tue, 9 Sep 2025 11:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/6] ASoC: cs-amp-lib-test: Add test for getting cal data
 from HP EFI
Message-ID: <202509091137.N4knO3B6-lkp@intel.com>
References: <20250908155842.599459-7-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908155842.599459-7-rf@opensource.cirrus.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.17-rc5 next-20250908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/ASoC-cs-amp-lib-Rename-defines-for-Cirrus-Logic-EFI/20250909-000445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250908155842.599459-7-rf%40opensource.cirrus.com
patch subject: [PATCH 6/6] ASoC: cs-amp-lib-test: Add test for getting cal data from HP EFI
config: x86_64-buildonly-randconfig-005-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091137.N4knO3B6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091137.N4knO3B6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091137.N4knO3B6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/cs-amp-lib-test.c: In function 'cs_amp_lib_test_get_hp_efi_cal':
>> sound/soc/codecs/cs-amp-lib-test.c:259:13: warning: variable 'target_uid' set but not used [-Wunused-but-set-variable]
     259 |         u64 target_uid;
         |             ^~~~~~~~~~


vim +/target_uid +259 sound/soc/codecs/cs-amp-lib-test.c

   253	
   254	/* Get cal data block from HP variable. */
   255	static void cs_amp_lib_test_get_hp_efi_cal(struct kunit *test)
   256	{
   257		struct cs_amp_lib_test_priv *priv = test->priv;
   258		struct cirrus_amp_cal_data result_data;
 > 259		u64 target_uid;
   260		int ret;
   261	
   262		cs_amp_lib_test_init_dummy_cal_blob(test, 2);
   263	
   264		kunit_activate_static_stub(test,
   265					   cs_amp_test_hooks->get_efi_variable,
   266					   cs_amp_lib_test_get_hp_cal_efi_variable);
   267	
   268		target_uid = cs_amp_lib_test_get_target_uid(test);
   269		ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, 0, &result_data);
   270		KUNIT_EXPECT_EQ(test, ret, 0);
   271	
   272		KUNIT_EXPECT_MEMEQ(test, &result_data, &priv->cal_blob->data[0], sizeof(result_data));
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
