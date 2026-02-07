Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF2A30FC3C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 09:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770457180; cv=none; b=FhSBlUiO5esUTjcEVzuNlxbM83bK04vfjp0ilWTVCNk5nMZvg5p5BVZRn8ZSIK/SqXtpACXiFIU2mh94VSwqqfKKhsQ42iiVlPxbluFiPODgPCbCTnTXziIIAWLDfUCa0F1szGO6vsFKHrimGcCfe6A3yQkzgLcMSZqNkumC924=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770457180; c=relaxed/simple;
	bh=Nh6l8MEfO0UeAdyVAqbHz2LHU7ajFZYE/9/bksDu8/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PGY+w61rQP6868t6iKYx56IyKZ2LiEsYwtWy4KCnnnuNMp0rAwm96Scv3+cpuklxdQUiUs1MOSsTQKlCaF7eAPsfeI7KnFMxNf1jJ7aLDhTpRwrbiWYxOGdzysG35+F/GG92Iro/HeClxxrzTNfPzy2m0a2N9yYSWhTJFjxhfvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eD4yYqyr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eD4yYqyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770457180; x=1801993180;
  h=date:from:to:cc:subject:message-id;
  bh=Nh6l8MEfO0UeAdyVAqbHz2LHU7ajFZYE/9/bksDu8/g=;
  b=eD4yYqyrMyBBj2R6S5TMvrNvmYRYv8whMTRkv8b5/y+srXNbF+um0SQa
   OLoRFe0uMIvl54ZD04uGGwkfMxmW2lw0IiDRsrT+SVvk7h20FepjQ3ugO
   PbRo6TOxI2hDlhiKkz9/D36XBnzadlBn9OThpbBO6ofqJHFDZI8KNQJIk
   6Ag2xBE7FVN3UI8roD3tE4JHXkItE2z9cKi+GwlJCdjQbwMhwa1psVTW/
   LNt/TEkjN9NS3Z2y8ZZeWGegmEqR95Wg/+11cf4h7OnvYU+IhvmhXlw4f
   I0IklEpg/N8KVuLxVKhWRxCqN/SuMci2oi1HkX9DsHdOWuzLwbeOxWcLD
   A==;
X-CSE-ConnectionGUID: B/L86a8JTgOeZGIGW/IR8A==
X-CSE-MsgGUID: iq+vmGVJT4C3Te4VLiLGiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70845829"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="70845829"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 01:39:39 -0800
X-CSE-ConnectionGUID: LnDqCBK3SYexBHbh/lZwKw==
X-CSE-MsgGUID: L7UyoNHsQqyC0fWkfuYLwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="234046602"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2026 01:39:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voemt-00000000lXg-2FFO;
	Sat, 07 Feb 2026 09:39:35 +0000
Date: Sat, 07 Feb 2026 17:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 12/12]
 drivers/net/ethernet/freescale/ucc_geth.c:2067:17: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202602071740.GKrTcpnS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   fe68638208033b4de7dc5a0426c0bc22357fd67e
commit: fe68638208033b4de7dc5a0426c0bc22357fd67e [12/12] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: powerpc-randconfig-r134-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071740.GKrTcpnS-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071740.GKrTcpnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071740.GKrTcpnS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/freescale/ucc_geth.c:244:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:244:21: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:244:21: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:405:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:405:22: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:405:22: sparse:     got restricted __be16 [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:406:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:406:22: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:406:22: sparse:     got restricted __be16 [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:407:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:407:22: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:407:22: sparse:     got restricted __be16 [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:449:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be16 [noderef] [usertype] __iomem *reg @@     got unsigned short [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:449:23: sparse:     expected restricted __be16 [noderef] [usertype] __iomem *reg
   drivers/net/ethernet/freescale/ucc_geth.c:449:23: sparse:     got unsigned short [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1279:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_uccm @@
   drivers/net/ethernet/freescale/ucc_geth.c:1279:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1279:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_uccm
   drivers/net/ethernet/freescale/ucc_geth.c:1279:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_uccm @@
   drivers/net/ethernet/freescale/ucc_geth.c:1279:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1279:9: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_uccm
   drivers/net/ethernet/freescale/ucc_geth.c:1280:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_ucce @@
   drivers/net/ethernet/freescale/ucc_geth.c:1280:22: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1280:22: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_ucce
   drivers/net/ethernet/freescale/ucc_geth.c:1291:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_ucce @@
   drivers/net/ethernet/freescale/ucc_geth.c:1291:36: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1291:36: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_ucce
   drivers/net/ethernet/freescale/ucc_geth.c:1496:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1496:41: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1496:41: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1553:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1553:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1553:27: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1572:54: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *upsmr_register @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1572:54: sparse:     expected unsigned int [noderef] [usertype] __iomem *upsmr_register
   drivers/net/ethernet/freescale/ucc_geth.c:1572:54: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1623:54: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *upsmr_register @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1623:54: sparse:     expected unsigned int [noderef] [usertype] __iomem *upsmr_register
   drivers/net/ethernet/freescale/ucc_geth.c:1623:54: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1724:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1724:41: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1724:41: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1739:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1739:50: sparse:     expected void const *objp
   drivers/net/ethernet/freescale/ucc_geth.c:1739:50: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1764:33: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1764:33: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1764:33: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1776:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1776:42: sparse:     expected void const *objp
   drivers/net/ethernet/freescale/ucc_geth.c:1776:42: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1865:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1865:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1865:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1865:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1865:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1865:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1867:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1867:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1867:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1867:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:1867:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1867:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:1912:29: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_uccm @@
   drivers/net/ethernet/freescale/ucc_geth.c:1912:29: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1912:29: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_uccm
   drivers/net/ethernet/freescale/ucc_geth.c:1915:29: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_ucce @@
   drivers/net/ethernet/freescale/ucc_geth.c:1915:29: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:1915:29: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_ucce
   drivers/net/ethernet/freescale/ucc_geth.c:2059:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem * @@     got void *[assigned] _res @@
   drivers/net/ethernet/freescale/ucc_geth.c:2059:40: sparse:     expected unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2059:40: sparse:     got void *[assigned] _res
>> drivers/net/ethernet/freescale/ucc_geth.c:2067:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *s @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2067:17: sparse:     expected void *s
   drivers/net/ethernet/freescale/ucc_geth.c:2067:17: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2087:37: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2087:37: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:2087:37: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2120:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem * @@     got void *[assigned] _res @@
   drivers/net/ethernet/freescale/ucc_geth.c:2120:40: sparse:     expected unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2120:40: sparse:     got void *[assigned] _res
   drivers/net/ethernet/freescale/ucc_geth.c:2147:37: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2147:37: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:2147:37: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2209:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *upsmr_register @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2209:32: sparse:     expected unsigned int [noderef] [usertype] __iomem *upsmr_register
   drivers/net/ethernet/freescale/ucc_geth.c:2209:32: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2215:57: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *upsmr_register @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2215:57: sparse:     expected unsigned int [noderef] [usertype] __iomem *upsmr_register
   drivers/net/ethernet/freescale/ucc_geth.c:2215:57: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2227:35: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *upsmr_register @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2227:35: sparse:     expected unsigned int [noderef] [usertype] __iomem *upsmr_register
   drivers/net/ethernet/freescale/ucc_geth.c:2227:35: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2275:37: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *upsmr_register @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2275:37: sparse:     expected unsigned int [noderef] [usertype] __iomem *upsmr_register
   drivers/net/ethernet/freescale/ucc_geth.c:2275:37: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2353:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *address @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2353:64: sparse:     expected void const volatile *address
   drivers/net/ethernet/freescale/ucc_geth.c:2353:64: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2356:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *address @@     got unsigned char [noderef] [usertype] __iomem *[assigned] endOfRing @@
   drivers/net/ethernet/freescale/ucc_geth.c:2356:45: sparse:     expected void const volatile *address
   drivers/net/ethernet/freescale/ucc_geth.c:2356:45: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] endOfRing
   drivers/net/ethernet/freescale/ucc_geth.c:2576:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *address @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2576:64: sparse:     expected void const volatile *address
   drivers/net/ethernet/freescale/ucc_geth.c:2576:64: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2843:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2843:21: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:2843:21: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:2909:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/net/ethernet/freescale/ucc_geth.c:2909:46: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:2909:46: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/net/ethernet/freescale/ucc_geth.c:3037:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_uccm @@
   drivers/net/ethernet/freescale/ucc_geth.c:3037:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:3037:17: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_uccm
   drivers/net/ethernet/freescale/ucc_geth.c:3037:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_uccm @@
   drivers/net/ethernet/freescale/ucc_geth.c:3037:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:3037:17: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_uccm
   drivers/net/ethernet/freescale/ucc_geth.c:3058:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_ucce @@
   drivers/net/ethernet/freescale/ucc_geth.c:3058:34: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:3058:34: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_ucce
   drivers/net/ethernet/freescale/ucc_geth.c:3059:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_uccm @@
   drivers/net/ethernet/freescale/ucc_geth.c:3059:34: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:3059:34: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_uccm
   drivers/net/ethernet/freescale/ucc_geth.c:3061:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_ucce @@
   drivers/net/ethernet/freescale/ucc_geth.c:3061:22: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:3061:22: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_ucce
   drivers/net/ethernet/freescale/ucc_geth.c:3067:38: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [usertype] __iomem *p_uccm @@
   drivers/net/ethernet/freescale/ucc_geth.c:3067:38: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/net/ethernet/freescale/ucc_geth.c:3067:38: sparse:     got restricted __be32 [noderef] [usertype] __iomem *p_uccm

vim +2067 drivers/net/ethernet/freescale/ucc_geth.c

ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1894  
18a8e8649d2687 drivers/net/ucc_geth.c                    Li Yang           2006-10-19  1895  static void ucc_geth_stop(struct ucc_geth_private *ugeth)
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1896  {
6fee40e9b8155a drivers/net/ucc_geth.c                    Andy Fleming      2008-05-02  1897  	struct ucc_geth __iomem *ug_regs = ugeth->ug_regs;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1898  
b39d66a81fb4f5 drivers/net/ucc_geth.c                    Harvey Harrison   2008-08-20  1899  	ugeth_vdbg("%s: IN", __func__);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1900  
75e6047431872d drivers/net/ucc_geth.c                    Joakim Tjernlund  2010-11-12  1901  	/*
75e6047431872d drivers/net/ucc_geth.c                    Joakim Tjernlund  2010-11-12  1902  	 * Tell the kernel the link is down.
75e6047431872d drivers/net/ucc_geth.c                    Joakim Tjernlund  2010-11-12  1903  	 * Must be done before disabling the controller
75e6047431872d drivers/net/ucc_geth.c                    Joakim Tjernlund  2010-11-12  1904  	 * or deadlock may happen.
75e6047431872d drivers/net/ucc_geth.c                    Joakim Tjernlund  2010-11-12  1905  	 */
53036aa8d03178 drivers/net/ethernet/freescale/ucc_geth.c Maxime Chevallier 2024-12-03  1906  	phylink_stop(ugeth->phylink);
75e6047431872d drivers/net/ucc_geth.c                    Joakim Tjernlund  2010-11-12  1907  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1908  	/* Disable the controller */
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1909  	ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1910  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1911  	/* Mask all interrupts */
c6f5047b633f06 drivers/net/ucc_geth.c                    Timur Tabi        2007-07-10 @1912  	out_be32(ugeth->uccf->p_uccm, 0x00000000);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1913  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1914  	/* Clear all interrupts */
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1915  	out_be32(ugeth->uccf->p_ucce, 0xffffffff);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1916  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1917  	/* Disable Rx and Tx */
3bc53427e4f323 drivers/net/ucc_geth.c                    Timur Tabi        2009-01-11  1918  	clrbits32(&ug_regs->maccfg1, MACCFG1_ENABLE_RX | MACCFG1_ENABLE_TX);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1919  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1920  	ucc_geth_memclean(ugeth);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1921  }
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1922  
728de4c927a354 drivers/net/ucc_geth.c                    Kim Phillips      2007-04-13  1923  static int ucc_struct_init(struct ucc_geth_private *ugeth)
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1924  {
18a8e8649d2687 drivers/net/ucc_geth.c                    Li Yang           2006-10-19  1925  	struct ucc_geth_info *ug_info;
18a8e8649d2687 drivers/net/ucc_geth.c                    Li Yang           2006-10-19  1926  	struct ucc_fast_info *uf_info;
728de4c927a354 drivers/net/ucc_geth.c                    Kim Phillips      2007-04-13  1927  	int i;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1928  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1929  	ug_info = ugeth->ug_info;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1930  	uf_info = &ug_info->uf_info;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1931  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1932  	/* Rx BD lengths */
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  1933  	for (i = 0; i < ucc_geth_rx_queues(ug_info); i++) {
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1934  		if ((ug_info->bdRingLenRx[i] < UCC_GETH_RX_BD_RING_SIZE_MIN) ||
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1935  		    (ug_info->bdRingLenRx[i] %
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1936  		     UCC_GETH_RX_BD_RING_SIZE_ALIGNMENT)) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  1937  			if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  1938  				pr_err("Rx BD ring length must be multiple of 4, no smaller than 8\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1939  			return -EINVAL;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1940  		}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1941  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1942  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1943  	/* Tx BD lengths */
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  1944  	for (i = 0; i < ucc_geth_tx_queues(ug_info); i++) {
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1945  		if (ug_info->bdRingLenTx[i] < UCC_GETH_TX_BD_RING_SIZE_MIN) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  1946  			if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  1947  				pr_err("Tx BD ring length must be no smaller than 2\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1948  			return -EINVAL;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1949  		}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1950  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1951  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1952  	/* mrblr */
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1953  	if ((uf_info->max_rx_buf_length == 0) ||
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1954  	    (uf_info->max_rx_buf_length % UCC_GETH_MRBLR_ALIGNMENT)) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  1955  		if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  1956  			pr_err("max_rx_buf_length must be non-zero multiple of 128\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1957  		return -EINVAL;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1958  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1959  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1960  	/* num Tx queues */
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  1961  	if (ucc_geth_tx_queues(ug_info) > NUM_TX_QUEUES) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  1962  		if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  1963  			pr_err("number of tx queues too large\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1964  		return -EINVAL;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1965  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1966  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1967  	/* num Rx queues */
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  1968  	if (ucc_geth_rx_queues(ug_info) > NUM_RX_QUEUES) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  1969  		if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  1970  			pr_err("number of rx queues too large\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1971  		return -EINVAL;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1972  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1973  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1974  	/* l2qt */
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1975  	for (i = 0; i < UCC_GETH_VLAN_PRIORITY_MAX; i++) {
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  1976  		if (ug_info->l2qt[i] >= ucc_geth_rx_queues(ug_info)) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  1977  			if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  1978  				pr_err("VLAN priority table entry must not be larger than number of Rx queues\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1979  			return -EINVAL;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1980  		}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1981  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1982  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1983  	/* l3qt */
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1984  	for (i = 0; i < UCC_GETH_IP_PRIORITY_MAX; i++) {
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  1985  		if (ug_info->l3qt[i] >= ucc_geth_rx_queues(ug_info)) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  1986  			if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  1987  				pr_err("IP priority table entry must not be larger than number of Rx queues\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1988  			return -EINVAL;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1989  		}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1990  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1991  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1992  	if (ug_info->cam && !ug_info->ecamptr) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  1993  		if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  1994  			pr_err("If cam mode is chosen, must supply cam ptr\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1995  		return -EINVAL;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1996  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1997  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  1998  	if ((ug_info->numStationAddresses !=
8e95a2026f3b43 drivers/net/ucc_geth.c                    Joe Perches       2009-12-03  1999  	     UCC_GETH_NUM_OF_STATION_ADDRESSES_1) &&
8e95a2026f3b43 drivers/net/ucc_geth.c                    Joe Perches       2009-12-03  2000  	    ug_info->rxExtendedFiltering) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  2001  		if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  2002  			pr_err("Number of station addresses greater than 1 not allowed in extended parsing mode\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  2003  		return -EINVAL;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  2004  	}
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  2005  
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  2006  	/* Generate uccm_mask for receive */
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  2007  	uf_info->uccm_mask = ug_info->eventRegMask & UCCE_OTHER;/* Errors */
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2008  	for (i = 0; i < ucc_geth_rx_queues(ug_info); i++)
3bc53427e4f323 drivers/net/ucc_geth.c                    Timur Tabi        2009-01-11  2009  		uf_info->uccm_mask |= (UCC_GETH_UCCE_RXF0 << i);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  2010  
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2011  	for (i = 0; i < ucc_geth_tx_queues(ug_info); i++)
3bc53427e4f323 drivers/net/ucc_geth.c                    Timur Tabi        2009-01-11  2012  		uf_info->uccm_mask |= (UCC_GETH_UCCE_TXB0 << i);
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  2013  	/* Initialize the general fast UCC block. */
728de4c927a354 drivers/net/ucc_geth.c                    Kim Phillips      2007-04-13  2014  	if (ucc_fast_init(uf_info, &ugeth->uccf)) {
890de95e8fe617 drivers/net/ucc_geth.c                    Li Yang           2007-07-19  2015  		if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  2016  			pr_err("Failed to init uccf\n");
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  2017  		return -ENOMEM;
ce973b141dfac4 drivers/net/ucc_geth.c                    Li Yang           2006-08-14  2018  	}
728de4c927a354 drivers/net/ucc_geth.c                    Kim Phillips      2007-04-13  2019  
345f84227b50e9 drivers/net/ucc_geth.c                    Haiying Wang      2009-04-29  2020  	/* read the number of risc engines, update the riscTx and riscRx
345f84227b50e9 drivers/net/ucc_geth.c                    Haiying Wang      2009-04-29  2021  	 * if there are 4 riscs in QE
345f84227b50e9 drivers/net/ucc_geth.c                    Haiying Wang      2009-04-29  2022  	 */
345f84227b50e9 drivers/net/ucc_geth.c                    Haiying Wang      2009-04-29  2023  	if (qe_get_num_of_risc() == 4) {
345f84227b50e9 drivers/net/ucc_geth.c                    Haiying Wang      2009-04-29  2024  		ug_info->riscTx = QE_RISC_ALLOCATION_FOUR_RISCS;
345f84227b50e9 drivers/net/ucc_geth.c                    Haiying Wang      2009-04-29  2025  		ug_info->riscRx = QE_RISC_ALLOCATION_FOUR_RISCS;
345f84227b50e9 drivers/net/ucc_geth.c                    Haiying Wang      2009-04-29  2026  	}
345f84227b50e9 drivers/net/ucc_geth.c                    Haiying Wang      2009-04-29  2027  
3e73fc9a12679a drivers/net/ucc_geth.c                    Anton Vorontsov   2008-12-18  2028  	ugeth->ug_regs = ioremap(uf_info->regs, sizeof(*ugeth->ug_regs));
3e73fc9a12679a drivers/net/ucc_geth.c                    Anton Vorontsov   2008-12-18  2029  	if (!ugeth->ug_regs) {
3e73fc9a12679a drivers/net/ucc_geth.c                    Anton Vorontsov   2008-12-18  2030  		if (netif_msg_probe(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  2031  			pr_err("Failed to ioremap regs\n");
3e73fc9a12679a drivers/net/ucc_geth.c                    Anton Vorontsov   2008-12-18  2032  		return -ENOMEM;
3e73fc9a12679a drivers/net/ucc_geth.c                    Anton Vorontsov   2008-12-18  2033  	}
728de4c927a354 drivers/net/ucc_geth.c                    Kim Phillips      2007-04-13  2034  
728de4c927a354 drivers/net/ucc_geth.c                    Kim Phillips      2007-04-13  2035  	return 0;
728de4c927a354 drivers/net/ucc_geth.c                    Kim Phillips      2007-04-13  2036  }
728de4c927a354 drivers/net/ucc_geth.c                    Kim Phillips      2007-04-13  2037  
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2038  static int ucc_geth_alloc_tx(struct ucc_geth_private *ugeth)
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2039  {
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2040  	struct ucc_geth_info *ug_info;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2041  	struct ucc_fast_info *uf_info;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2042  	int length;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2043  	u16 i, j;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2044  	u8 __iomem *bd;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2045  
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2046  	ug_info = ugeth->ug_info;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2047  	uf_info = &ug_info->uf_info;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2048  
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2049  	/* Allocate Tx bds */
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2050  	for (j = 0; j < ucc_geth_tx_queues(ug_info); j++) {
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2051  		u32 align = max(UCC_GETH_TX_BD_RING_ALIGNMENT,
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2052  				UCC_GETH_TX_BD_RING_SIZE_MEMORY_ALIGNMENT);
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2053  		u32 alloc;
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2054  
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2055  		length = ug_info->bdRingLenTx[j] * sizeof(struct qe_bd);
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2056  		alloc = round_up(length, align);
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2057  		alloc = roundup_pow_of_two(alloc);
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2058  
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2059  		ugeth->p_tx_bd_ring[j] = kmalloc(alloc, GFP_KERNEL);
64a99fe596f9cb drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2060  
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2061  		if (!ugeth->p_tx_bd_ring[j]) {
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2062  			if (netif_msg_ifup(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  2063  				pr_err("Can not allocate memory for Tx bd rings\n");
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2064  			return -ENOMEM;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2065  		}
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2066  		/* Zero unused end of bd ring, according to spec */
9b0dfef4755301 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19 @2067  		memset(ugeth->p_tx_bd_ring[j] + length, 0, alloc - length);
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2068  	}
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2069  
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2070  	/* Init Tx bds */
53f49d86ea2108 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2071  	for (j = 0; j < ucc_geth_tx_queues(ug_info); j++) {
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2072  		/* Setup the skbuff rings */
6da2ec56059c3c drivers/net/ethernet/freescale/ucc_geth.c Kees Cook         2018-06-12  2073  		ugeth->tx_skbuff[j] =
33deb13c87e561 drivers/net/ethernet/freescale/ucc_geth.c Rasmus Villemoes  2021-01-19  2074  			kcalloc(ugeth->ug_info->bdRingLenTx[j],
6da2ec56059c3c drivers/net/ethernet/freescale/ucc_geth.c Kees Cook         2018-06-12  2075  				sizeof(struct sk_buff *), GFP_KERNEL);
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2076  
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2077  		if (ugeth->tx_skbuff[j] == NULL) {
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2078  			if (netif_msg_ifup(ugeth))
c84d8055e0c997 drivers/net/ethernet/freescale/ucc_geth.c Joe Perches       2013-04-13  2079  				pr_err("Could not allocate tx_skbuff\n");
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2080  			return -ENOMEM;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2081  		}
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2082  
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2083  		ugeth->skb_curtx[j] = ugeth->skb_dirtytx[j] = 0;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2084  		bd = ugeth->confBd[j] = ugeth->txBd[j] = ugeth->p_tx_bd_ring[j];
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2085  		for (i = 0; i < ug_info->bdRingLenTx[j]; i++) {
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2086  			/* clear bd buffer */
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2087  			out_be32(&((struct qe_bd __iomem *)bd)->buf, 0);
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2088  			/* set bd status and length */
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2089  			out_be32((u32 __iomem *)bd, 0);
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2090  			bd += sizeof(struct qe_bd);
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2091  		}
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2092  		bd -= sizeof(struct qe_bd);
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2093  		/* set bd status and length */
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2094  		out_be32((u32 __iomem *)bd, T_W); /* for last BD set Wrap bit */
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2095  	}
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2096  
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2097  	return 0;
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2098  }
e19a82c18f0e63 drivers/net/ethernet/freescale/ucc_geth.c Paul Gortmaker    2012-02-27  2099  

:::::: The code at line 2067 was first introduced by commit
:::::: 9b0dfef4755301d9f7fcef63e2f64d23649bebb4 ethernet: ucc_geth: simplify rx/tx allocations

:::::: TO: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
