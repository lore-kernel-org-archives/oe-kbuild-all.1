Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829865;
	b=lQcT8hVwwAzIDr6zcAvPld47msu4V3UNu6uc7iv6juDJsZ6M67G/eTTw/v6PR4jMUqNG
	 zXDldIOe5YfsiEyb8bzfLugvYdjQVcBZuD47G88HPNWngCXJZe1GjJVjghBT/iCYLb2E6
	 3PLcqVCSCEIvAXBBtUR/I8HGP2oo/+C5jkWahlPkcdA2gp11XxSY5q588aOAHob12QRD9
	 GV3DvknwZDA6TIMPes1kdK5aQBCv6vR/z++KPHw5meXOP8kRPtGlUWdJFmRXnWVvNfYFX
	 xsug68vGhkYR7nNDXO/87h8NRQitmq7qiezvvYZVv5uPfkg3c5f7mA0o0BGVzV14BaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829865;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=E4Mfa5Kzqm6sNdlgvVw9fOGmF51fKbpDpOPLk1g9eKM=;
	b=vTWmnVckxzl8y4eZ6vhGEGKmaU0cxuCXaTDct3kck/63Nd95CIFPeAiMMZMY4XaMF6D2
	 Zh9fIO/Znu3+N0I55N2bR362Fw5V3+9fOccwn82iR84DtZTvN/eceSBhfFtkfusHEYr11
	 FUHncebOih0YsXzQ8ZJs1WUqS/qLueZnLZwv5Jm5c/0N5NUUxndhe2Fy/0pVsXJXtRSyi
	 E3InZ/TmiUxmSWt/pQisU7e+dyIkPW7SAFBuKF9MfczPwPst6Fkvy3fSQbCMkiFQFvHjL
	 8miFP+DK/L3OMOMrRRavbmQ7kIrD1H3gzlBqkW05Z6GUqQJcBKUo9eIWg7+G8Vw8fXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmJBYZ6m;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B782C606A329
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 11:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B782C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmJBYZ6m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794829865; x=1826365865;
  h=date:from:to:cc:subject:message-id;
  bh=kJf+FrsPudvTq/jtc7xNiV1iGwHWjSe7fjC/xhSmdO8=;
  b=jmJBYZ6m2XC6PoKhvSIsid01msZJ18QufTY4QDb+aIKt9BS3PRoGZlI4
   EWgQKsWZlV0KE1DwDMPKOmQEW4L889UDgvoGZvXy0TAaAYP0nTGsB9yhw
   Ikg/SlUCHhGbxaeB0ICN1ZOFxv46IoZFVtXhUlQISA330pCbzzSXUAZ39
   LcNvlYFPZH7AUptRXAhQL43/qRXWXNagkDL80Uj63zSf8DBz29QMSWSgT
   4WQy6iKLnO7yGtlDpYoBQ3VFLi1lOcMbuLzVnIYRERNxSAOhf5lkhYlvW
   l345kH3QVUChfBDx0yl03E4sr0TNJLHkdFiAzPNuihIhihi+LdgKuxA+i
   w==;
X-CSE-ConnectionGUID: kI5LQAh2TSe/PeOTANIung==
X-CSE-MsgGUID: TkgJkMbxRDOmUp5uAzYM4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3479929"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3479929"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:51:05 -0800
X-CSE-ConnectionGUID: PEyCOsfOSNSNPjzhru0vFg==
X-CSE-MsgGUID: hwdOJo/GSreUvJ8QOSX5sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9545711"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 03:51:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSvEf-000000002gF-1XlD;
	Mon, 16 Nov 2026 11:50:57 +0000
Date: Mon, 16 Nov 2026 12:50:07 +0100
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sspesa_v2 34/98]
 drivers/iommu/riscv/iommu-ir.c:325:27: error: implicit declaration of
 function 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202611161251.Fl34zAyg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sspesa_v2
head:   6deccfa10a938ba2257b489c067a1928022d510d
commit: c5446adf22b458b508a4cb31001bcb0e84c87927 [34/98] iommu/riscv: Add guest file irqbypass support
config: alpha-randconfig-2200-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161251.Fl34zAyg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161251.Fl34zAyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161251.Fl34zAyg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_ir_msiptp_update':
>> drivers/iommu/riscv/iommu-ir.c:325:27: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_phys'? [-Wimplicit-function-declaration]
     325 |                 .msiptp = virt_to_pfn(domain->msi_root) |
         |                           ^~~~~~~~~~~
         |                           virt_to_phys


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
