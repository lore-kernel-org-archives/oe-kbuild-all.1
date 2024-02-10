Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE7569F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 04:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707540549; cv=none; b=UDK/hignVtjDLb0g5mNvYI9bjzhw9OQK2GOnPgpdzV3bCR4a6cgA5mCR9rSqQ48baeWdrXqvflLMeTKR/d9kha1CUpfyw3bRENC94R6g2Vf7itKjYPMU8Dy2CrOPbBa1XOsaJtdBdjv3aAfejpODaHXdomAWodXMrpQY7iVL1sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707540549; c=relaxed/simple;
	bh=sF4GELokpttTpps009zWxVEcOvwRx/NNO1R7oFkf6Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P6dTPLBPUIKSIK+7cG0QFnRmhf+frGXTznteY+RnZDIV3jxqOo8Mdip+8SzDTrqwT41lTHFXgJ0h5DLYX0Z1Uzzu/c8wGkfFENzZ9VQ9LrUcud6vADrQenq8njXrndacwwsD3XTzCFvaBkPHjVISVi0Uox7ckQo2phqPdm6Qg4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpaXilgn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpaXilgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707540548; x=1739076548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sF4GELokpttTpps009zWxVEcOvwRx/NNO1R7oFkf6Qk=;
  b=BpaXilgnOlQRWCYZPTMgo4dCB0M8hku02IP7rtzzvpZfGDBhQyXCtl+0
   SoahKqFKivxk/zMFqwPnlH/dvNzYuCfHnM/kVzGvtbkO/cNpSZLAPZxP0
   R4sx75vdNk6Cs8l1/KNPUA6gnauVXzm+0uYMeO01VAEWz/0egZtbBCEJP
   fMpgGDk3JGGBlGXWqGv4LirufqbMURfZOZCSWb7z+o0kjlCEczlBDbJuY
   XLlQVMmQb5GPXATbk+z/Z1yK86HLPFl9ixyN0GI+kGJt5py1jQ6bFyAX7
   GamLnUsvJsfdV8kMa8Sc0Hfco3r6RKKi9kThoeTw54/0LMwLugoG7Vzrg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1861340"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="1861340"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 20:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="6860560"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2024 20:49:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYfIT-0005M2-1O;
	Sat, 10 Feb 2024 04:49:01 +0000
Date: Sat, 10 Feb 2024 12:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@google.com>
Subject: [sudeep-holla:android13-5.15/ffa 2786/4062]
 arch/arm64/kvm/arm.c:2011:39: error: use of undeclared identifier
 'smccc_trng_available'
Message-ID: <202402101209.a7Y2FFcM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: 888643ea37b504cb32afdd6430698d1e92a79a71 [2786/4062] ANDROID: KVM: arm64: relay entropy requests from protected guests directly to secure
config: arm64-randconfig-r063-20240209 (https://download.01.org/0day-ci/archive/20240210/202402101209.a7Y2FFcM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ac0577177f053ba7e7016e1b7e44cf5932d00b03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101209.a7Y2FFcM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101209.a7Y2FFcM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:2011:39: error: use of undeclared identifier 'smccc_trng_available'
    2011 |         kvm_nvhe_sym(smccc_trng_available) = smccc_trng_available;
         |                                              ^
   1 error generated.


vim +/smccc_trng_available +2011 arch/arm64/kvm/arm.c

  1997	
  1998	static int kvm_hyp_init_protection(u32 hyp_va_bits)
  1999	{
  2000		void *addr = phys_to_virt(hyp_mem_base);
  2001		int ret;
  2002	
  2003		kvm_nvhe_sym(id_aa64pfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
  2004		kvm_nvhe_sym(id_aa64pfr1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
  2005		kvm_nvhe_sym(id_aa64isar0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
  2006		kvm_nvhe_sym(id_aa64isar1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR1_EL1);
  2007		kvm_nvhe_sym(id_aa64mmfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
  2008		kvm_nvhe_sym(id_aa64mmfr1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
  2009		kvm_nvhe_sym(id_aa64mmfr2_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR2_EL1);
  2010		kvm_nvhe_sym(__icache_flags) = __icache_flags;
> 2011		kvm_nvhe_sym(smccc_trng_available) = smccc_trng_available;
  2012	
  2013		ret = create_hyp_mappings(addr, addr + hyp_mem_size, PAGE_HYP);
  2014		if (ret)
  2015			return ret;
  2016	
  2017		ret = init_stage2_iommu();
  2018		if (ret < 0)
  2019			return ret;
  2020	
  2021		ret = do_pkvm_init(hyp_va_bits, (enum kvm_iommu_driver)ret);
  2022		if (ret)
  2023			return ret;
  2024	
  2025		free_hyp_pgds();
  2026	
  2027		return 0;
  2028	}
  2029	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
