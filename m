Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A504C2E8B68
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761110618; cv=none; b=dfm9/tW27WPq9LM0XbqdeUksgeGWgsh/sHMofYNSDdbn5sNnDhPizfuJrgr/SEezBqSrJubQhdNSifaOrEB10RzAMw5mFkDZlzKa3PLE0fGm8xi4l32rRePbq+odiRfLqP0+lpaMd/cEdUdg1HbMnjaCcaTAMSHVBXUTsF4627g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761110618; c=relaxed/simple;
	bh=8Gxr9siNIyXoXvKhhTWFM6arAzrhjHNjkgQZlPogkdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wv0L2cgJHl80KNgiAlBu9aA9d0ZccK8AHQk19ld4i4HgPHTiPbiec+X/C+AcPxRlNwvCYPP9NayIlqSh0uvZvSGaclC/UPy55X34p0jHKfFeBuursIqheNRym1Gc2ao2ZWCrgG7pRTkzQB+6bRmrv58KOyn2NbvG5djKZATj3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8k5xXmH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8k5xXmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761110616; x=1792646616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Gxr9siNIyXoXvKhhTWFM6arAzrhjHNjkgQZlPogkdk=;
  b=L8k5xXmHzBniu9fZZdRmGPZBMGO6YMYSl8GtDX93v/6KEgVobM4sXA0v
   AbbkqONn8N5NJ+QEYvK0QIOERo9fB2hqClmT5Rh4zoSol/ubLYctGJ29s
   /XRffYeHYlES6U1QUPTYxCBmQgpFjzryAsRtCS+E5zm3lPopsuKA6pmF2
   G259/lNZrMQonQlvAO5ORUTECpnXQOoZWlObVYqFaP0j25G66dYHGXyFT
   IRaBXvcJcRMcJDC3D74RxMbqxY1T1mbN2Pu3ChGvbcfstWa1TLEBs18Sz
   OU6EHxTXxBvCxRyOJvsIiWqFVK2pooXsjG3/xh+9jVZCvgfrViZV4eukO
   g==;
X-CSE-ConnectionGUID: M7wDxFK+TwCeU1oCq1IY3Q==
X-CSE-MsgGUID: BZBZIY0ySeud78Cch2GqeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62279196"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="62279196"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:23:36 -0700
X-CSE-ConnectionGUID: sKxDN1yqSeqtr4Kk+nl+zA==
X-CSE-MsgGUID: 7ucf1gRIQKGG6QIxlQoUpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="214720676"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2025 22:23:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBRJs-000C1D-31;
	Wed, 22 Oct 2025 05:23:32 +0000
Date: Wed, 22 Oct 2025 13:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Rathor <mrathor@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>
Subject: [linux-next:master 2829/3483] arch/x86/hyperv/hv_crash.c:512:45-51:
 ERROR: application of sizeof to pointer
Message-ID: <202510221340.Uj8hW51i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
commit: 11831782653e2f4a909275dee7562883e8aa421c [2829/3483] x86/hyperv: Enable build of hypervisor crashdump collection files
config: x86_64-randconfig-103-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221340.Uj8hW51i-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221340.Uj8hW51i-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/hyperv/hv_crash.c:512:45-51: ERROR: application of sizeof to pointer
   arch/x86/hyperv/hv_crash.c:517:45-51: ERROR: application of sizeof to pointer
   arch/x86/hyperv/hv_crash.c:521:45-51: ERROR: application of sizeof to pointer
   arch/x86/hyperv/hv_crash.c:525:45-51: ERROR: application of sizeof to pointer

vim +512 arch/x86/hyperv/hv_crash.c

cd0e114e4583bb Mukesh Rathor 2025-10-06  499  
cd0e114e4583bb Mukesh Rathor 2025-10-06  500  /*
cd0e114e4583bb Mukesh Rathor 2025-10-06  501   * Build 32bit trampoline page table for transition from protected mode
cd0e114e4583bb Mukesh Rathor 2025-10-06  502   * non-paging to long-mode paging. This transition needs pagetables below 4G.
cd0e114e4583bb Mukesh Rathor 2025-10-06  503   */
cd0e114e4583bb Mukesh Rathor 2025-10-06  504  static void hv_crash_build_tramp_pt(void)
cd0e114e4583bb Mukesh Rathor 2025-10-06  505  {
cd0e114e4583bb Mukesh Rathor 2025-10-06  506  	p4d_t *p4d;
cd0e114e4583bb Mukesh Rathor 2025-10-06  507  	pud_t *pud;
cd0e114e4583bb Mukesh Rathor 2025-10-06  508  	pmd_t *pmd;
cd0e114e4583bb Mukesh Rathor 2025-10-06  509  	pte_t *pte;
cd0e114e4583bb Mukesh Rathor 2025-10-06  510  	u64 pa, addr = trampoline_pa;
cd0e114e4583bb Mukesh Rathor 2025-10-06  511  
cd0e114e4583bb Mukesh Rathor 2025-10-06 @512  	p4d = hv_crash_ptpgs[0] + pgd_index(addr) * sizeof(p4d);
cd0e114e4583bb Mukesh Rathor 2025-10-06  513  	pa = virt_to_phys(hv_crash_ptpgs[1]);
cd0e114e4583bb Mukesh Rathor 2025-10-06  514  	set_p4d(p4d, __p4d(_PAGE_TABLE | pa));
cd0e114e4583bb Mukesh Rathor 2025-10-06  515  	p4d->p4d &= ~(_PAGE_NX);	/* enable execute */
cd0e114e4583bb Mukesh Rathor 2025-10-06  516  
cd0e114e4583bb Mukesh Rathor 2025-10-06  517  	pud = hv_crash_ptpgs[1] + pud_index(addr) * sizeof(pud);
cd0e114e4583bb Mukesh Rathor 2025-10-06  518  	pa = virt_to_phys(hv_crash_ptpgs[2]);
cd0e114e4583bb Mukesh Rathor 2025-10-06  519  	set_pud(pud, __pud(_PAGE_TABLE | pa));
cd0e114e4583bb Mukesh Rathor 2025-10-06  520  
cd0e114e4583bb Mukesh Rathor 2025-10-06  521  	pmd = hv_crash_ptpgs[2] + pmd_index(addr) * sizeof(pmd);
cd0e114e4583bb Mukesh Rathor 2025-10-06  522  	pa = virt_to_phys(hv_crash_ptpgs[3]);
cd0e114e4583bb Mukesh Rathor 2025-10-06  523  	set_pmd(pmd, __pmd(_PAGE_TABLE | pa));
cd0e114e4583bb Mukesh Rathor 2025-10-06  524  
cd0e114e4583bb Mukesh Rathor 2025-10-06  525  	pte = hv_crash_ptpgs[3] + pte_index(addr) * sizeof(pte);
cd0e114e4583bb Mukesh Rathor 2025-10-06  526  	set_pte(pte, pfn_pte(addr >> PAGE_SHIFT, PAGE_KERNEL_EXEC));
cd0e114e4583bb Mukesh Rathor 2025-10-06  527  }
cd0e114e4583bb Mukesh Rathor 2025-10-06  528  

:::::: The code at line 512 was first introduced by commit
:::::: cd0e114e4583bb2146c9e3d95c036fddde8d4bb7 x86/hyperv: Implement hypervisor RAM collection into vmcore

:::::: TO: Mukesh Rathor <mrathor@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
