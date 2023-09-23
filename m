Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6D63A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695501653; x=1727037653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iGpffhU6mtF9jQDs8VPxrtaapWcS6MWDxSr1u5X0pAo=;
  b=A3ZMroBxUGvTb4KUX1QGTjcjM/zIZHxXM0036IuZbNfz0XyGytuT2EcV
   SgHNwTqpWSxQV3URCZMoF7SSnQnB1RDgNvkyOHr7XerJabHrGOGV3VJxe
   V/e90P1fOg4OwU54KZPqNZXcqVyFqC/GefTP5E1RyC3EKc1Q7XHywnHvu
   RrH8U7GEurzHFHh+DhgNESa1nkuFJ5JSN9cCGI1l1Gkq/H4aZngEcGZSj
   Lo9jQ5svY3ZA1DLFJw+WQwd+/cArqwscez6mNjuuJbwiunojmBNTU6aCM
   H++g8+q12E18QLH3sjqDmlp0ksNwmzvMaMAPMCcBzRyupfxEDPFaZjjRq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="366114554"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="366114554"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 13:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="747927120"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="747927120"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Sep 2023 13:40:50 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk9Ql-0002pa-1U;
	Sat, 23 Sep 2023 20:40:47 +0000
Date: Sun, 24 Sep 2023 04:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/cpucap/cleanup 33/38]
 arch/arm64/kernel/cpufeature.c:2224:17: error: 'compat_elf_hwcap2'
 undeclared; did you mean 'cpu_get_elf_hwcap2'?
Message-ID: <202309240411.BNvaG6FA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/cpucap/cleanup
head:   ae28f8e5f8d450cf73446e7002b9bdebcd0cb4e7
commit: 9b3c62084b424cdacf0991659357069b3a2c4e8a [33/38] arm64: Avoid cpus_have_const_cap() for ARM64_WORKAROUND_1742098
config: arm64-randconfig-002-20230923 (https://download.01.org/0day-ci/archive/20230924/202309240411.BNvaG6FA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240411.BNvaG6FA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240411.BNvaG6FA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c: In function 'elf_hwcap_fixup':
>> arch/arm64/kernel/cpufeature.c:2224:17: error: 'compat_elf_hwcap2' undeclared (first use in this function); did you mean 'cpu_get_elf_hwcap2'?
    2224 |                 compat_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
         |                 ^~~~~~~~~~~~~~~~~
         |                 cpu_get_elf_hwcap2
   arch/arm64/kernel/cpufeature.c:2224:17: note: each undeclared identifier is reported only once for each function it appears in


vim +2224 arch/arm64/kernel/cpufeature.c

ec3ea23d918718d Mark Rutland 2023-09-13  2220  
44b3834b2eed595 James Morse  2022-07-14  2221  static void elf_hwcap_fixup(void)
44b3834b2eed595 James Morse  2022-07-14  2222  {
9b3c62084b424cd Mark Rutland 2023-09-08  2223  	if (cpus_have_cap(ARM64_WORKAROUND_1742098))
44b3834b2eed595 James Morse  2022-07-14 @2224  		compat_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
44b3834b2eed595 James Morse  2022-07-14  2225  }
44b3834b2eed595 James Morse  2022-07-14  2226  

:::::: The code at line 2224 was first introduced by commit
:::::: 44b3834b2eed595af07021b1c64e6f9bc396398b arm64: errata: Remove AES hwcap for COMPAT tasks

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
