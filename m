Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC9335E1AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 06:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689471; cv=none; b=EeuPEsLXtPHfuWJAKG105c4FeDlxKHKWifdqsLimEd/vxJ6t2VFqma+vLZWC3tqL2yAZAIUBkSffFU3h2UAe8MV4h9lVw2JvZI8H2O/304aNfT/UxDnrkGKusYsCtxbgFiwFZQVVSrG6HauGTtx7cTOmr+Q9ygM5ql78fbInNZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689471; c=relaxed/simple;
	bh=Qx9QazVCF15GRxWHc4HjJBVKWf7gLrwF2TKfuMCpyiU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QzC3SHep8PIJaA+FNW2LcMI68lqcidpR1TC3mVPs5OqVdi5nyXPtCGRs1CCNBQD66R6+/m/FjgjjN3t+CdltnNgLR5gfntwqdbBV9VZDEkrtRJViTgdCo5A1iqkRKeYC6H/Wd20c4Tq85BYhBuEJ/rrDZ6SAi7o95afqs6mnaiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTFjCaPL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTFjCaPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786689470; x=1818225470;
  h=date:from:to:cc:subject:message-id;
  bh=Qx9QazVCF15GRxWHc4HjJBVKWf7gLrwF2TKfuMCpyiU=;
  b=XTFjCaPLdKgv4y4qd1c1UHZ32z80HeHnBpfRONpfFJSyZjtxWE4fR0AT
   2NESsyx2fzBhCbr3jFX19EYQKz6opJbReqKz5HD4B0E0Ml2niIGdKIwFS
   TCIetvDeTdKzQXyWUAHpm5kagPgfQ7riIEVrkU4mZFZdSgDduE+VAzJmv
   Pbnc8BInYoEg6uvL3A2btzMVOo2fYplS0xr7fdiOgI7ljCj3VTMezoSLQ
   g6P3Xn+anlJ4hbadIyeKDMQuUxn2JP5Obe4IUNvEpU5P6ekKdTkll8zLT
   xXVq5CGgMRpvcNXFRQ2qAM02rxt9uW12IL1TayY0YIWCkNlr8zrWdGjlP
   A==;
X-CSE-ConnectionGUID: 847/Q0+0TzSK5JEzGMjS4A==
X-CSE-MsgGUID: 2l+JB+nTTbyNe7ktnY7dRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97859512"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="97859512"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 23:37:49 -0700
X-CSE-ConnectionGUID: 5+gpb7w+SpGnGTwWktUbJA==
X-CSE-MsgGUID: jkykk0MhRhGUHrAc67XSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="259904893"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Aug 2026 23:37:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wulY1-00000000Y4c-0UTU;
	Fri, 14 Aug 2026 06:37:45 +0000
Date: Fri, 14 Aug 2026 14:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v5 59/108]
 drivers/iommu/riscv/iommu-ir.c:325:27: error: implicit declaration of
 function 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202608141436.HEryshDf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   d5f1be8d8fd44129a93976f98cc0153408015030
commit: 1e5a582db6a5ae1479214eeb2f2d37b2f85928db [59/108] iommu/riscv: Add guest file irqbypass support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260814/202608141436.HEryshDf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141436.HEryshDf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141436.HEryshDf-lkp@intel.com/

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
