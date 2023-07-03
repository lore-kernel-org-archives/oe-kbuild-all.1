Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C023C3C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 23:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688428589; x=1719964589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fuNSuYgPevBpeRp1PIGcRSvkdLeYoMJGA0UlctcBLxE=;
  b=egjdjUX9YdTqkAionyjrGqLN/LgOnmykAUVRFXVj4FRypzZdPYcEMqDs
   +IALdi9hODeokCxhjRvwFye8tGSyzDAZFVBIKMoBsKXh/S2qyoqTjyldZ
   sVym2atIZpfBH0GDPAR6kQ+dwGeRXBBigcLmj2WFqxTdC+YNwG7IzEu2O
   UbbpWoki2aNNZQG9jwkgyEwioy6no9JIQ6Qtu45Zx2omXZydPjWJqt3Kg
   2QtVWnX+mLbx8eJP5g7dl2STFgtDswUSOHunAI8g+dYVxHAI36ssHAxIf
   uUm+P60lNInv4oJV7o97fWkqcLbJPxStCfpJI2RflMw0Z0jmteW0Zh3h0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360467452"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="360467452"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 16:56:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="721914778"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="721914778"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jul 2023 16:56:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGTP8-000HiF-0j;
	Mon, 03 Jul 2023 23:56:26 +0000
Date: Tue, 4 Jul 2023 07:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-07032023-yi 64/65]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3099:25: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202307040724.kwDzRpRw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-07032023-yi
head:   ac623a6f5d61ed4f4d90a3f835c668728b07ab95
commit: ded63090bfbbf906032c6a2cb56fb747db511013 [64/65] iommu/arm-smmu-v3: Add arm_smmu_cache_invalidate_user
config: arm64-randconfig-r081-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040724.kwDzRpRw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040724.kwDzRpRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040724.kwDzRpRw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2066:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base_idr @@     got void [noderef] __iomem * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2066:18: sparse:     expected void *base_idr
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2066:18: sparse:     got void [noderef] __iomem *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2068:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2068:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2068:55: sparse:     got void *
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3099:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected restricted __le64 [usertype] *base @@     got void [noderef] __user * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3099:25: sparse:     expected restricted __le64 [usertype] *base
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3099:25: sparse:     got void [noderef] __user *
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3129:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got restricted __le64 [usertype] * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3129:43: sparse:     expected void const [noderef] __user *from
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3129:43: sparse:     got restricted __le64 [usertype] *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +3099 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3086	
  3087	static int arm_smmu_cache_invalidate_user(struct iommu_domain *domain,
  3088						   void *user_data)
  3089	{
  3090		const u32 cons_err = FIELD_PREP(CMDQ_CONS_ERR, CMDQ_ERR_CERROR_ILL_IDX);
  3091		struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
  3092		struct iommu_hwpt_arm_smmuv3_invalidate *inv = user_data;
  3093		struct arm_smmu_device *smmu = smmu_domain->smmu;
  3094		struct arm_smmu_queue q = {
  3095			.llq = {
  3096				.prod = inv->cmdq_prod,
  3097				.max_n_shift = inv->cmdq_log2size,
  3098			},
> 3099			.base = u64_to_user_ptr(inv->cmdq_uptr),
  3100			.ent_dwords = inv->cmdq_entry_size / sizeof(u64),
  3101		};
  3102		bool has_leaf = false, has_cfgi = false;
  3103		void __user *cons_uptr;
  3104		int ncmds, i = 0;
  3105		u64 *cmds;
  3106		int ret;
  3107	
  3108		if (!smmu || !smmu_domain->s2 || domain->type != IOMMU_DOMAIN_NESTED)
  3109			return -EINVAL;
  3110		if (q.ent_dwords != CMDQ_ENT_DWORDS)
  3111			return -EINVAL;
  3112		WARN_ON(q.llq.max_n_shift > smmu->cmdq.q.llq.max_n_shift);
  3113	
  3114		cons_uptr = u64_to_user_ptr(inv->cmdq_cons_uptr);
  3115		if (copy_from_user(&q.llq.cons, cons_uptr, sizeof(u32)))
  3116			return -EFAULT;
  3117		if (queue_empty(&q.llq))
  3118			return -EINVAL;
  3119	
  3120		ncmds = min(queue_ncmds(&q.llq), CMDQ_BATCH_ENTRIES - 1);
  3121	
  3122		cmds = kcalloc(ncmds, inv->cmdq_entry_size, GFP_KERNEL);
  3123		if (!cmds)
  3124			return -ENOMEM;
  3125	
  3126		for (; !queue_empty(&q.llq); queue_inc_cons(&q.llq)) {
  3127			u64 *cmd = &cmds[i * CMDQ_ENT_DWORDS];
  3128	
> 3129			ret = copy_from_user(cmd, Q_ENT(&q, q.llq.cons),
  3130					     inv->cmdq_entry_size);
  3131			if (ret) {
  3132				ret = -EFAULT;
  3133				goto out_free_cmds;
  3134			}
  3135	
  3136			ret = arm_smmu_fix_user_cmd(smmu_domain, cmd);
  3137			if (ret == -EOPNOTSUPP)
  3138				continue;
  3139			if (ret) {
  3140				q.llq.cons |= cons_err;
  3141				goto out_copy_cons;
  3142			}
  3143	
  3144			if (arm_smmu_cmdq_hit_errata(smmu, cmd, &has_leaf, &has_cfgi)) {
  3145				/* WAR is to issue the batch prior, with a CMD_SYNC */
  3146				ret = arm_smmu_cmdq_issue_cmdlist(smmu, cmds, i, true);
  3147				if (ret)
  3148					goto out_copy_cons;
  3149				/* Then move the cmd to the head for a new batch */
  3150				for (i = 0; i < CMDQ_ENT_DWORDS; i++)
  3151					cmds[i] = cmd[i];
  3152				i = 1;
  3153				continue;
  3154			}
  3155	
  3156			if (++i == CMDQ_BATCH_ENTRIES - 1) {
  3157				ret = arm_smmu_cmdq_issue_cmdlist(smmu, cmds, i, true);
  3158				if (ret)
  3159					goto out_copy_cons;
  3160				i = 0;
  3161			}
  3162		}
  3163	
  3164		if (i)
  3165			ret = arm_smmu_cmdq_issue_cmdlist(smmu, cmds, i, true);
  3166	out_copy_cons:
  3167		if (copy_to_user(cons_uptr, &q.llq.cons, sizeof(u32)))
  3168			ret = -EFAULT;
  3169	out_free_cmds:
  3170		kfree(cmds);
  3171		return ret;
  3172	}
  3173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
