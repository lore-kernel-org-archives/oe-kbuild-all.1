Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8A1A0731
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 03:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742872387; cv=none; b=GbsT6KijMDoz3qHejdGFe5RA9+vA6YpQfaowxF/mwoEgwwIlNXawKkedMafIH5+PiNf3bRll37Pnf0bGe6VVMobXAg+0MexhJYtq10L9U9D1zDxQ5gA1SEaCtYy+6btyUsnIWpLDMy3+oEtvPEaPcdHpNFhf+4rJC7rlvZihlEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742872387; c=relaxed/simple;
	bh=JeUGltH0NaGqMFRd4Nv0oSKt5WpngbBCXmU4xjm7aNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZwhwG3kh/sC26eR5zZfmQt+zNCOR90xpZnhjEF9dWe+0aFiubXObatVwcCci2+vTY7fMnMxmHzcKexLMBCTl9P3BV1gSJebDt26PsmJqZIky6cGYaLGw3NNxtHsAS8hmdLz5wDdxTgxAcUcuIV/Og9VxUgu5K8UKDlubAv9UDko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzpFgyVE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzpFgyVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742872386; x=1774408386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JeUGltH0NaGqMFRd4Nv0oSKt5WpngbBCXmU4xjm7aNQ=;
  b=gzpFgyVEp+a9HwqiSoNLl0bOkqVyH7rmQk8+spw6whTAznnN/kI/+g+p
   fnGii0uCef8JDPN3oNDMBXw7hRz9y7NstqbQeezuPZ2z3C9/5nH0XTemb
   apq9NmQW7SoO8VMPCDAEyIPyaZFqoMM/d3gCilgtOpE2SMYHTqiKrJQnz
   ol4DGqQ9/aeBkOAKuxIXtQW/26QJkFaOMFNUxiQaRjBEebauIZwOsq7T+
   ItUqEN1lxjhmPN61BN0TwpMwrNIrOX6DJK7Cyc051+JBw8+o0/kj7hNR2
   n47of18Z9Jmke8Y2Nroe3//2D/Xgf1R2Ih15Mio7voVM9N3D9Ps6VqpcZ
   w==;
X-CSE-ConnectionGUID: MuOo7vDRSMqEk/Y1EVoQUA==
X-CSE-MsgGUID: LTHVjJCmRJ+QDTWSh+OWZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54768016"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="54768016"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 20:13:03 -0700
X-CSE-ConnectionGUID: /HnfaAmrREy2XcOIZbL0xw==
X-CSE-MsgGUID: 540opKP9RteXjj5bLRQs+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="161455683"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Mar 2025 20:13:02 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twuiY-00046h-09;
	Tue, 25 Mar 2025 03:12:59 +0000
Date: Tue, 25 Mar 2025 11:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] arch/arm64/kvm/arm.c:2011:39:
 error: use of undeclared identifier 'smccc_trng_available'
Message-ID: <202503251141.YFGEn7gc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   79690c1514e424a9e114b551db43e02068191cf0
commit: 888643ea37b504cb32afdd6430698d1e92a79a71 [1/1] ANDROID: KVM: arm64: relay entropy requests from protected guests directly to secure
config: arm64-randconfig-r064-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251141.YFGEn7gc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251141.YFGEn7gc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251141.YFGEn7gc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:2011:39: error: use of undeclared identifier 'smccc_trng_available'
    2011 |         kvm_nvhe_sym(smccc_trng_available) = smccc_trng_available;
         |                                              ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]


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
