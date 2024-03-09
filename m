Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D332C692
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 10:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709981306; cv=none; b=ZHvsJ4wkQWBEI5tcrJeal8Uccb9OWL0MzWbKTG235ussx3pYW02SkpW7H1k/c9tXgZrZa/diWORRuXhp1+QlRhMtSeq5DO9WSTo/UalzRoP5gb/kQxjzcRriwsf8K9X6XDbwUZCyH+zsBh29n7EP9hHCYHKET6T9KENAjYGOSU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709981306; c=relaxed/simple;
	bh=8mxlkVWAvH8YUG32r1yCsALnEVcnU+ijplLe0wNwBXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QeqZnpqrr0pq3+I8iDfbE9NdgN+UOTJTeJ5T6FxnZ8Mu170b3Ds0DYZz9VIJmmPfa2N+JFnyxVyqqonU9IF9sAbWOZy++TEG+cQgOPTvstHGFnwMXsiRZWygdXG2tl2mHzTn0HBbafSxPsf/8fjMstASpKBavRI0alK7GowYO4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbTVXx14; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbTVXx14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709981305; x=1741517305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8mxlkVWAvH8YUG32r1yCsALnEVcnU+ijplLe0wNwBXM=;
  b=RbTVXx14tWsFxIHqc196qT9IAfGJpSF+84qtsD2V6u2608U6JnDmZxUQ
   Oey0ylH54cLdf6P3tuBebYLDWYAxn/CLbSOKTnqKVMkkwbNU0AQBE+lL/
   N+Qije5EnJkXWAQbiQnihgppCY6Ws9xqTWhGUK8aB4XXzr/W2ynEbHeo2
   dA3wGP9W2LMkhbVRl4/jMj5m+JGf2IEE5wb/xRCmDmeMcuPkvQEYVVXx5
   VTms1YS1WtkN+AZr8Awlzuw1fyrLPn8627Tj+OUu3F+xMU1Dga5EXS+mv
   GGTvcmZOpPkCZwxQCy47cqs7GInPcXtbQ0qAU2GJFTBxZTp4T+adcxSi7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4568571"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="4568571"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 02:48:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="10589339"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Mar 2024 02:48:23 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riuFY-0007Gh-2J;
	Sat, 09 Mar 2024 10:48:20 +0000
Date: Sat, 9 Mar 2024 18:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 5/7] arch/mips/include/asm/pgtable.h:248:26:
 warning: "__builtin_ffs" is not defined, evaluates to 0
Message-ID: <202403091833.33UUh5y9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   d0d131e3b655fd267d14bb1bed49e3f990a1465e
commit: 643714ff18301f41bded2489e8f1f9d1b4782094 [5/7] bpf: cap BPF_PROG_PACK_SIZE to 2MB * num_possible_nodes()
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240309/202403091833.33UUh5y9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403091833.33UUh5y9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091833.33UUh5y9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/kallsyms.h:13,
                    from include/linux/bpf.h:21,
                    from include/linux/filter.h:9,
                    from kernel/bpf/core.c:21:
>> arch/mips/include/asm/pgtable.h:248:26: warning: "__builtin_ffs" is not defined, evaluates to 0 [-Wundef]
     248 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                          ^~~~~~~~~~~~~
   arch/mips/include/asm/pgtable-32.h:67:43: note: in expansion of macro 'PTE_T_LOG2'
      67 | # define PGDIR_SHIFT    (2 * PAGE_SHIFT - PTE_T_LOG2)
         |                                           ^~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:22:33: note: in expansion of macro 'PMD_SHIFT'
      22 | #define PMD_SIZE        (1UL << PMD_SHIFT)
         |                                 ^~~~~~~~~
   kernel/bpf/core.c:900:5: note: in expansion of macro 'PMD_SIZE'
     900 | #if PMD_SIZE <= (1 << 21)
         |     ^~~~~~~~
   arch/mips/include/asm/pgtable.h:248:39: error: missing binary operator before token "("
     248 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                                       ^
   arch/mips/include/asm/pgtable-32.h:67:43: note: in expansion of macro 'PTE_T_LOG2'
      67 | # define PGDIR_SHIFT    (2 * PAGE_SHIFT - PTE_T_LOG2)
         |                                           ^~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:22:33: note: in expansion of macro 'PMD_SHIFT'
      22 | #define PMD_SIZE        (1UL << PMD_SHIFT)
         |                                 ^~~~~~~~~
   kernel/bpf/core.c:900:5: note: in expansion of macro 'PMD_SIZE'
     900 | #if PMD_SIZE <= (1 << 21)
         |     ^~~~~~~~


vim +/__builtin_ffs +248 arch/mips/include/asm/pgtable.h

^1da177e4c3f41 include/asm-mips/pgtable.h Linus Torvalds 2005-04-16  245  
5ff974720abec2 include/asm-mips/pgtable.h Ralf Baechle   2007-08-01  246  #define PGD_T_LOG2	(__builtin_ffs(sizeof(pgd_t)) - 1)
5ff974720abec2 include/asm-mips/pgtable.h Ralf Baechle   2007-08-01  247  #define PMD_T_LOG2	(__builtin_ffs(sizeof(pmd_t)) - 1)
5ff974720abec2 include/asm-mips/pgtable.h Ralf Baechle   2007-08-01 @248  #define PTE_T_LOG2	(__builtin_ffs(sizeof(pte_t)) - 1)
^1da177e4c3f41 include/asm-mips/pgtable.h Linus Torvalds 2005-04-16  249  

:::::: The code at line 248 was first introduced by commit
:::::: 5ff974720abec255c17af6f3732dd410d364e367 [MIPS] Fix computation of {PGD,PMD,PTE}_T_LOG2.

:::::: TO: Ralf Baechle <ralf@linux-mips.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
