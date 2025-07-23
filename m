Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3293A59
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 01:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753235833; cv=none; b=rFypO/huzhLkqIvkUhILswjcyl0VjFchV4Kb079/Ug/VsyIQ/29O7oc7gE7YW9hoK73fR0RnLeQHv+mHfMkTXdkoBiwA44ffpqQaMmoHRebaH1NZxvYVcAZQ0jmYiod1Cbt9fODvZ7iGKT44LvsDKL3/FM//3xJoyQIvYIC5aME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753235833; c=relaxed/simple;
	bh=24xyqbzONlHvRHLMElqfNFIPpciL76CoybG7B6QkpF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VSODx34QVQikyAs2xfquJoF918HwGuplI/PeXVm22IuWgu+cl/4oHQAZkUq2bI0DZQ5yzDISajtH8Y4v717NC2NuhNqDZGITInEwzHbkGdFUJUplzSy6B009tB/PPETabVM6uccTxXSh04f7v9xHP9wA2Gsc6cqRzQXfzE5WhCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqCxJQFf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqCxJQFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753235832; x=1784771832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=24xyqbzONlHvRHLMElqfNFIPpciL76CoybG7B6QkpF8=;
  b=lqCxJQFfpTGeY4+I4sIj3BGlyoHasAU81PcWCHSxEwsSuV1by3/vFi91
   mDopJftBL+CsVvZK7KD6u3Dfo/cMZtIn7NBtAfZgJAmJpaSVnUpg83w5F
   N/tpzgjJcXq99ddepZPvgxBUDf7DDGD2Ek2PezEbexw0LgLyJPtalzMhy
   Miegywqy0R3PeYL0SDjl0JvnnERwqmVQPdglipSsTXNedE8NO1GY4e8FV
   Fgtb0+kaypztsD8woC2sueYGGhETX7vLVevID+df7hUmAqQU80qzs/8jc
   BcvSSXpBnXHe5GcfiPbsWuH0WawQi86+SptNNPWvbd03n2kcST8K2I1ND
   Q==;
X-CSE-ConnectionGUID: 0iPU2zjUQRqdWWRslp5EkA==
X-CSE-MsgGUID: Hz6IV0jhSXWUbEzeflvDRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66074969"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="66074969"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 18:57:11 -0700
X-CSE-ConnectionGUID: aKzW83X7RCSoh1FFIzjE/g==
X-CSE-MsgGUID: /R9CZdhXRyW5dNRTdkFbMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159345453"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jul 2025 18:57:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueOjD-000Irb-2a;
	Wed, 23 Jul 2025 01:57:07 +0000
Date: Wed, 23 Jul 2025 09:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:sheaves-with-microbenchmark 2/13]
 include/linux/kern_levels.h:5:25: warning: format '%llu' expects argument of
 type 'long long unsigned int', but argument 3 has type 'cycles_t' {aka 'long
 unsigned int'}
Message-ID: <202507230908.xZEhJwkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git sheaves-with-microbenchmark
head:   0ccec62a3cdf5cc2dcc69a139babc4f5aeb5284b
commit: 0c4fd4c733964800f18cf161362a82065710473a [2/13] slub_kunit: microbenchmark
config: arm-randconfig-001-20250723 (https://download.01.org/0day-ci/archive/20250723/202507230908.xZEhJwkT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230908.xZEhJwkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230908.xZEhJwkT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/kunit/assert.h:13,
                    from include/kunit/test.h:12,
                    from lib/tests/slub_kunit.c:2:
   lib/tests/slub_kunit.c: In function 'do_bench':
>> include/linux/kern_levels.h:5:25: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'cycles_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:479:25: note: in definition of macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:580:9: note: in expansion of macro 'printk'
     580 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:580:16: note: in expansion of macro 'KERN_INFO'
     580 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   lib/tests/slub_kunit.c:346:17: note: in expansion of macro 'pr_info'
     346 |                 pr_info("iteration: %02d time %llu\n", iter, end - start);
         |                 ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:479:25: note: in definition of macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:580:9: note: in expansion of macro 'printk'
     580 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:580:16: note: in expansion of macro 'KERN_INFO'
     580 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   lib/tests/slub_kunit.c:351:9: note: in expansion of macro 'pr_info'
     351 |         pr_info("average (excl. iter 0): %llu\n", sum / iters);
         |         ^~~~~~~
   lib/tests/slub_kunit.c: In function 'test_bench':
   lib/tests/slub_kunit.c:384:23: warning: variable 'base' set but not used [-Wunused-but-set-variable]
     384 |         unsigned long base;
         |                       ^~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
