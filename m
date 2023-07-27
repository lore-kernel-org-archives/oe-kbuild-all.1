Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF67107A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 09:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690449742; x=1721985742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDRj8mXSEk314ARjfSYydSKl3VgYFHbSDgSb3VWrtH4=;
  b=YeuiRT/sP8U9qVdjoQrRp/1NbhVqU5w7Ie/WZiNBpwa5PDPvZCrERY5u
   MDqtYnUD111L6KaOGa5lTP4aq1Qqt0pJXK+WIezurDvlT6OMI83cGKTM3
   te1GEYER/Br8P3DT0LBCa+MqLCjBMcAhtp7WSaLsKTb6i/052JH4bj8r5
   l6s8Hn3FVEnW6H7sfF6Bi+P0jalJ33v5lxKbE1YO1wSFNscbPZUUHmTzp
   I6tO6bg27OpCa/E6yhOwlRum7MH7c8TmlWLExYuEly2pRMlAxncoM7sgF
   9dpPOnOkeYOd/Cp+IYs9G+TOYihvij15lPlmRLlKjoPTG7gLYAHLjPU4E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358258525"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="358258525"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 02:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="792299184"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="792299184"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jul 2023 02:22:16 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOx9n-00027z-18;
	Thu, 27 Jul 2023 09:20:11 +0000
Date: Thu, 27 Jul 2023 17:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd_nesting 65/66]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3107:26: sparse: sparse: cast
 removes address space '__user' of expression
Message-ID: <202307271725.KPvcQtnE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git iommufd_nesting
head:   6ee9c8550423d405ed4a5456dc3e722ffae3762e
commit: 78c6120f38cfb77e95471372d089ffd05e71980c [65/66] iommu/arm-smmu-v3: Add arm_smmu_cache_invalidate_user
config: arm64-randconfig-r083-20230726 (https://download.01.org/0day-ci/archive/20230727/202307271725.KPvcQtnE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271725.KPvcQtnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271725.KPvcQtnE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3107:26: sparse: sparse: cast removes address space '__user' of expression
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +/__user +3107 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3094	
  3095	static int arm_smmu_cache_invalidate_user(struct iommu_domain *domain,
  3096						  void *user_data)
  3097	{
  3098		const u32 cons_err = FIELD_PREP(CMDQ_CONS_ERR, CMDQ_ERR_CERROR_ILL_IDX);
  3099		struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
  3100		struct iommu_hwpt_arm_smmuv3_invalidate *inv = user_data;
  3101		struct arm_smmu_device *smmu = smmu_domain->smmu;
  3102		struct arm_smmu_queue q = {
  3103			.llq = {
  3104				.prod = inv->cmdq_prod,
  3105				.max_n_shift = inv->cmdq_log2size,
  3106			},
> 3107			.base = (__le64 *)u64_to_user_ptr(inv->cmdq_uptr),
  3108			.ent_dwords = inv->cmdq_entry_size / sizeof(u64),
  3109		};
  3110		bool has_leaf = false, has_cfgi = false;
  3111		void __user *cons_uptr;
  3112		int ncmds, i = 0;
  3113		u64 *cmds;
  3114		int ret;
  3115	
  3116		if (!smmu || !smmu_domain->s2 || domain->type != IOMMU_DOMAIN_NESTED)
  3117			return -EINVAL;
  3118		if (q.ent_dwords != CMDQ_ENT_DWORDS)
  3119			return -EINVAL;
  3120		WARN_ON(q.llq.max_n_shift > smmu->cmdq.q.llq.max_n_shift);
  3121	
  3122		cons_uptr = u64_to_user_ptr(inv->cmdq_cons_uptr);
  3123		if (copy_from_user(&q.llq.cons, cons_uptr, sizeof(u32)))
  3124			return -EFAULT;
  3125		if (queue_empty(&q.llq))
  3126			return -EINVAL;
  3127	
  3128		ncmds = min(queue_ncmds(&q.llq), CMDQ_BATCH_ENTRIES - 1);
  3129	
  3130		cmds = kcalloc(ncmds, inv->cmdq_entry_size, GFP_KERNEL);
  3131		if (!cmds)
  3132			return -ENOMEM;
  3133	
  3134		for (; !queue_empty(&q.llq); queue_inc_cons(&q.llq)) {
  3135			u64 *cmd = &cmds[i * CMDQ_ENT_DWORDS];
  3136	
  3137			ret = copy_from_user(cmd,
  3138					     (const void __user *)Q_ENT(&q, q.llq.cons),
  3139					     inv->cmdq_entry_size);
  3140			if (ret) {
  3141				ret = -EFAULT;
  3142				goto out_free_cmds;
  3143			}
  3144	
  3145			ret = arm_smmu_fix_user_cmd(smmu_domain, cmd);
  3146			if (ret == -EOPNOTSUPP)
  3147				continue;
  3148			if (ret) {
  3149				q.llq.cons |= cons_err;
  3150				goto out_copy_cons;
  3151			}
  3152	
  3153			if (arm_smmu_cmdq_hit_errata(smmu, cmd, &has_leaf, &has_cfgi)) {
  3154				/* WAR is to issue the batch prior, with a CMD_SYNC */
  3155				ret = arm_smmu_cmdq_issue_cmdlist(smmu, cmds, i, true);
  3156				if (ret)
  3157					goto out_copy_cons;
  3158				/* Then move the cmd to the head for a new batch */
  3159				for (i = 0; i < CMDQ_ENT_DWORDS; i++)
  3160					cmds[i] = cmd[i];
  3161				i = 1;
  3162				continue;
  3163			}
  3164	
  3165			if (++i == CMDQ_BATCH_ENTRIES - 1) {
  3166				ret = arm_smmu_cmdq_issue_cmdlist(smmu, cmds, i, true);
  3167				if (ret)
  3168					goto out_copy_cons;
  3169				i = 0;
  3170			}
  3171		}
  3172	
  3173		if (i)
  3174			ret = arm_smmu_cmdq_issue_cmdlist(smmu, cmds, i, true);
  3175	out_copy_cons:
  3176		if (copy_to_user(cons_uptr, &q.llq.cons, sizeof(u32)))
  3177			ret = -EFAULT;
  3178	out_free_cmds:
  3179		kfree(cmds);
  3180		return ret;
  3181	}
  3182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
