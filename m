Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9916F07C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 18:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708280593; cv=none; b=ZZI8TicXjKYYQXNckXYjpUwU9nsDa0CCCQ4f3DygJ/TFV0UosNih3IaM7+b1lflQR5m3+jHVArPhjIVdYNhXD4wasYxB6cnfgAhM7DdPFh70rCrIQYpxyHujiQ3mGmvyzmNBflBkKzPetuoQX6Kioi6A1Xgv2camQDV8zL7eQls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708280593; c=relaxed/simple;
	bh=g1suebBzPiKP/8uZr4mt4ixvXaAluWda9dRHhvf5Sic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sXYy+uNEODJB28RJwiKyDuZwMM47pkXo8bJc6WgenNd+XxKK7Epm8+qAIOwHABCvBzM8wCIBS7V0sRytpT3V1jg3xTx1sHiYBu4rPOuOP3clI5E1JFpKUjf7k2bk7sZVF6FoXJXLIPmVOkJV6CkuODG8Y3ldwo0AfXlA6wBMiV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oz1geU6o; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oz1geU6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708280582; x=1739816582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1suebBzPiKP/8uZr4mt4ixvXaAluWda9dRHhvf5Sic=;
  b=Oz1geU6okRjwif57CiKZudobFI5xyDotO2Q2tgG9LLOFVi6xfXaXPPI7
   rgZOuxH3IdIIcoNz8Quo6PRjOYWxaG/KhxsBNgCeCbEybv58KberNyTMa
   NJ4pSNGxHCjFNGGGVaWkdMFg0AXVE+1TyvoUWmR+KtsPX4UK8NFkVQx6h
   nWIhZFRd9f+M3hGYv3lAB+7tWWs4wuWfRHhhWr+66DCL52m/4AqyQDtZd
   W1Y8LHbXi7Sz82MoJQDkiNZVqL3C6csrQPWeRQeaG5yzPWxxmJ957nMt9
   eV6NAJalTAzi4KApss6VArf84V4P0XKjGjpGKzOXBYvnQQ8X9VYtqIxHF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19881731"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="19881731"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 10:22:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="8890709"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Feb 2024 10:22:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbloV-0003Ea-12;
	Sun, 18 Feb 2024 18:22:55 +0000
Date: Mon, 19 Feb 2024 02:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3176/3186]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3988:39: warning: variable
 'pre_addr' is uninitialized when used here
Message-ID: <202402190254.FDaGb5YO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   181ab23277f274c13c335d037d654b2879de50ca
commit: 86b90dc581ce2fcc6b724b4ffaea6103122a4b68 [3176/3186] iommu/arm-smmu-v3: Add support for ECMDQ register mode
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240219/202402190254.FDaGb5YO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402190254.FDaGb5YO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402190254.FDaGb5YO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3988:39: warning: variable 'pre_addr' is uninitialized when used here [-Wuninitialized]
    3988 |                 if (i && ((val & ECMDQ_CP_ADDR) != (pre_addr + ECMDQ_CP_RRESET_SIZE))) {
         |                                                     ^~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3979:20: note: initialize the variable 'pre_addr' to silence this warning
    3979 |                 u64 val, pre_addr;
         |                                  ^
         |                                   = 0
   1 warning generated.


vim +/pre_addr +3988 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

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
  3973		smmu_dma_base = (vmalloc_to_pfn(smmu->base) << PAGE_SHIFT);
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
> 3988			if (i && ((val & ECMDQ_CP_ADDR) != (pre_addr + ECMDQ_CP_RRESET_SIZE))) {
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
