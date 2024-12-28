Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948D8482EB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735374698; cv=none; b=lXcvA9glMIUqMS5FJCLzdvm3qpx8owB8jhQJIerB0qhoN/D8iBV9IyE7TLOalU/fxBwK3meBxTDImnFylD4acHdqbnJLm+KUK12Tt+kOrUrseSYWPXBCRzGEqUI1SGAS4/XylAtsIwB4Guvgs36XigEdXmOJS4dLrwz7ZuX4fUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735374698; c=relaxed/simple;
	bh=EcMNaJHfZn5qW0fG1yxg0WKafl/QSyAIHSq6DUj638U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HPjJW5wWgsTf5HBEUsW2GBEDFCCylN1uSOX3sRgEX0+Ytm4pbW35KnJFYT1CnNIDeGONqtAS9v71ZMzng4uHbEyCZNOmS6N5RNNco3u48IQBO00VBzos5utgNw+G/5mk6hHsyQ1wSAIvWWrsWwF6pPkBa+XZVTks9AzQ36Itp4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRh6Lyzo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRh6Lyzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735374697; x=1766910697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EcMNaJHfZn5qW0fG1yxg0WKafl/QSyAIHSq6DUj638U=;
  b=DRh6LyzoxUPh5dGxcTNpAoj0vGklA0+3U6pbwrcaPjjyHX5yBgT9SoAy
   x0v26jilU/0ahvHSn3YtPIIabN4JQIkGOep4e0HTMfQZIPhzfmst3qFCw
   muYL4xmux8wcttwmyfaYEAamUVKDulnEqQ+TFbvmguo7KnZWLE7yJ/LBh
   toj64itnFMiVVJXtHFvOIvbErbD12V+79GoRhMkNw8MrzxrCYlQJW2LR2
   3RSSMpFeYMU3hm+vqZKuR6lzogqvYUNGENehQgjIfsKC/GwusZhPJyWNs
   OKu/sC+ACydFW/92V37Yu2yWb3xmzJtVBz6KCZGziBg3DSoIrF1o+IQXu
   Q==;
X-CSE-ConnectionGUID: 14JwhQaVQlmQMoOPmBQ7LQ==
X-CSE-MsgGUID: GRWwoHYISUi5U7udir8RvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35057874"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35057874"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 00:31:34 -0800
X-CSE-ConnectionGUID: A24/mU1tRVmjbZwipgyZBQ==
X-CSE-MsgGUID: uMB6rcePQla99ze2G6cCew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105410573"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Dec 2024 00:31:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRSEM-0003xE-0M;
	Sat, 28 Dec 2024 08:31:30 +0000
Date: Sat, 28 Dec 2024 16:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1355/1355]
 include/linux/kern_levels.h:5:25: warning: format '%p' expects argument of
 type 'void *', but argument 40 has type 'long unsigned int'
Message-ID: <202412281637.7HUx9YuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 2d2fe6b40444bd8f84f674930ac5f98a6314702e [1355/1355] ascend: mm: add an owner for mm_struct
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412281637.7HUx9YuE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412281637.7HUx9YuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281637.7HUx9YuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   mm/debug.c:35:9: sparse: sparse: cast from restricted gfp_t
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from mm/debug.c:9:
   mm/debug.c: In function 'dump_mm':
>> include/linux/kern_levels.h:5:25: warning: format '%p' expects argument of type 'void *', but argument 40 has type 'long unsigned int' [-Wformat=]
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
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 42 has type 'int' [-Wformat=]
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
   include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 44 has type 'long unsigned int' [-Wformat=]
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
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 45 has type 'const long unsigned int *' [-Wformat=]
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
   include/linux/kern_levels.h:5:25: warning: format '%p' expects a matching 'void *' argument [-Wformat=]
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
