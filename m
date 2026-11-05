Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917825;
	b=RqMDnYOjd2Z2fTjMe//h3uNYHUhdtFKT5XFKueL8NYf/W+PfRWAVMcR9FdZEjxf4xHBR
	 pGXfMQdXkBV7M8PsH9WO5VsEC26cAIjdRRz4WSMo2GRIrea/oniHuf3w/kE62+TaQkbdZ
	 RUVuY8CEDLIVtIeDXWpxBZm+8Q+O14lxE7vES8yAj/jmjR4IFzJA99D3JXNrYVHSJSWjH
	 +z/XMRp/EQRnSzasLXPiL5s3eIpVaJ8UGyLikAcseLLKKD+A0Lxh7Opz+wpNXa4Ax7buI
	 UECYOf4ODV8b1HsAUJMzrTBaoJUju6nQfdFGI4uhlQCOxEOJ/xNDCTKne3PJx9eoLcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917825;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GB2WHBZu9RlI1NLJYVrYHRDs3iDH7jdgLPqIZBdZwu0=;
	b=cOHUe6udffXCaTZjWH5BElMjlLcOvFv86Z1rs/vuzC/R7sNwqihBuV255dA1emYSSkPG
	 YtV/wjOuzSdHAa+jgduYZVSbZynRFgAuM77I0VPbQDZYhNZQ3ZBOehvsvKGhHLOr24JgC
	 ra4eEq/O6OG/AIiVYmFys78hCGdUoU75GmrlJhq4+r9dBPaeE3l5PTMbZ2lSWnT6yiukU
	 JzL6lZD2estHE45QCqzQSkZjQqYPTDBHPJ6MJoiPlFtin1u8ZodHvSSjeezjvZYSzUe0b
	 m9X6rnSy0Gnrfu0Swfzmgesz4l6LgbWCbToozJmW3uXfTBRGip7vPHNub2jb0ZyvVQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K22nz+CB;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C586606A32D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 22:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C586606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K22nz+CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793917822; x=1825453822;
  h=date:from:to:cc:subject:message-id;
  bh=1F6VTUJ6SJP8s0c7dkKs8yx/o45HLPTSwybWSTyrcto=;
  b=K22nz+CBywpck5+kTsXSN91t/GHpmJCsvhYOqAo6TPk7oJTX+qIDDA1T
   GNkTVYahgWs066DjGKlmI8sBDcBDsX5QlE+4OrqurGsVoC14inoZijshj
   Va6nj8K507lyLtaNPh7WG6qrUi3tGuug3p+MFBqqMbx+CAv0eUpp9Q7Ye
   SKiRNqChF8Bs6Sz24aMVBOCh22HaeC8mJJ6hpzNrnSf18dB4JjB8cQJNs
   E7SUV2K8GaCosd1xqaXN68pN98bz0OLKX0BNYvyZLd95PR7bUJXUDepQP
   CV1gtg6zSU3iHlIpg4UDUHwGeUI/7pv5Lvz3u+TDBn1W37rhgaBawuozd
   g==;
X-CSE-ConnectionGUID: XJ2aRAxYSweaJ/8u74yuGw==
X-CSE-MsgGUID: HhPxMjKLQEykDHGYI7pnGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2816862"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2816862"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 14:30:22 -0800
X-CSE-ConnectionGUID: UM2GXXQtTcKfog+Jsw0n8w==
X-CSE-MsgGUID: mvim1JU1R3GmfzGDC6Miig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7458895"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2026 14:30:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP5yL-00000000mxf-2nJ7;
	Thu, 05 Nov 2026 22:30:17 +0000
Date: Fri, 06 Nov 2026 06:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v12 17/46]
 drivers/iommu/riscv/iommu.c:1287:29: error: implicit declaration of function
 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202611060634.oFt5gYKi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v12
head:   6edb42266d180e7a96cbf7c0f790f5170e1c5c5a
commit: a49d1ae32c9d2e31752c7c9d50772bbfb57647a9 [17/46] iommu/riscv: Add IRQ domain for interrupt remapping
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261106/202611060634.oFt5gYKi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060634.oFt5gYKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060634.oFt5gYKi-lkp@intel.com/

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
