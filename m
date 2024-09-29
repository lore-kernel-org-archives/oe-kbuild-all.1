Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA3074059
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 18:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727636397; cv=none; b=HNgDmIYrX5WvBVEy02FXtTnn5CoB+3tJ1mjiH+GBcb3++KST9omruR1xuMig0Men+vp/1RAdQSUT8T8EjFKiwGTWCN0dm2aYdiH5oN6jLUbizndiWKjznMZS8xuUxSMy9tBzSEdETglV3MDoVtvk9kgzrfNIyBHI5lBntdiPqI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727636397; c=relaxed/simple;
	bh=QPgjsQEyr7pgL0eQT4IpJumxLkUK23fjEJZiM5W2OFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XmEYeZnVOY4EFGONf7exEkL39vnDerUb5dO8qYgvd9y5Z63ns3u/YCKZLPlYs7/taeU92lcsf7PxwDE6bX9YH7lIlquZ011xH8VAzAbJzbRgPT66G2Ca4G0ihSkHhQ5DSWX3SQ63s2MuFhFFvlH5bw1ZfbPk7o7SLHw9ZmQZP18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzzvXUHL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzzvXUHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727636396; x=1759172396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPgjsQEyr7pgL0eQT4IpJumxLkUK23fjEJZiM5W2OFs=;
  b=fzzvXUHLOMSiCLSXTcPPrmqSwcp2fLnn2o+cZTVsP9HI/jkPC3wHxdEj
   ZIEE+Oon72uEaFaeUx/v9zbLrJMS5Z/2Rg0ngafzFIWP1+uEN896AzHcE
   lsJI22d1LoarRe5GQwDQRoB9kSnt6ZUxUgr+ej7s0bes1pVD7UjJMs6iQ
   kT8RgzLWVSKX5pQ3rtE/AdSC4trznAUNrSWx0yj3E/pB07N1tloUl9OfB
   6aSVyqkNJ6te1vhfkpNT9/FCH342OJuueV266mO9FNk5VZcZNxi3wysEB
   lFXJCFPR/mvjZesinx2WsJtFwim2Lg2sSVIoPivylD2XGgTuKKpJCdfw+
   w==;
X-CSE-ConnectionGUID: +pmoGzwJQdex1KG+MWDmkQ==
X-CSE-MsgGUID: iLXtKWVWQJCeiaEBpda6Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26881213"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26881213"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 11:59:50 -0700
X-CSE-ConnectionGUID: Y5cW0XJuRNa+9s9bmoRkGg==
X-CSE-MsgGUID: /fkpNVWSTQGGZkG7233V5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="77894015"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2024 11:59:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suz90-000OcJ-10;
	Sun, 29 Sep 2024 18:59:46 +0000
Date: Mon, 30 Sep 2024 02:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2675/16788]
 drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous
 prototype for function 'max11801_read_adc'
Message-ID: <202409300219.ZNFv1zR7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: f101b55a17f7b5d6a8feb0c4105138cc57c0cec6 [2675/16788] MLK-11703-1: input: touchscreen: max11801_ts: Add DCM mode for max11801 ADC
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240930/202409300219.ZNFv1zR7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300219.ZNFv1zR7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300219.ZNFv1zR7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous prototype for function 'max11801_read_adc' [-Wmissing-prototypes]
     148 | u32 max11801_read_adc(void)
         |     ^
   drivers/input/touchscreen/max11801_ts.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     148 | u32 max11801_read_adc(void)
         | ^
         | static 
   1 warning generated.


vim +/max11801_read_adc +148 drivers/input/touchscreen/max11801_ts.c

   147	
 > 148	u32 max11801_read_adc(void)
   149	{
   150		u32 adc_data;
   151	
   152		if (!max11801_client) {
   153			pr_err("FAIL  max11801_client not initialize\n");
   154			return -1;
   155		}
   156		adc_data = max11801_dcm_sample_aux(max11801_client);
   157	
   158		return adc_data;
   159	}
   160	EXPORT_SYMBOL_GPL(max11801_read_adc);
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
