Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E835A37757C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 19:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784229106; cv=none; b=pvoAQq4zM6zuvB8QBiiDUcNab+dqxnKtD3onng+1poKdx+MK2XWNaYZCuHqm6JH+6Gk+r1zQRkYDSfGM7UzRSZ18fVgv4TfEi9yRYrLYA30QuyeEQFXWK8RShPbBDkgcz5nBLVYR6QbIvHTSjLddAbojmfu9rE0rey5e2tWBlTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784229106; c=relaxed/simple;
	bh=qog0WLBnLSMOFqz5DVOImCf8keK6H6qp5JCd0LiGi3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M0o9sWanhGABn3L2o3/8UjsVw4mZZL94/oPjgMKLlsiiG/Lnx36tv2V+CIkLnEkCS8r1N7+RCcBicMtPZs7LD4BdzlM/8udd1R/Gv9CFHcZEwQx55LZOgXeKSkcx3Leri29hLRKSyfW8+2Ho9WVKUGvuJWbSHIR4cUWBGRHcuYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgIgDSAJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgIgDSAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784229103; x=1815765103;
  h=date:from:to:cc:subject:message-id;
  bh=qog0WLBnLSMOFqz5DVOImCf8keK6H6qp5JCd0LiGi3Q=;
  b=GgIgDSAJhQtkqsVQDTDbwq9IGjq9i1y7V6dCUeadbVYLwrJpr1RYytVq
   0K7D0sigzr6buC3Cn/+T+k4MCV1w2mh1Uanq6tBCIxVwhkVbWMoVErBc4
   3VBPoy993WaPsDZB43qYBAo1VNihebywa1qJYM46f1rUJP2RX92pOQHi4
   vADwSYi5uhcBGwGyi/KBaCZ1W6flUm3+ex9QgVCOWjfKgqib8zS4ZndOg
   5zcdW1e4MGaWaKWdXxxhS2/X6oWYMCe0D35Mn0Mq0sNuvid/U9dwTp9u3
   4i46/XzZG4a7aov5DklbtAIrisHDyfeatXAeJiBVCOVSnKzSdZOgfn4xZ
   w==;
X-CSE-ConnectionGUID: MtuBIc9jRcu433mbol/gWA==
X-CSE-MsgGUID: Cgxrp3vkTdiEavyjSFJ6hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84927508"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="84927508"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 12:11:43 -0700
X-CSE-ConnectionGUID: leMq9xCCSjCe589QqcVkow==
X-CSE-MsgGUID: rLiETo3cST+Cp3zu92kKKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="286646101"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Jul 2026 12:11:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkRUh-00000000PTg-1vwL;
	Thu, 16 Jul 2026 19:11:39 +0000
Date: Fri, 17 Jul 2026 03:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12]
 drivers/irqchip/irq-gic-v3-its.c:3810:30: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202607170254.arvLbfKV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c6f9cfff7e5303d62cede4879db0c6a80745aefb
commit: 9ac8c1da9f82e622cbe1d4422848c324d3706787 [12/12] irqchip/gicv3-its: Add workaround for hip09 ITS erratum 162100801
config: arm-randconfig-r133-20260716 (https://download.01.org/0day-ci/archive/20260717/202607170254.arvLbfKV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607170254.arvLbfKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607170254.arvLbfKV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/irqchip/irq-gic-v3-its.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:1468:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:1468:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:1474:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:1474:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:1474:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:2843:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cpumask [usertype] **mask @@     got struct cpumask [usertype] *[noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:2843:45: sparse:     expected struct cpumask [usertype] **mask
   drivers/irqchip/irq-gic-v3-its.c:2843:45: sparse:     got struct cpumask [usertype] *[noderef] __percpu *
>> drivers/irqchip/irq-gic-v3-its.c:3810:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *l @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:3810:30: sparse:     expected struct raw_spinlock [usertype] *l
   drivers/irqchip/irq-gic-v3-its.c:3810:30: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:4338:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:4338:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:4338:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:4356:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:4356:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:4356:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:269:12: sparse: sparse: context imbalance in 'vpe_to_cpuid_lock' - wrong count at exit
   drivers/irqchip/irq-gic-v3-its.c:275:13: sparse: sparse: context imbalance in 'vpe_to_cpuid_unlock' - unexpected unlock
   drivers/irqchip/irq-gic-v3-its.c:1319:13: sparse: sparse: context imbalance in 'its_send_vmovp' - wrong count at exit
   drivers/irqchip/irq-gic-v3-its.c:1470:18: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:1791:13: sparse: sparse: context imbalance in 'its_map_vm' - different lock contexts for basic block
   drivers/irqchip/irq-gic-v3-its.c:1818:13: sparse: sparse: context imbalance in 'its_unmap_vm' - different lock contexts for basic block
   drivers/irqchip/irq-gic-v3-its.c:1955:12: sparse: sparse: context imbalance in 'its_irq_set_vcpu_affinity' - wrong count at exit
   drivers/irqchip/irq-gic-v3-its.c:2241:23: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2241:23: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2658:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2658:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2679:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2715:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2715:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2719:38: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2737:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2737:49: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2738:25: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2748:30: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2791:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2818:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c: note: in included file (through include/linux/irqchip/arm-gic-v3.h):
   arch/arm/include/asm/arch_gicv3.h:146:9: sparse: sparse: cast truncates bits from constant value (2000000000000000 becomes 0)
   drivers/irqchip/irq-gic-v3-its.c:2847:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2848:14: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2918:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2932:45: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2932:45: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2934:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2986:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2986:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3001:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3001:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3026:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3074:31: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3079:13: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3098:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3103:21: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3163:43: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3197:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3198:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3229:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3232:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3232:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3784:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3811:18: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3802:13: sparse: sparse: context imbalance in 'its_vpe_4_1_invall_locked' - wrong count at exit
   drivers/irqchip/irq-gic-v3-its.c:3864:22: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3900:9: sparse: sparse: context imbalance in 'its_vpe_set_affinity' - different lock contexts for basic block
   drivers/irqchip/irq-gic-v3-its.c:3905:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3919:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3955:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3964:13: sparse: sparse: context imbalance in 'its_vpe_invall' - wrong count at exit
   drivers/irqchip/irq-gic-v3-its.c:4067:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:4147:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:4162:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:4339:16: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5239:19: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5239:19: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5244:31: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5264:14: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5341:13: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5344:21: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5354:13: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5356:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5368:9: sparse: sparse: dereference of noderef expression

vim +3810 drivers/irqchip/irq-gic-v3-its.c

  3801	
  3802	static void its_vpe_4_1_invall_locked(int cpu, struct its_vpe *vpe)
  3803	{
  3804		void __iomem *rdbase;
  3805		u64 val;
  3806	
  3807		val  = GICR_INVALLR_V;
  3808		val |= FIELD_PREP(GICR_INVALLR_VPEID, vpe->vpe_id);
  3809	
> 3810		guard(raw_spinlock)(&gic_data_rdist_cpu(cpu)->rd_lock);
  3811		rdbase = per_cpu_ptr(gic_rdists->rdist, cpu)->rd_base;
  3812		gic_write_lpir(val, rdbase + GICR_INVALLR);
  3813		wait_for_syncr(rdbase);
  3814	}
  3815	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
