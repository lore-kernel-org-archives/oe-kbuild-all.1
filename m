Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161C03A7F41
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 06:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218820; cv=none; b=q1TqQof/gHXUrOSTx0dq1Ym5Jj1Q5L12T1QfQnY0J9z2TbHf3lTmBxfFgruP3mK0Gp1gqOvwYcSB+ubocwKQBS++IVXTQPJVC09nSQTDoWCLfjv9d8VmH5vPdk7TCkDOGzlMfsgzbQKt8zhDwqTQWVz0XnX0GNHCFKYLUerMFCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218820; c=relaxed/simple;
	bh=m0XFQBO/Yhfe8eu3xLdDTAyfctZO8C78MvsR8LcYRM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VLv0fqY1SgSNK1doMN53f+AXXTIogtvoNz9F2KygK11WVuUVpArqGAsQGm9l3cEneZTnlxXXtWdh6esp2/rtNUdbtXnTTuPY7atJNYUvAKP8vvU7MbsWECNPTtRBfCA5TyvXTqKeG7za5I32LIH0QT+JxZz1yVC8gZ9cXCGphp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ali523X/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ali523X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785218818; x=1816754818;
  h=date:from:to:cc:subject:message-id;
  bh=m0XFQBO/Yhfe8eu3xLdDTAyfctZO8C78MvsR8LcYRM8=;
  b=Ali523X/yB/iOqjOnZ3jgHIG7+iyoVCFb72X8tamw3Rc/GPEcMkW817R
   KkflQYKPa9F/8loJOvHH3Gx/mWJZl3F/NXqWWWuDuoEMcqe57FMsneBGT
   TZSQXgl6zgEmM45f4XPECrRUqobtEYqo778A0R7/sGqZLH4JfTfHouOFr
   CCLRoRw/d+V+VcnIAg5Lo2duRgIq0Ob1oBVNiM2rfY8KIqkolZuCayLe8
   /O1U/jCv+aZqTjQK54vcRbVMTk2uI41VJ2bG2tCZS8ObIIYCUPuRK/v4c
   Jvy0fdKMOnZPQ41BCN9Y66FOnhWZpjRzjg8vTT16g9x4VJeBrmg2d6tWN
   Q==;
X-CSE-ConnectionGUID: Do2AqqZ7Qvibm9eersYijA==
X-CSE-MsgGUID: s3EuusNvTKyW/N86FK/gKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89616918"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="89616918"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 23:06:57 -0700
X-CSE-ConnectionGUID: BueoQqU9TLCXPYnReaOwQA==
X-CSE-MsgGUID: 4iNHIw/IQHen1U+fPwJuBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="256267581"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2026 23:06:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woaxi-00000000e3T-1vEz;
	Tue, 28 Jul 2026 06:06:49 +0000
Date: Tue, 28 Jul 2026 14:05:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v4 16/58]
 drivers/iommu/riscv/iommu-ir.c:325:27: error: implicit declaration of
 function 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <202607281312.zA3zDZxe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   11d3b03554ac726b2a53aef3fd1acb7218b6af8e
commit: f3472a45187c7023d4a5a6f068f72c26d840dd88 [16/58] iommu/riscv: Add guest file irqbypass support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260728/202607281312.zA3zDZxe-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281312.zA3zDZxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281312.zA3zDZxe-lkp@intel.com/

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
