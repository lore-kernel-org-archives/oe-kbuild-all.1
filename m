Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EFE184540
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783201882; cv=none; b=E9vCLHICB5ZLV95G4zMmNKbFV46dgW6VIpzgEOBIVLSfft+Gf5c+qc9IGzKQdd4HjJCbFpTzl6yHJBTo8g8eC4MLqwC8yz78NYn8jL/Kk8hjVh4q6eFt9cYNl8gdJuDt3TlwguNwaxWF2Kzyp020QJ56oj+UpW2BIgrBwwim92Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783201882; c=relaxed/simple;
	bh=UalcgdVSaZHYmeNODPzIo79xLb5scqZZe7CJHts38w4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BOUoBB/GlUPGyPBDAF0BstR9o59CcmMgUouKSYC4fa0hAC1SCXMv6fzYLb5maWVRTBxWdMixyiez9wAzajiEFf3OxZ3M4ROYoBikXNns898MgWK2ypA4QyqLqEaJwqKiZmuPbHU64b3Nb5a62VDlZGLYpn9jeKiogN7Aa/y9OsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLSpQVZf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLSpQVZf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783201881; x=1814737881;
  h=date:from:to:cc:subject:message-id;
  bh=UalcgdVSaZHYmeNODPzIo79xLb5scqZZe7CJHts38w4=;
  b=iLSpQVZf8cS8Kgu8y2UhLGMCuPZ3VOP5MB/WzShqo21Websvlx6LfrSH
   SHqy/COD7krGE01k0mmt8J/PlBBWTzGEbyutBC29LafuZdkKkNzELVqYq
   5M/xttEOc/DdIF9OMsmNgalEH/IgA4UtAvtEouWVh2FuRiT2RtEM9O5vF
   keL23pdNDxEW/wBtSr+R6O7N80miVzSyaeRU/reyjLbuoalPax3jUnh8W
   D87cVwpCkc9bnT3u0aV5jA+Y9LmQxD6z5i/X55GgrsNkyDy0cAiCOAdHc
   x0RPqRV0311YQSIOT3NzNrTtVPdkTfJn1ogGFtkYo+irqkTwD01JnhSvj
   g==;
X-CSE-ConnectionGUID: IKUZ9lZbSXCyPdW4AvIjLg==
X-CSE-MsgGUID: Uouxx/mJTba9Eyd8DFPa+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="83761912"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="83761912"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 14:51:20 -0700
X-CSE-ConnectionGUID: 6/XTWhNGQRGWygoIb1VxnQ==
X-CSE-MsgGUID: eDqBSLjFQi2S03KlE8MakA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="257252621"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2026 14:51:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg8GX-00000000DHf-1tSI;
	Sat, 04 Jul 2026 21:51:13 +0000
Date: Sun, 05 Jul 2026 05:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v4 8/58]
 drivers/iommu/riscv/iommu.c:1264:29: error: implicit declaration of function
 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202607050515.sb6vxMgZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   077795f92007de48afcaeab45f9e9217537966d8
commit: a84ace27334d0b45917c159a25e0912f74323a73 [8/58] iommu/riscv: Add IRQ domain for interrupt remapping
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260705/202607050515.sb6vxMgZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607050515.sb6vxMgZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607050515.sb6vxMgZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu.c: In function 'riscv_iommu_attach_paging_domain':
>> drivers/iommu/riscv/iommu.c:1264:29: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_phys'? [-Wimplicit-function-declaration]
    1264 |                 dc.msiptp = virt_to_pfn(domain->msi_root) |
         |                             ^~~~~~~~~~~
         |                             virt_to_phys


vim +1264 drivers/iommu/riscv/iommu.c

  1238	
  1239	static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
  1240						    struct device *dev,
  1241						    struct iommu_domain *old)
  1242	{
  1243		struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
  1244		struct riscv_iommu_device *iommu = dev_to_iommu(dev);
  1245		struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
  1246		struct pt_iommu_riscv_64_hw_info pt_info;
  1247		struct riscv_iommu_dc dc = {0};
  1248		int ret;
  1249	
  1250		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
  1251	
  1252		if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
  1253			return -ENODEV;
  1254	
  1255		ret = riscv_iommu_ir_attach_paging_domain(domain, dev);
  1256		if (ret)
  1257			return ret;
  1258	
  1259		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
  1260			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
  1261		dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) | RISCV_IOMMU_PC_TA_V;
  1262	
  1263		if (domain->msi_root) {
> 1264			dc.msiptp = virt_to_pfn(domain->msi_root) |
  1265				    FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
  1266					       RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
  1267			dc.msi_addr_mask = domain->msi_addr_mask;
  1268			dc.msi_addr_pattern = domain->msi_addr_pattern;
  1269		}
  1270	
  1271		if (riscv_iommu_bond_link(domain, dev))
  1272			return -ENOMEM;
  1273	
  1274		riscv_iommu_iodir_update(iommu, dev, &dc);
  1275		riscv_iommu_bond_unlink(info->domain, dev);
  1276		info->domain = domain;
  1277	
  1278		return 0;
  1279	}
  1280	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
