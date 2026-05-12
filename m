Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53184266B2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 06:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565902; cv=none; b=eVMF4aJ2C9++CfsipZusnKjfWxVwCFyngE8EVZY9modhzNFhpaKqfS2QjW/CJzSF4+r7goN8SXmpKLaJWjOCRTmF6eLfDH0e2aK9KSGhapD1eJeRCONbTPXQytZ+AgQ9NZUCCnQkK5P5fEbJJ9+PXTYnb97Gbs8B2+GOhAiiTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565902; c=relaxed/simple;
	bh=ottS2BbDVZ713Z8s2w0sazEubEGnD6FpxPv8pBvJLAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZOJJ5i9v5o4rKgKAPxuhSQ8gi3O7y4nVI1+lmhS/036cN/4fN0HTf2FgQPzB9qtRxod32axjn3wfXBof2ObndB8aWGg01Ck7NXf1yQEjSCZwEniDFcm2O/Q4yY0cVC13memiFWdfohqAQBfC7ihmucB2XuyQ12NWWsLB6W9EoAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g0uMrW1S; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0uMrW1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778565896; x=1810101896;
  h=date:from:to:cc:subject:message-id;
  bh=ottS2BbDVZ713Z8s2w0sazEubEGnD6FpxPv8pBvJLAc=;
  b=g0uMrW1SXFjIhWVVSqV2HYeDpFw3Z31LpSKIp5vi8rSIiHp6gPMTJDbL
   R5UFyzhfsuFB9Rr8YeYb2UzTOmrw/+RgYU7fFVWJTg6Nlx0Ppphdb/u0s
   HDFFMkKfxCT8FJpkCR7SkQvKKvi/jhu4PdMwVJ6b4bd4WeUysc1ule6ni
   vomEPDn/C51eP3DNv1h7Y8oJMBI5AHm9oppEcGLkht2HdkmIfc56ntC5c
   PbVuyzgCDX0F8y2Ig4Hsg795YxEzC56EzsbfT6t3lQLUcbmDxz3heoUAn
   bY7r6hxl4PtwJ+/0gNaasQWzZBr9ii2Edgg0GDUbMtVp4km9HkwWKWAHH
   g==;
X-CSE-ConnectionGUID: JmBYQ5gtSOyhTkLeNYBlxw==
X-CSE-MsgGUID: rfUNpu93TvOjOm79Ri2l4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90164167"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="90164167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 23:04:51 -0700
X-CSE-ConnectionGUID: 62VEj6PORcWzmePsbW3Bcw==
X-CSE-MsgGUID: ZvT9niouSuS7HljVxDaiLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242644706"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 23:04:49 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMgEZ-000000001g5-0JDM;
	Tue, 12 May 2026 06:04:47 +0000
Date: Tue, 12 May 2026 14:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v4 15/56]
 drivers/iommu/riscv/iommu-ir.c:325:27: error: implicit declaration of
 function 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202605121346.GepBEaGz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   8ec4d1f998a55911e55f8f7a607861007532cd1b
commit: 3a2ee01e59297777c99794a5887e5e1109bbbf27 [15/56] iommu/riscv: Add guest file irqbypass support
config: x86_64-buildonly-randconfig-003-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121346.GepBEaGz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121346.GepBEaGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121346.GepBEaGz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_ir_msiptp_update':
>> drivers/iommu/riscv/iommu-ir.c:325:27: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_phys'? [-Wimplicit-function-declaration]
     325 |                 .msiptp = virt_to_pfn(domain->msi_root) |
         |                           ^~~~~~~~~~~
         |                           virt_to_phys

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +325 drivers/iommu/riscv/iommu-ir.c

   306	
   307	static void riscv_iommu_ir_msiptp_update(struct riscv_iommu_domain *domain)
   308	{
   309		struct pt_iommu_riscv_64_hw_info pt_info, gstage_info;
   310		struct riscv_iommu_device *iommu, *prev;
   311		struct riscv_iommu_bond *bond;
   312		struct riscv_iommu_dc new_dc;
   313	
   314		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
   315		pt_iommu_riscv_64_hw_info(&domain->gstage_riscvpt, &gstage_info);
   316	
   317		new_dc = (struct riscv_iommu_dc){
   318			.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
   319			      RISCV_IOMMU_PC_TA_V,
   320			.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, gstage_info.fsc_iosatp_mode) |
   321				   FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
   322				   FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, gstage_info.ppn),
   323			.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
   324			       FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn),
 > 325			.msiptp = virt_to_pfn(domain->msi_root) |
   326				  FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
   327					     RISCV_IOMMU_DC_MSIPTP_MODE_FLAT),
   328			.msi_addr_mask = domain->msi_addr_mask,
   329			.msi_addr_pattern = domain->msi_addr_pattern,
   330		};
   331	
   332		/* Like riscv_iommu_ir_msitbl_inval(), synchronize with riscv_iommu_bond_link() */
   333		smp_mb();
   334	
   335		rcu_read_lock();
   336	
   337		prev = NULL;
   338		list_for_each_entry_rcu(bond, &domain->bonds, list) {
   339			iommu = dev_to_iommu(bond->dev);
   340			if (iommu == prev)
   341				continue;
   342	
   343			riscv_iommu_iodir_update(iommu, bond->dev, &new_dc);
   344			prev = iommu;
   345		}
   346	
   347		rcu_read_unlock();
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
