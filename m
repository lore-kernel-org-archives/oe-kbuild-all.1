Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08773376E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 23:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726962614; cv=none; b=t6F0ZgAOhaNP+NUZ8mtk+9I24sJbHpYYxGJ5ca8QhTm3tOiKcxCoJpasfBKyYaHwS+9qoEwdDscTpERVUoMq53Uzgn84nQ2dDEi8wtSwZlvmm+bN+vyt82sYeookQcYSkEzxKdOdXkgdvR6bj6w+9u1Kvw0CPXSM3UkwSXKPT1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726962614; c=relaxed/simple;
	bh=toDXRkn4+VHLvqDQVEjvlh+d1f1R6vumlq9X+7jyz4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oOipeLgLJbOwUt74nVKv9ZMfV1V9SGUtI/qKJQ0aLAyabA6k3ZrkBEztctu8Gy7vreOQf6d3g3r0qojGtMrCgLCN3RsoyyGW1uE9v+b0fu5HK4Cz5hyk/aTLFW3Bvnv3l2UH5+1uk8liyxG5s5SKZpaL0qss3fu/MUTSlL0lQJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CywqYuCK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CywqYuCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726962613; x=1758498613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=toDXRkn4+VHLvqDQVEjvlh+d1f1R6vumlq9X+7jyz4E=;
  b=CywqYuCKUAt3Vz7SBN4Hv/zaAGhxrgDHOjNbcsYmCkT77pL4VInI/O2x
   bBlLDnUhWVPL0Swv29jcNUegIlh/N2fP5VB1ob7MJT1iBP07Wq3AThmyC
   HoR5ybaBHBmmgZVwKIMW7ErIyYJ47QnASo0U5iAS6/Ua769YNbT/xmWih
   GiyKAeDZ3QvRtULFgCIyL3SDDLonYyaVEU+nFX9E4xn9jbv+wI6zfdmjC
   3hzwAtRVkiiW+2ibX/ygWU1z+6TCygKBX8hA403aNFFm9aC/aOxZqAJ7R
   MhrvmFrHWt1vD2a6UScpHNM5LoU/ze0ap0uT8jUN6i15C2GMVJzfqkdat
   Q==;
X-CSE-ConnectionGUID: WLEZMl8nS923iY7xYZU2aw==
X-CSE-MsgGUID: 9dFFAR/EQOaLw1IoV7qTgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25815703"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="25815703"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 16:50:12 -0700
X-CSE-ConnectionGUID: NUWizbMvSliID7uP9Bp0CA==
X-CSE-MsgGUID: 0Jth1RyVT7OitK1mAeMndA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="70959790"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Sep 2024 16:50:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss9rb-000Ft3-1w;
	Sat, 21 Sep 2024 23:50:07 +0000
Date: Sun, 22 Sep 2024 07:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [palmer:for-next 6/6] include/linux/kern_levels.h:5:25: warning:
 format '%llx' expects argument of type 'long long unsigned int', but
 argument 2 has type 'phys_addr_t' {aka 'unsigned int'}
Message-ID: <202409220757.BgDfkFaq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   59f8265115526655da91184ba58d2e42a873ce9f
commit: 59f8265115526655da91184ba58d2e42a873ce9f [6/6] riscv: add a warning when physical memory address overflows
config: riscv-randconfig-002-20240921 (https://download.01.org/0day-ci/archive/20240922/202409220757.BgDfkFaq-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220757.BgDfkFaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220757.BgDfkFaq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/riscv/mm/init.c:10:
   arch/riscv/mm/init.c: In function 'setup_bootmem':
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:518:16: note: in expansion of macro 'KERN_WARNING'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   arch/riscv/mm/init.c:262:25: note: in expansion of macro 'pr_warn'
     262 |                         pr_warn("Physical memory overflows the linear mapping size: region above 0x%llx removed",
         |                         ^~~~~~~


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
