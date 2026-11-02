Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650425;
	b=lNzpMwi5zSK136LW+w2XuBn5Bg6lKpjEdUnzzsX84yFUV7wfPDEtAV9rgWkaPQgsExBw
	 Y/KdfPaOEsVHixwAR1b7sPR7N5ywHW3V2uJINFUEu/z/g6j/AMfLHx6twl/q+7UCV3wV+
	 LUiVOMcPwqyju1SE3wGy07TdEFqrGULWHTUTZz2ryeGh4iBUJCF4fnParAVU651G/EBa1
	 MFUzIkuK6Jm2lsTirWjayMZDdjtw57K+W/wmUsohL3nkMcH2unfK3PU9HOhqPUt9jkX5/
	 L3vfSWN+c1JRtu8NIlAWjkvjhX0tkEUrq88H9p0Hy4fBfTIQWT8EJnwgdwkjDkql41g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650425;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LHNZwVHkDS2m/l+ux2RdjdaI7HtJWS/iPNRQ6sY+mJQ=;
	b=WewiUjC37a7A9jz5WO3DEtWemHbNZbmHeuCyCvNpJNOYy6uKODgbyqRltI3HAt+T/GEU
	 kRW0rLNgD60DGXpmfcpoMc61xssvuD/ePOJZ0TnKPjqFPrYFEQnkTFRsbxMTZGXKsp7MX
	 Fy2rWCJQf8H1AX2iATn42kTMCnIzvig0UkFDUK6cupUU5u30hPoiUPA6owwTHMb/u4dGO
	 Wxd0tHmDcK9bJ5jJNru8JwF9xT9EyrT1GzUh3NjyVYP0kwkZxMuB5PSWrQgW7rzesdHIt
	 gmyfN6s8iAGIPiD1A6hkpvxEbVSzmLRsSxabY6LFieVoBVtcBdHtrmBqgRr8z4bpsLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dW7oxrac;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65B606A324
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 20:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B65B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dW7oxrac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793650423; x=1825186423;
  h=date:from:to:cc:subject:message-id;
  bh=YxNl5u1d0QX5pPY2n3hKuSDxQL0STAFB15SpJpzUaOs=;
  b=dW7oxrac/iE2fSKSCJl22IKERtM9h3J9C7Z/m7hGNVtrG8xBlcsEqzpC
   p0vNcRm22BTv/izbhoQZDxYb77w/CLxsgm6hrktvNpxMA/vz+7Yd3SKAT
   6xiEXMLa333xFIPWr5r1SeJK5nlrwVCku1M6XEWsNmcPIzGJ1rrnEIRhL
   akjfEa+eojl82+F7Du8aPGWzBz/xg6AuffCiLzq0RL3QffOMe9DDL7jLn
   6VF3kd/NmPkrU6MwcZvIzQjjF3h1EsgeZufm51tRAht9JWcgeHkbzkJW7
   GpAzpKbA7BCgREvs6nIuDZNIsM7XQ/5q3ShXyfY2uNGn6SxK5V7/G6LC4
   g==;
X-CSE-ConnectionGUID: 2VgYqN5pSumur9E5hVmpXg==
X-CSE-MsgGUID: Uhi0+kF5QJmulYdUM0KXoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2262734"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2262734"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 12:13:42 -0800
X-CSE-ConnectionGUID: 4n2r6/CfTFm8+3vEAxDXYA==
X-CSE-MsgGUID: dXEcs500RyuPn0UoVe8VsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6200448"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2026 12:13:41 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNyPT-000000008iB-09ct;
	Mon, 02 Nov 2026 20:13:39 +0000
Date: Mon, 02 Nov 2026 21:12:45 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 20/20]
 drivers/irqchip/irq-gic-v3-its.c:3810:30: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202611022139.WIMgY45r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e92b73070f9a9cf42236e34fdc16537c05349f91
commit: 9ac8c1da9f82e622cbe1d4422848c324d3706787 [20/20] irqchip/gicv3-its: Add workaround for hip09 ITS erratum 162100801
config: arm64-randconfig-r2302-20261102 (https://download.01.org/0day-ci/archive/20261102/202611022139.WIMgY45r-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3e5b45eed6c3ec25f4f1cc81ce0be10106a8f31f)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611022139.WIMgY45r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611022139.WIMgY45r-lkp@intel.com/

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
   drivers/irqchip/irq-gic-v3-its.c:2847:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2848:14: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2918:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2932:45: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2932:45: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2934:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2986:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2986:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3001:29: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3001:29: sparse: sparse: dereference of noderef expression
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
