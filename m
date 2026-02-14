Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB1117B506
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 01:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031042; cv=none; b=jpkGAL1kIcKg8/sOpifJET6CSBGeJCEACcSahVbk8b7aGQx/6UXqaY8w4NTCshchSDrkEgxaio6b1m/Rlb1C8yYuAliaq6e+cks7oKO8mxjiTHHMoPDYUQrPo+dFYHFHsq81lUI1uuQPEUUHSF/7pRtjU/oPL5ZsqB9H7S3IBWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031042; c=relaxed/simple;
	bh=awpRlx+fE7s/2s6HllbVc3OfxBB8juQ0aXvIOSf2Y3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rbwk4GH9Me/Hsos7xji7074OwdpGrgFeuD2ElFQ/nBlmlgbV4hbPKMAhXhpURBMhifIQQglwhqz9eahQSd4WvHt4NHGxNRvXSww5YQr9RG3DGVBBOs6bscbzOmHOC1iZEh3S7aC6X8H3KWbjzhj86oNEZRaC5NZHs4PL0DMmquw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLZhrvh7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLZhrvh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771031039; x=1802567039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=awpRlx+fE7s/2s6HllbVc3OfxBB8juQ0aXvIOSf2Y3M=;
  b=ZLZhrvh7LTxQvj2m2TTsH5vq/8F+3/y1DapcM0giIYtxPQbUEBmdgW9I
   nHyPR/7BA1X7sm/26GrI3bcGopNim101CYOEqGmbKTudMJAoJY++HQWJ7
   6mojK7+w78Pf8XOf7U8UGVogRIHNVWcUJGtHg4vwds/L0r5PiJv6PiY+D
   VyHV+PkuqM/JF/aUNKrwnVvFouv2vLdlUspbtRNzIHClwRwSpUabgGNiG
   X4Fo8SRxjHlVQh6fFRbEpU7JpzQzkKLEGDFmiAO8WSzjYdi07iou+sLp2
   ASB9cwDrwuGkJkGe5VS/qSEQ/rE6g5W2bzwJFmmHDoRIjQCte+GvylUjj
   g==;
X-CSE-ConnectionGUID: G0dKV1ZMTICBPzBaO85AKw==
X-CSE-MsgGUID: SwcNeaXkREa+EqMBAwcnMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72312778"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72312778"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 17:03:59 -0800
X-CSE-ConnectionGUID: qBPk0MHBR+OCsrLUvpcyzg==
X-CSE-MsgGUID: mAhCnL8pTfWWt1dh7ENXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="211725997"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 17:03:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr44h-00000000w0e-0BQv;
	Sat, 14 Feb 2026 01:03:55 +0000
Date: Sat, 14 Feb 2026 09:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Paoloni <gpaoloni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 6/6] char: mem: add Kconfig option for devmem
 KUnit tests
Message-ID: <202602140816.WdBObaxN-lkp@intel.com>
References: <20260212124923.222484-7-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212124923.222484-7-gpaoloni@redhat.com>

Hi Gabriele,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus lwn/docs-next shuah-kselftest/kunit shuah-kselftest/kunit-fixes linus/master v6.19 next-20260213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Paoloni/Documentation-extend-the-Function-documentation-with-expected-behavior-and-constraints-of-use/20260212-205315
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260212124923.222484-7-gpaoloni%40redhat.com
patch subject: [RFC PATCH v3 6/6] char: mem: add Kconfig option for devmem KUnit tests
config: arc-randconfig-r073-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140816.WdBObaxN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140816.WdBObaxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140816.WdBObaxN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/char/mem_kunit_test.c: In function 'edge_to_allowed_pair':
>> drivers/char/mem_kunit_test.c:351:2: error: label at end of compound statement
     351 |  default:
         |  ^~~~~~~
   drivers/char/mem_kunit_test.c: In function 'edge_requires_restricted':
   drivers/char/mem_kunit_test.c:364:2: error: label at end of compound statement
     364 |  default:
         |  ^~~~~~~
   drivers/char/mem_kunit_test.c: In function 'pick_mixed_policy_phys_addr':
>> drivers/char/mem_kunit_test.c:427:8: error: implicit declaration of function 'valid_phys_addr_range' [-Werror=implicit-function-declaration]
     427 |   if (!valid_phys_addr_range(start, count))
         |        ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/mem_kunit_test.c: In function 'pick_phys_addr_type':
>> drivers/char/mem_kunit_test.c:577:40: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     577 |   walk_iomem_res_desc(IORES_DESC_NONE, (u64)~0ULL, IORESOURCE_MEM, IORES_DESC_NONE,
         |                                        ^~~~~~~~~~
   drivers/char/mem_kunit_test.c:584:40: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     584 |   walk_iomem_res_desc(IORES_DESC_NONE, (u64)~0ULL, IORESOURCE_MEM, IORES_DESC_NONE,
         |                                        ^~~~~~~~~~
   In file included from include/kunit/assert.h:13,
                    from include/kunit/test.h:12,
                    from drivers/char/mem_kunit_test.c:8:
   drivers/char/mem_kunit_test.c: In function 'read_mem_restricted_addr_single_test':
   include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:484:11: note: in definition of macro 'printk_index_wrap'
     484 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/kunit/test.h:661:3: note: in expansion of macro 'printk'
     661 |   printk(lvl fmt, ##__VA_ARGS__);    \
         |   ^~~~~~
   include/kunit/test.h:667:2: note: in expansion of macro 'kunit_log'
     667 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |  ^~~~~~~~~
   include/kunit/test.h:680:2: note: in expansion of macro 'kunit_printk'
     680 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/kunit/test.h:680:15: note: in expansion of macro 'KERN_INFO'
     680 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |               ^~~~~~~~~
   drivers/char/mem_kunit_test.c:858:2: note: in expansion of macro 'kunit_info'
     858 |  kunit_info(test, "base_phys=%pa, cnt=%ld\n", (u8 *)__va(res.base_phys), req.count);
         |  ^~~~~~~~~~
   drivers/char/mem_kunit_test.c:858:41: note: format string is defined here
     858 |  kunit_info(test, "base_phys=%pa, cnt=%ld\n", (u8 *)__va(res.base_phys), req.count);
         |                                       ~~^
         |                                         |
         |                                         long int
         |                                       %d
   In file included from drivers/char/mem_kunit_test.c:8:
>> include/kunit/test.h:51:31: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      51 | #define KUNIT_SUBTEST_INDENT  "    "
         |                               ^~~~~~
   include/kunit/test.h:662:42: note: in definition of macro 'kunit_log'
     662 |   kunit_log_append((test_or_suite)->log, fmt,  \
         |                                          ^~~
   include/kunit/test.h:667:23: note: in expansion of macro 'KUNIT_SUBTEST_INDENT'
     667 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:680:2: note: in expansion of macro 'kunit_printk'
     680 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   drivers/char/mem_kunit_test.c:858:2: note: in expansion of macro 'kunit_info'
     858 |  kunit_info(test, "base_phys=%pa, cnt=%ld\n", (u8 *)__va(res.base_phys), req.count);
         |  ^~~~~~~~~~
   drivers/char/mem_kunit_test.c:858:41: note: format string is defined here
     858 |  kunit_info(test, "base_phys=%pa, cnt=%ld\n", (u8 *)__va(res.base_phys), req.count);
         |                                       ~~^
         |                                         |
         |                                         long int
         |                                       %d
   In file included from include/kunit/assert.h:13,
                    from include/kunit/test.h:12,
                    from drivers/char/mem_kunit_test.c:8:
   drivers/char/mem_kunit_test.c: In function 'read_mem_ram_addr_single_test':
   include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:484:11: note: in definition of macro 'printk_index_wrap'
     484 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/kunit/test.h:661:3: note: in expansion of macro 'printk'
     661 |   printk(lvl fmt, ##__VA_ARGS__);    \
         |   ^~~~~~
   include/kunit/test.h:667:2: note: in expansion of macro 'kunit_log'
     667 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |  ^~~~~~~~~
   include/kunit/test.h:680:2: note: in expansion of macro 'kunit_printk'
     680 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/kunit/test.h:680:15: note: in expansion of macro 'KERN_INFO'
     680 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |               ^~~~~~~~~
   drivers/char/mem_kunit_test.c:912:2: note: in expansion of macro 'kunit_info'
     912 |  kunit_info(test, "res.backing_kbuf=%p, cnt=%ld\n", (u8 *)res.backing_kbuf, req.count);
         |  ^~~~~~~~~~
   drivers/char/mem_kunit_test.c:912:47: note: format string is defined here
     912 |  kunit_info(test, "res.backing_kbuf=%p, cnt=%ld\n", (u8 *)res.backing_kbuf, req.count);
         |                                             ~~^
         |                                               |
         |                                               long int
         |                                             %d
   In file included from drivers/char/mem_kunit_test.c:8:
>> include/kunit/test.h:51:31: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      51 | #define KUNIT_SUBTEST_INDENT  "    "
         |                               ^~~~~~
   include/kunit/test.h:662:42: note: in definition of macro 'kunit_log'
     662 |   kunit_log_append((test_or_suite)->log, fmt,  \
         |                                          ^~~
   include/kunit/test.h:667:23: note: in expansion of macro 'KUNIT_SUBTEST_INDENT'
     667 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:680:2: note: in expansion of macro 'kunit_printk'
     680 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   drivers/char/mem_kunit_test.c:912:2: note: in expansion of macro 'kunit_info'
     912 |  kunit_info(test, "res.backing_kbuf=%p, cnt=%ld\n", (u8 *)res.backing_kbuf, req.count);
         |  ^~~~~~~~~~
   drivers/char/mem_kunit_test.c:912:47: note: format string is defined here
     912 |  kunit_info(test, "res.backing_kbuf=%p, cnt=%ld\n", (u8 *)res.backing_kbuf, req.count);
         |                                             ~~^
         |                                               |
         |                                               long int
         |                                             %d
   In file included from include/kunit/assert.h:13,
                    from include/kunit/test.h:12,
                    from drivers/char/mem_kunit_test.c:8:
   drivers/char/mem_kunit_test.c: In function 'read_mem_cross_page_multi_test':
   include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:484:11: note: in definition of macro 'printk_index_wrap'
     484 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/kunit/test.h:661:3: note: in expansion of macro 'printk'
     661 |   printk(lvl fmt, ##__VA_ARGS__);    \
         |   ^~~~~~
   include/kunit/test.h:667:2: note: in expansion of macro 'kunit_log'
     667 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |  ^~~~~~~~~
   include/kunit/test.h:680:2: note: in expansion of macro 'kunit_printk'
     680 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/kunit/test.h:680:15: note: in expansion of macro 'KERN_INFO'
     680 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |               ^~~~~~~~~
   drivers/char/mem_kunit_test.c:1034:2: note: in expansion of macro 'kunit_info'
    1034 |  kunit_info(test, "res.backing_kbuf=%p, cnt=%ld\n", (u8 *)res.backing_kbuf, req.count);
         |  ^~~~~~~~~~
   drivers/char/mem_kunit_test.c:1034:47: note: format string is defined here
    1034 |  kunit_info(test, "res.backing_kbuf=%p, cnt=%ld\n", (u8 *)res.backing_kbuf, req.count);
         |                                             ~~^
         |                                               |
         |                                               long int
         |                                             %d
   In file included from drivers/char/mem_kunit_test.c:8:
>> include/kunit/test.h:51:31: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      51 | #define KUNIT_SUBTEST_INDENT  "    "
         |                               ^~~~~~
   include/kunit/test.h:662:42: note: in definition of macro 'kunit_log'
     662 |   kunit_log_append((test_or_suite)->log, fmt,  \
         |                                          ^~~
   include/kunit/test.h:667:23: note: in expansion of macro 'KUNIT_SUBTEST_INDENT'
     667 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:680:2: note: in expansion of macro 'kunit_printk'
     680 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   drivers/char/mem_kunit_test.c:1034:2: note: in expansion of macro 'kunit_info'
    1034 |  kunit_info(test, "res.backing_kbuf=%p, cnt=%ld\n", (u8 *)res.backing_kbuf, req.count);
         |  ^~~~~~~~~~
   drivers/char/mem_kunit_test.c:1034:47: note: format string is defined here
    1034 |  kunit_info(test, "res.backing_kbuf=%p, cnt=%ld\n", (u8 *)res.backing_kbuf, req.count);
         |                                             ~~^
         |                                               |
         |                                               long int
         |                                             %d
   cc1: some warnings being treated as errors


vim +351 drivers/char/mem_kunit_test.c

a3f15e5663b7bf Alessandro Carminati 2026-02-12  323  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  324  static inline int edge_to_allowed_pair(enum phys_addr_type t, int *a, int *b)
a3f15e5663b7bf Alessandro Carminati 2026-02-12  325  {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  326  	switch (t) {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  327  	case PHYS_EDGE_ALLOWED_RESTRICTED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  328  		*a = 1;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  329  		*b = 2;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  330  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  331  	case PHYS_EDGE_RESTRICTED_ALLOWED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  332  		*a = 2;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  333  		*b = 1;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  334  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  335  	case PHYS_EDGE_ALLOWED_DENIED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  336  		*a = 1;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  337  		*b = 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  338  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  339  	case PHYS_EDGE_DENIED_ALLOWED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  340  		*a = 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  341  		*b = 1;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  342  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  343  	case PHYS_EDGE_RESTRICTED_DENIED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  344  		*a = 2;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  345  		*b = 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  346  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  347  	case PHYS_EDGE_DENIED_RESTRICTED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  348  		*a = 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  349  		*b = 2;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  350  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12 @351  	default:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  352  	}
a3f15e5663b7bf Alessandro Carminati 2026-02-12  353  	return 1;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  354  }
a3f15e5663b7bf Alessandro Carminati 2026-02-12  355  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  356  static inline bool edge_requires_restricted(enum phys_addr_type t)
a3f15e5663b7bf Alessandro Carminati 2026-02-12  357  {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  358  	switch (t) {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  359  	case PHYS_EDGE_ALLOWED_RESTRICTED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  360  	case PHYS_EDGE_RESTRICTED_ALLOWED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  361  	case PHYS_EDGE_RESTRICTED_DENIED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  362  	case PHYS_EDGE_DENIED_RESTRICTED:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  363  		return true;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  364  	default:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  365  	}
a3f15e5663b7bf Alessandro Carminati 2026-02-12  366  	return false;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  367  }
a3f15e5663b7bf Alessandro Carminati 2026-02-12  368  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  369  /**
a3f15e5663b7bf Alessandro Carminati 2026-02-12  370   * pick_mixed_policy_phys_addr - Pick a physical address matching a policy edge
a3f15e5663b7bf Alessandro Carminati 2026-02-12  371   * @test: KUnit test context.
a3f15e5663b7bf Alessandro Carminati 2026-02-12  372   * @count: Number of bytes to be read (must be >= 2 and <= PAGE_SIZE for edges).
a3f15e5663b7bf Alessandro Carminati 2026-02-12  373   * @t: Desired address type (basic or edge).
a3f15e5663b7bf Alessandro Carminati 2026-02-12  374   *
a3f15e5663b7bf Alessandro Carminati 2026-02-12  375   * It scans PFNs looking for adjacent pages (pfn, pfn+1) whose page_is_allowed()
a3f15e5663b7bf Alessandro Carminati 2026-02-12  376   * values match the requested transition and returns a start address positioned
a3f15e5663b7bf Alessandro Carminati 2026-02-12  377   * at the last byte of the first page so the access spans the boundary.
a3f15e5663b7bf Alessandro Carminati 2026-02-12  378   *
a3f15e5663b7bf Alessandro Carminati 2026-02-12  379   * Constraints assumed by this helper:
a3f15e5663b7bf Alessandro Carminati 2026-02-12  380   *  - @count is never greater than PAGE_SIZE. With start at
a3f15e5663b7bf Alessandro Carminati 2026-02-12  381   *    (PAGE_SIZE - count / 2), this ensures the access spans two pages.
a3f15e5663b7bf Alessandro Carminati 2026-02-12  382   *  - If CONFIG_STRICT_DEVMEM is not enabled, edges involving RESTRICTED (2)
a3f15e5663b7bf Alessandro Carminati 2026-02-12  383   *    are treated as not present and return 0.
a3f15e5663b7bf Alessandro Carminati 2026-02-12  384   *
a3f15e5663b7bf Alessandro Carminati 2026-02-12  385   * Return: physical start address, or 0 if none found.
a3f15e5663b7bf Alessandro Carminati 2026-02-12  386   */
a3f15e5663b7bf Alessandro Carminati 2026-02-12  387  static phys_addr_t pick_mixed_policy_phys_addr(struct kunit *test, size_t count,
a3f15e5663b7bf Alessandro Carminati 2026-02-12  388  					       enum phys_addr_type t)
a3f15e5663b7bf Alessandro Carminati 2026-02-12  389  {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  390  	phys_addr_t start;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  391  	unsigned long pfn;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  392  	int want_a, want_b;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  393  	int a, b;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  394  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  395  	if (edge_to_allowed_pair(t, &want_a, &want_b)) {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  396  		kunit_info(test, "Unsupported edge type %d\n", t);
a3f15e5663b7bf Alessandro Carminati 2026-02-12  397  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  398  	}
a3f15e5663b7bf Alessandro Carminati 2026-02-12  399  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  400  	if (count < 2) {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  401  		kunit_info(test, "Count=%zu too small for edge type %d\n",
a3f15e5663b7bf Alessandro Carminati 2026-02-12  402  			   count, t);
a3f15e5663b7bf Alessandro Carminati 2026-02-12  403  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  404  	}
a3f15e5663b7bf Alessandro Carminati 2026-02-12  405  	if (count > PAGE_SIZE) {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  406  		kunit_info(test, "Count=%zu > PAGE_SIZE not supported for edge type %d\n",
a3f15e5663b7bf Alessandro Carminati 2026-02-12  407  			   count, t);
a3f15e5663b7bf Alessandro Carminati 2026-02-12  408  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  409  	}
a3f15e5663b7bf Alessandro Carminati 2026-02-12  410  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  411  	if (!IS_ENABLED(CONFIG_STRICT_DEVMEM) && edge_requires_restricted(t)) {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  412  		kunit_info(test, "No restricted edges when CONFIG_STRICT_DEVMEM is disabled\n");
a3f15e5663b7bf Alessandro Carminati 2026-02-12  413  		return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  414  	}
a3f15e5663b7bf Alessandro Carminati 2026-02-12  415  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  416  	for (pfn = 0; pfn + 1 < max_pfn; pfn++) {
a3f15e5663b7bf Alessandro Carminati 2026-02-12  417  		a = page_is_allowed(pfn);
a3f15e5663b7bf Alessandro Carminati 2026-02-12  418  		if (a != want_a)
a3f15e5663b7bf Alessandro Carminati 2026-02-12  419  			continue;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  420  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  421  		b = page_is_allowed(pfn + 1);
a3f15e5663b7bf Alessandro Carminati 2026-02-12  422  		if (b != want_b)
a3f15e5663b7bf Alessandro Carminati 2026-02-12  423  			continue;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  424  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  425  		start = PFN_PHYS(pfn) + PAGE_SIZE - count / 2;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  426  
a3f15e5663b7bf Alessandro Carminati 2026-02-12 @427  		if (!valid_phys_addr_range(start, count))
a3f15e5663b7bf Alessandro Carminati 2026-02-12  428  			continue;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  429  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  430  		kunit_info(test,
a3f15e5663b7bf Alessandro Carminati 2026-02-12  431  			   "found edge %d at pfn=%lu (a=%d b=%d) start=0x%llx count=%zu\n",
a3f15e5663b7bf Alessandro Carminati 2026-02-12  432  			   t, pfn, a, b, (unsigned long long)start, count);
a3f15e5663b7bf Alessandro Carminati 2026-02-12  433  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  434  		return start;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  435  	}
a3f15e5663b7bf Alessandro Carminati 2026-02-12  436  
a3f15e5663b7bf Alessandro Carminati 2026-02-12  437  	kunit_info(test, "no match for edge %d found\n", t);
a3f15e5663b7bf Alessandro Carminati 2026-02-12  438  	return 0;
a3f15e5663b7bf Alessandro Carminati 2026-02-12  439  }
a3f15e5663b7bf Alessandro Carminati 2026-02-12  440  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
