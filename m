Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BBDF9D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734290055; cv=none; b=FjJDGpQ/JXd6qjWc4AsEPgStjdX3DzaUryRstNYOwQzedPP4qcIcnNIJPKDW+npXFXoONYQ2vbrMbkI8pRoOGDGXP3CVkTb5Eh68E4IgtCgaja5cgMsKvwug5pmX71JVNH1ex7BSfv7OlmuI1wmna9vrZcQc+fh9gz7F5c3Cdfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734290055; c=relaxed/simple;
	bh=NXE1mxhgaCjCdC9bEQEgBg1bPtZ1oC5Divtqb9au7f0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7m8F5lbJC7rKSEPwQBrt2wXHFtBf316oGDOm+onGL01bIRB8732sBMLB7739wRRVGKLBDdL1NmWTVs3jCNgqAiIvCq2LNr/dbvLrsFK6pWYfpNsZWZvSG2vmqSqJ5LU024zMXd7ER2JqQh9bq6bxOdnhTuHRE0mpT9R6abB+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgAGGX9h; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgAGGX9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734290054; x=1765826054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NXE1mxhgaCjCdC9bEQEgBg1bPtZ1oC5Divtqb9au7f0=;
  b=UgAGGX9hgywD2u8QVpYHMuE7mF67f7bp4goSPLBFjKMrHxjYZCf0kiug
   EE2BCJUj141sBG6bI1xSf5tujJ9cqHV95TMSo9UYK6qchIbhlcfFD1FeJ
   3lU+dC+HyuJhFjvoQQvV9ThX+0qNxZ0X7ra/rbsgXSfrYE1nSBk6q9Z22
   Xefoh+7fiKm9OQg2ppBVoc27zD7RsbTqMDJ/H7S5+Nsx6Kmn9OCHSG5T3
   esqylQoJ1vsFA3nmStbAe18OhElCmI21dMrp1dbz8Mag8g/3082pWXz3A
   3V+7d8uesh/Vev+2vfs6C4cm3MDKeA89ddXtQ8gJszNkiu+6cPiErd4Zb
   A==;
X-CSE-ConnectionGUID: /58I/jDMTuetzyQ9rNhfDw==
X-CSE-MsgGUID: UozYtsavQ1iT+8YTS5/g1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34904158"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34904158"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 11:14:13 -0800
X-CSE-ConnectionGUID: 8m3SW0UJS9e8+Azjwf/M0w==
X-CSE-MsgGUID: o/Kyx51yTgms6LPpPi9UvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101985300"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Dec 2024 11:14:12 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMu48-000Dos-2k;
	Sun, 15 Dec 2024 19:14:08 +0000
Date: Mon, 16 Dec 2024 03:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:wip 18/20] include/linux/kern_levels.h:5:25: warning: format
 '%lu' expects argument of type 'long unsigned int', but argument 7 has type
 'unsigned int'
Message-ID: <202412160331.dKLmjSKE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   14a0b37677c60e56234bfdca48f2893895e751f3
commit: 03605b8f85a900083d1f7f2d3d19fcd16cbcdd96 [18/20] f2fs: fix to do sanity check correctly on i_inline_xattr_size
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20241216/202412160331.dKLmjSKE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412160331.dKLmjSKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412160331.dKLmjSKE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/inode.c:8:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:1855:33: note: in expansion of macro 'KERN_WARNING'
    1855 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~
   fs/f2fs/inode.c:317:17: note: in expansion of macro 'f2fs_warn'
     317 |                 f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %lu, max: %lu",
         |                 ^~~~~~~~~


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
