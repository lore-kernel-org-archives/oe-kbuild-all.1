Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3607A5E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696072604; x=1727608604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=slzsAtKQT8gm5qunTspY3NK0kuZwhWPgqZIHO99wXcs=;
  b=E3ouDMoE9S6crbOUyK7bGkd0Nnfwy/G6sF9KVuB+cqJJsindia9e3w9R
   SSJI/R69Bw31OA5IT4k5GaXiBhm2emvbJmQO7p4Bm2GbFAKCVOqjp/95U
   ghhG62SQuy5HQAxM2q+CIGWGRG2xHFXVbD7uo4G8e+s2CaV5DnQJyTvlQ
   eKHAaB9UAkyyRDKS/HxNkEq12LxrXjZ4JZCjFPNZzxtIzuPPY2RGy7zfG
   CHWaKbzhqVjGn5ZMpge1hc0ataKjsbH+oDe/XjlDlgn/efsbFfNAb/GLN
   /DJJymyGYZWoOtcca/ML73u0PLvfigFLagLgk+PuZXoIjY6xFPbivaWyj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="362695856"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="362695856"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 04:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="753622786"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="753622786"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Sep 2023 04:16:43 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmXxg-00044V-1v;
	Sat, 30 Sep 2023 11:16:40 +0000
Date: Sat, 30 Sep 2023 19:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/cpucap/cleanup 33/38]
 arch/arm64/kernel/cpufeature.c:2224:17: error: 'compat_elf_hwcap2'
 undeclared; did you mean 'cpu_get_elf_hwcap2'?
Message-ID: <202309301947.pdLbCHaO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/cpucap/cleanup
head:   9cc35b0f2f282c453095977947d5520cc235025b
commit: 3bade17768b4fbb91353d1366769a4202f648c16 [33/38] arm64: Avoid cpus_have_const_cap() for ARM64_WORKAROUND_1742098
config: arm64-randconfig-001-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301947.pdLbCHaO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301947.pdLbCHaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301947.pdLbCHaO-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c: In function 'elf_hwcap_fixup':
>> arch/arm64/kernel/cpufeature.c:2224:17: error: 'compat_elf_hwcap2' undeclared (first use in this function); did you mean 'cpu_get_elf_hwcap2'?
    2224 |                 compat_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
         |                 ^~~~~~~~~~~~~~~~~
         |                 cpu_get_elf_hwcap2
   arch/arm64/kernel/cpufeature.c:2224:17: note: each undeclared identifier is reported only once for each function it appears in


vim +2224 arch/arm64/kernel/cpufeature.c

ef53ef46106512 Mark Rutland 2023-09-13  2220  
44b3834b2eed59 James Morse  2022-07-14  2221  static void elf_hwcap_fixup(void)
44b3834b2eed59 James Morse  2022-07-14  2222  {
3bade17768b4fb Mark Rutland 2023-09-08  2223  	if (cpus_have_cap(ARM64_WORKAROUND_1742098))
44b3834b2eed59 James Morse  2022-07-14 @2224  		compat_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
44b3834b2eed59 James Morse  2022-07-14  2225  }
44b3834b2eed59 James Morse  2022-07-14  2226  

:::::: The code at line 2224 was first introduced by commit
:::::: 44b3834b2eed595af07021b1c64e6f9bc396398b arm64: errata: Remove AES hwcap for COMPAT tasks

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
