Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A823BCF5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760034326; cv=none; b=MXxWV6+HdYTZO7EX5mG9b3ww6+NtSVBdjIZ/Fv+/QvJpdTdAFOlYWCtkVx5ixGZpgDTC7DsnHa7rj/BBCbNBzZpWTp6Y5QnUO6bIsNnqkEFyR6nVK2D75WjWVXEhd6whUIAYI6qg31PhNvJ1iSNB+AnlmiZaBNqWwQaSd1JCW9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760034326; c=relaxed/simple;
	bh=dp+++NQlQngAk+rRono0rMK4ALNQfQUK3Ef+gZzyonM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5oixWQl0oj0mV2kcA1f6k+gO88WDBPtUv+heDDPZI+IgVPE43u9/mYfauQTOVJL6MekaIoo1M0YAqxHZdqbQr9qVusseujt/pfLz4/1aPJRTK3rVWvsFKbnfdMITS9chuFD3ul7UyTM0/dfLvr25+DZwQtK1weQeGGNBuZkmG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KChd3ifW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KChd3ifW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760034325; x=1791570325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dp+++NQlQngAk+rRono0rMK4ALNQfQUK3Ef+gZzyonM=;
  b=KChd3ifWwTfPKwNYvbXlRo0saKVaudQRvyTKfS98a2vQuDLhTlyxSGwo
   NQ5J0C2uWHsddJiXxd2IjDtj+HUki75GKxR7hl1kvG4SJx/0Yo+qaD5i7
   R2H15pcnA2TMdW1+sKwj/grJpOJ8SJae3U+HfoHxGUIerHhHcF6TyAUs1
   HAHpxq9/GnW1bwaRN/LolByiupwCl8dWb37E4FZOfB3AgrcZL+rvNlT+S
   6hBk9gmJdiPS4sWUB9ANBIReleDNtwQ58JG/YATj446/IUUHAePreUxIJ
   23XC++CsqZyuvphRJE80FdJeOj8qoFySaeJtTVLY3mtnmMLtaKA3UEkJg
   g==;
X-CSE-ConnectionGUID: 5oz7Is67Sm+VlhKa2hpj4A==
X-CSE-MsgGUID: uujXnR0TSYCnyfILTy7fVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73684623"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73684623"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 11:25:24 -0700
X-CSE-ConnectionGUID: lp5baOu8Q7uCh8l/RQSoEw==
X-CSE-MsgGUID: 1jU4KYvYSsSwmry8ct0c9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="184807942"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Oct 2025 11:25:22 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6vKJ-0001CZ-3D;
	Thu, 09 Oct 2025 18:25:20 +0000
Date: Fri, 10 Oct 2025 02:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 6/8] include/linux/kern_levels.h:5:18: warning:
 too many arguments for format
Message-ID: <202510100237.gjKDkxV8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   f413b3ee5d939ae78a851e6451d374f0d4772b15
commit: fcf3088e82150dea902ce346c4461e0525d7ba17 [6/8] f2fs: freeze fs operations during f2fs_enable_checkpoint()
config: riscv-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100237.gjKDkxV8-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100237.gjKDkxV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100237.gjKDkxV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:90,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:9,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from fs/f2fs/super.c:8:
   fs/f2fs/super.c: In function 'f2fs_enable_checkpoint':
>> include/linux/kern_levels.h:5:18: warning: too many arguments for format [-Wformat-extra-args]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   fs/f2fs/f2fs.h:1969:26: note: in expansion of macro 'KERN_INFO'
    1969 |  f2fs_printk(sbi, false, KERN_INFO fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/f2fs/super.c:2693:2: note: in expansion of macro 'f2fs_info'
    2693 |  f2fs_info(sbi, "%s sync_fs, meta: %lld, imeta: %lld, node: %lld, dents: %lld, qdata: lld",
         |  ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


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
