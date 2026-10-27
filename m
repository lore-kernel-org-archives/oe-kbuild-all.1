Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108111;
	b=rWuT9R2JDgEYUzKm0n01nzH80AWnpD8a1E5TRPwkrfBNOWD59Q54stCT+YxHOYM1u5KD
	 tnawnnaKr7eDCE8Rixo2Z/SPK0NkB4KGi5jtzsr6/oIcXXh0UxNXJP8hb+daalhamxwWH
	 zlwvhg+TB6S5vynvnncbzM2bsaqTJVyP4B/dUOIsHWcK68z1ryMrXuBxSZZGYy1LJipZV
	 NDYd4TBP/L7WfasnAwfm6YSoqewaBO/YtkVYu3yVNqRpupTNNI0BEXaTGh4q+WNXj5py0
	 EQV1efCCYGFwyHkLhnz8/HWSO0Kv6RHHomVSywE8LU8wN2XeBo8IuIWf7YUfheFzoQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108111;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AoBNXOQoi1a4swVO+Hu1/0L+yWX2oi8HONhp+980T+0=;
	b=fhc2uHDppJbEMM3byRzo0vilLTpTCzr5F6ImVCeiK6lv+ZsJ9N0DvP0KYvCatEuA/ZzN
	 eyupwiz4iINdSorYcy5XG04g3xyLAvEHL3q7dhf0XUOWED0QIp4ETILWyFT+tCRCUEk2n
	 PNea8+zOuPkaJ7gQgQnG9HK3Na1s0FnHUMapdaIvSjJS7tt1OOyOgmBGsPupI7qCL3e5f
	 P4fsEKVrXbzrrKT5t/WZ290foozecKNM9sgGrvCWDGBTcC4WWdtS/0iVfwJhgJ87cxKg5
	 Bx0Wuyffa0yXVaih4pfv3dbH0bKBHb7csNocSH5u8S4Dgy07AcU7KwY4hguGP+5XzrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VHXAk0To;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF1F606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 13:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF1F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VHXAk0To
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793108111; x=1824644111;
  h=date:from:to:cc:subject:message-id;
  bh=M9YDtvvUlc1CuYmNza3TKPhD9GpAHkbG4taruddUJj0=;
  b=VHXAk0ToEHpmMBSvZM2wal7b/k4ntwheff4MlbS6IInVfy4T3MA/MXeb
   qnDiVZYkK+2/tVXUIejNJJoGOMuJRbTHq97m0hrC6G4cigEUBLoNu79Xp
   DnQg0eJmAsb7N3oqYjOmAkF8+5x9N9FkPUa6ZVXnkV4Nq58ZyBo8lL8Fq
   kuScwWRhDlx5bGouCERQ2thAq3MLpE96N/svflsIV+ryFFxycItPCFULa
   JQpWVL6OhdWD/zuhpTRvZS+lqSvkN38gbP/PynIAhO1Dldtmjtw0ET/m9
   7HJNZTDUiy2OkR///VOskg5z/J4ew/smdwfRhR3s7SVp4zyq/5DYriyl7
   A==;
X-CSE-ConnectionGUID: R5APW+t9TUmYAbL/aHlqLQ==
X-CSE-MsgGUID: su80pMQITPOaeqbTYRUl6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1696619"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1696619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:35:09 -0700
X-CSE-ConnectionGUID: 5BSQnQfHR82/neDQ6epjHQ==
X-CSE-MsgGUID: ck5I/wElRp6+6wV0fXDGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5070948"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 06:35:08 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLhKT-000000004Wx-3n03;
	Tue, 27 Oct 2026 13:35:05 +0000
Date: Tue, 27 Oct 2026 14:34:06 +0100
From: kernel test robot <lkp@intel.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: drivers/irqchip/irq-realtek-rtl.c:79:15: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202610271430.H39Nrho1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d135ab453a7400a34930bdda1ef4bdc8acfac80e
commit: 58b34b72b64bfbfc5f8ad4d8f229942aff76597e irqchip/irq-realtek-rtl: Use readl_be()/writel_be() instead of readl()/writel()
date:   10 weeks ago
config: mips-randconfig-r2311-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271430.H39Nrho1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271430.H39Nrho1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 58b34b72b64b ("irqchip/irq-realtek-rtl: Use readl_be()/writel_be() instead of readl()/writel()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271430.H39Nrho1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-realtek-rtl.c:79:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:79:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:79:15: sparse:     got unsigned int *
>> drivers/irqchip/irq-realtek-rtl.c:79:15: sparse: sparse: cast to restricted __be32
>> drivers/irqchip/irq-realtek-rtl.c:81:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/irqchip/irq-realtek-rtl.c:81:9: sparse:     expected unsigned int [usertype] val
   drivers/irqchip/irq-realtek-rtl.c:81:9: sparse:     got restricted __be32 [usertype]
>> drivers/irqchip/irq-realtek-rtl.c:81:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:81:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:81:9: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:167:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:167:19: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:167:19: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:167:19: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:168:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:168:19: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:168:19: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:168:19: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:58:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:58:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:58:16: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:58:16: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse:     expected unsigned int [usertype] val
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse:     got restricted __be32 [usertype]
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     expected unsigned int [usertype] val
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     got restricted __be32 [usertype]
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     expected unsigned int [usertype] val
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     got restricted __be32 [usertype]
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     got unsigned int *

vim +79 drivers/irqchip/irq-realtek-rtl.c

    71	
    72	static void write_irr(unsigned int cpu, int hw_irq, u32 value)
    73	{
    74		void __iomem *irr0 = REG(cpu, RTL_ICTL_IRR0);
    75		unsigned int offset = IRR_OFFSET(hw_irq);
    76		unsigned int shift = IRR_SHIFT(hw_irq);
    77		u32 irr;
    78	
  > 79		irr = readl_be(irr0 + offset) & ~(0xf << shift);
    80		irr |= (value & 0xf) << shift;
  > 81		writel_be(irr, irr0 + offset);
    82	}
    83	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
