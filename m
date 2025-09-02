Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964901E9B0D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 22:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756852733; cv=none; b=UqaGKtFFiakLLBxnveRqGwnk42VccEbGFRQueossp8jPg/D8dK3mkn69kqmtf++Btx/O97nxluP8Gim1Z5GsMxJZish7h05/VPZw2YQaBp0UFWP1Ec6885iE/mG+3bxhS5XRcOarZ3K/tHB08GeP2SmUBbovGDmc+Wqdk9ZQuPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756852733; c=relaxed/simple;
	bh=dYX8FKpe0BiZzqP/Ssrbjwno4EfI605QugG9/XS5r0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aab1dMhDSYo+HrhJXPjjPzCNv5PnsXHz/TQokYeQZyKp6L6ZD6NaFPQPxvqSKN44XeAhyBs4mPCzG3+51AHeXlVBzxLVDzd4qE7haoiEU23AamanUjbBBAEAp8s1Azu+MwumgxallbehSFsiRGmeH9G7oMu+C4mTqgqQAQ7xZQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6vPhv85; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6vPhv85"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756852731; x=1788388731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dYX8FKpe0BiZzqP/Ssrbjwno4EfI605QugG9/XS5r0Y=;
  b=f6vPhv85XiWRwYau2/t3H7tdSGEctH59EB4Y2yG3GGO4aFRW5aYEKok9
   yRKQdD7EZuu34r2NlPdUmQj7HJC3E9ssbgUOxDRmF51w0gZA+1f0vCYQF
   /7L2XmKmOHimR/ggzNJJsMbO+oamlZu+fdvNd6QJK9YNZ1AvP9cg2Z4ct
   AngRLvYK+g5ZcgSxaSRP33tbcXoOqR7Fr32DFVRC6Vr9Y0VI1YMcZ5Any
   ADkI5p8UUXeAtImzZWhvvYI+4xv5u19wlzUifOqLktQvNm1yzwdRlLctW
   ZJinH3GUVsYX6TtvV/3SqJjEtsGLhcy/V+WgOi98aEoNOg9oVs+JEWKvq
   Q==;
X-CSE-ConnectionGUID: Uk9HmIsfSOyAvBjulqXguw==
X-CSE-MsgGUID: HXBDgTZmRICVvYUCZTqY+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59287825"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="59287825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 15:38:50 -0700
X-CSE-ConnectionGUID: kqeGIUv5R7+/aHbUOiACBQ==
X-CSE-MsgGUID: LejKBvRATwmdL07j1DHMjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="175787240"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2025 15:38:49 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utZdW-00035X-0o;
	Tue, 02 Sep 2025 22:38:17 +0000
Date: Wed, 3 Sep 2025 06:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 109/109] include/linux/kern_levels.h:5:25: warning:
 format '%lu' expects argument of type 'long unsigned int', but argument 16
 has type 'int'
Message-ID: <202509030638.L4D1o07A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   b40ae505a5ff6123396b42b79f42ad45df461634
commit: b40ae505a5ff6123396b42b79f42ad45df461634 [109/109] mm/show_mem: temporal build fix
config: i386-buildonly-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509030638.L4D1o07A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030638.L4D1o07A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030638.L4D1o07A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from mm/show_mem.c:8:
   mm/show_mem.c: In function 'show_free_areas':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 16 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   mm/show_mem.c:298:17: note: in expansion of macro 'printk'
     298 |                 printk(KERN_CONT
         |                 ^~~~~~
   include/linux/kern_levels.h:24:25: note: in expansion of macro 'KERN_SOH'
      24 | #define KERN_CONT       KERN_SOH "c"
         |                         ^~~~~~~~
   mm/show_mem.c:298:24: note: in expansion of macro 'KERN_CONT'
     298 |                 printk(KERN_CONT
         |                        ^~~~~~~~~


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
