Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D13153820
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718624; cv=none; b=IQXeS/Eob9cqcoaIhRRI07+lulnF0xAyO4Sy3I4eFOtSCjLBVEFgEk1pCf9W3JIWRbC1JTtYfgnG5HFswMr/RK8r2JvjtIL8P7Gxyi9cXkkJ5K9oaeadHM8Ntrw9GGU9Hg98NIuwU7V2C6Fkav8N9ycweeD8hvEgRscR6TRNEqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718624; c=relaxed/simple;
	bh=ZD8v5zLjBKPnmArvvG/i9Wzpgt6cbLYB/rU1FRThEXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXzGqJNUrYeDAm38Xw5eOzRflgErqNq6Gxl7aTyZf24benErFDvG9IWsUEEqHV4OGHXd/2fI+TNRVomvARRObZC8EomrQTaVjpas00XlvR5YBT9uuRWVW+d3Q/RT46F0fMKZIQ3Q2AR7ZrSsRgxJKUrzqilRfC6Eu3al4IUZjpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8TpBvqC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8TpBvqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718622; x=1765254622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZD8v5zLjBKPnmArvvG/i9Wzpgt6cbLYB/rU1FRThEXg=;
  b=B8TpBvqCrK1VEEr+SvBzdB3arrRdISnqfUAfrkwXX62cHzE7ryCNVb9V
   tyuiZiAsVJUb0NkbwMnwmYfHsSd3stMorvKXIG4KMs3TlyqHMTcxIfAu7
   4SYkuiItSZIUmGVmcvq5vtmtiUzIEslBwsytszkcSVklA3hdTY4xyZ5IY
   kBQ7dgoqQ44MpNcndbscGYFy0kDx8RAipe8y+oew0AJNnMLmarhg95gW3
   PHLeKuXE7VQ4OBpSN5eOiBvHT5sf+lEUMf+crtUI2KvTmzA06UiFsyHc+
   msPgPMlg69kXNmCqhDqVo4Uxq663RVvGq4O2waS9SHQZUpD0qLa9Wulck
   A==;
X-CSE-ConnectionGUID: pSgqTYYDQHCWFo1A8jEoag==
X-CSE-MsgGUID: voYvuIDoQF2xpbPOuQmsBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37930981"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37930981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:30:20 -0800
X-CSE-ConnectionGUID: gtwP+bBKQbe9rNGPn+1LNQ==
X-CSE-MsgGUID: gAGa+rOfR2qDX21D1STTHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95751349"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 20:30:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVPU-0003rm-0E;
	Mon, 09 Dec 2024 04:30:16 +0000
Date: Mon, 9 Dec 2024 12:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:arm64/sysreg-el12 2/4] arch/arm64/mm/proc.S:504:
 Error: undefined symbol TCR2_EL1x_HAFT used as an immediate value
Message-ID: <202412080512.D8NvzV7F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git arm64/sysreg-el12
head:   43aafbc40b7a211579f624bf594eaa42d7675daf
commit: 9633732169ec11efc9e7aaa727feb3087c664832 [2/4] arm64/sysreg: Get rid of the TCR2_EL1x SysregFields
config: arm64-randconfig-004-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080512.D8NvzV7F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080512.D8NvzV7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080512.D8NvzV7F-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/proc.S: Assembler messages:
>> arch/arm64/mm/proc.S:504: Error: undefined symbol TCR2_EL1x_HAFT used as an immediate value


vim +504 arch/arm64/mm/proc.S

dd006da21646f1 Ard Biesheuvel           2015-03-19  486  
87366d8cf7b3f6 Radha Mohan Chintakuntla 2014-03-07  487  	/*
787fd1d019b269 Kristina Martsenko       2017-12-13  488  	 * Set the IPS bits in TCR_EL1.
87366d8cf7b3f6 Radha Mohan Chintakuntla 2014-03-07  489  	 */
5cd6fa6de5e903 Mark Rutland             2021-03-26  490  	tcr_compute_pa_size tcr, #TCR_IPS_SHIFT, x5, x6
2f4b829c625ec3 Catalin Marinas          2015-07-10  491  #ifdef CONFIG_ARM64_HW_AFDBM
2f4b829c625ec3 Catalin Marinas          2015-07-10  492  	/*
05abb595bbaccc Suzuki K Poulose         2018-03-26  493  	 * Enable hardware update of the Access Flags bit.
05abb595bbaccc Suzuki K Poulose         2018-03-26  494  	 * Hardware dirty bit management is enabled later,
05abb595bbaccc Suzuki K Poulose         2018-03-26  495  	 * via capabilities.
2f4b829c625ec3 Catalin Marinas          2015-07-10  496  	 */
2f4b829c625ec3 Catalin Marinas          2015-07-10  497  	mrs	x9, ID_AA64MMFR1_EL1
efe72541355d4d Yicong Yang              2024-11-02  498  	ubfx	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_SHIFT, #4
05abb595bbaccc Suzuki K Poulose         2018-03-26  499  	cbz	x9, 1f
5cd6fa6de5e903 Mark Rutland             2021-03-26  500  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
efe72541355d4d Yicong Yang              2024-11-02  501  #ifdef CONFIG_ARM64_HAFT
efe72541355d4d Yicong Yang              2024-11-02  502  	cmp	x9, ID_AA64MMFR1_EL1_HAFDBS_HAFT
efe72541355d4d Yicong Yang              2024-11-02  503  	b.lt	1f
efe72541355d4d Yicong Yang              2024-11-02 @504  	orr	tcr2, tcr2, TCR2_EL1x_HAFT
efe72541355d4d Yicong Yang              2024-11-02  505  #endif /* CONFIG_ARM64_HAFT */
05abb595bbaccc Suzuki K Poulose         2018-03-26  506  1:
2f4b829c625ec3 Catalin Marinas          2015-07-10  507  #endif	/* CONFIG_ARM64_HW_AFDBM */
776e49af6000ef Mark Rutland             2021-03-26  508  	msr	mair_el1, mair
5cd6fa6de5e903 Mark Rutland             2021-03-26  509  	msr	tcr_el1, tcr
9e9bb6ede00a84 Joey Gouly               2023-06-06  510  
9e9bb6ede00a84 Joey Gouly               2023-06-06  511  	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
9e9bb6ede00a84 Joey Gouly               2023-06-06  512  	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
9e9bb6ede00a84 Joey Gouly               2023-06-06  513  	cbz	x1, .Lskip_indirection
9e9bb6ede00a84 Joey Gouly               2023-06-06  514  
60d043c101769b Ard Biesheuvel           2024-02-14  515  	/*
60d043c101769b Ard Biesheuvel           2024-02-14  516  	 * The PROT_* macros describing the various memory types may resolve to
60d043c101769b Ard Biesheuvel           2024-02-14  517  	 * C expressions if they include the PTE_MAYBE_* macros, and so they
60d043c101769b Ard Biesheuvel           2024-02-14  518  	 * can only be used from C code. The PIE_E* constants below are also
60d043c101769b Ard Biesheuvel           2024-02-14  519  	 * defined in terms of those macros, but will mask out those
60d043c101769b Ard Biesheuvel           2024-02-14  520  	 * PTE_MAYBE_* constants, whether they are set or not. So #define them
60d043c101769b Ard Biesheuvel           2024-02-14  521  	 * as 0x0 here so we can evaluate the PIE_E* constants in asm context.
60d043c101769b Ard Biesheuvel           2024-02-14  522  	 */
60d043c101769b Ard Biesheuvel           2024-02-14  523  

:::::: The code at line 504 was first introduced by commit
:::::: efe72541355d4d40a4f076af453f6533e98e058c arm64: Add support for FEAT_HAFT

:::::: TO: Yicong Yang <yangyicong@hisilicon.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
