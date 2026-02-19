Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB6519F40B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 00:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771461267; cv=none; b=G/WnBbmAfLPloP0+XwNXHEJq9xyrm0YZ8iShkwlTxzcYcWWXjq49akvtw0Cceqv4gAdgRjlrQAu/K/FWDw1YBemH4RALzSHle3WooWCBaiWNK/ELBWHbtXeTzYk1zD8U39M5wRTJoBrABHpsDy+cZAwMVXpIRM3fXX5pHsgApok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771461267; c=relaxed/simple;
	bh=ZZV3AnFP7tDa04xSdYe32lxB1P4mwYORB2B+xjnF+rs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=br06nWDwJtGlxZWr55yFZU5gQRijYQgQA0rXqT9nlVFn/OepR4dP26YLbnfRtpY6fJP+KRRKmg6XtFxzj87qGlthvpixNz9ZuhNXECNSJRUkL0bvId9X88GrH+WHxpsltjsA5NAtWNvAZ7urH5tbkfW0/ialtvx7pwvVIpwlftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWyjVl0G; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWyjVl0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771461266; x=1802997266;
  h=date:from:to:cc:subject:message-id;
  bh=ZZV3AnFP7tDa04xSdYe32lxB1P4mwYORB2B+xjnF+rs=;
  b=fWyjVl0GHkQnflbZIE9PYVc/fONdPmSIP2WoFhX0uGWcITDUr2RlUIlC
   vJ7Yob4FbPsaJeBtTWIQNt29drlrTS/JLWX7fRpyev4Cs5HnNB/mz9rDV
   Eqjs3Oh9g5XHaQcY3lUU8Rk69c1295FhJMEN1aVnF+Fa8DDVHyrnGA95L
   FpkwYKoNWv8bPtRF+OgDk3HmFMTfcbawXUnZF+BSb1UgPxyclK4YIoxSI
   IX+eoyILOeA6ihO80OmwtLEcvWBj55Je5N2nzlSqUUTA7/YgGfM7wfXvF
   Ma/NIGqVXS92e/PmYq2M2ugqus7BVTJGDTlRNGOusS4Y5SE8EjX7H15st
   w==;
X-CSE-ConnectionGUID: GY6wEL5PQ2yeYZJszW02zg==
X-CSE-MsgGUID: yqrVCp4MTYKfFNRrXtGUvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72450019"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72450019"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 16:34:15 -0800
X-CSE-ConnectionGUID: zjWzOzDSRmyi1SEgqITgrw==
X-CSE-MsgGUID: 2IHiNfjFSRWsI0kgxjD0+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="213082428"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Feb 2026 16:34:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsrzg-000000012po-0JAe;
	Thu, 19 Feb 2026 00:34:12 +0000
Date: Thu, 19 Feb 2026 08:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 9/27]
 drivers/input/touchscreen/wdt87xx_i2c.c:40: warning: "PG_SIZE" redefined
Message-ID: <202602190840.4CiM96V6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   1903e57e83c0c0526b0ee193ce32e6aac90863af
commit: 87ea5e388f0115d9a2ba856cf4d2fecb9880a845 [9/27] mm: Introduce PG_SIZE, PG_SHIFT and PG_MASK
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602190840.4CiM96V6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190840.4CiM96V6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190840.4CiM96V6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/wdt87xx_i2c.c:40: warning: "PG_SIZE" redefined
      40 | #define PG_SIZE                         0x1000
         | 
   In file included from arch/nios2/include/asm/page.h:21,
                    from arch/nios2/include/asm/processor.h:22,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/input/touchscreen/wdt87xx_i2c.c:12:
   include/vdso/page.h:34: note: this is the location of the previous definition
      34 | #define PG_SIZE         (_AC(1,UL) << CONFIG_PG_SHIFT)
         | 


vim +/PG_SIZE +40 drivers/input/touchscreen/wdt87xx_i2c.c

3e30c11c8a902d HungNien Chen 2015-06-15  39  
3e30c11c8a902d HungNien Chen 2015-06-15 @40  #define PG_SIZE				0x1000
3e30c11c8a902d HungNien Chen 2015-06-15  41  #define MAX_RETRIES			3
3e30c11c8a902d HungNien Chen 2015-06-15  42  

:::::: The code at line 40 was first introduced by commit
:::::: 3e30c11c8a902de350281a0d821e17cdb45ef156 Input: add a driver for wdt87xx touchscreen controller

:::::: TO: HungNien Chen <hn.chen@weidahitech.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
