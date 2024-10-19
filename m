Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388121917CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 20:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729370166; cv=none; b=Kk9+qmj66oCoWkjTUCakG4kOLVZEtK1LOWu8YhPifWBsLhJ6UBJk9jTn/JNUOr/DZapf+12l81TyNgB6jhWzoiWhZcqhgAptEGOSMTiT5P3jK3YB6YBAiE5qNu+2FAaOBZ0Hk6gjAQsvgvUeIyLYcF6zlbSMqd3U2sK8oXMkeds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729370166; c=relaxed/simple;
	bh=z+Wmy9FS1Y6KlnH42dIbqfVo8CIPLEyHseR5pY1qjqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ecIOxk8hzec8s+bvplexgss4OJr6U6TOc7dab0KDfJ0ICO5nEELzHLoVejhTNbu7v+ckhSwMLhy9ErBNDSowuXDArTpt40FYrsrd+HdTw7GGeYqZ+gvqKDsMp6pRtRGG94jSmf5hciT4tMsJ46zTaGpYbBKx8jkzLvisN5Fc/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONZxoqhX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONZxoqhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729370163; x=1760906163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+Wmy9FS1Y6KlnH42dIbqfVo8CIPLEyHseR5pY1qjqU=;
  b=ONZxoqhX+t8s4d6iNKdXLCmU0F4uctXZdrkddrjENpzG/4qpdbATGDB8
   D4btcxR2mqemjPakAYB4/ZKW7Ej/Sjrm9pYrawC4oNzGHWYlPYvDxTb4s
   y9NCDqshXMtP3cfiAH71t6cSNQzqUhDzPAU88Lv5R4ITsfA0tu/4XBhuM
   ArE3GY+Iuvz6H+5w5aHvkTZ4LdJD+1WnNExtoIYzD4FqJOeJSVlfAFxH9
   3nQRSK6e7glws5lDaoiEvvrTWo6IBca3tFdMvFuhHOswfmpECJY2mR8BV
   z2aR0uIpEOaD2ua/r/jWg4bANJs1FvA/2MvHRaoJv8u39BzWOiSklUC/x
   A==;
X-CSE-ConnectionGUID: WCPHds3FQWqKqR7f+w5ixA==
X-CSE-MsgGUID: 9q1YRp2uRyedmMVAQfc1Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28839415"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28839415"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 13:36:00 -0700
X-CSE-ConnectionGUID: 7wAP2AYET16t/IEp26Ug9g==
X-CSE-MsgGUID: P1kw4Nm7R0+E9kH9hBZKTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="102474933"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Oct 2024 13:35:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2GB2-000PWY-1X;
	Sat, 19 Oct 2024 20:35:56 +0000
Date: Sun, 20 Oct 2024 04:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Eric Auger <eric.auger@redhat.com>
Subject: [jgunthorpe:smmuv3_nesting 11/17]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202410200404.OJrmhHAF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
head:   fa1528253d221071f2c743b194d5aebad4b55a93
commit: a29d6e74459ce8ff8a2c370e09cdd85d2ee89480 [11/17] iommu/arm-smmu-v3: Add arm_smmu_cache_invalidate_user
config: arm64-randconfig-r123-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200404.OJrmhHAF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241020/202410200404.OJrmhHAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200404.OJrmhHAF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse:     expected restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse:     got unsigned long long [usertype]
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:142:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:142:21: sparse:     expected restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:142:21: sparse:     got unsigned long long [usertype]
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:144:25: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:147:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:147:29: sparse:     expected restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:147:29: sparse:     got unsigned long long
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:155:29: sparse: sparse: invalid assignment: &=
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:155:29: sparse:    left side has type restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:155:29: sparse:    right side has type unsigned long long
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:156:29: sparse: sparse: invalid assignment: |=
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:156:29: sparse:    left side has type restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:156:29: sparse:    right side has type unsigned long long
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:202:51: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] *cmds @@     got restricted __le64 * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:202:51: sparse:     expected unsigned long long [usertype] *cmds
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:202:51: sparse:     got restricted __le64 *

vim +141 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c

   127	
   128	/*
   129	 * Convert, in place, the raw invalidation command into an internal format that
   130	 * can be passed to arm_smmu_cmdq_issue_cmdlist(). Internally commands are
   131	 * stored in CPU endian.
   132	 *
   133	 * Enforce the VMID on the command.
   134	 */
   135	static int
   136	arm_smmu_convert_user_cmd(struct arm_smmu_nested_domain *nested_domain,
   137				  struct iommu_hwpt_arm_smmuv3_invalidate *cmd)
   138	{
   139		u16 vmid = nested_domain->s2_parent->s2_cfg.vmid;
   140	
 > 141		cmd->cmd[0] = le64_to_cpu(cmd->cmd[0]);
   142		cmd->cmd[1] = le64_to_cpu(cmd->cmd[1]);
   143	
 > 144		switch (cmd->cmd[0] & CMDQ_0_OP) {
   145		case CMDQ_OP_TLBI_NSNH_ALL:
   146			/* Convert to NH_ALL */
 > 147			cmd->cmd[0] = CMDQ_OP_TLBI_NH_ALL |
   148				      FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
   149			cmd->cmd[1] = 0;
   150			break;
   151		case CMDQ_OP_TLBI_NH_VA:
   152		case CMDQ_OP_TLBI_NH_VAA:
   153		case CMDQ_OP_TLBI_NH_ALL:
   154		case CMDQ_OP_TLBI_NH_ASID:
 > 155			cmd->cmd[0] &= ~CMDQ_TLBI_0_VMID;
   156			cmd->cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
   157			break;
   158		default:
   159			return -EIO;
   160		}
   161		return 0;
   162	}
   163	
   164	static int arm_smmu_cache_invalidate_user(struct iommu_domain *domain,
   165						  struct iommu_user_data_array *array)
   166	{
   167		struct arm_smmu_nested_domain *nested_domain =
   168			to_smmu_nested_domain(domain);
   169		struct arm_smmu_device *smmu = nested_domain->s2_parent->smmu;
   170		struct iommu_hwpt_arm_smmuv3_invalidate *last_batch;
   171		struct iommu_hwpt_arm_smmuv3_invalidate *cmds;
   172		struct iommu_hwpt_arm_smmuv3_invalidate *cur;
   173		struct iommu_hwpt_arm_smmuv3_invalidate *end;
   174		int ret;
   175	
   176		cmds = kcalloc(array->entry_num, sizeof(*cmds), GFP_KERNEL);
   177		if (!cmds)
   178			return -ENOMEM;
   179		cur = cmds;
   180		end = cmds + array->entry_num;
   181	
   182		static_assert(sizeof(*cmds) == 2 * sizeof(u64));
   183		ret = iommu_copy_struct_from_full_user_array(
   184			cmds, sizeof(*cmds), array,
   185			IOMMU_HWPT_INVALIDATE_DATA_ARM_SMMUV3);
   186		if (ret)
   187			goto out;
   188	
   189		last_batch = cmds;
   190		while (cur != end) {
   191			ret = arm_smmu_convert_user_cmd(nested_domain, cur);
   192			if (ret)
   193				goto out;
   194	
   195			/* FIXME work in blocks of CMDQ_BATCH_ENTRIES and copy each block? */
   196			cur++;
   197			if (cur != end && (cur - last_batch) != CMDQ_BATCH_ENTRIES - 1)
   198				continue;
   199	
   200			/* FIXME always uses the main cmdq rather than trying to group by type */
   201			ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq,
 > 202							  last_batch->cmd,
   203							  cur - last_batch, true);
   204			if (ret) {
   205				cur--;
   206				goto out;
   207			}
   208			last_batch = cur;
   209		}
   210	out:
   211		array->entry_num = cur - cmds;
   212		kfree(cmds);
   213		return ret;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
