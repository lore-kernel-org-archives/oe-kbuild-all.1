Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657091922F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741760545; cv=none; b=D+wFCsDD6pl4K2uUOGDRtjVHw1MP1DJCsvDgVfuN5XF0F2jRH4SLpadTFBuDv2DCkZUxrnnEBHHqv5XscjkEFdFAP39TZfAOeomLSW6oNOUy07kQhYKWyrtcVGTg/fhlDD3UGUnSAyTEpZjlE0wpVBXFUkKWLOjoU5mbEa7KFX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741760545; c=relaxed/simple;
	bh=lerxxgv+rH8XFTC+HklmQjZOQgOrUKcmEmC3LAqFF90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QbvW7TNr3elkH9zH2jS3fjlpUfIngn6fIJPnK5VgMMxEKcaBmwMVo4L8OWLg5vF6XO9t8+J2AtXlMDWKKxjZN18tHmSp43wz7uU27WIoTpoJiiKpVFJOuI6zCT/HQgcSRzHdi+BtbKnpkFscv8ZwkriG1ckkmDez4Hs6qciTHyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kG8ftdeZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kG8ftdeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741760543; x=1773296543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lerxxgv+rH8XFTC+HklmQjZOQgOrUKcmEmC3LAqFF90=;
  b=kG8ftdeZrWQT9rwsRDVrYJPLcF8KuBcvbv4P/DRyzlgGg5N+SxrOP/8R
   XlfwvQj8p7xqhyGy9F9MFAZcyMpNOESkRiMnhkgvlVeD9i6NxCZ5uQXRW
   9VqEb58xaWf4G/XVi6UQCzqHDz4CVWtpE0ANrrCXLloOrlGT0ok7WQIUN
   qrG0Y4FgeLqh8+wBG2jJf1SC9MG60BqJd8edgr3DZjdk2lbhxavEUj9MJ
   w6cuNcVb1qm/wshz7bGUysmAFPGHomgA/ZoLAgszTWmKtLqAT9YS1RE2O
   7mLEV0vLm39dnW0sGIZIT3WFUEHP5SlYaJrE31UsaA/7SWrrEIr4TDQcw
   A==;
X-CSE-ConnectionGUID: rKRgI8W8Tsqu1QtKO6IeeQ==
X-CSE-MsgGUID: 5dh9rZlNTd2ylSjejLTqBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42863100"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="42863100"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 23:22:23 -0700
X-CSE-ConnectionGUID: z0euNGWYQMqNFS59LT1czA==
X-CSE-MsgGUID: 0dGtDLZGRZuolYGHUUGbYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="120516566"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2025 23:22:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsFTv-0008BS-1f;
	Wed, 12 Mar 2025 06:22:19 +0000
Date: Wed, 12 Mar 2025 14:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 69/70] include/linux/kern_levels.h:5:25: warning: format
 '%ld' expects argument of type 'long int', but argument 2 has type 'int'
Message-ID: <202503121414.O6EdHiTp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   d2e2e629f0a887e71446afa03ead92dc5a4af57c
commit: 76d7ff040dcb70c93e714eb0e2ace87f220ec091 [69/70] dyndbg: print multiple headers (WIP,WAG)
config: i386-buildonly-randconfig-003-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121414.O6EdHiTp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121414.O6EdHiTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121414.O6EdHiTp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c: In function 'dynamic_debug_init':
>> include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   lib/dynamic_debug.c:138:17: note: in expansion of macro 'pr_info'
     138 |                 pr_info(fmt, ##__VA_ARGS__);                    \
         |                 ^~~~~~~
   lib/dynamic_debug.c:141:33: note: in expansion of macro 'vnpr_info'
     141 | #define vpr_info(fmt, ...)      vnpr_info(1, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~
   lib/dynamic_debug.c:1751:17: note: in expansion of macro 'vpr_info'
    1751 |                 vpr_info("%ld header(s) found, format: %s\n",
         |                 ^~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
