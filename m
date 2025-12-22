Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B05F333447
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422927; cv=none; b=Eji0BC2pyND6/gEP3VGLRjm9DtemJMgMM4rioSYojL6/cse4ArOUyaUiy6qig5jvzb+yHIRpxp5Yvjv0ZbFnmhr4j6SkrNR2EceIsSSmmHjGRQ+OvMBR7vloca4OW8Vhf/9WgevuortcZ8eG0mUXP/AobuLw9EXMBAq/uASNAP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422927; c=relaxed/simple;
	bh=1fnahG/l8SQgJ/U1y7QsuIrpQPja+ZVJmEhWgWN3RjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fe0jKYKLxbvOqB3s8GBO3lxDtbgJ6gUddfe5L0qdGSQaO8NMD2ZOKubnfXpWG8EMnGofgU9JrYuu4Bwn4dnnVTIwj3jo2oheY/EZtC7y1mE+lgDbzMSPNilGmxLOdJNuvS1fEIGTYkKf9rkFRZJ91WWQ70ZicElRWvkOxIOOubM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kbvd8UyV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kbvd8UyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766422925; x=1797958925;
  h=date:from:to:cc:subject:message-id;
  bh=1fnahG/l8SQgJ/U1y7QsuIrpQPja+ZVJmEhWgWN3RjI=;
  b=Kbvd8UyVkh2lXeWZ0XZ7kjKrDIgElAeyIq1BCUk9ADeBKXBtnFdt6zIF
   +b0AiMwopMAUIX9yIgn/dHPCNQu0Tz/HQRfj4EHAUdTLkNYaJyeTM1MD4
   sPVHh0VWI7gwWiVw9FsmP/HHhGlPf4t9SMUaP5fTugDTMuC2ERrPpysfF
   P7HyRUtyUR3TE8H+Ah7ETKPdUpzXHKR212RJx7+1OOxGC6MYnEGNnlj0X
   nW0TFU+1xhC38AOm161t4EhrCbD1W7wGRelyFUlG3yAW4XMuj2oKz6RaY
   uXN9jmzxMPjaJ4VEvMfLLAv28ifpB5jVozCxszovUBLCvrPg0h+rlB0xc
   A==;
X-CSE-ConnectionGUID: fneqehciSsePmrPLc69tGQ==
X-CSE-MsgGUID: yDsizo8vQq++yTjVlCO7RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68264504"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68264504"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:02:05 -0800
X-CSE-ConnectionGUID: AZT3dn35T0mqG0CPO/xlZQ==
X-CSE-MsgGUID: r9/9adD7SfmtyZy6qTjVdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="198707817"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Dec 2025 09:02:00 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXjID-000000000u2-084l;
	Mon, 22 Dec 2025 17:01:57 +0000
Date: Tue, 23 Dec 2025 01:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3557/3557]
 drivers/irqchip/irq-gic-phytium-2500.c:1216:78: sparse: sparse: dubious: !x |
 !y
Message-ID: <202512230028.LM8FWjL7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 792b82446538ed840a6e23b89673ce21564702bd [3557/3557] Fix gic support for Phytium S2500
config: arm64-randconfig-r132-20251218 (https://download.01.org/0day-ci/archive/20251223/202512230028.LM8FWjL7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230028.LM8FWjL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230028.LM8FWjL7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-gic-phytium-2500.c:1216:78: sparse: sparse: dubious: !x | !y
>> drivers/irqchip/irq-gic-phytium-2500.c:302:29: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:327:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:454:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:479:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:266:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:767:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:1155:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:1156:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:1157:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:1409:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:266:24: sparse: sparse: dereference of noderef expression
--
>> drivers/irqchip/irq-gic-phytium-2500-its.c:1479:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:1479:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-phytium-2500-its.c:1479:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-phytium-2500-its.c:1485:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:1485:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-phytium-2500-its.c:1485:9: sparse:     got struct raw_spinlock [noderef] __percpu *
>> drivers/irqchip/irq-gic-phytium-2500-its.c:2934:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cpumask [usertype] **mask @@     got struct cpumask [usertype] *[noderef] __percpu * @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:2934:45: sparse:     expected struct cpumask [usertype] **mask
   drivers/irqchip/irq-gic-phytium-2500-its.c:2934:45: sparse:     got struct cpumask [usertype] *[noderef] __percpu *
   drivers/irqchip/irq-gic-phytium-2500-its.c:4281:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:4281:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-phytium-2500-its.c:4281:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-phytium-2500-its.c:4286:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:4286:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-phytium-2500-its.c:4286:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-phytium-2500-its.c:4421:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:4421:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-phytium-2500-its.c:4421:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-phytium-2500-its.c:4439:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:4439:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-phytium-2500-its.c:4439:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-phytium-2500-its.c: note: in included file (through include/linux/spinlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/spinlock_api_smp.h:111:9: sparse: sparse: context imbalance in 'vpe_to_cpuid_lock' - wrong count at exit
   drivers/irqchip/irq-gic-phytium-2500-its.c:284:13: sparse: sparse: context imbalance in 'vpe_to_cpuid_unlock' - unexpected unlock
>> drivers/irqchip/irq-gic-phytium-2500-its.c:1481:18: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2337:23: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2337:23: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2751:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2751:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2772:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2806:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2806:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2810:38: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2828:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2828:49: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2829:25: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2839:30: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2882:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2909:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2938:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2939:14: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3009:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3021:45: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3021:45: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3023:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3078:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3078:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3093:29: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3093:29: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3118:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3156:31: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3161:13: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3180:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3185:21: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3244:43: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3279:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3280:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3318:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3321:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3321:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3919:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3968:13: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3969:36: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3969:36: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3984:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3998:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:4030:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:4140:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:4220:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:4235:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:4282:18: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:4422:16: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:5309:19: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:5309:19: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:5314:31: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:5334:14: sparse: sparse: dereference of noderef expression

vim +1216 drivers/irqchip/irq-gic-phytium-2500.c

ade50f9f855e6a Li Yuting 2024-01-17  1181  
ade50f9f855e6a Li Yuting 2024-01-17  1182  static int __gic_update_rdist_properties(struct redist_region *region,
ade50f9f855e6a Li Yuting 2024-01-17  1183  					 void __iomem *ptr)
ade50f9f855e6a Li Yuting 2024-01-17  1184  {
ade50f9f855e6a Li Yuting 2024-01-17  1185  	u64 typer = gic_read_typer(ptr + GICR_TYPER);
ade50f9f855e6a Li Yuting 2024-01-17  1186  	u32 ctlr = readl_relaxed(ptr + GICR_CTLR);
ade50f9f855e6a Li Yuting 2024-01-17  1187  
ade50f9f855e6a Li Yuting 2024-01-17  1188  	/* Boot-time cleanup */
ade50f9f855e6a Li Yuting 2024-01-17  1189  	if ((typer & GICR_TYPER_VLPIS) && (typer & GICR_TYPER_RVPEID)) {
ade50f9f855e6a Li Yuting 2024-01-17  1190  		u64 val;
ade50f9f855e6a Li Yuting 2024-01-17  1191  
ade50f9f855e6a Li Yuting 2024-01-17  1192  		/* Deactivate any present vPE */
ade50f9f855e6a Li Yuting 2024-01-17  1193  		val = gicr_read_vpendbaser(ptr + SZ_128K + GICR_VPENDBASER);
ade50f9f855e6a Li Yuting 2024-01-17  1194  		if (val & GICR_VPENDBASER_Valid)
ade50f9f855e6a Li Yuting 2024-01-17  1195  			gicr_write_vpendbaser(GICR_VPENDBASER_PendingLast,
ade50f9f855e6a Li Yuting 2024-01-17  1196  					      ptr + SZ_128K + GICR_VPENDBASER);
ade50f9f855e6a Li Yuting 2024-01-17  1197  
ade50f9f855e6a Li Yuting 2024-01-17  1198  		/* Mark the VPE table as invalid */
ade50f9f855e6a Li Yuting 2024-01-17  1199  		val = gicr_read_vpropbaser(ptr + SZ_128K + GICR_VPROPBASER);
ade50f9f855e6a Li Yuting 2024-01-17  1200  		val &= ~GICR_VPROPBASER_4_1_VALID;
ade50f9f855e6a Li Yuting 2024-01-17  1201  		gicr_write_vpropbaser(val, ptr + SZ_128K + GICR_VPROPBASER);
ade50f9f855e6a Li Yuting 2024-01-17  1202  	}
ade50f9f855e6a Li Yuting 2024-01-17  1203  
ade50f9f855e6a Li Yuting 2024-01-17  1204  	gic_data.rdists.has_vlpis &= !!(typer & GICR_TYPER_VLPIS);
ade50f9f855e6a Li Yuting 2024-01-17  1205  
ade50f9f855e6a Li Yuting 2024-01-17  1206  	/*
ade50f9f855e6a Li Yuting 2024-01-17  1207  	 * TYPER.RVPEID implies some form of DirectLPI, no matter what the
ade50f9f855e6a Li Yuting 2024-01-17  1208  	 * doc says... :-/ And CTLR.IR implies another subset of DirectLPI
ade50f9f855e6a Li Yuting 2024-01-17  1209  	 * that the ITS driver can make use of for LPIs (and not VLPIs).
ade50f9f855e6a Li Yuting 2024-01-17  1210  	 *
ade50f9f855e6a Li Yuting 2024-01-17  1211  	 * These are 3 different ways to express the same thing, depending
ade50f9f855e6a Li Yuting 2024-01-17  1212  	 * on the revision of the architecture and its relaxations over
ade50f9f855e6a Li Yuting 2024-01-17  1213  	 * time. Just group them under the 'direct_lpi' banner.
ade50f9f855e6a Li Yuting 2024-01-17  1214  	 */
ade50f9f855e6a Li Yuting 2024-01-17  1215  	gic_data.rdists.has_rvpeid &= !!(typer & GICR_TYPER_RVPEID);
ade50f9f855e6a Li Yuting 2024-01-17 @1216  	gic_data.rdists.has_direct_lpi &= (!!(typer & GICR_TYPER_DirectLPIS) |
ade50f9f855e6a Li Yuting 2024-01-17  1217  					   !!(ctlr & GICR_CTLR_IR) |
ade50f9f855e6a Li Yuting 2024-01-17  1218  					   gic_data.rdists.has_rvpeid);
ade50f9f855e6a Li Yuting 2024-01-17  1219  	gic_data.rdists.has_vpend_valid_dirty &= !!(typer & GICR_TYPER_DIRTY);
ade50f9f855e6a Li Yuting 2024-01-17  1220  
ade50f9f855e6a Li Yuting 2024-01-17  1221  	/* Detect non-sensical configurations */
ade50f9f855e6a Li Yuting 2024-01-17  1222  	if (WARN_ON_ONCE(gic_data.rdists.has_rvpeid && !gic_data.rdists.has_vlpis)) {
ade50f9f855e6a Li Yuting 2024-01-17  1223  		gic_data.rdists.has_direct_lpi = false;
ade50f9f855e6a Li Yuting 2024-01-17  1224  		gic_data.rdists.has_vlpis = false;
ade50f9f855e6a Li Yuting 2024-01-17  1225  		gic_data.rdists.has_rvpeid = false;
ade50f9f855e6a Li Yuting 2024-01-17  1226  	}
ade50f9f855e6a Li Yuting 2024-01-17  1227  
ade50f9f855e6a Li Yuting 2024-01-17  1228  	gic_data.ppi_nr = min(GICR_TYPER_NR_PPIS(typer), gic_data.ppi_nr);
ade50f9f855e6a Li Yuting 2024-01-17  1229  
ade50f9f855e6a Li Yuting 2024-01-17  1230  	return 1;
ade50f9f855e6a Li Yuting 2024-01-17  1231  }
ade50f9f855e6a Li Yuting 2024-01-17  1232  

:::::: The code at line 1216 was first introduced by commit
:::::: ade50f9f855e6afd85e65b6b036a1bb948d4dfff Add gic support for Phytium S2500

:::::: TO: Li Yuting <liyuting2071@phytium.com.cn>
:::::: CC: Li Yuting <liyuting2071@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
