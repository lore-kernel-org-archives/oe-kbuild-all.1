Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4F2C21F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986131; cv=none; b=jGmmZmXP9LVYlB0J4643d3Hdxil77itExZ580crL+XWmw5DU9QB6hMUX6BPsAr/E6vGoKQGPTtBqSu8x/1QaAzf+yLFMbMwsc1YIq3qPcHRn9bs3L+MzdEGyJbrHV1aPcQJWQ8d82dyx2S45IDN2MHDsKCi7vPKQIZESQUkd9BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986131; c=relaxed/simple;
	bh=d1syxAptadqxWPoPugRCe4YMCcs8iXAx3GQeBGcZYj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIRyVtwDOOFp4qRd2KY8Y3g7rLbN7iAVegejvMtwyPMlCNdXrD3qTiqI9kfr5A/TmQ/sEo0OV1VGn406QeR5Gl5CcgpieobEwlIu/TEBqhu7WsPNb9jZ6zypeRAHyIsXaVf/pAmw/CwhBmtvHjsIFbtz+5gg4xTosmvLZaBQWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4C01fVg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4C01fVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760986129; x=1792522129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d1syxAptadqxWPoPugRCe4YMCcs8iXAx3GQeBGcZYj0=;
  b=J4C01fVgO1FHXA+R2NigakBkhGEnZX92tx4lu8ow5g+CWOqOfUrKniKN
   mu32WxGmsRTJ0iAQErd9LMFtAYDp8AOqQFPgM6v92GZ8ZNZlS8e+/5X7m
   WGCsVgsna9VeIcsVTsaCR0j2hcyvSVw0t8HXVxYFk+iJUzexwynPBIMqd
   eb0G+/WARC6aBrJ1Qwfc45+EqTclNa32oQnTlkkvGp68PJuIpAc54N8vP
   2zzs4rGgXtAyJQ7/YWo+sdOtIzfMIImkuBFdbFE7Vb0aYmckWaGHYjeHu
   9FvKVRBb96cAaVp8sE28iovToouATlkX9+ikwFqq6fK+COpal1IVDrzQG
   g==;
X-CSE-ConnectionGUID: u15kgUu+SXKhEbaDiuxcZA==
X-CSE-MsgGUID: xqnp/RTPRT2G0TlCylkUtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73778638"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="73778638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:48:49 -0700
X-CSE-ConnectionGUID: qZIa/eOoRpqchj7lPIZ0pw==
X-CSE-MsgGUID: O2rthT2LSk2R/Ftgi8OcWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="184171256"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2025 11:48:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAuw1-000A5J-2W;
	Mon, 20 Oct 2025 18:48:45 +0000
Date: Tue, 21 Oct 2025 02:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v21 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Message-ID: <202510210232.L2yY8OFS-lkp@intel.com>
References: <20251015-v5_user_cfi_series-v21-25-6a07856e90e7@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-v5_user_cfi_series-v21-25-6a07856e90e7@rivosinc.com>

Hi Deepak,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-VM_SHADOW_STACK-definition-for-riscv/20251016-021733
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251015-v5_user_cfi_series-v21-25-6a07856e90e7%40rivosinc.com
patch subject: [PATCH v21 25/28] riscv: create a config for shadow stack and landing pad instr support
config: riscv-randconfig-001-20251020 (https://download.01.org/0day-ci/archive/20251021/202510210232.L2yY8OFS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210232.L2yY8OFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210232.L2yY8OFS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/kernel/usercfi.c: In function 'amo_user_shstk':
>> arch/riscv/kernel/usercfi.c:136:9: error: implicit declaration of function '__enable_user_access' [-Werror=implicit-function-declaration]
     136 |         __enable_user_access();
         |         ^~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/usercfi.c:140:60: error: expected ':' before '_ASM_EXTABLE'
     140 |                 "1: ssamoswap.d %[swap], %[val], %[addr]\n"
         |                                                            ^
         |                                                            :
     141 |                 _ASM_EXTABLE(1b, %l[fault])
         |                 ~~~~~~~~~~~~                                
>> arch/riscv/kernel/usercfi.c:141:30: error: invalid suffix "b" on integer constant
     141 |                 _ASM_EXTABLE(1b, %l[fault])
         |                              ^~
>> arch/riscv/kernel/usercfi.c:148:9: error: implicit declaration of function '__disable_user_access' [-Werror=implicit-function-declaration]
     148 |         __disable_user_access();
         |         ^~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/usercfi.c:150:1: warning: label 'fault' defined but not used [-Wunused-label]
     150 | fault:
         | ^~~~~
   cc1: some warnings being treated as errors
--
   drivers/perf/riscv_pmu_sbi.c: In function 'pmu_sbi_setup_irqs':
>> drivers/perf/riscv_pmu_sbi.c:1199:37: error: 'RV_IRQ_PMU' undeclared (first use in this function); did you mean 'RV_IRQ_EXT'?
    1199 |                 riscv_pmu_irq_num = RV_IRQ_PMU;
         |                                     ^~~~~~~~~~
         |                                     RV_IRQ_EXT
   drivers/perf/riscv_pmu_sbi.c:1199:37: note: each undeclared identifier is reported only once for each function it appears in
--
>> cc1: error: '-fcf-protection=full' is not supported for this target

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RISCV_SBI
   Depends on [n]: !RISCV_M_MODE [=y]
   Selected by [y]:
   - RISCV_USER_CFI [=y] && 64BIT [=y] && RISCV_ALTERNATIVE [=y]
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/__enable_user_access +136 arch/riscv/kernel/usercfi.c

95bae5bc77741e Deepak Gupta 2025-10-15  122  
21515287e36beb Deepak Gupta 2025-10-15  123  /*
21515287e36beb Deepak Gupta 2025-10-15  124   * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
21515287e36beb Deepak Gupta 2025-10-15  125   * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
21515287e36beb Deepak Gupta 2025-10-15  126   * shadow stack. To keep it simple, we plan to use `ssamoswap` to perform writes on shadow
21515287e36beb Deepak Gupta 2025-10-15  127   * stack.
21515287e36beb Deepak Gupta 2025-10-15  128   */
21515287e36beb Deepak Gupta 2025-10-15  129  static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
21515287e36beb Deepak Gupta 2025-10-15  130  {
21515287e36beb Deepak Gupta 2025-10-15  131  	/*
21515287e36beb Deepak Gupta 2025-10-15  132  	 * Never expect -1 on shadow stack. Expect return addresses and zero
21515287e36beb Deepak Gupta 2025-10-15  133  	 */
21515287e36beb Deepak Gupta 2025-10-15  134  	unsigned long swap = -1;
21515287e36beb Deepak Gupta 2025-10-15  135  
21515287e36beb Deepak Gupta 2025-10-15 @136  	__enable_user_access();
21515287e36beb Deepak Gupta 2025-10-15  137  	asm goto(
21515287e36beb Deepak Gupta 2025-10-15  138  		".option push\n"
21515287e36beb Deepak Gupta 2025-10-15  139  		".option arch, +zicfiss\n"
21515287e36beb Deepak Gupta 2025-10-15 @140  		"1: ssamoswap.d %[swap], %[val], %[addr]\n"
21515287e36beb Deepak Gupta 2025-10-15 @141  		_ASM_EXTABLE(1b, %l[fault])
21515287e36beb Deepak Gupta 2025-10-15  142  		".option pop\n"
21515287e36beb Deepak Gupta 2025-10-15  143  		: [swap] "=r" (swap), [addr] "+A" (*addr)
21515287e36beb Deepak Gupta 2025-10-15  144  		: [val] "r" (val)
21515287e36beb Deepak Gupta 2025-10-15  145  		: "memory"
21515287e36beb Deepak Gupta 2025-10-15  146  		: fault
21515287e36beb Deepak Gupta 2025-10-15  147  		);
21515287e36beb Deepak Gupta 2025-10-15 @148  	__disable_user_access();
21515287e36beb Deepak Gupta 2025-10-15  149  	return swap;
21515287e36beb Deepak Gupta 2025-10-15 @150  fault:
21515287e36beb Deepak Gupta 2025-10-15  151  	__disable_user_access();
21515287e36beb Deepak Gupta 2025-10-15  152  	return -1;
21515287e36beb Deepak Gupta 2025-10-15  153  }
21515287e36beb Deepak Gupta 2025-10-15  154  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
