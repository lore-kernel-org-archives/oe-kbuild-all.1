Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965231D5CC9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 23:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775862684; cv=none; b=Uj2U7QY2UwXiI5MMZk69v1n+bzQ+KPc6BqZvOQG+mt63KGjRb68IIXNgg0Ao9OWHFB+O3Cl3GcsqW6a4ya7r4zZyLfw7+OwAIBRVLSzwp3ygVCzOvKeCui7pXNvYaf9cRaa16T47FS/vR2zIqxNfl8GCxvC6a1lLZ/dmbX8493o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775862684; c=relaxed/simple;
	bh=u55h2IEH+mTo6sziZzC57ARiOhljqZqXrpEjTZXufL0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ele4YJ74f17KQbFusO8xuaL/WD/0wkTum2/PjmP4iqPdxxOCOKb4w+kHEmKRUx4IANPSaGqWsylmUuZPUTethYVDMhEMEi3XqXS1jGn+tO5CW+QW9qoIxCPJ7r6E1XLGP7gsY+XQFPeqqUou20Ipd8w77IjE2UPV8pv2tDiKsqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VV0I2AP/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VV0I2AP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775862682; x=1807398682;
  h=date:from:to:cc:subject:message-id;
  bh=u55h2IEH+mTo6sziZzC57ARiOhljqZqXrpEjTZXufL0=;
  b=VV0I2AP/lKdhTLjewmGTDIoVgZUrviA5aHoYW4E8wa/6LVsaRXaw2r90
   zvkXIcEFDUmRYhAeLjUjtBCm9MyBoQst5SuVFFnGSEAvuDC0P66ciLHH+
   +rYFytF1Lp+8U+IZi75dGja0Hx7tyRnyEe4hPcP1blFHfEM/pxghgKu4X
   W4ZV8kVrwk6jOxHKact3fRcRgMIoHPdEALtfP22TpUp7aMdeWIGnxJ2RR
   as/qnaVqcpha7lDRBCCQq4MXEJkrxOqoHTaNZZKSEFxE1FnlGlG/cYod4
   cSkTH13QgEa9Kb6ri4Xou3HI4SiksuPJOSRph5yrtdwJg3QQ1/V5xD/a4
   A==;
X-CSE-ConnectionGUID: fy7SBv5IQGmDDpY67ZiaxQ==
X-CSE-MsgGUID: t+GBRrpyRNKMDMI1nTlUaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80777383"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="80777383"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:11:22 -0700
X-CSE-ConnectionGUID: Ilcfxqn/RIi7Yge2/r+Z4Q==
X-CSE-MsgGUID: FMwNgTNOQSi+rxWMHEt11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="229102395"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Apr 2026 16:11:21 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBL0Q-000000000Lp-1tUc;
	Fri, 10 Apr 2026 23:11:18 +0000
Date: Sat, 11 Apr 2026 07:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 25/38] arch/arm64/kernel/time.c:56:22:
 error: static declaration of 'random_get_entropy' follows non-static
 declaration
Message-ID: <202604110755.bcyZONtz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: 54bd79b94adcfca5a061b3d2f7f38c510b688c7c [25/38] arm64: Select ARCH_HAS_RANDOM_ENTROPY
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260411/202604110755.bcyZONtz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110755.bcyZONtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110755.bcyZONtz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/kernel/time.c:56:22: error: static declaration of 'random_get_entropy' follows non-static declaration
      56 | static unsigned long random_get_entropy(void)
         |                      ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/random.h:154,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/arm64/include/asm/cpufeature.h:27,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/clocksource.h:17,
                    from include/linux/clockchips.h:14,
                    from arch/arm64/kernel/time.c:10:
   arch/arm64/include/asm/random.h:9:15: note: previous declaration of 'random_get_entropy' with type 'long unsigned int(void)'
       9 | unsigned long random_get_entropy(void);
         |               ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/time.c:56:22: warning: 'random_get_entropy' defined but not used [-Wunused-function]
      56 | static unsigned long random_get_entropy(void)
         |                      ^~~~~~~~~~~~~~~~~~


vim +/random_get_entropy +56 arch/arm64/kernel/time.c

    55	
  > 56	static unsigned long random_get_entropy(void)
    57	{
    58		return arch_timer_read_counter();
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
