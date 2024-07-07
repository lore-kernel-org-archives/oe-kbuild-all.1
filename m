Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5A6AB6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720386328; cv=none; b=rVFWLmv0xlNIN/aDEhsrnwzvqRnWcBSrpLXAK+WFCJ0yZKSO6LS4cI+vSkj1aPW1mHVyLxZTBHHEzdzHFkjNlcewzZMidjdand4mXb7wgGDp74jIPd0JNJQQPN1rcQMHFdsu6ib6iDYqLg+8l9TKt5rJKY0cgAHH6ZAom4ricJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720386328; c=relaxed/simple;
	bh=95Ly0duow42XZ100iZggTQRf2hzCgHSXYME84zGetpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pRk0U0RqDtnOtZRDEPuE9QVQcj1wDYszbsbJp+TpBjCsZf7MNVh1JlcM44piwQ+XyATkrE5AoagKueH/CmR3PWytN/uD3iNKZEX8hLun3w30luPbJpH2whbw+fEdC93qL5dnn5lrUCc7gMaMMU91GBykd1NnADFRbwFw65aRV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixakwltT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixakwltT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720386326; x=1751922326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=95Ly0duow42XZ100iZggTQRf2hzCgHSXYME84zGetpM=;
  b=ixakwltTL9bWKnAceSnaV7+HJuARBmP051Q3EqC7TX9nUoNhM4ZTAQfz
   qyX8mixb8MN1EDUhTntW4mFSatny4VoXYdVp4L/VlUGW/4c86OdyE+2Sl
   gUBUQsIP0j+HUZj4NMANAPq3zz12HJpM97wWPYyQV8f3fbXBwSe5BAUC3
   4/dtrRCPZYNmv1BF36KpMNTh5v2H34+9ExoHz7Jh8s6kalFJWTHHmfu5O
   nEi4Qve0sDHiTldtKQpstpUnCffNjTohdhRaWo7hxv3kKgH1XkB6TJAy5
   N9HHiHeWqXj/zZddW/g2kB8dkLgFU7f8MkXp6ERQ0HGVYedxYpfw1Asu0
   w==;
X-CSE-ConnectionGUID: JEl1eey+QMyrMoXz2PtOhA==
X-CSE-MsgGUID: gYayKckpSc+N6e5ndVWVTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17297210"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17297210"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 14:05:25 -0700
X-CSE-ConnectionGUID: OzMU4SVUSaK34gE1s2DCUw==
X-CSE-MsgGUID: zM/P2ZzTTNS/5ooR+ljtJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47280554"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jul 2024 14:05:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQZ4U-000VHW-0Z;
	Sun, 07 Jul 2024 21:05:22 +0000
Date: Mon, 8 Jul 2024 05:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3269/10596]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3942:23: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202407080437.gW9dgdMn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3b421b6002e287e38790cbdad4a3e08baf7e1bc4
commit: 86b90dc581ce2fcc6b724b4ffaea6103122a4b68 [3269/10596] iommu/arm-smmu-v3: Add support for ECMDQ register mode
config: arm64-randconfig-r131-20240707 (https://download.01.org/0day-ci/archive/20240708/202407080437.gW9dgdMn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407080437.gW9dgdMn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080437.gW9dgdMn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3942:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct arm_smmu_ecmdq *ecmdq @@     got struct arm_smmu_ecmdq [noderef] __percpu * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3942:23: sparse:     expected struct arm_smmu_ecmdq *ecmdq
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3942:23: sparse:     got struct arm_smmu_ecmdq [noderef] __percpu *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3947:58: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct arm_smmu_ecmdq * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3947:58: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3947:58: sparse:     got struct arm_smmu_ecmdq *
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3973:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem *base @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3973:45: sparse:     expected void const *addr
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3973:45: sparse:     got void [noderef] __iomem *base
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +3942 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3934	
  3935	#ifdef CONFIG_ARM_SMMU_V3_ECMDQ
  3936	static int arm_smmu_ecmdq_layout(struct arm_smmu_device *smmu)
  3937	{
  3938		int cpu;
  3939		struct arm_smmu_ecmdq *ecmdq;
  3940	
  3941		if (num_possible_cpus() <= smmu->nr_ecmdq) {
> 3942			ecmdq = devm_alloc_percpu(smmu->dev, *ecmdq);
  3943			if (!ecmdq)
  3944				return -ENOMEM;
  3945	
  3946			for_each_possible_cpu(cpu)
  3947				*per_cpu_ptr(smmu->ecmdq, cpu) = per_cpu_ptr(ecmdq, cpu);
  3948	
  3949			/* A core requires at most one ECMDQ */
  3950			smmu->nr_ecmdq = num_possible_cpus();
  3951	
  3952			return 0;
  3953		}
  3954	
  3955		return -ENOSPC;
  3956	}
  3957	
  3958	static int arm_smmu_ecmdq_probe(struct arm_smmu_device *smmu)
  3959	{
  3960		int ret, cpu;
  3961		u32 i, nump, numq, gap;
  3962		u32 reg, shift_increment;
  3963		u64 addr, smmu_dma_base;
  3964		void __iomem *cp_regs, *cp_base;
  3965	
  3966		/* IDR6 */
  3967		reg = readl_relaxed(smmu->base + ARM_SMMU_IDR6);
  3968		nump = 1 << FIELD_GET(IDR6_LOG2NUMP, reg);
  3969		numq = 1 << FIELD_GET(IDR6_LOG2NUMQ, reg);
  3970		smmu->nr_ecmdq = nump * numq;
  3971		gap = ECMDQ_CP_RRESET_SIZE >> FIELD_GET(IDR6_LOG2NUMQ, reg);
  3972	
> 3973		smmu_dma_base = (vmalloc_to_pfn(smmu->base) << PAGE_SHIFT);
  3974		cp_regs = ioremap(smmu_dma_base + ARM_SMMU_ECMDQ_CP_BASE, PAGE_SIZE);
  3975		if (!cp_regs)
  3976			return -ENOMEM;
  3977	
  3978		for (i = 0; i < nump; i++) {
  3979			u64 val, pre_addr;
  3980	
  3981			val = readq_relaxed(cp_regs + 32 * i);
  3982			if (!(val & ECMDQ_CP_PRESET)) {
  3983				iounmap(cp_regs);
  3984				dev_err(smmu->dev, "ecmdq control page %u is memory mode\n", i);
  3985				return -EFAULT;
  3986			}
  3987	
  3988			if (i && ((val & ECMDQ_CP_ADDR) != (pre_addr + ECMDQ_CP_RRESET_SIZE))) {
  3989				iounmap(cp_regs);
  3990				dev_err(smmu->dev, "ecmdq_cp memory region is not contiguous\n");
  3991				return -EFAULT;
  3992			}
  3993	
  3994			pre_addr = val & ECMDQ_CP_ADDR;
  3995		}
  3996	
  3997		addr = readl_relaxed(cp_regs) & ECMDQ_CP_ADDR;
  3998		iounmap(cp_regs);
  3999	
  4000		cp_base = devm_ioremap(smmu->dev, smmu_dma_base + addr, ECMDQ_CP_RRESET_SIZE * nump);
  4001		if (!cp_base)
  4002			return -ENOMEM;
  4003	
  4004		smmu->ecmdq = devm_alloc_percpu(smmu->dev, struct arm_smmu_ecmdq *);
  4005		if (!smmu->ecmdq)
  4006			return -ENOMEM;
  4007	
  4008		ret = arm_smmu_ecmdq_layout(smmu);
  4009		if (ret)
  4010			return ret;
  4011	
  4012		shift_increment = order_base_2(num_possible_cpus() / smmu->nr_ecmdq);
  4013	
  4014		addr = 0;
  4015		for_each_possible_cpu(cpu) {
  4016			struct arm_smmu_ecmdq *ecmdq;
  4017			struct arm_smmu_queue *q;
  4018	
  4019			ecmdq = *per_cpu_ptr(smmu->ecmdq, cpu);
  4020			ecmdq->base = cp_base + addr;
  4021	
  4022			q = &ecmdq->cmdq.q;
  4023	
  4024			q->llq.max_n_shift = ECMDQ_MAX_SZ_SHIFT + shift_increment;
  4025			ret = arm_smmu_init_one_queue(smmu, q, ecmdq->base, ARM_SMMU_ECMDQ_PROD,
  4026					ARM_SMMU_ECMDQ_CONS, CMDQ_ENT_DWORDS, "ecmdq");
  4027			if (ret)
  4028				return ret;
  4029	
  4030			q->ecmdq_prod = ECMDQ_PROD_EN;
  4031			rwlock_init(&q->ecmdq_lock);
  4032	
  4033			ret = arm_smmu_ecmdq_init(&ecmdq->cmdq);
  4034			if (ret) {
  4035				dev_err(smmu->dev, "ecmdq[%d] init failed\n", i);
  4036				return ret;
  4037			}
  4038	
  4039			addr += gap;
  4040		}
  4041	
  4042		return 0;
  4043	}
  4044	#endif
  4045	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
