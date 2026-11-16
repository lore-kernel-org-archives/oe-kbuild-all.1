Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824568;
	b=at9q8/oKmcM2C0Qsr9uI0oTKwp508WuKsjhywcmoow7I8tGXiEndwkatJZYmwb5v/1p5
	 g/eruK+0Qn8qYkt75WCrYAK2y5chsvrhw9h0P9d6+TslTYJhVElpTwztBPYvOrXeut4rO
	 heuFxCOHcBqa9eQEx/wH15QViVv4j2eMOZVsXqifPhXsVm32BbXq7H46QLzg6Q2TgpyXr
	 fKGRJ5uhceCsPyvYdW3nZlPIE28KcZgAt6Bgftj+8yN2BPT1L/swD8XV2gYP7ttc/HO4r
	 WDSsjagCSfifKqEI8sjKWiM6jN84kq0cUz4Vu655t6GIuc3+mHydMY8exiPELiLzLAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824568;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o43mwzCsPFXPlJahanq5sifDVaDh3YBDDRbQgbXo1YQ=;
	b=w2D/Ke/Di+E6RUwfhzBLsvO9F3Uh+P/uTuTRHKTVdMCByFcEADGTKQfNcwQIFdhKKXBA
	 3XrbrDAd8M+uocGiWIvXX6ofTk4g+T5rbiNWyPi1MdEawVvXL1oKRQnp964SHXgy8CZwb
	 CSfpQjJ1nQ9dOnhwiBCoBmZqFDyOfHVdaZKw6egaKteYfFHtt+Au83KTNNJ11cXo+1+gx
	 WdY2p0Rfbthuc1+TCHYIka+uywliMfYK619vsJzX1tufnUp1rXJO4KMSnDb1kqKZATX3i
	 WgfvMhOlLYDKvcBnxMW7u753b54AmxBw8VlOeX/W8lOc5ibuNjjCkMLj9WvBJ4Yo8sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FP+XAmVV;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA2606A883
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 10:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DA2606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FP+XAmVV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794824567; x=1826360567;
  h=date:from:to:cc:subject:message-id;
  bh=9fWOMs8pll8jZ+IXSKV18cg0WnxBmrdV0ZRWsoD89RI=;
  b=FP+XAmVVFdHdW9TRLCQ3TYm/8Tud4Nx8ytaUzOGbawjkG8S/37YJKRLi
   Gy7eg3iYF5n7my3APiVOuh2ud+gxCmjFLOO5kGRSF/FhMOQ4ZVprU8Zzu
   Sx3Fb00Gu5+2ZHK93i4zVLPecl6vqe8Vjvx/oFpGxUwNyzcVTutBGfH5z
   eWtztAW38KRQ0DrFgNHAOBAQzxilPk2tmE4VuQMZZ3gIs2DcGjxTV0Ftf
   s/msxhdfrvvco7fFWG+mWXXLvIhLdN5+1zsiZqYEEU+W15GIRsTtrMIHS
   Vm3aE0+6eC+hqfG1uLViFUwJYl3OSzpSHlNVi7gZ345/HGZF+IeoCyXl0
   A==;
X-CSE-ConnectionGUID: 660FXm88SBecOhV5iFYB+Q==
X-CSE-MsgGUID: LtRPTM4USzCNwJNUE93OeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3447939"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3447939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:22:46 -0800
X-CSE-ConnectionGUID: LtF1myjGQqi9psH/2+cNeg==
X-CSE-MsgGUID: pPcmyl3lS36JXEcC47xllA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9572926"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2026 02:22:45 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xStrF-000000002fH-3Oyl;
	Mon, 16 Nov 2026 10:22:41 +0000
Date: Mon, 16 Nov 2026 11:21:51 +0100
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 26/89]
 drivers/iommu/riscv/iommu.c:1287:29: error: implicit declaration of function
 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202611161112.8O1m8vww-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   1dab2361933785691d1874856d9e368c5be79b2c
commit: cbdcd79d57964765c2aa1e5a50ce2d65cd95eb0b [26/89] iommu/riscv: Add IRQ domain for interrupt remapping
config: alpha-randconfig-2200-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161112.8O1m8vww-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161112.8O1m8vww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161112.8O1m8vww-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu.c: In function 'riscv_iommu_attach_paging_domain':
>> drivers/iommu/riscv/iommu.c:1287:29: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_phys'? [-Wimplicit-function-declaration]
    1287 |                 dc.msiptp = virt_to_pfn(domain->msi_root) |
         |                             ^~~~~~~~~~~
         |                             virt_to_phys


vim +1287 drivers/iommu/riscv/iommu.c

  1261	
  1262	static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
  1263						    struct device *dev,
  1264						    struct iommu_domain *old)
  1265	{
  1266		struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
  1267		struct riscv_iommu_device *iommu = dev_to_iommu(dev);
  1268		struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
  1269		struct pt_iommu_riscv_64_hw_info pt_info;
  1270		struct riscv_iommu_dc dc = {0};
  1271		int ret;
  1272	
  1273		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
  1274	
  1275		if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
  1276			return -ENODEV;
  1277	
  1278		ret = riscv_iommu_ir_attach_paging_domain(domain, dev);
  1279		if (ret)
  1280			return ret;
  1281	
  1282		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
  1283			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
  1284		dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) | RISCV_IOMMU_PC_TA_V;
  1285	
  1286		if (domain->msi_root) {
> 1287			dc.msiptp = virt_to_pfn(domain->msi_root) |
  1288				    FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
  1289					       RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
  1290			dc.msi_addr_mask = domain->msi_addr_mask;
  1291			dc.msi_addr_pattern = domain->msi_addr_pattern;
  1292		}
  1293	
  1294		if (riscv_iommu_bond_link(domain, dev))
  1295			return -ENOMEM;
  1296	
  1297		riscv_iommu_iodir_update(iommu, dev, &dc);
  1298		riscv_iommu_bond_unlink(info->domain, dev);
  1299		info->domain = domain;
  1300	
  1301		return 0;
  1302	}
  1303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
