Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CDA392C4F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 23:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768433351; cv=none; b=n0aAG9xXfmsYky/swg4MOJ/rpq3Scfz9tV6S04GAz33fWQZL1aAf0UMzEPsXmg17+K3UQk4Ae7pa4gaSWw45A0AXOq2c65ENW1/DuiaoDRAkfRAYh+p7EZp9yxszQLHokWDBGZRmMP8iYXduOzLYfluBaJ5CDVzPXCqFePkn2yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768433351; c=relaxed/simple;
	bh=TmdDwrkjemfKr84Co8l+XTXTvbIWJUPZaOwT8F/RTkc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xuk2Q0tLaawTBepzbh1oJlmFWDiYBnXpqi42ZDEkWTYHoNr+mJDS5vtpjs08RvArn0GmsCAdxHMCxgOtDn/M2iyVnqjjXAedCgjvi7zrNvz6TJzqLP+Bb17Wzjxnf7q10XCYssaHkk7FmcCa8RxWB3kSesK8c7FZQoWCcbCVkx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=empkzwXY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="empkzwXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768433331; x=1799969331;
  h=date:from:to:cc:subject:message-id;
  bh=TmdDwrkjemfKr84Co8l+XTXTvbIWJUPZaOwT8F/RTkc=;
  b=empkzwXYCGtM2/aytOHyZerE7Qs60ruos8bhBIuuuwumm5NpihrHFl62
   oDp93eIU+hs5b4btVdZeUvWMBxW41X6QeJuVCWyTCiYQof3HqBB1XUa/O
   TFe6XZcB6Dt6EdPiBcaYMcS/hqnkeib4gwjl6sknWaDipZDQUW56pf+Y2
   amvk1UbeK1UAEP48W+EJEFwze/5rYOIBXF5hm9OyDh2ayli4xZU+04PH0
   jeCa/KfcGimLMVpiSRzjeU42SMOmWQo4Zpxez7Mm/wSUybRuA+UZBFWi8
   oLXC2HfBxLYjN0APzBh8EAvtL49A/KqsSBDcDZXPj9vbnHHTBjz5Xfr43
   A==;
X-CSE-ConnectionGUID: LjiT2owlTFO+9/vfitGqsw==
X-CSE-MsgGUID: HruiNLEVSNW+X6rd13MA0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69717337"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69717337"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 15:28:33 -0800
X-CSE-ConnectionGUID: +9iNP/OfR0qKGVYgJedDrA==
X-CSE-MsgGUID: 8GqTYyWcQzuqL5+IWpnnFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205221836"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 15:28:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgAHs-00000000HCM-3zzz;
	Wed, 14 Jan 2026 23:28:28 +0000
Date: Thu, 15 Jan 2026 07:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 17/29]
 arch/riscv/kvm/gstage.c:324:9: sparse: sparse: incorrect type in assignment
 (different base types)
Message-ID: <202601150745.7E50qSt8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v1
head:   d4b2d5a14e336a12a75d613fa8c743557c44795b
commit: 36e3b851139a5475c27a09c75c79a580a1c34bdc [17/29] RISC-V: KVM: Extend kvm_riscv_mmu_update_hgatp() for nested virtualization
config: riscv-randconfig-r121-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150745.7E50qSt8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150745.7E50qSt8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150745.7E50qSt8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kvm/gstage.c:324:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/gstage.c:324:9: sparse:     expected unsigned long
   arch/riscv/kvm/gstage.c:324:9: sparse:     got restricted __le64 [usertype]

vim +324 arch/riscv/kvm/gstage.c

   316	
   317	void kvm_riscv_gstage_update_hgatp(phys_addr_t pgd_phys, unsigned long vmid)
   318	{
   319		unsigned long hgatp = kvm_riscv_gstage_mode << HGATP_MODE_SHIFT;
   320	
   321		hgatp |= (vmid << HGATP_VMID_SHIFT) & HGATP_VMID;
   322		hgatp |= (pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
   323	
 > 324		ncsr_write(CSR_HGATP, hgatp);
   325	
   326		if (!kvm_riscv_gstage_vmid_bits())
   327			kvm_riscv_local_hfence_gvma_all();
   328	}
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
