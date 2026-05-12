Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BF4288C96
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 03:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557122; cv=none; b=P2QnDbP0iZcHeY8d89ul/lTCigv1S2eS/z+EjiX8D7QzaAfHB9apJH/920NK+hcUbbtgV6gKzUqoxwk+zCNpHR8fen+dQ6u770Q339eCXZr3+4dUxhl8Tymqi83UI1vCEHQFU6Mj7rl5T568xSX2bMFOo1F0jSris2IUsdtp8nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557122; c=relaxed/simple;
	bh=VbkMPhTSYa/cXwuYY1dHO3wVfVnXQqrr0vGG857A7Ro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IzJUveSuTj7x72VNf2dvyPm93TKRJALCrhzKrFMJaXFR5dqA5WpKqKB6UMdEfNK+Y6uXHLqDZKflZoTd/Ev2b/HzpVWcrH7GGyL6EP+oNqvFg7ylsDOTqAqnjJFvCn1muFxiO6PYB5ZAKO1PzVyXNWUUycpZxcq5NI+V4JzOSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSd8OZKQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSd8OZKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778557121; x=1810093121;
  h=date:from:to:cc:subject:message-id;
  bh=VbkMPhTSYa/cXwuYY1dHO3wVfVnXQqrr0vGG857A7Ro=;
  b=QSd8OZKQSvyMulaUYEao2O2BD2edKvueNbTe+UYHdxc3xmm/2Zbf86uz
   FRjwe3XT/PH4M9l/n60BT8y84pvL0eQj+//1bzIl4gEeTCsD0777O0Kc8
   Kf6DlbrRkzIX+dAfdeUSyx+uBgmsQrgaHoKQVpr4YfDhUnl4xWjPhW1mu
   DNs7HcUPJ1Lh89K50q6QVZuhCPKzy64mD8N2DlStGx1l4vn2MWLUTBbwt
   ItfJXoczxEmlT+46U6dzZB4Rc0YNlWH9g1oZrDCfkMKy/M0H/qTup0//m
   XubZVv9P7BfNNnnXjsW7/9sE0mo65OLpBCl/OSuiGoByPLSqDi7rlzk/w
   Q==;
X-CSE-ConnectionGUID: t2AXL19nSaKpu7xEJ81Idw==
X-CSE-MsgGUID: r00Wi2FYRBqaV0A6ev4t9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79355564"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79355564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 20:38:40 -0700
X-CSE-ConnectionGUID: HGTMd4bLTl2KIUetxcOqWQ==
X-CSE-MsgGUID: oJz9pgQjSaSdr5IcRQ/MUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="236663787"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 May 2026 20:38:38 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMdx5-000000001XF-3MIS;
	Tue, 12 May 2026 03:38:35 +0000
Date: Tue, 12 May 2026 11:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v4 7/56]
 drivers/iommu/riscv/iommu.c:1181:29: error: implicit declaration of function
 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202605121128.IZYkhEbZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   8ec4d1f998a55911e55f8f7a607861007532cd1b
commit: 636d6f4d6f412057412d72bfa4751cf2e760b0ad [7/56] iommu/riscv: Add IRQ domain for interrupt remapping
config: x86_64-buildonly-randconfig-003-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121128.IZYkhEbZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121128.IZYkhEbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121128.IZYkhEbZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu.c: In function 'riscv_iommu_attach_paging_domain':
>> drivers/iommu/riscv/iommu.c:1181:29: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_phys'? [-Wimplicit-function-declaration]
    1181 |                 dc.msiptp = virt_to_pfn(domain->msi_root) |
         |                             ^~~~~~~~~~~
         |                             virt_to_phys

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +1181 drivers/iommu/riscv/iommu.c

  1155	
  1156	static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
  1157						    struct device *dev,
  1158						    struct iommu_domain *old)
  1159	{
  1160		struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
  1161		struct riscv_iommu_device *iommu = dev_to_iommu(dev);
  1162		struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
  1163		struct pt_iommu_riscv_64_hw_info pt_info;
  1164		struct riscv_iommu_dc dc = {0};
  1165		int ret;
  1166	
  1167		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
  1168	
  1169		if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
  1170			return -ENODEV;
  1171	
  1172		ret = riscv_iommu_ir_attach_paging_domain(domain, dev);
  1173		if (ret)
  1174			return ret;
  1175	
  1176		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
  1177			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
  1178		dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) | RISCV_IOMMU_PC_TA_V;
  1179	
  1180		if (domain->msi_root) {
> 1181			dc.msiptp = virt_to_pfn(domain->msi_root) |
  1182				    FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
  1183					       RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
  1184			dc.msi_addr_mask = domain->msi_addr_mask;
  1185			dc.msi_addr_pattern = domain->msi_addr_pattern;
  1186		}
  1187	
  1188		if (riscv_iommu_bond_link(domain, dev))
  1189			return -ENOMEM;
  1190	
  1191		riscv_iommu_iodir_update(iommu, dev, &dc);
  1192		riscv_iommu_bond_unlink(info->domain, dev);
  1193		info->domain = domain;
  1194	
  1195		return 0;
  1196	}
  1197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
