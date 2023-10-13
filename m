Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12D02903
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 05:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/7otZIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697174642; x=1728710642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/WqDizgFqs435YwYOGoEY4poKR2sumVcvkpfDRzQOvM=;
  b=G/7otZItsvyaVJUtXRqKN4+wcZaU23/hd3WGtmolnN86xnq++99TbZUy
   +1LNq4QtVy01ZS26vDiheh9ne8tX2AJ5QsRcdHDTcj12D7Fsvn3B4SUmm
   iQWBBLz1w+6y5Pm6iCAp2zsloZrD0ZYZZL13oEpQghImx0SXLN1r1hQZw
   o63zXqIELsu+2HMZ730kgkv65olcB7jAqeXKgCnGv5iJh9FF5wiYBJk0L
   7WxBGswav9YpMZSSdI6qFK+RMVax+DJLur0CputdU9QoeWp3tJA4Ammit
   ijdfIRESWlXofZ63xybfZ8voClEyLcLmefWTywjAkMxThUjrGEGHHvX3c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375454814"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="375454814"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758344536"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="758344536"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 22:24:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrAeU-0004Mn-0v;
	Fri, 13 Oct 2023 05:23:58 +0000
Date: Fri, 13 Oct 2023 13:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/cpucap/cleanup 33/38]
 arch/arm64/kernel/cpufeature.c:2225:17: error: 'compat_elf_hwcap2'
 undeclared; did you mean 'cpu_get_elf_hwcap2'?
Message-ID: <202310131335.OaIn64FN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/cpucap/cleanup
head:   0bb334d1f3369b18fef3144b7e19099ca6146db4
commit: 709133831bea313d27c1399611379c517bb551fe [33/38] arm64: Avoid cpus_have_const_cap() for ARM64_WORKAROUND_1742098
config: arm64-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131335.OaIn64FN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131335.OaIn64FN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131335.OaIn64FN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c: In function 'elf_hwcap_fixup':
>> arch/arm64/kernel/cpufeature.c:2225:17: error: 'compat_elf_hwcap2' undeclared (first use in this function); did you mean 'cpu_get_elf_hwcap2'?
    2225 |                 compat_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
         |                 ^~~~~~~~~~~~~~~~~
         |                 cpu_get_elf_hwcap2
   arch/arm64/kernel/cpufeature.c:2225:17: note: each undeclared identifier is reported only once for each function it appears in


vim +2225 arch/arm64/kernel/cpufeature.c

c444d19868d6a9 Mark Rutland 2023-09-13  2221  
44b3834b2eed59 James Morse  2022-07-14  2222  static void elf_hwcap_fixup(void)
44b3834b2eed59 James Morse  2022-07-14  2223  {
709133831bea31 Mark Rutland 2023-09-08  2224  	if (cpus_have_cap(ARM64_WORKAROUND_1742098))
44b3834b2eed59 James Morse  2022-07-14 @2225  		compat_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
44b3834b2eed59 James Morse  2022-07-14  2226  }
44b3834b2eed59 James Morse  2022-07-14  2227  

:::::: The code at line 2225 was first introduced by commit
:::::: 44b3834b2eed595af07021b1c64e6f9bc396398b arm64: errata: Remove AES hwcap for COMPAT tasks

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
