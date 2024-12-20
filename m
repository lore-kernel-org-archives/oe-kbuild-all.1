Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941C2210FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 19:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734724274; cv=none; b=sTDZA9ARGS71jo02VdvYV4q23kSNfqHJdhiRpW7nbqZ4J7EllvuBwUreQ5sw4uSQA1C6j3A5/YqaEZUZ4DbC/Ccu0RvBZ42KDCMh+yM8j0BEIJyVdIxfanok8fn4ELXlrYvI/bWXrk6mwfYw1sQyn89Wh3WQM1dtYJhpXiXQslQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734724274; c=relaxed/simple;
	bh=fUH6QNSwXUwRXFIi9g6evbnmbLW96mfFkur+hAGha0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sy3wLjS/ccZYQhIQNKky70JjzDCk1mbpGSgZfFhh9LHnckGRGtx1uCrO4vAS//XetENhuLEoT5c6GRWXfj4+dC5i5jSLQ/w/BZQDfjtSBYj3iCoTWrpDHmirqT7vM7rzsyJvef98Hpoes1zttJscTf6JHcu9BOKX4xpVnfrU2M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuM/zA93; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuM/zA93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734724272; x=1766260272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fUH6QNSwXUwRXFIi9g6evbnmbLW96mfFkur+hAGha0c=;
  b=CuM/zA93Nk0QmIU9LQ8XslkX2F9dC0GquP9T3LPoZ/BwdQukdXukAeRy
   SaEOtHSC37H3nvYEuNcLYw4ww9zC/o10CeVkkfJpgdpv146WksU3JjUty
   CbqRVJbbWcoblLhjsqTpzPfv8rvHcMnP+uaIjgi7ouqU/4oNlRlRpjmCn
   4soWCXtmBMMdTwUICO9Hs8R2lell1wvw4p+c+rEgq30p7VZVuJNkd2HYp
   v5YrMHwE5NcyT0V33RU+oTh7bKA4ftC4Jv1jG5m0wd0fM6qLjH88XRsV1
   LkLJHi/Edr/6nOTxuAq699C5gKTJ/u4ZONQVGaI3mgNLFED4+vmAbhnlA
   Q==;
X-CSE-ConnectionGUID: f+daZ2L3TcG3EDp6S2J0JA==
X-CSE-MsgGUID: xjWBjqOgRp2po1A8d9HFCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57755513"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="57755513"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 11:51:11 -0800
X-CSE-ConnectionGUID: eGflhNl6TW2wNam5ASyePg==
X-CSE-MsgGUID: V21kZ0WEROGSMoeqsUql+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135945507"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2024 11:51:10 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOj1f-0001dr-0D;
	Fri, 20 Dec 2024 19:51:07 +0000
Date: Sat, 21 Dec 2024 03:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1341/1341]
 include/linux/kern_levels.h:5:25: warning: format '%p' expects argument of
 type 'void *', but argument 38 has type 'int'
Message-ID: <202412210351.AFkLgZJH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   02951ceaa6d546dfa0f741f52f6d47e0fb0ac7b4
commit: 2d2fe6b40444bd8f84f674930ac5f98a6314702e [1341/1341] ascend: mm: add an owner for mm_struct
config: x86_64-randconfig-r052-20241221 (https://download.01.org/0day-ci/archive/20241221/202412210351.AFkLgZJH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210351.AFkLgZJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210351.AFkLgZJH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from mm/debug.c:9:
   mm/debug.c: In function 'dump_mm':
>> include/linux/kern_levels.h:5:25: warning: format '%p' expects argument of type 'void *', but argument 38 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:8:25: note: in expansion of macro 'KERN_SOH'
       8 | #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
         |                         ^~~~~~~~
   include/linux/printk.h:342:16: note: in expansion of macro 'KERN_EMERG'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   mm/debug.c:117:9: note: in expansion of macro 'pr_emerg'
     117 |         pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 39 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:8:25: note: in expansion of macro 'KERN_SOH'
       8 | #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
         |                         ^~~~~~~~
   include/linux/printk.h:342:16: note: in expansion of macro 'KERN_EMERG'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   mm/debug.c:117:9: note: in expansion of macro 'pr_emerg'
     117 |         pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 40 has type 'const long unsigned int *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:8:25: note: in expansion of macro 'KERN_SOH'
       8 | #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
         |                         ^~~~~~~~
   include/linux/printk.h:342:16: note: in expansion of macro 'KERN_EMERG'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   mm/debug.c:117:9: note: in expansion of macro 'pr_emerg'
     117 |         pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%p' expects a matching 'void *' argument [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:8:25: note: in expansion of macro 'KERN_SOH'
       8 | #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
         |                         ^~~~~~~~
   include/linux/printk.h:342:16: note: in expansion of macro 'KERN_EMERG'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   mm/debug.c:117:9: note: in expansion of macro 'pr_emerg'
     117 |         pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
         |         ^~~~~~~~


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
