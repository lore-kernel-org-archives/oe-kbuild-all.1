Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E84303A16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 23:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761780437; cv=none; b=I5eOZL6ymNNK5ha7a3v6g3ESbqw1gWiPBak9g5yWTpmNAQt9f4Nbt2N0akmV9qzaFWjwbVurSUABrrVEbdbN/LJvTB8+WuYYtGwdZYKVrlwUjLIUbqcvL8EDhN0OVIjy3SGOmhSIIl7F4nXHRb3DxP7JUhNzECrnAgjYphdtemk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761780437; c=relaxed/simple;
	bh=EOh7ftjLnfEUrP7uK4hkPe5aTEKEr9lj7xUG3SPjrRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZlmNN8+9bmVObULHcf9IljU83y7J6ADSsuHp2cQxuyhIQ2sfG6JkNTH/6ICjkNkARQyTE+Jm5fBcJq2WZw/LVxxl/iFbwhNDBrUySOinD9v9OQ6cAi5hMYWYzisoHQGAG3MOX7ve29cRwhGUZw8hy0Nxd6pjQJmvFs3OguS3OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csQkpR3U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csQkpR3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761780435; x=1793316435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOh7ftjLnfEUrP7uK4hkPe5aTEKEr9lj7xUG3SPjrRU=;
  b=csQkpR3UL9Jl6iAjkEJmk0FH9aFmZA2vseDOMsMtmr9vrU07/djp9unK
   rUsH7uYGAb4VyVIikbqCP3LPysCHZxanQBM/mIE13R2o+T/6/nSXUIarX
   kmXEUWurs9Tfz5hHg5T8sOo3Oe34elMQHDC5/A3KfXUbUXH1pqq8BX3gF
   mi6S2Dd0i8wjrIM000Bq/UsVsPR6+t93Qighx3AUhkMgPZm3kK0r3nUJE
   UlnsLErGr0/OhxsnmLSQhiz1rZizJ79hKV77101TsSgbuLkiI49wRjDy9
   UM4Q+SynbiUUXHzH53un5ZLLCiLiYhwaIlm5SEbpEUJ/4MLkmHrDReJ0g
   Q==;
X-CSE-ConnectionGUID: efmfGMO8T8m8YVZBJN5UZQ==
X-CSE-MsgGUID: DncivmlgTQKmDi8fUAlidw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64010970"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="64010970"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 16:27:14 -0700
X-CSE-ConnectionGUID: aPsHKE2iTk2PlE1ae/4k2Q==
X-CSE-MsgGUID: OPtAUgynQsew4hJL1EH5dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="184993685"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2025 16:27:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEFZN-000LGq-0M;
	Wed, 29 Oct 2025 23:27:09 +0000
Date: Thu, 30 Oct 2025 07:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3064/3064]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:939
 arm_smmu_cmdq_issue_cmdlist() warn: inconsistent indenting
Message-ID: <202510300753.dLChQYN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2f6a2b7160d59b59ef2bd08614200d0a2219b54e
commit: 86b90dc581ce2fcc6b724b4ffaea6103122a4b68 [3064/3064] iommu/arm-smmu-v3: Add support for ECMDQ register mode
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300753.dLChQYN9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300753.dLChQYN9-lkp@intel.com/

smatch warnings:
drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:939 arm_smmu_cmdq_issue_cmdlist() warn: inconsistent indenting

vim +939 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  824  
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  825  /*
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  826   * This is the actual insertion function, and provides the following
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  827   * ordering guarantees to callers:
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  828   *
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  829   * - There is a dma_wmb() before publishing any commands to the queue.
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  830   *   This can be relied upon to order prior writes to data structures
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  831   *   in memory (such as a CD or an STE) before the command.
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  832   *
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  833   * - On completion of a CMD_SYNC, there is a control dependency.
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  834   *   This can be relied upon to order subsequent writes to memory (e.g.
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  835   *   freeing an IOVA) after completion of the CMD_SYNC.
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  836   *
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  837   * - Command insertion is totally ordered, so if two CPUs each race to
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  838   *   insert their own list of commands then all of the commands from one
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  839   *   CPU will appear before any of the commands from the other CPU.
05cbaf4ddd02b69 drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-08-20  840   */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  841  static int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  842  				       u64 *cmds, int n, bool sync)
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  843  {
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  844  	u64 cmd_sync[CMDQ_ENT_DWORDS];
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  845  	u32 prod;
2f657add07a8f75 drivers/iommu/arm-smmu-v3.c                 Robin Murphy 2017-08-31  846  	unsigned long flags;
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  847  	bool owner;
8639cc83aac5dd1 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei     2021-08-11  848  	struct arm_smmu_cmdq *cmdq = arm_smmu_get_cmdq(smmu);
5c08c5acdc6ce46 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c John Garry   2021-06-22  849  	struct arm_smmu_ll_queue llq, head;
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  850  	int ret = 0;
2f657add07a8f75 drivers/iommu/arm-smmu-v3.c                 Robin Murphy 2017-08-31  851  
5c08c5acdc6ce46 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c John Garry   2021-06-22  852  	llq.max_n_shift = cmdq->q.llq.max_n_shift;
5c08c5acdc6ce46 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c John Garry   2021-06-22  853  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  854  	/* 1. Allocate some space in the queue */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  855  	local_irq_save(flags);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  856  	llq.val = READ_ONCE(cmdq->q.llq.val);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  857  	do {
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  858  		u64 old;
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  859  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  860  		while (!queue_has_space(&llq, n + sync)) {
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  861  			local_irq_restore(flags);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  862  			if (arm_smmu_cmdq_poll_until_not_full(smmu, &llq))
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  863  				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  864  			local_irq_save(flags);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  865  		}
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  866  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  867  		head.cons = llq.cons;
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  868  		head.prod = queue_inc_prod_n(&llq, n + sync) |
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  869  					     CMDQ_PROD_OWNED_FLAG;
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  870  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  871  		old = cmpxchg_relaxed(&cmdq->q.llq.val, llq.val, head.val);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  872  		if (old == llq.val)
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  873  			break;
2f657add07a8f75 drivers/iommu/arm-smmu-v3.c                 Robin Murphy 2017-08-31  874  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  875  		llq.val = old;
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  876  	} while (1);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  877  	owner = !(llq.prod & CMDQ_PROD_OWNED_FLAG);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  878  	head.prod &= ~CMDQ_PROD_OWNED_FLAG;
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  879  	llq.prod &= ~CMDQ_PROD_OWNED_FLAG;
2f657add07a8f75 drivers/iommu/arm-smmu-v3.c                 Robin Murphy 2017-08-31  880  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  881  	/*
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  882  	 * 2. Write our commands into the queue
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  883  	 * Dependency ordering from the cmpxchg() loop above.
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  884  	 */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  885  	arm_smmu_cmdq_write_entries(cmdq, cmds, llq.prod, n);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  886  	if (sync) {
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  887  		prod = queue_inc_prod_n(&llq, n);
8639cc83aac5dd1 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei     2021-08-11  888  		arm_smmu_cmdq_build_sync_cmd(cmd_sync, smmu, &cmdq->q, prod);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  889  		queue_write(Q_ENT(&cmdq->q, prod), cmd_sync, CMDQ_ENT_DWORDS);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  890  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  891  		/*
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  892  		 * In order to determine completion of our CMD_SYNC, we must
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  893  		 * ensure that the queue can't wrap twice without us noticing.
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  894  		 * We achieve that by taking the cmdq lock as shared before
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  895  		 * marking our slot as valid.
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  896  		 */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  897  		arm_smmu_cmdq_shared_lock(cmdq);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  898  	}
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  899  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  900  	/* 3. Mark our slots as valid, ensuring commands are visible first */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  901  	dma_wmb();
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  902  	arm_smmu_cmdq_set_valid_map(cmdq, llq.prod, head.prod);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  903  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  904  	/* 4. If we are the owner, take control of the SMMU hardware */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  905  	if (owner) {
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  906  		/* a. Wait for previous owner to finish */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  907  		atomic_cond_read_relaxed(&cmdq->owner_prod, VAL == llq.prod);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  908  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  909  		/* b. Stop gathering work by clearing the owned flag */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  910  		prod = atomic_fetch_andnot_relaxed(CMDQ_PROD_OWNED_FLAG,
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  911  						   &cmdq->q.llq.atomic.prod);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  912  		prod &= ~CMDQ_PROD_OWNED_FLAG;
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  913  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  914  		/*
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  915  		 * c. Wait for any gathered work to be written to the queue.
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  916  		 * Note that we read our own entries so that we have the control
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  917  		 * dependency required by (d).
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  918  		 */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  919  		arm_smmu_cmdq_poll_valid_map(cmdq, llq.prod, prod);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  920  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  921  		/*
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  922  		 * d. Advance the hardware prod pointer
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  923  		 * Control dependency ordering from the entries becoming valid.
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  924  		 */
86b90dc581ce2fc drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei     2024-02-17  925  #ifdef CONFIG_ARM_SMMU_V3_ECMDQ
86b90dc581ce2fc drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei     2024-02-17  926  		if (smmu->ecmdq_enabled) {
86b90dc581ce2fc drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei     2024-02-17  927  			read_lock(&cmdq->q.ecmdq_lock);
86b90dc581ce2fc drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei     2024-02-17  928  			writel_relaxed(prod | cmdq->q.ecmdq_prod, cmdq->q.prod_reg);
86b90dc581ce2fc drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei     2024-02-17  929  			read_unlock(&cmdq->q.ecmdq_lock);
86b90dc581ce2fc drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei     2024-02-17  930  		} else
86b90dc581ce2fc drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei     2024-02-17  931  #endif
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  932  			writel_relaxed(prod, cmdq->q.prod_reg);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  933  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  934  		/*
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  935  		 * e. Tell the next owner we're done
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  936  		 * Make sure we've updated the hardware first, so that we don't
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  937  		 * race to update prod and potentially move it backwards.
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  938  		 */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02 @939  		atomic_set_release(&cmdq->owner_prod, prod);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  940  	}
2f657add07a8f75 drivers/iommu/arm-smmu-v3.c                 Robin Murphy 2017-08-31  941  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  942  	/* 5. If we are inserting a CMD_SYNC, we must wait for it to complete */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  943  	if (sync) {
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  944  		llq.prod = queue_inc_prod_n(&llq, n);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  945  		ret = arm_smmu_cmdq_poll_until_sync(smmu, &llq);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  946  		if (ret) {
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  947  			dev_err_ratelimited(smmu->dev,
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  948  					    "CMD_SYNC timeout at 0x%08x [hwprod 0x%08x, hwcons 0x%08x]\n",
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  949  					    llq.prod,
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  950  					    readl_relaxed(cmdq->q.prod_reg),
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  951  					    readl_relaxed(cmdq->q.cons_reg));
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  952  		}
2f657add07a8f75 drivers/iommu/arm-smmu-v3.c                 Robin Murphy 2017-08-31  953  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  954  		/*
49fbb25030265c6 drivers/iommu/arm-smmu-v3.c                 John Garry   2020-06-23  955  		 * Try to unlock the cmdq lock. This will fail if we're the last
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  956  		 * reader, in which case we can safely update cmdq->q.llq.cons
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  957  		 */
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  958  		if (!arm_smmu_cmdq_shared_tryunlock(cmdq)) {
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  959  			WRITE_ONCE(cmdq->q.llq.cons, llq.cons);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  960  			arm_smmu_cmdq_shared_unlock(cmdq);
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  961  		}
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  962  	}
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  963  
587e6c10a7ce89a drivers/iommu/arm-smmu-v3.c                 Will Deacon  2019-07-02  964  	local_irq_restore(flags);
49806599c31d77b drivers/iommu/arm-smmu-v3.c                 Will Deacon  2017-10-19  965  	return ret;
49806599c31d77b drivers/iommu/arm-smmu-v3.c                 Will Deacon  2017-10-19  966  }
49806599c31d77b drivers/iommu/arm-smmu-v3.c                 Will Deacon  2017-10-19  967  

:::::: The code at line 939 was first introduced by commit
:::::: 587e6c10a7ce89a5924fdbeff2ec524fbd6a124b iommu/arm-smmu-v3: Reduce contention during command-queue insertion

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
