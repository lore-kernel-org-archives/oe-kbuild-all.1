Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A5448D19
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620320; cv=none; b=kVBW8wzNhh3I6Bm7WjxCh+nKEUeqlGc7Ds7ZkIuOOLu+Yu1MspRFtty3FahOjEAwACUX2kkAJTD/t/Sfju6L7Zhr67lSgw+SIkANkDmcLFLSlu6sx7cHue8p49jV1kgLgLUqq6KftIB7lNP4U9GY4RkarLg0AFugt1r41sq7Hd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620320; c=relaxed/simple;
	bh=iOpagaI/A0bBSSp22UDPwcuUMFegXxkrj27hhfcWu00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uUQA5C5AHoaQk8RqfTaGQtul+42lJqrGyuIxfP4B1xGJTN/AvmVviR1f5+g75lC5GxB5YywAnVhDfFTLGC4yMzAbXp8NPQBxTABUmpG++4BcEXxf+n+zlIFM+D5n+jl3+Hm+z1Ws/u4TKT6Hhikde8HrZROBME8klrfpIY1Ctkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJZVV8mv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJZVV8mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786620317; x=1818156317;
  h=date:from:to:cc:subject:message-id;
  bh=iOpagaI/A0bBSSp22UDPwcuUMFegXxkrj27hhfcWu00=;
  b=WJZVV8mvLH1YY8AMc+wR10eTDiPiqqWTdK0XYssszCkebhWrYYmBNCrM
   8nyC+koh6xOfs0cnrS9gt06ihGRLi2sLlc1hLW5oiaBapv1qUa+gx/BQ8
   R5tYzHOwKM+XEyQLf6ezBKLoo8kraCbGYLHOz/UhAVgqusNJyVNDKDD3f
   oTcIuCe7pmrcRi/o7QHFnkFYuzOUXuGj4b1ANwqpH60JQgJVh/jdi9ecP
   4IJqVazCDgKfiXpkptlBlhrkuhzQlaxchHU2E2nKz+oT34IKz5Tc2V3t6
   bInFqzAwVhFYrrHIyqDp4LX6BWsnmgGnbS1d8RoQSSGv3q/r8lQCFaDb6
   w==;
X-CSE-ConnectionGUID: ckzGyOvkQGqIHqm1M5v8GQ==
X-CSE-MsgGUID: ZtbIjIs/QLi4yKOX143b8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98547421"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="98547421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:25:15 -0700
X-CSE-ConnectionGUID: wS0smlNARxezvXEzm80pyA==
X-CSE-MsgGUID: isEgmNjNSeS6r8Wbt5bpIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="293857889"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Aug 2026 04:25:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTYd-00000000TqM-1oD7;
	Thu, 13 Aug 2026 11:25:11 +0000
Date: Thu, 13 Aug 2026 19:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 /116]
 drivers/iommu/riscv/iommu.c:1264:29: error: implicit declaration of function
 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202608131914.6AuvXOaC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   2251d17fd6ac95b1f6de32a893141a3481e3ad1d
commit: cbb1d3e45cdd6ff067a162f710402a308710949d [/116] iommu/riscv: Add IRQ domain for interrupt remapping
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260813/202608131914.6AuvXOaC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131914.6AuvXOaC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131914.6AuvXOaC-lkp@intel.com/

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
