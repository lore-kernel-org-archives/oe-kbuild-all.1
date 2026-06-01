Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B4939DBF5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 20:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344325; cv=none; b=NIW7zhQkIZm1SKEKE4H3q8UCivV2d0/VS32lSqPFGjbAzIIgebsyBLjn3CJldY9iIxmrzIN060b9wIOgEgnctdXR55bot17P/TFgClNJKBD4yxESyilHpjrinyEH8o8PjAS/BLaZGQnLMBirUBJng7PxCn/zu4RNQRv3blhQTNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344325; c=relaxed/simple;
	bh=CrqKyrb62UQvfehyU0fRh+4r5qMklpzrokEIsY9tiak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CT75BDSDXMJN1uVgr80h957JrcDXJPA269WPs5v0uVQRPZ0tN8xvjQpaWVutD6tF/IqJ/w8nsbokEdNTLlgWgNevHO5rtTSWBq09CaRDookdT7i7ldnZQcgQyF5EBq3YF3G9aZNCivojI35Yil7NMyHS63gOWZG5DAoWUUcSXbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjTDg0cw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjTDg0cw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780344320; x=1811880320;
  h=date:from:to:cc:subject:message-id;
  bh=CrqKyrb62UQvfehyU0fRh+4r5qMklpzrokEIsY9tiak=;
  b=DjTDg0cw3+y6JCCpr+AP3Pkj00aNcgi1qvMq8b0svqllimu5rlCnl/7L
   xOUdZ2CxERlIHZeMcq4vS6o8T07OMpl9Vg4C6hi50hPKGIP5gQ70fpVh+
   nWGPOzwIrFM07gvVH0ekkP0Rn7AWtVnLe9vBGqVWG+hcvhQGJekrgQFuq
   ho8GbZQIt9cBRRSlEuo0uqxj2geYdkWC8yDhrXHs+59l1iQ87Gp0AWw0I
   FNSsr1ZSeIwB7tQS4J9TbbWXgPVow/ZiiMO84S3kXm/RKVi2Tv4Aynse2
   /LXTvguZ5rBngcFwmxDTcyt9EQrwh/BG77h/oihG2IjjFxgC7xDMEKU62
   g==;
X-CSE-ConnectionGUID: rgrs1oDTQLy5i/9fuF2WVA==
X-CSE-MsgGUID: kADNrOvfSeaC6zCJZyfEOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81086109"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81086109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 13:05:20 -0700
X-CSE-ConnectionGUID: rIfCShF9QBevOvQVh8lfpg==
X-CSE-MsgGUID: hMdwXD7LQqOarN+7UVvj2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="273949335"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2026 13:05:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU8st-000000001dN-2yUy;
	Mon, 01 Jun 2026 20:05:15 +0000
Date: Mon, 01 Jun 2026 22:05:14 +0200
From: kernel test robot <lkp@intel.com>
To: Yi Sun <yi.sun@unisoc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: lib/test_bitmap.c:238:1: warning:
 'test_bitmap_find_next_zero_area_off' defined but not used
Message-ID: <202606012221.fTAGQ2LM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yi-Sun/lib-bitmap-reduce-the-number-of-goto-again-in-bitmap_find_next_zero_area_off/20260601-194347
head:   9d43b4f4096adb99e0bf97438a68d1a827290326
commit: 9d43b4f4096adb99e0bf97438a68d1a827290326 lib/bitmap: add tests for bitmap_find_next_zero_area_off()
date:   8 hours ago
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260601/202606012221.fTAGQ2LM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012221.fTAGQ2LM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012221.fTAGQ2LM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_bitmap.c:238:1: warning: 'test_bitmap_find_next_zero_area_off' defined but not used [-Wunused-function]
     238 | test_bitmap_find_next_zero_area_off(void)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/test_bitmap_find_next_zero_area_off +238 lib/test_bitmap.c

   236	
   237	static void __init
 > 238	test_bitmap_find_next_zero_area_off(void)
   239	{
   240		int bmap_len = 64 * 3;
   241		DECLARE_BITMAP(bmap, bmap_len);
   242	
   243		bitmap_set(bmap, 0, bmap_len);
   244	
   245		bitmap_clear(bmap, 0, 8);
   246		__clear_bit(50, bmap);
   247		bitmap_clear(bmap, 60, 10);
   248		__clear_bit(80, bmap);
   249		bitmap_clear(bmap, 100, 10);
   250		__clear_bit(120, bmap);
   251		bitmap_clear(bmap, 160, 32);
   252	
   253		expect_eq_uint(0,
   254			bitmap_find_next_zero_area_off(bmap, bmap_len, 0, 8, 0, 0));
   255		expect_eq_uint(60,
   256			bitmap_find_next_zero_area_off(bmap, bmap_len, 1, 8, 0, 0));
   257		expect_eq_uint(60,
   258			bitmap_find_next_zero_area_off(bmap, bmap_len, 0, 10, 0, 0));
   259		expect_eq_uint(160,
   260			bitmap_find_next_zero_area_off(bmap, bmap_len, 0, 32, 0, 0));
   261		expect_eq_uint(1,
   262			!!(bitmap_find_next_zero_area_off(bmap, bmap_len, 0, 33, 0, 0) > bmap_len));
   263	}
   264	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
