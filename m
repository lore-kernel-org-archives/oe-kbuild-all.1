Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3E3C2F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 01:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754183885; cv=none; b=N0JgDHhZ2aqnesxhjphHTOMHPnWc/Pboq/ovrDwoP/yVsEap868mqh+4UOaGNcJdGfX71uDMW6P96x2jPwPgIVW3rfKMp4wriyIZv+LhEpUvNpDCwdt0nzWEAJ07WdcrrYz4OAMLebxICBhGSFXD4mdPpmeLVFcRxLqleHuI5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754183885; c=relaxed/simple;
	bh=wTp8nnI90mSxRQ8aWYdV3fBmkkIyMGHrJb8KZlqZqXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8RQRLNdDdWMZoTibX2cLgpK3uGQqz2Po0LZwLt6KvkdlqeoPwrQvgHbQY6vOZYmsGEK7uGRDkawtFqVujSyctdo9tkJyxBtqUBiFd+Y0xUUjhpRxlE0bpXJV144uuf19aaB6egOYaFaLtx2CrsPkz8GkPdQshGXyPn69kUlxgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g89RtXlW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g89RtXlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754183884; x=1785719884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wTp8nnI90mSxRQ8aWYdV3fBmkkIyMGHrJb8KZlqZqXM=;
  b=g89RtXlWYZNlmfw15ov+jkExjAsZFZvuvVCZ66NyUcYBTDfzithriuMg
   mAuPDmMxz63c2lNvVLRRoVwCN01CRdmZUhL5U3IXzZqwFPmoMTry3MRcr
   kW41hx3tHwCMKt5eFRKpxLnFZmxjzzKFSNDJrXBM7x7ZPQDDX7mmrw4Qa
   Dbxy01CZHoEbQRXbDVPI5xcJ6cqXAJlGX/J2R0KTv9SaSAZsUm5qGEaBy
   AdgcQ0b8ilEgB6oeKAB+psJcbKVwI/My5BYbfCiR9DZA0Tol6giRX/H+w
   gB9kFOBcsAAqq8sYLNtgUQUXDsqOEDhUtCAJrO6no4VQmqFMCE+9zOC8U
   A==;
X-CSE-ConnectionGUID: zlXdbncRT2KkIJ1BhjfMbQ==
X-CSE-MsgGUID: KoTSzwsET8W5pMqBXG25og==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56446908"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56446908"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 18:18:03 -0700
X-CSE-ConnectionGUID: 1gHTJS+VToG2RQQYLhZzxQ==
X-CSE-MsgGUID: CxRgnC+5SaWYp33yX08I6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163140314"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Aug 2025 18:18:02 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiNMN-0005hc-32;
	Sun, 03 Aug 2025 01:17:59 +0000
Date: Sun, 3 Aug 2025 09:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2630/2630]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4039:39: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202508030926.Js3SWM6z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8fa27fba5fd9db50ef3d03358c9abd371dcbdd99
commit: 587296e12d7d64c971a182ca1d28de8cdbe29ca9 [2630/2630] iommu/arm-smmu-v3: Add mpam helpers to query and set state
config: arm64-randconfig-r111-20250803 (https://download.01.org/0day-ci/archive/20250803/202508030926.Js3SWM6z-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250803/202508030926.Js3SWM6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030926.Js3SWM6z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4039:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4039:39: sparse:     expected restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4039:39: sparse:     got unsigned long long
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4040:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4040:39: sparse:     expected restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4040:39: sparse:     got unsigned long long
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +4039 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  4000	
  4001	static int arm_smmu_group_set_mpam(struct iommu_group *group, u16 partid,
  4002					   u8 pmg)
  4003	{
  4004		int i;
  4005		u32 sid;
  4006		unsigned long flags;
  4007		struct arm_smmu_ste *step;
  4008		struct iommu_domain *domain;
  4009		struct arm_smmu_device *smmu;
  4010		struct arm_smmu_master *master;
  4011		struct arm_smmu_cmdq_batch cmds;
  4012		struct arm_smmu_domain *smmu_domain;
  4013		struct arm_smmu_cmdq_ent cmd = {
  4014			.opcode	= CMDQ_OP_CFGI_STE,
  4015			.cfgi	= {
  4016				.leaf	= true,
  4017			},
  4018		};
  4019		struct arm_smmu_master_domain *master_domain;
  4020	
  4021		domain = iommu_get_domain_for_group(group);
  4022		smmu_domain = to_smmu_domain(domain);
  4023		if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_MPAM))
  4024			return -EIO;
  4025		smmu = smmu_domain->smmu;
  4026	
  4027		arm_smmu_cmdq_batch_init(smmu, &cmds);
  4028	
  4029		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
  4030		list_for_each_entry(master_domain, &smmu_domain->devices,
  4031				    devices_elm) {
  4032			master = master_domain->master;
  4033	
  4034			for (i = 0; i < master->num_streams; i++) {
  4035				sid = master->streams[i].id;
  4036				step = arm_smmu_get_step_for_sid(smmu, sid);
  4037	
  4038				/* These need locking if the VMSPtr is ever used */
> 4039				step->data[4] = FIELD_PREP(STRTAB_STE_4_PARTID, partid);
  4040				step->data[5] = FIELD_PREP(STRTAB_STE_5_PMG, pmg);
  4041	
  4042				cmd.cfgi.sid = sid;
  4043				arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
  4044			}
  4045	
  4046			master->partid = partid;
  4047			master->pmg = pmg;
  4048		}
  4049		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
  4050	
  4051		arm_smmu_cmdq_batch_submit(smmu, &cmds);
  4052	
  4053		return 0;
  4054	}
  4055	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
