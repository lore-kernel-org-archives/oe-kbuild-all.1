Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA604390613
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 23:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779407283; cv=none; b=XAdPGmAKFkhHRG4YE5/NqRh9/urhO90XxIOLcPZwVjGxM5FCpflpka7deazIrE3WvEfz76laYdYM+DsxG+WTHpJ70mZAT+sBs0dYwXx2yZGAd9X6tYQ5vGq9Pw8/R4ssMh89aOetoKtDBrGBy+mRvV0W1yWrU6FcCiRrLdbrY14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779407283; c=relaxed/simple;
	bh=tnAOSs7I5PVB9TCxNDqtx3h5QwGvhalRntJ4jkgbXMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a56DHVw/ZhhCEFP+X/u2WhLpxW7VaFvCTjiqr3Bj2gEiIl+zSSzNj6EeQ+FLKArRrQDNYBvNtOAQL4x6SuCoU22+4Ax/kASSTQG5kBBAVAqgWdMhgzcIN+LveYYZr+57rCA3ULUrSeIB6aDCufbW1fB+FWn8rqScKngFhrgXdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iv1RYERR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iv1RYERR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779407277; x=1810943277;
  h=date:from:to:cc:subject:message-id;
  bh=tnAOSs7I5PVB9TCxNDqtx3h5QwGvhalRntJ4jkgbXMM=;
  b=iv1RYERRnTUcqjUcGq2XY56OJMmeUBqFv23NsOcxoXZdyzX6B60phzXn
   5sG/196eD7NpDYcugc1nPAd+KLUL03NHUwthRwZkT6YaqURV1Lwjf5f3S
   x49VpAujfWCObUIgc6Qp5nXPVsb2J3G7xymwOfr9K45/yls5+mleNBwRx
   Yx7PYnZG5wXvOfBCpTgis6DP8D0PLEWEga6sWI5dgIwq4JxhBGBLGqw8R
   pDK5AWYdYBTn/tu2cA8NFID51nSV8mqlDn7VxOYof9wbmFOIhjufvy340
   yxWl0oTSJzpyu3ZNBqhSsvDMkw/nZOQCUO4xDAt9L8nEdfy0Vj002kLVW
   A==;
X-CSE-ConnectionGUID: FEa8fcUERsWKJpTmrqAv6A==
X-CSE-MsgGUID: emBRDT6wQJGGDu4xgQfb3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80370151"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80370151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 16:47:52 -0700
X-CSE-ConnectionGUID: 30a+qg4DTaKQPazGLBmdbQ==
X-CSE-MsgGUID: qlCeIwCkSbK6EWMqnViEGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="244976957"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2026 16:47:51 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQD7D-000000001O5-3eTQ;
	Thu, 21 May 2026 23:47:47 +0000
Date: Fri, 22 May 2026 07:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 20/65]
 drivers/iommu/riscv/iommu-ir.c:325:27: error: implicit declaration of
 function 'virt_to_pfn'; did you mean 'virt_to_pte'?
Message-ID: <202605220716.iFPU1cIC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   7087f62c7333ca95c6a5c57f5ba52bd1594f22cf
commit: b94a25c2259625ebc67070995888f7baec7e3203 [20/65] iommu/riscv: Add guest file irqbypass support
config: um-randconfig-002-20260522 (https://download.01.org/0day-ci/archive/20260522/202605220716.iFPU1cIC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220716.iFPU1cIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220716.iFPU1cIC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_ir_msiptp_update':
>> drivers/iommu/riscv/iommu-ir.c:325:27: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_pte'? [-Wimplicit-function-declaration]
     325 |                 .msiptp = virt_to_pfn(domain->msi_root) |
         |                           ^~~~~~~~~~~
         |                           virt_to_pte

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


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
