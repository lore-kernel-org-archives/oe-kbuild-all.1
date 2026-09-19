Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3522D25392A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 04:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793408; cv=none; b=jMMYGnQBckbPSQGOH/MNCT5MWGDWtd2h5wR8DK1QsPzzScArq4nxRKVGneUwZotlBN6slmgWovYAGJ1TFA6HQ5Hw8d0qEVKxS5U4OB1kESXnKN9NMX4siY2unB9EVMMAXjmSmq+HcKs/dT322c9sU5BgOCzrPxHPPQh43qTlYPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793408; c=relaxed/simple;
	bh=pbUvLv4XWgxjtK43I2EcaM7v9STYJ3vkao7HuPADYgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oMp4Q3MvKswJ549aFufYnin7or4N10fbIdoZZ/wr6hOs4S/xGt4CzVnTjXHY/fee7wCMa4WXErlqEyF9UVzWEnprnpxyXGT7iF1inEedB6jucihtTZeWi7X0/JJo2gtzu6SHQCxEVukUYyOlIotyPfK3nl2e+gd+DKWaL22YKbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5sGE7Gw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5sGE7Gw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789793405; x=1821329405;
  h=date:from:to:cc:subject:message-id;
  bh=pbUvLv4XWgxjtK43I2EcaM7v9STYJ3vkao7HuPADYgo=;
  b=H5sGE7GwxvIrKesxJTsG4oehgB5scp8dsufR/zTZkjMJdItv3c02gHGS
   U3KiFF1IF1JYHTbnTEk2fBzJfEk0GcB+k4YOB0ccNED5Wup2KfQfAQi9t
   ih4aVsTrYxp6pB9oOPBVE7qfuSavziwfbYAJ4mPDUTgejMWYXeF0qRqE6
   EotS2xGZx/W+9Oxnq6Oc9a+X/Ammn3drR8NFmUNuWpLqZmCcHyMlYXJI0
   JYhgOIVPU1PSYogCfoHVGwZyI0J9A3lBeKZvXykixnu44Laxx6VdyR+YF
   fiNQs3ceOBzZ3aHN1t0KJgYYK3yIbdGNV+vm7PtL0vDS+BjrWvBw7tFnq
   A==;
X-CSE-ConnectionGUID: P8RgKQQwSOqJeZVJZ5FVqw==
X-CSE-MsgGUID: Y0tXagVIRVuIAvY/4xpF4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89258002"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89258002"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 21:50:04 -0700
X-CSE-ConnectionGUID: 8T+U6JHQS721onqEjUzc3g==
X-CSE-MsgGUID: HGtN8KFASvqyMf0l2g9Q1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2899829"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 18 Sep 2026 21:50:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7n1U-00000000AeR-1yOz;
	Sat, 19 Sep 2026 04:50:00 +0000
Date: Sat, 19 Sep 2026 12:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 5557/8449]
 arch/arm64/kvm/vgic/vgic-v5-tables.c:1473:23: sparse: sparse: incorrect type
 in initializer (different base types)
Message-ID: <202609191215.to1MBYak-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
commit: f9846846c4df6818d323f4a86c168bd2d63c6cdb [5557/8449] KVM: arm64: gic-v5: Implement save/restore mechanisms for ISTs
config: arm64-randconfig-r1307-20260918 (https://download.01.org/0day-ci/archive/20260919/202609191215.to1MBYak-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191215.to1MBYak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191215.to1MBYak-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1069:34: sparse: sparse: Using plain integer as NULL pointer
   arch/arm64/kvm/vgic/vgic-v5-tables.c:537:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vmd_base @@     got void *[assigned] vmd @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:537:31: sparse:     expected void [noderef] __iomem *vmd_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:537:31: sparse:     got void *[assigned] vmd
   arch/arm64/kvm/vgic/vgic-v5-tables.c:578:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected restricted __le64 [noderef] [usertype] __iomem *vpet_base @@     got restricted __le64 [usertype] *[assigned] vpet @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:578:24: sparse:     expected restricted __le64 [noderef] [usertype] __iomem *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:578:24: sparse:     got restricted __le64 [usertype] *[assigned] vpet
   arch/arm64/kvm/vgic/vgic-v5-tables.c:685:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got restricted __le64 [noderef] [usertype] __iomem *vpet_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:685:18: sparse:     expected void const *objp
   arch/arm64/kvm/vgic/vgic-v5-tables.c:685:18: sparse:     got restricted __le64 [noderef] [usertype] __iomem *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:686:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got void [noderef] __iomem *vmd_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:686:18: sparse:     expected void const *objp
   arch/arm64/kvm/vgic/vgic-v5-tables.c:686:18: sparse:     got void [noderef] __iomem *vmd_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:742:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected restricted __le64 [usertype] *vpet_base @@     got restricted __le64 [noderef] [usertype] __iomem *vpet_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:742:19: sparse:     expected restricted __le64 [usertype] *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:742:19: sparse:     got restricted __le64 [noderef] [usertype] __iomem *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:754:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] tmp @@     got unsigned long long @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:754:13: sparse:     expected restricted __le64 [usertype] tmp
   arch/arm64/kvm/vgic/vgic-v5-tables.c:754:13: sparse:     got unsigned long long
   arch/arm64/kvm/vgic/vgic-v5-tables.c:757:17: sparse: sparse: cast from restricted __le64
   arch/arm64/kvm/vgic/vgic-v5-tables.c:790:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected restricted __le64 [usertype] *vpet_base @@     got restricted __le64 [noderef] [usertype] __iomem *vpet_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:790:19: sparse:     expected restricted __le64 [usertype] *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:790:19: sparse:     got restricted __le64 [noderef] [usertype] __iomem *vpet_base
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:1473:23: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int __rpu_val @@     got restricted __le32 [assigned] [usertype] h_iste @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1473:23: sparse:     expected unsigned int __rpu_val
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1473:23: sparse:     got restricted __le32 [assigned] [usertype] h_iste
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1525:31: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int __rpu_val @@     got restricted __le32 [assigned] [usertype] h_iste @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1525:31: sparse:     expected unsigned int __rpu_val
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1525:31: sparse:     got restricted __le32 [assigned] [usertype] h_iste
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:1722:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 __rgu_val @@     got unsigned int @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1722:23: sparse:     expected restricted __le32 __rgu_val
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1722:23: sparse:     got unsigned int
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1777:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 __rgu_val @@     got unsigned int @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1777:31: sparse:     expected restricted __le32 __rgu_val
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1777:31: sparse:     got unsigned int

vim +1473 arch/arm64/kvm/vgic/vgic-v5-tables.c

  1452	
  1453	/*
  1454	 * Save a linear host IST to userspace memory.
  1455	 *
  1456	 * Only the architected 32-bit ISTE state is stored. Metadata is skipped when
  1457	 * striding through the host IST.
  1458	 */
  1459	static int vgic_v5_save_linear_ist(const struct vgic_v5_ist_desc *ist,
  1460					   u32 __user *uaddr, size_t nr_entries)
  1461	{
  1462		__le32 h_iste;
  1463		size_t index;
  1464		int ret;
  1465	
  1466		vgic_v5_clean_inval(ist->base,
  1467				    GICV5_LINEAR_IST_SIZE(ist->id_bits, ist->istsz));
  1468	
  1469		for (index = 0; index < nr_entries; index++) {
  1470			__le32 *h_iste_addr = ist->base + index * ist->iste_size;
  1471	
  1472			h_iste = READ_ONCE(*h_iste_addr);
> 1473			ret = put_user(h_iste, uaddr);
  1474			if (ret)
  1475				return ret;
  1476	
  1477			uaddr++;
  1478		}
  1479	
  1480		return 0;
  1481	}
  1482	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
