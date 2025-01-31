Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF94155393
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738316630; cv=none; b=f6gxALmbN3JEjjxmK7H4vtt/7LX06CdaSBLgNgZYQrq5qUpjJSwXsKTjN1aiG3m4iog3ESQnti6TIajkGfg0oTAzWFRit1iXw+1wXUoF9Ie0gCXlXaHvqz9CX2e4W/dlEiRrExJ1p//ENmZv4u5KzVGO+POyRS7a9yxJDceMYc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738316630; c=relaxed/simple;
	bh=diKMeJL0V3hcP8Jgt+2RnGv6+JURXF7Q67NIBKwA8fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SqmdPI1MJjzXrCRLbECCb9xpq+fCMROetCmUbnukia28NmK+iONS+Nn56CpA1COQPUz+dlb8TEkTZCCX4S5/Z9wkQ/dj2nmqMneGANOyT8EQQyOX/p3c0FPAWwWbUbtFCresJhO6HDsHUIiU4WJPiQIKbEfLzCKt7hLhLNwPiDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bs3IECBi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bs3IECBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738316628; x=1769852628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=diKMeJL0V3hcP8Jgt+2RnGv6+JURXF7Q67NIBKwA8fs=;
  b=bs3IECBiusw9getdj9bUqg5esdcBikzvGe3FqwRBh3eQKDWXVHdThDwZ
   eOXhujKJYrRG3960iEFR6ptdnDMADAi7hSHq9+FXM+sKCE0TqqFCB62L0
   vmTkLRUB+dLFSybp0WrhOBcO/Iy7rHI6PyRFbGU+uiSn9cwBftIbp5tgo
   Vo3XhYaeilG3ew16tQEVi1VQSWFKRSvKRamOipulfNpZZTEHJCsVymYew
   /3xhwYs3oobdbSP6s7bnk7EB0Y54bFidc27RG7/OigJ4zUOPac4K+Z+cs
   AWohvPYlm8RC2EoLYBD/m4DRMenT44g4VPbIeIyhJVMWNdgnWqpdqaRyG
   w==;
X-CSE-ConnectionGUID: 7rJNxlMVTHipXI94yJcvfQ==
X-CSE-MsgGUID: s4/KJsaiQLWYPt1dl4f1/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="64245814"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="64245814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 01:43:47 -0800
X-CSE-ConnectionGUID: lkvCy5UeTSqxhJnDIUbe0Q==
X-CSE-MsgGUID: goo+jNchQNO0oBRdzV4Aiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="109425615"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Jan 2025 01:43:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdnYt-000mEV-0K;
	Fri, 31 Jan 2025 09:43:43 +0000
Date: Fri, 31 Jan 2025 17:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [akpm-mm:mm-unstable 106/111] include/linux/kern_levels.h:5:25:
 warning: unknown conversion type character 'b' in format
Message-ID: <202501311708.dRI35epU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f5604ad70091eabe663ea7106ced99449d653320
commit: 951452b2ec82d352a69f14cfffdeb7c08461eefb [106/111] mm: further refactor commit_merge()
config: x86_64-buildonly-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311708.dRI35epU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311708.dRI35epU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311708.dRI35epU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from mm/debug.c:9:
   mm/debug.c: In function 'dump_vmg':
>> include/linux/kern_levels.h:5:25: warning: unknown conversion type character 'b' in format [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:554:16: note: in expansion of macro 'KERN_WARNING'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/debug.c:262:9: note: in expansion of macro 'pr_warn'
     262 |         pr_warn("vmg %px state: mm %px pgoff %lx\n"
         |         ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: unknown conversion type character 'b' in format [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:554:16: note: in expansion of macro 'KERN_WARNING'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/debug.c:262:9: note: in expansion of macro 'pr_warn'
     262 |         pr_warn("vmg %px state: mm %px pgoff %lx\n"
         |         ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: unknown conversion type character 'b' in format [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:554:16: note: in expansion of macro 'KERN_WARNING'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/debug.c:262:9: note: in expansion of macro 'pr_warn'
     262 |         pr_warn("vmg %px state: mm %px pgoff %lx\n"
         |         ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:554:16: note: in expansion of macro 'KERN_WARNING'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/debug.c:262:9: note: in expansion of macro 'pr_warn'
     262 |         pr_warn("vmg %px state: mm %px pgoff %lx\n"
         |         ^~~~~~~


vim +/b +5 include/linux/kern_levels.h

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
