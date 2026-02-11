Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1815122301
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 05:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770789441; cv=none; b=clLtCsXx1JUjMEaXu+j/wfmD+lhRnZ1AfPNyjIEaQ4FFctTAqEG3E3M+zKdDVJjuFbsSzyr6QDn6Hcs+Rojzxe6QY2oCUdTGUVhAtoI3aQ5LA2NxXkOCHS1t+0x7IYwcX7JRMhO7KKERG0GNHjWbVuWxJxBYhLme69fHvsIeoto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770789441; c=relaxed/simple;
	bh=tbd1ParXJQf4Em/NvI1HfVq9XP8mhS16w9FWryCSWKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ihFlpReTpDtoeoyV1qxU1tUBznrXd0BFNhU/jrCk2spKxY+MtUmVOPOQ2c3ZzBayLH8NrzMdYTwnNtWhB5zWsAI66nm3ytuW9QhtJZeHUz0wTAjymhPGPlEBkS+v8dYaOpgB4HrIRxVJYFDo43m3c1P5bC6E2JfjywDpr6qCPLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLTYm+9V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLTYm+9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770789438; x=1802325438;
  h=date:from:to:cc:subject:message-id;
  bh=tbd1ParXJQf4Em/NvI1HfVq9XP8mhS16w9FWryCSWKw=;
  b=aLTYm+9V4FyuisdaozNj+PbZDJSv+hpqsk2ZGTnnNl7BcCkw29H0gC34
   Lh8I5qvsNEdMsB3ZjFew/hTCm4OCYR0StrCcjGjg69ndGOrzifs+xykkX
   CNtx+D2AHZgBeVWZw4VlWKnXZ0kobm34VnlyUWSvMB52MkEJx3Q6VQXcY
   gcnql7np15AP6LhUD3Lj5rSdWIKls+mTTAhHhexGA5HULuL77oZU3tWF/
   HloSBEf3ognDhGNzaBcN6UKv1MvlXa4beLsdhFxguIVjLZwuCO1I5YXCI
   az9+sGBBoamW/nceFMkLLaxVmrEZ+9jhOr2mw1b+ISSEK9znXxwqygUqV
   g==;
X-CSE-ConnectionGUID: yKCVBVEkTzWYxsZkqA6CIw==
X-CSE-MsgGUID: Uva85Qx1TGCcrql8MCGmIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="94569674"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94569674"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 21:57:17 -0800
X-CSE-ConnectionGUID: jphCkfRvRSC7jNZ8GhTsGA==
X-CSE-MsgGUID: JGqhtL5oRe62Ak/bjRxUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212176570"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 21:57:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq3Dt-00000000pis-09oR;
	Wed, 11 Feb 2026 05:57:13 +0000
Date: Wed, 11 Feb 2026 13:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 12/12]
 drivers/mtd/nand/raw/fsl_upm.c:192:30: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202602111319.gfAebrmK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   ca32044366289fa09a7a3d3f184e3d8e5598a433
commit: ca32044366289fa09a7a3d3f184e3d8e5598a433 [12/12] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: powerpc-randconfig-r123-20260211 (https://download.01.org/0day-ci/archive/20260211/202602111319.gfAebrmK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111319.gfAebrmK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111319.gfAebrmK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/fsl_upm.c:192:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] upm_addr_offset @@     got restricted __be32 const [usertype] @@
   drivers/mtd/nand/raw/fsl_upm.c:192:30: sparse:     expected unsigned char [usertype] upm_addr_offset
   drivers/mtd/nand/raw/fsl_upm.c:192:30: sparse:     got restricted __be32 const [usertype]
>> drivers/mtd/nand/raw/fsl_upm.c:199:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] upm_cmd_offset @@     got restricted __be32 const [usertype] @@
   drivers/mtd/nand/raw/fsl_upm.c:199:29: sparse:     expected unsigned char [usertype] upm_cmd_offset
   drivers/mtd/nand/raw/fsl_upm.c:199:29: sparse:     got restricted __be32 const [usertype]
   drivers/mtd/nand/raw/fsl_upm.c: note: in included file:
>> arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
>> arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
   arch/powerpc/include/asm/fsl_lbc.h:268:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:268:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:268:27: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
>> arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
>> arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:255:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:266:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
   arch/powerpc/include/asm/fsl_lbc.h:268:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *mxmr @@
   arch/powerpc/include/asm/fsl_lbc.h:268:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/include/asm/fsl_lbc.h:268:27: sparse:     got restricted __be32 [noderef] [usertype] __iomem *mxmr
--
>> drivers/mtd/nand/raw/fsl_elbc_nand.c:167:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:167:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:167:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:168:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:168:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:168:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:177:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:177:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:177:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:178:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:178:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:178:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:211:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:211:19: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:211:19: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:213:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:213:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:213:27: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/mtd/nand/raw/fsl_elbc_nand.c:215:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:215:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:215:9: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/mtd/nand/raw/fsl_elbc_nand.c:215:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:215:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:215:9: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/mtd/nand/raw/fsl_elbc_nand.c:215:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:215:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:215:9: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:218:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:218:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:218:9: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:218:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:218:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:218:9: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:218:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:218:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:218:9: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:226:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:226:19: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:226:19: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:234:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:234:47: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:234:47: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:239:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:239:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:239:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:239:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:239:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:239:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:252:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:252:44: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:252:44: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:265:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:265:35: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:265:35: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:282:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:282:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:282:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:289:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:289:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:289:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:292:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:292:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:292:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:299:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:299:35: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:299:35: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:301:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:301:35: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:301:35: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:333:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:333:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:333:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:358:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:358:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:358:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:371:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:371:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:371:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:374:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:374:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:374:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:379:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:379:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:379:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:399:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:399:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:399:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:406:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:406:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:406:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:411:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:411:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:411:27: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/mtd/nand/raw/fsl_elbc_nand.c:438:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] fcr @@     got int @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:438:21: sparse:     expected restricted __be32 [usertype] fcr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:438:21: sparse:     got int
   drivers/mtd/nand/raw/fsl_elbc_nand.c:443:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:443:35: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:443:35: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:452:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:452:35: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:452:35: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/mtd/nand/raw/fsl_elbc_nand.c:464:37: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/fsl_elbc_nand.c:464:37: sparse:    left side has type restricted __be32
   drivers/mtd/nand/raw/fsl_elbc_nand.c:464:37: sparse:    right side has type int
   drivers/mtd/nand/raw/fsl_elbc_nand.c:467:37: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/fsl_elbc_nand.c:467:37: sparse:    left side has type restricted __be32
   drivers/mtd/nand/raw/fsl_elbc_nand.c:467:37: sparse:    right side has type int
   drivers/mtd/nand/raw/fsl_elbc_nand.c:470:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:470:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:470:27: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/mtd/nand/raw/fsl_elbc_nand.c:470:37: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] fcr @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:470:37: sparse:     expected unsigned int [usertype] val
   drivers/mtd/nand/raw/fsl_elbc_nand.c:470:37: sparse:     got restricted __be32 [usertype] fcr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:487:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:487:35: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:487:35: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:490:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:490:35: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:490:35: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:499:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:499:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:499:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:502:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:502:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:502:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:503:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:503:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:503:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:518:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:518:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:518:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:519:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:519:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:519:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:695:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:695:31: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:695:31: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:736:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:736:40: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:736:40: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:769:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:769:32: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:769:32: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:771:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:771:36: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:771:36: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:773:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:773:36: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:773:36: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:822:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:822:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:822:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:822:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:822:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:822:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:825:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:825:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:825:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:825:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:825:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:825:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:886:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:886:40: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:886:40: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:887:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:887:40: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:887:40: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:888:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:888:40: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:888:40: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/mtd/nand/raw/fsl_elbc_nand.c:889:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/mtd/nand/raw/fsl_elbc_nand.c:889:40: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/mtd/nand/raw/fsl_elbc_nand.c:889:40: sparse:     got restricted __be32 [noderef] __iomem *

vim +192 drivers/mtd/nand/raw/fsl_upm.c

54309d65776755 drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  162  
06f25510692385 drivers/mtd/nand/fsl_upm.c     Bill Pemberton      2012-11-19  163  static int fun_probe(struct platform_device *ofdev)
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  164  {
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  165  	struct fsl_upm_nand *fun;
58c5a0e04dfceb drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  166  	struct resource *io_res;
766f271a63d1ee drivers/mtd/nand/fsl_upm.c     Ian Munsie          2010-10-01  167  	const __be32 *prop;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  168  	int ret;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  169  	int size;
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  170  	int i;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  171  
f760bf29f8676b drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  172  	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  173  	if (!fun)
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  174  		return -ENOMEM;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  175  
892ad2638a6ba3 drivers/mtd/nand/raw/fsl_upm.c Yangtao Li          2023-07-07  176  	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
58c5a0e04dfceb drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  177  	if (IS_ERR(fun->io_base))
58c5a0e04dfceb drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  178  		return PTR_ERR(fun->io_base);
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  179  
58c5a0e04dfceb drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  180  	ret = fsl_upm_find(io_res->start, &fun->upm);
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  181  	if (ret) {
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  182  		dev_err(&ofdev->dev, "can't find UPM\n");
f760bf29f8676b drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  183  		return ret;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  184  	}
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  185  
c8a4d0fd2ac2ce drivers/mtd/nand/fsl_upm.c     Anatolij Gustschin  2010-06-03  186  	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-addr-offset",
c8a4d0fd2ac2ce drivers/mtd/nand/fsl_upm.c     Anatolij Gustschin  2010-06-03  187  			       &size);
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  188  	if (!prop || size != sizeof(uint32_t)) {
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  189  		dev_err(&ofdev->dev, "can't get UPM address offset\n");
f760bf29f8676b drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  190  		return -EINVAL;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  191  	}
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11 @192  	fun->upm_addr_offset = *prop;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  193  
c8a4d0fd2ac2ce drivers/mtd/nand/fsl_upm.c     Anatolij Gustschin  2010-06-03  194  	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-cmd-offset", &size);
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  195  	if (!prop || size != sizeof(uint32_t)) {
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  196  		dev_err(&ofdev->dev, "can't get UPM command offset\n");
f760bf29f8676b drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  197  		return -EINVAL;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  198  	}
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11 @199  	fun->upm_cmd_offset = *prop;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  200  
c8a4d0fd2ac2ce drivers/mtd/nand/fsl_upm.c     Anatolij Gustschin  2010-06-03  201  	prop = of_get_property(ofdev->dev.of_node,
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  202  			       "fsl,upm-addr-line-cs-offsets", &size);
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  203  	if (prop && (size / sizeof(uint32_t)) > 0) {
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  204  		fun->mchip_count = size / sizeof(uint32_t);
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  205  		if (fun->mchip_count >= NAND_MAX_CHIPS) {
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  206  			dev_err(&ofdev->dev, "too much multiple chips\n");
f760bf29f8676b drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  207  			return -EINVAL;
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  208  		}
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  209  		for (i = 0; i < fun->mchip_count; i++)
766f271a63d1ee drivers/mtd/nand/fsl_upm.c     Ian Munsie          2010-10-01  210  			fun->mchip_offsets[i] = be32_to_cpu(prop[i]);
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  211  	} else {
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  212  		fun->mchip_count = 1;
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  213  	}
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  214  
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  215  	for (i = 0; i < fun->mchip_count; i++) {
a50895bbdbd433 drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  216  		fun->rnb_gpio[i] = devm_gpiod_get_index_optional(&ofdev->dev,
a50895bbdbd433 drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  217  								 NULL, i,
a50895bbdbd433 drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  218  								 GPIOD_IN);
a50895bbdbd433 drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  219  		if (IS_ERR(fun->rnb_gpio[i])) {
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  220  			dev_err(&ofdev->dev, "RNB gpio #%d is invalid\n", i);
a50895bbdbd433 drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  221  			return PTR_ERR(fun->rnb_gpio[i]);
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  222  		}
b6e0e8c07754c8 drivers/mtd/nand/fsl_upm.c     Wolfgang Grandegger 2009-03-30  223  	}
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  224  
abc846afda664b drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  225  	nand_controller_init(&fun->base);
54309d65776755 drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  226  	fun->base.ops = &fun_ops;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  227  	fun->dev = &ofdev->dev;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  228  
58c5a0e04dfceb drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  229  	ret = fun_chip_init(fun, ofdev->dev.of_node, io_res);
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  230  	if (ret)
a50895bbdbd433 drivers/mtd/nand/raw/fsl_upm.c Boris Brezillon     2020-06-03  231  		return ret;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  232  
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  233  	dev_set_drvdata(&ofdev->dev, fun);
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  234  
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  235  	return 0;
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  236  }
5c249c5a57dce2 drivers/mtd/nand/fsl_upm.c     Anton Vorontsov     2008-03-11  237  

:::::: The code at line 192 was first introduced by commit
:::::: 5c249c5a57dce2b47f1fb92093201b3a7013cb57 [MTD] [NAND] FSL UPM NAND driver

:::::: TO: Anton Vorontsov <avorontsov@ru.mvista.com>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
