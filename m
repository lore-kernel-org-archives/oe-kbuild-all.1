Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AF25D53C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475040; cv=none; b=Vpn4kJUxoBz1r3TayKe+GLYQWz7kQtHuIsaw0yKyGN2LB4Cp2anco1N/d5vUBy94m0n3lCU4/9tQuYzitHZpukIyYEoaNWY9o61ow455ZsFuu2MQ4A9Heyk2H9Ecvjl6tNwy2zpH5pphWwFX3TNlFuHAS1eBN3l6EBZuwS7ioEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475040; c=relaxed/simple;
	bh=zqFyrBI5YE8rwq4rGR5Ml0SyUI3JQm/xbHJdDrlOcI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MuhCPiP78Sr9ahhnNgtcRTQjkh5bal1fjRVC2YaVExXpI/WPGoWl/lhYCBXf2IQcBl1ZVZGkYS0Wfh0BVN9cENR2Ojm4wVaecNZdvH6I3f/lKG4pOO1YZzl+V4bYGjY8yVpVxfJkdOJjpWbM256bzN3SfXLzp7z4i4QzdBeM/1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QW72U7k/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QW72U7k/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763475037; x=1795011037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zqFyrBI5YE8rwq4rGR5Ml0SyUI3JQm/xbHJdDrlOcI0=;
  b=QW72U7k/obm5NbVXFhJq+/gxsiC7JAaTRVtPijSTxSZdiDxP3204QlF7
   m48NI3SB7JMnHYrgmLJQnaFTMbk8Dx48h7F1gbi4X2Xxq4Kz4WwJmsPNe
   czxHtzuvJC77nIjJR2MrDVotR8fmxvJ14jWDecuocEwfB56Ru8u85LxRr
   vSvZohdcc5lLrxoDk2nwpXIAEoTaFqqrC1w6euRHiSVpHRnqpaD7Frzce
   N95Y3xuglLTynLsRw4uDWoqpsOB+AR2m/AfID9uWV5emUzI/tWxLNDHnB
   juNRbyRtkve859XBx/HgrGSvm+dghApduWMN49f+cJ4ekWS81xba7d4rB
   g==;
X-CSE-ConnectionGUID: 1yIPyQQsSQuBDXw5Tj/oKA==
X-CSE-MsgGUID: xRFRvJP0R8Wm6xXow32S3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65376853"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65376853"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 06:10:37 -0800
X-CSE-ConnectionGUID: JCzGr/CyQkegt5Dkcgc0Rw==
X-CSE-MsgGUID: ehKHkabWRPiqpEYUhPUZlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195229784"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Nov 2025 06:10:35 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLMPh-0001od-23;
	Tue, 18 Nov 2025 14:10:33 +0000
Date: Tue, 18 Nov 2025 22:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] include/asm-generic/io.h:379:22:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202511182244.hFxSiSob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   9e265862b98f47e02ce26ff6430b7acbe9dcba56
commit: 2616a2072ce0737bbc1b9136056ad9d84991c0de [1/1] FROMGIT: arm64: io: Use asm-generic high level MMIO accessors
config: arm64-randconfig-r131-20251118 (https://download.01.org/0day-ci/archive/20251118/202511182244.hFxSiSob-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511182244.hFxSiSob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511182244.hFxSiSob-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/smp_spin_table.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
--
   drivers/irqchip/irq-gic-v3.c:888:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3.c:888:17: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3.c:888:17: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3.c:940:78: sparse: sparse: dubious: !x | y
   drivers/irqchip/irq-gic-v3.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   drivers/irqchip/irq-gic-v3.c:225:29: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3.c:248:17: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   drivers/irqchip/irq-gic-v3.c:338:24: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   drivers/irqchip/irq-gic-v3.c:355:24: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   drivers/irqchip/irq-gic-v3.c:189:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3.c:586:24: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3.c:889:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3.c:890:17: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   drivers/irqchip/irq-gic-v3.c:1127:17: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   drivers/irqchip/irq-gic-v3.c:189:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3.c:189:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3.c:189:24: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
--
   drivers/irqchip/irq-ti-sci-inta.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h):
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
--
   drivers/irqchip/irq-gic-v3-its.c:1454:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:1454:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:1454:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:1459:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:1459:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:1459:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:2834:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cpumask [usertype] **mask @@     got struct cpumask [usertype] *[noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:2834:45: sparse:     expected struct cpumask [usertype] **mask
   drivers/irqchip/irq-gic-v3-its.c:2834:45: sparse:     got struct cpumask [usertype] *[noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:3966:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:3966:17: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:3966:17: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:3970:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:3970:17: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:3970:17: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:4148:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:4148:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:4148:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:4153:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:4153:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:4153:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:4288:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:4288:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:4288:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:4306:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct raw_spinlock [usertype] *lock @@     got struct raw_spinlock [noderef] __percpu * @@
   drivers/irqchip/irq-gic-v3-its.c:4306:9: sparse:     expected struct raw_spinlock [usertype] *lock
   drivers/irqchip/irq-gic-v3-its.c:4306:9: sparse:     got struct raw_spinlock [noderef] __percpu *
   drivers/irqchip/irq-gic-v3-its.c:261:12: sparse: sparse: context imbalance in 'vpe_to_cpuid_lock' - wrong count at exit
   drivers/irqchip/irq-gic-v3-its.c:267:13: sparse: sparse: context imbalance in 'vpe_to_cpuid_unlock' - unexpected unlock
   drivers/irqchip/irq-gic-v3-its.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/kexec.h, include/linux/crash_dump.h):
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   drivers/irqchip/irq-gic-v3-its.c:1455:18: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:2235:23: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:2235:23: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:2651:15: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:2651:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2672:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2706:15: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:2706:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2710:38: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:2728:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2728:49: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2729:25: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2739:30: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:2782:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2809:35: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:2838:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2839:14: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:2909:9: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:2921:45: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2921:45: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2923:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2981:15: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:2981:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:2996:29: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   drivers/irqchip/irq-gic-v3-its.c:2996:29: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3021:17: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:3069:31: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3074:13: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:3093:40: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3094:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3099:21: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:3153:43: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:3188:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3189:9: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:3219:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3222:26: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:3222:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3778:26: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:3827:13: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3828:36: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3828:36: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3843:35: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:3857:35: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:3889:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:3967:26: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:4007:26: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:4087:35: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:4102:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:4149:18: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:4289:16: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
>> include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   drivers/irqchip/irq-gic-v3-its.c:5153:19: sparse: sparse: dereference of noderef expression
>> include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   drivers/irqchip/irq-gic-v3-its.c:5153:19: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-v3-its.c:5158:31: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   drivers/irqchip/irq-gic-v3-its.c:5178:13: sparse: sparse: dereference of noderef expression
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32

vim +379 include/asm-generic/io.h

1c8d29696f0d79 Arnd Bergmann       2014-11-11  330  
e511267bc25e18 Robin Murphy        2016-04-26  331  #if defined(readq) && !defined(readq_relaxed)
8875c55437617f Sinan Kaya          2018-04-06  332  #define readq_relaxed readq_relaxed
8875c55437617f Sinan Kaya          2018-04-06  333  static inline u64 readq_relaxed(const volatile void __iomem *addr)
8875c55437617f Sinan Kaya          2018-04-06  334  {
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  335  	u64 val;
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  336  
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  337  	log_read_mmio(64, addr, _THIS_IP_);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14 @338  	val =__le64_to_cpu(__raw_readq(addr));
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  339  	log_post_read_mmio(val, 64, addr, _THIS_IP_);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  340  	return val;
8875c55437617f Sinan Kaya          2018-04-06  341  }
1c8d29696f0d79 Arnd Bergmann       2014-11-11  342  #endif
3f7e212df82ca0 Arnd Bergmann       2009-05-13  343  
9439eb3ab9d1ec Will Deacon         2013-09-03  344  #ifndef writeb_relaxed
a71e7c44ffb7ba Sinan Kaya          2018-04-06  345  #define writeb_relaxed writeb_relaxed
a71e7c44ffb7ba Sinan Kaya          2018-04-06  346  static inline void writeb_relaxed(u8 value, volatile void __iomem *addr)
a71e7c44ffb7ba Sinan Kaya          2018-04-06  347  {
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  348  	log_write_mmio(value, 8, addr, _THIS_IP_);
a71e7c44ffb7ba Sinan Kaya          2018-04-06  349  	__raw_writeb(value, addr);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  350  	log_post_write_mmio(value, 8, addr, _THIS_IP_);
a71e7c44ffb7ba Sinan Kaya          2018-04-06  351  }
9439eb3ab9d1ec Will Deacon         2013-09-03  352  #endif
9439eb3ab9d1ec Will Deacon         2013-09-03  353  
9439eb3ab9d1ec Will Deacon         2013-09-03  354  #ifndef writew_relaxed
a71e7c44ffb7ba Sinan Kaya          2018-04-06  355  #define writew_relaxed writew_relaxed
a71e7c44ffb7ba Sinan Kaya          2018-04-06  356  static inline void writew_relaxed(u16 value, volatile void __iomem *addr)
a71e7c44ffb7ba Sinan Kaya          2018-04-06  357  {
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  358  	log_write_mmio(value, 16, addr, _THIS_IP_);
a71e7c44ffb7ba Sinan Kaya          2018-04-06  359  	__raw_writew(cpu_to_le16(value), addr);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  360  	log_post_write_mmio(value, 16, addr, _THIS_IP_);
a71e7c44ffb7ba Sinan Kaya          2018-04-06  361  }
9439eb3ab9d1ec Will Deacon         2013-09-03  362  #endif
9439eb3ab9d1ec Will Deacon         2013-09-03  363  
9439eb3ab9d1ec Will Deacon         2013-09-03  364  #ifndef writel_relaxed
a71e7c44ffb7ba Sinan Kaya          2018-04-06  365  #define writel_relaxed writel_relaxed
a71e7c44ffb7ba Sinan Kaya          2018-04-06  366  static inline void writel_relaxed(u32 value, volatile void __iomem *addr)
a71e7c44ffb7ba Sinan Kaya          2018-04-06  367  {
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  368  	log_write_mmio(value, 32, addr, _THIS_IP_);
a71e7c44ffb7ba Sinan Kaya          2018-04-06  369  	__raw_writel(__cpu_to_le32(value), addr);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  370  	log_post_write_mmio(value, 32, addr, _THIS_IP_);
a71e7c44ffb7ba Sinan Kaya          2018-04-06  371  }
9439eb3ab9d1ec Will Deacon         2013-09-03  372  #endif
3f7e212df82ca0 Arnd Bergmann       2009-05-13  373  
e511267bc25e18 Robin Murphy        2016-04-26  374  #if defined(writeq) && !defined(writeq_relaxed)
a71e7c44ffb7ba Sinan Kaya          2018-04-06  375  #define writeq_relaxed writeq_relaxed
a71e7c44ffb7ba Sinan Kaya          2018-04-06  376  static inline void writeq_relaxed(u64 value, volatile void __iomem *addr)
a71e7c44ffb7ba Sinan Kaya          2018-04-06  377  {
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  378  	log_write_mmio(value, 64, addr, _THIS_IP_);
a71e7c44ffb7ba Sinan Kaya          2018-04-06 @379  	__raw_writeq(__cpu_to_le64(value), addr);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  380  	log_post_write_mmio(value, 64, addr, _THIS_IP_);
a71e7c44ffb7ba Sinan Kaya          2018-04-06  381  }
1c8d29696f0d79 Arnd Bergmann       2014-11-11  382  #endif
1c8d29696f0d79 Arnd Bergmann       2014-11-11  383  

:::::: The code at line 379 was first introduced by commit
:::::: a71e7c44ffb7baea0c0795824afc34cc0bc1a301 io: change writeX_relaxed() to remove barriers

:::::: TO: Sinan Kaya <okaya@codeaurora.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
