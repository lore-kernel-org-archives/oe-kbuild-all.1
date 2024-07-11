Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620CE1EB26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 14:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708292; cv=none; b=jya6RJ/x0/QSwkqoF1gDxAiuMGxmtYbxqGg6cRFjOtLBrlmTn8mj4RK+xkHKgmIFdiFkxTsAt3JFImpau+k4BoUX61BmNWZ2y5PnuWARZRJy/QOnC6J4Iql+M7z9MeKJpMjM/234qLaH4q6C+YdK+y77/6tPs6iBan/tyyCfnIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708292; c=relaxed/simple;
	bh=hrj7tVi+wNdx+SmfOhQWcBRwUV+/4wY0BROpAIsRvBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQeLA9RbQDhaV08hZcBCr39pphdWFHU848vjW+PFil0iPOgWTfal9ejpRLkbFK0AYCdDzNvBmXZVa+ZahQmByBH+vR3hQm/ODZbWzPx7hlNCeRpWIwIZFbimEw5+1fpt8duuYAbr+EQkPQu7Fx8nSDGcLWz+56E6tso243ZyceA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljwryxMs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljwryxMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720708291; x=1752244291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hrj7tVi+wNdx+SmfOhQWcBRwUV+/4wY0BROpAIsRvBw=;
  b=ljwryxMshhXmIkpq8y1IPHIJE6ZjVYcjUC2c+p1WHAfRJqIhBwN29Lka
   Uf4GpV/RgWgABK163jWhFenWNLpWqhUx9hgdjXYfO0D1++cGjUUzzpT+2
   xl6Y50JiJLJr+Dt+JiYSq8WGV3MQ/TAJS8ipSIaeJsSo1OyeUoB5J4yE3
   QlLhd+dqmitd4g7CVu6aCCx4r89onUQ6DzLmS4zhZ+n5iQ1xeIws0QoxQ
   XgcVW9+Och4cZSPk06AFZ7zgCVaV0n/A/N2RC1besbBocSj7I1W656RRt
   7i1yA616jVNra2i1THC49bh+XgkJvdxW6gFIZPy8/Bz4wDjiEgmLtgXyA
   Q==;
X-CSE-ConnectionGUID: JUAigUOLTZugPY6N61vDrg==
X-CSE-MsgGUID: 5l+xuW5+RrW3XnKGW4p7qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35523896"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="35523896"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 07:31:30 -0700
X-CSE-ConnectionGUID: WY9a4b2ZT3S7IuG48ItOCw==
X-CSE-MsgGUID: TdBrXsYuRLyzoz2EYzPONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48326629"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2024 07:31:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRupR-000ZO1-2y;
	Thu, 11 Jul 2024 14:31:25 +0000
Date: Thu, 11 Jul 2024 22:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>
Subject: [linux-next:master 12377/12643] arch/mips/include/asm/pgtable.h:758:
 warning: "pud_leaf" redefined
Message-ID: <202407112219.UMkURKb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 4d460b397e28528bab4b2cea6a9337560e78b0b8 [12377/12643] mm: add p{g/4}d_leaf() in asm-generic/pgtable-nop{4/u}d.h
config: mips-randconfig-r035-20230528 (https://download.01.org/0day-ci/archive/20240711/202407112219.UMkURKb4-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112219.UMkURKb4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112219.UMkURKb4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/mips/kernel/asm-offsets.c:15:
>> arch/mips/include/asm/pgtable.h:758: warning: "pud_leaf" redefined
     758 | #define pud_leaf(pud)   ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/mips/include/asm/pgtable-32.h:19,
                    from arch/mips/include/asm/pgtable.h:14:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/linux/elfcore.h:11,
                    from include/linux/vmcore_info.h:6,
                    from include/linux/kexec.h:18,
                    from arch/mips/kernel/traps.c:20:
>> arch/mips/include/asm/pgtable.h:758: warning: "pud_leaf" redefined
     758 | #define pud_leaf(pud)   ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/mips/include/asm/pgtable-32.h:19,
                    from arch/mips/include/asm/pgtable.h:14:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 
   arch/mips/kernel/traps.c: In function 'do_mcheck':
   arch/mips/kernel/traps.c:1591:24: warning: variable 'prev_state' set but not used [-Wunused-but-set-variable]
    1591 |         enum ctx_state prev_state;
         |                        ^~~~~~~~~~
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/pagemap.h:8,
                    from arch/mips/mm/init.c:21:
>> arch/mips/include/asm/pgtable.h:758: warning: "pud_leaf" redefined
     758 | #define pud_leaf(pud)   ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/mips/include/asm/pgtable-32.h:19,
                    from arch/mips/include/asm/pgtable.h:14:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 
   In file included from <command-line>:
   arch/mips/mm/init.c: In function 'mem_init':
   include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_321' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/mips/mm/init.c:470:9: note: in expansion of macro 'BUILD_BUG_ON'
     470 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT));
         |         ^~~~~~~~~~~~
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/mips/kernel/asm-offsets.c:15:
>> arch/mips/include/asm/pgtable.h:758: warning: "pud_leaf" redefined
     758 | #define pud_leaf(pud)   ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/mips/include/asm/pgtable-32.h:19,
                    from arch/mips/include/asm/pgtable.h:14:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 


vim +/pud_leaf +758 arch/mips/include/asm/pgtable.h

970d032fec3f96 Ralf Baechle 2012-10-18  755  
501b8104670140 Steven Price 2020-02-03  756  #ifdef _PAGE_HUGE
501b8104670140 Steven Price 2020-02-03  757  #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
501b8104670140 Steven Price 2020-02-03 @758  #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
501b8104670140 Steven Price 2020-02-03  759  #endif
501b8104670140 Steven Price 2020-02-03  760  

:::::: The code at line 758 was first introduced by commit
:::::: 501b81046701408a23bb11f75f1fb4e8521c64a6 mips: mm: add p?d_leaf() definitions

:::::: TO: Steven Price <steven.price@arm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
