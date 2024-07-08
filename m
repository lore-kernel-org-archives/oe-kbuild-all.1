Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2695442F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 00:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720399065; cv=none; b=F35AmNWEXycCydFwLpsltASmL3HSakZZw5jJCL7+yb+if+p6d3yVzQFlZgNkrksdqvakE6iuFmATGlJAC3IqPo9S9dkTiUD6m1jbaJrtRHK/zpPFbyQ84yLL2O0189Fi15M/DxcS6AHqJ7IIaDXmkUhcR4kXQrGWpq3JmXVtEyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720399065; c=relaxed/simple;
	bh=qBBxtPUtjyJwEml7+S51P3sgps21jCk4aQXuDjvUHHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dvbh4YiVB0GRuiNLCh8M29iZ9+OdaHwOkkzjg/cxqAglwB+VXi/vEbZH85MDMYu5kiMBNJMkJJ8hE9vGXFfsNljWR7hjejqNXEZhKLrPhWXIJQz4ab+d1K94huc8ok2ofGTiyp5e7vNhEetBKVGnL9E/yS1mlWQcueSdZhX/N6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOOzCOG3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOOzCOG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720399064; x=1751935064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBBxtPUtjyJwEml7+S51P3sgps21jCk4aQXuDjvUHHI=;
  b=LOOzCOG3KD7m3nJcMLa2nQJ8wHgVAxTUjlGmyJjfS02OAFTL5QJI9Ixg
   D3y3KeXCU6R5VeKeg2gNsdJjYvdcbHj8gRY/6O0TaqKGzQgDLAeoKiMTo
   WTP/E4QA0tOMsXf9GEc8lBW6xctfdN0Tini82p/ZrdIt2XJa+4KoDdJ6t
   8V52LRl/23nJ6Lc7t1sSz6+C53FjP9G8S85LqWE2W9UmEvhYecCFCLOCF
   RHxH9YNj5U04I07VQ8ceiGx+H/l5ITpHUW8IGYP32fKqlTJLEldZaFVEB
   T3uaSudHouqkO5QoQKmn11e9BdpwHGg6e3cY6dKKtzxTel+R7TSfMh9fW
   Q==;
X-CSE-ConnectionGUID: BB/5MSrER26BmSZr1cgQVA==
X-CSE-MsgGUID: pbdf24gPRU6UD2WUX7uTRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="21400417"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="21400417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 17:37:41 -0700
X-CSE-ConnectionGUID: RBLStBTuRyKcceHE6pIcMg==
X-CSE-MsgGUID: O6n2iwfvTmSC4+DunO+mrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="52539043"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Jul 2024 17:37:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQcNh-000VP3-1a;
	Mon, 08 Jul 2024 00:37:25 +0000
Date: Mon, 8 Jul 2024 08:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3272/10596]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4087:21: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202407080858.aAMctg7p-lkp@intel.com>
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
commit: 22129ea1b367d0101df8cc4a837b3f773021e556 [3272/10596] iommu/arm-smmu-v3: Add support for less than one ECMDQ per core
config: arm64-randconfig-r131-20240707 (https://download.01.org/0day-ci/archive/20240708/202407080858.aAMctg7p-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407080858.aAMctg7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080858.aAMctg7p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4084:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct arm_smmu_ecmdq *ecmdq @@     got struct arm_smmu_ecmdq [noderef] __percpu * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4084:15: sparse:     expected struct arm_smmu_ecmdq *ecmdq
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4084:15: sparse:     got struct arm_smmu_ecmdq [noderef] __percpu *
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4087:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct arm_smmu_ecmdq [noderef] __percpu *ecmdq @@     got struct arm_smmu_ecmdq *ecmdq @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4087:21: sparse:     expected struct arm_smmu_ecmdq [noderef] __percpu *ecmdq
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4087:21: sparse:     got struct arm_smmu_ecmdq *ecmdq
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4124:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem *base @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4124:45: sparse:     expected void const *addr
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4124:45: sparse:     got void [noderef] __iomem *base
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +4087 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  4077	
  4078	#ifdef CONFIG_ARM_SMMU_V3_ECMDQ
  4079	static int arm_smmu_ecmdq_layout(struct arm_smmu_device *smmu)
  4080	{
  4081		int cpu, host_cpu;
  4082		struct arm_smmu_ecmdq *ecmdq;
  4083	
> 4084		ecmdq = devm_alloc_percpu(smmu->dev, *ecmdq);
  4085		if (!ecmdq)
  4086			return -ENOMEM;
> 4087		smmu->ecmdq = ecmdq;
  4088	
  4089		/* A core requires at most one ECMDQ */
  4090		if (num_possible_cpus() < smmu->nr_ecmdq)
  4091			smmu->nr_ecmdq = num_possible_cpus();
  4092	
  4093		for_each_possible_cpu(cpu) {
  4094			if (cpu < smmu->nr_ecmdq) {
  4095				*per_cpu_ptr(smmu->ecmdqs, cpu) = per_cpu_ptr(smmu->ecmdq, cpu);
  4096			} else {
  4097				host_cpu = cpu % smmu->nr_ecmdq;
  4098				ecmdq = per_cpu_ptr(smmu->ecmdq, host_cpu);
  4099				ecmdq->cmdq.shared = 1;
  4100				*per_cpu_ptr(smmu->ecmdqs, cpu) = ecmdq;
  4101			}
  4102		}
  4103	
  4104		return 0;
  4105	}
  4106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
