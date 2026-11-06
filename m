Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959561;
	b=1zvHtciMh39HM7k0zHZiqAhg0I6CyNEG2VMJ7FTmx0QmgWsCstP8JNkRmPiSFnrNQCUC
	 E+sQlZqQA7z41yQHJXdRg+xk3rC1bAmDYs56BwbhXe3EOsEr7yvOr8oftQOeH384dL1bI
	 geGy8u8GcaYKlSBeBKAxFO2ZuMu4GIBxixP+zqmafAL1fTKjv6ozPbqYIUUKrT9YCOy9d
	 c8Lkx/h1+C7VseVp+s9CdQjmxIRwqn0r1FnOaA1IQ8Lv4yMa4Ps0JbGVmBHMgoX9abuAL
	 uxHSGuc4k40uLt6eptbLPE0nh97A+8qPm01Zak8kaduAoN01AfM1vp/OmD9MygdMbQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959561;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jQp1zOiOs1zNV8SLnhIyJ46CkMTzPRt6TZIuk6ljqsw=;
	b=h4B9Rbmpm5Sl5f1MofRCtRF7yk+jCtOX/iRQsU10kERh+ACA7JkAnMa2UM0cOFvy20yZ
	 VtDb7HQo1thsdUqqL0eMj5bseIaIaKXOVlG3Iwz6DSoMBgtltOmWo5q0bamMuwTsIPnKK
	 rXHDfxiWpOaUwSDiFv39BLVGYjay2jyPpswZkUuZJVeMeayOZ5lXpj1V1Z95Olwzlbm+X
	 MD9kRYwCkxgN4xvWhGOBt1bFAYo3gwifEnEC7/H1PfcFBfOtogVlZxQeJEnytrw1ynJmM
	 Ct9Qf+XQwl53LpLYLLDfsQwWC6WQAI7cNt/LHZxj2TD+QiXWWMtKSe1rQnHlwh5xjhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vh+S0yfO;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA8606A329
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 10:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAEA8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vh+S0yfO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793959561; x=1825495561;
  h=date:from:to:cc:subject:message-id;
  bh=d9LQEQ3RAkUKjGDqnq/mRivTTjqFlq19w7zkWKVB2TQ=;
  b=Vh+S0yfOJf5jIvUy7bxJAqj/PLb7kvLlLZIslGIAPU9su9m7SReoz1tF
   g1N/1JMDchsdOi3OO4E4U061Zj85ejwSlthRV/JEQCkt6ERajXvCQLFNK
   19SLqZ4AfLNjNOb8ldF76cidpSw0O1xYPZ1rvuJnX/L3fci75h9MJoxKc
   hd6u9B1GLNx0lf3B0RGm5maM9OJWIQbOo0glS3lCsRAc2r90260I5bbCf
   dr5quGmx62EhOTM1Gzai6+I60O+3W62FntSOpYbX9meEHPoFcCJhgnubD
   GtU4hr6AurT3nEhW44iqtrOUXWJIhX6L9FpW1pwmsyzCDdTfVj/z+uze9
   w==;
X-CSE-ConnectionGUID: ir+l8vtPSn+bD0EtvXGdKA==
X-CSE-MsgGUID: kTxjI5pjTIWz4aEOIUPbKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2797554"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2797554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 02:06:01 -0800
X-CSE-ConnectionGUID: ly6OOFgTTrC4FcfREdfSSA==
X-CSE-MsgGUID: yUNyXiaRQearjUReUrogtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7284541"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Nov 2026 02:06:00 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPGpY-00000000owt-3bfB;
	Fri, 06 Nov 2026 10:05:56 +0000
Date: Fri, 06 Nov 2026 18:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v12 25/46]
 drivers/iommu/riscv/iommu-ir.c:325:27: error: implicit declaration of
 function 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202611061825.A3Pe15KX-lkp@intel.com>
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
commit: 0d3e96b381559dc884edb4c957ef4ae6747b454c [25/46] iommu/riscv: Add guest file irqbypass support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261106/202611061825.A3Pe15KX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061825.A3Pe15KX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061825.A3Pe15KX-lkp@intel.com/

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
