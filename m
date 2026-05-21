Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D792A3537C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779401686; cv=none; b=OPLf4vliURdwVGY13SufRv3rnt25+85lmRUQ3yewhM3STXd7oTFIOr08pDRbcmV/p1SL6mlyUBIAWH/WF5r7PUXj17L/cSXpMAGkQu014/xp1uXG5ibJgfwbYvir6tmA4wUA+qlwvUuGZCdS6NGZbnReOVBGySur3LEu8skRwP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779401686; c=relaxed/simple;
	bh=+dP2e5K+OwMUWXdp7FcPqHjOH5RSDTslt1BE2RfjG0E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BLrXfgdn3dn+MZjBpC2QMJuBIzmuj56XYVL78Bs0Roes/bmeHf3RDFUiNtwol4QocFXgnJiJOtyxDHi9YnUkjhRo9qBXqZFD47WOn9RABGW8dxjJzv8ytDd26estMdl3TgGpTECI5BXjgJAUeeYLguv1nWN5SzhhZJ5zoK8tTOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxAafkcu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxAafkcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779401683; x=1810937683;
  h=date:from:to:cc:subject:message-id;
  bh=+dP2e5K+OwMUWXdp7FcPqHjOH5RSDTslt1BE2RfjG0E=;
  b=FxAafkcu+Sdu7T7kooNtBOMZjxSbBzoPK9w+zeaqnyslFsDSfHfNRVvm
   MD7lWWzoiTsKG+zvL64HrgZX0/fQcxWwc9mSy3SuLsggOssItqiZrcj9k
   2S+fL+MnqTn58qfYpL/5mdKqkpQwN2K19nNDX/m6UgFS6fBUazbeuHaMY
   jn51tRoGMBTCrvh4sAxQRwSmfaB8vIxqiJXmDblmwIIdF2uD6WMlWITQa
   4es09ZcavpabWNb2mnILpMViB8rFan8OZe/Icnli6RZcy6tMcoMG4VAWi
   MCO7kKRBZkSQp6sor0EofhMc+5r2KIFe6D5PcNw8OlSG1jnfz0DJCOtkY
   g==;
X-CSE-ConnectionGUID: IsEpiunzQUCc464KxNDK2g==
X-CSE-MsgGUID: zGwHlNKTS2WPllWpsMw0oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80386879"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80386879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 15:14:43 -0700
X-CSE-ConnectionGUID: NX7NzAemQu6zaTMf4l5CcQ==
X-CSE-MsgGUID: OoAosNzCT3uVJrD5m8KsDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="244716858"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2026 15:14:42 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQBf5-000000001FV-01uZ;
	Thu, 21 May 2026 22:14:39 +0000
Date: Fri, 22 May 2026 06:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 12/65]
 drivers/iommu/riscv/iommu.c:1181:29: error: implicit declaration of function
 'virt_to_pfn'; did you mean 'virt_to_pte'?
Message-ID: <202605220640.ndpqT67J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   7087f62c7333ca95c6a5c57f5ba52bd1594f22cf
commit: 4d325e1fb5c55e8cf3982b22ec745949ededd3b7 [12/65] iommu/riscv: Add IRQ domain for interrupt remapping
config: um-randconfig-002-20260522 (https://download.01.org/0day-ci/archive/20260522/202605220640.ndpqT67J-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220640.ndpqT67J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220640.ndpqT67J-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu.c: In function 'riscv_iommu_attach_paging_domain':
>> drivers/iommu/riscv/iommu.c:1181:29: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_pte'? [-Wimplicit-function-declaration]
    1181 |                 dc.msiptp = virt_to_pfn(domain->msi_root) |
         |                             ^~~~~~~~~~~
         |                             virt_to_pte

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


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
