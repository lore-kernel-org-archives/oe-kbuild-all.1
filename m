Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066187E11A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711713472; cv=none; b=gOBxfdYcVN11iEis+qatZQDkteoVn5o/KM5ViCbW8UTAcQryXV0UTxyX1clXRH57SZ5okrA2CR/3RwhNySjAQO84Cthi+iwGTzloYZKgOSEPFR3WsrFyv2Up2JelfmMmcVfGqlE92VGFH3suwhKXbE9eg8cbczXrLsS9cb/viC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711713472; c=relaxed/simple;
	bh=GD8ZUVX4QGApUdZ0cJ0Hr6ExPzc2fQvygpJr10LbHYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sKgK8BzwXbttJqtWQz4ZOPEl0MRqnxit+7sHEw+KlR7NHHmtbala7ljEdxmM1GX+GPytjKDXRT0l4S1vY8lUyPmWdVVyBldXXiy44RHOVe6wxS9I4m3P/T3JMfkjAZ/uIkpXGlzgEBVPt2scxGHkDp+Bej7b+o5zE64BvInDx84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfZLxVSv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfZLxVSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711713470; x=1743249470;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GD8ZUVX4QGApUdZ0cJ0Hr6ExPzc2fQvygpJr10LbHYw=;
  b=HfZLxVSv3hb0M8zx645j8DTVkczoG7zErKjyPh5DeySxjHR77gBe9hUi
   vLeu3f3PcircqiTuLBrQKm88zHOyAGIlZKHP8ncvA3rzHkiatg25rI12J
   Beq+Wc0OmKJhUNwf20oOT8HoAxq7bGeAU4fvB7mJDggPePKDRZD8G/UdO
   sQKKLODEohQJOnO/YKdZkbP51Gj+NwnitWmiXGmlhMXRPCg2kyO89STCr
   YyGwacHeXrPl3ZDtCXA0bZMqZ1xzBNbA7KFMrPOdn/kpyFEMeW+Gur6bd
   fJij+GoGITikpyt+70fD0YLfapoM/a6nvstlLgi5IHLQrX011phxE8h39
   Q==;
X-CSE-ConnectionGUID: n5J29kErRs6c6B59iGNmKA==
X-CSE-MsgGUID: HolXae7VTzSbdm87PSUCKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6837185"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="6837185"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 04:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="21699820"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Mar 2024 04:57:48 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqArh-00039i-2C;
	Fri, 29 Mar 2024 11:57:45 +0000
Date: Fri, 29 Mar 2024 19:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-classmap-add-trace 20/64]
 drivers/gpu/drm/xe/xe_bo.c:1888:6: error: expected expression
Message-ID: <202403291935.uXY8cL3d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/jimc/linux.git dd-fix-classmap-add-trace
head:   3341029059d1eb4ef9a6b48d5c2075e3f694daaf
commit: 198c1990e09a81474b7bad0e664cac4c18afa1d7 [20/64] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403291935.uXY8cL3d-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291935.uXY8cL3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291935.uXY8cL3d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_bo.c:6:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo.c:6:
   In file included from drivers/gpu/drm/xe/xe_bo.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:9:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_bo.c:6:
   In file included from drivers/gpu/drm/xe/xe_bo.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:9:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_bo.c:6:
   In file included from drivers/gpu/drm/xe/xe_bo.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:9:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/xe/xe_bo.c:1888:6: error: expected expression
    1888 |         if (XE_IOCTL_DBG(xe, args->extensions) ||
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:271:58: note: expanded from macro '__dynamic_func_call_cls'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^
   drivers/gpu/drm/xe/xe_bo.c:1889:6: error: expected expression
    1889 |             XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:271:58: note: expanded from macro '__dynamic_func_call_cls'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^
   drivers/gpu/drm/xe/xe_bo.c:1890:6: error: expected expression
    1890 |             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:271:58: note: expanded from macro '__dynamic_func_call_cls'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^
   drivers/gpu/drm/xe/xe_bo.c:1894:6: error: expected expression
    1894 |         if (XE_IOCTL_DBG(xe, (args->placement & ~xe->info.mem_region_mask) ||
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:271:58: note: expanded from macro '__dynamic_func_call_cls'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^
   drivers/gpu/drm/xe/xe_bo.c:1898:6: error: expected expression
    1898 |         if (XE_IOCTL_DBG(xe, args->flags &
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
--
   In file included from drivers/gpu/drm/xe/xe_exec.c:10:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_exec.c:10:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_exec.c:10:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_exec.c:10:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/xe/xe_exec.c:122:6: error: expected expression
     122 |         if (XE_IOCTL_DBG(xe, args->extensions) ||
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:271:58: note: expanded from macro '__dynamic_func_call_cls'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^
   drivers/gpu/drm/xe/xe_exec.c:123:6: error: expected expression
     123 |             XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:271:58: note: expanded from macro '__dynamic_func_call_cls'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^
   drivers/gpu/drm/xe/xe_exec.c:124:6: error: expected expression
     124 |             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:271:58: note: expanded from macro '__dynamic_func_call_cls'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^
   drivers/gpu/drm/xe/xe_exec.c:128:6: error: expected expression
     128 |         if (XE_IOCTL_DBG(xe, !q))
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:271:58: note: expanded from macro '__dynamic_func_call_cls'
     271 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
         |                                                          ^
   drivers/gpu/drm/xe/xe_exec.c:131:6: error: expected expression
     131 |         if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
         |             ^
   drivers/gpu/drm/xe/xe_macros.h:14:14: note: expanded from macro 'XE_IOCTL_DBG'
      14 |         ((cond) && (drm_dbg(&(xe)->drm, \
         |                     ^
   include/drm/drm_print.h:520:32: note: expanded from macro 'drm_dbg'
     520 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:502:2: note: expanded from macro 'drm_dbg_driver'
     502 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:423:2: note: expanded from macro 'drm_dev_dbg'
     423 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   include/linux/dynamic_debug.h:298:2: note: expanded from macro '_dynamic_func_call_cls'
     298 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
..


vim +1888 drivers/gpu/drm/xe/xe_bo.c

dd08ebf6c3525a Matthew Brost    2023-03-30  1875  
dd08ebf6c3525a Matthew Brost    2023-03-30  1876  int xe_gem_create_ioctl(struct drm_device *dev, void *data,
dd08ebf6c3525a Matthew Brost    2023-03-30  1877  			struct drm_file *file)
dd08ebf6c3525a Matthew Brost    2023-03-30  1878  {
dd08ebf6c3525a Matthew Brost    2023-03-30  1879  	struct xe_device *xe = to_xe_device(dev);
dd08ebf6c3525a Matthew Brost    2023-03-30  1880  	struct xe_file *xef = to_xe_file(file);
dd08ebf6c3525a Matthew Brost    2023-03-30  1881  	struct drm_xe_gem_create *args = data;
dd08ebf6c3525a Matthew Brost    2023-03-30  1882  	struct xe_vm *vm = NULL;
dd08ebf6c3525a Matthew Brost    2023-03-30  1883  	struct xe_bo *bo;
622f709ca6297d Pallavi Mishra   2023-08-11  1884  	unsigned int bo_flags;
dd08ebf6c3525a Matthew Brost    2023-03-30  1885  	u32 handle;
dd08ebf6c3525a Matthew Brost    2023-03-30  1886  	int err;
dd08ebf6c3525a Matthew Brost    2023-03-30  1887  
7a56bd0cfbeafa Rodrigo Vivi     2023-11-22 @1888  	if (XE_IOCTL_DBG(xe, args->extensions) ||
7a56bd0cfbeafa Rodrigo Vivi     2023-11-22  1889  	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
b8c1ba831e6750 Francois Dugast  2023-07-17  1890  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
dd08ebf6c3525a Matthew Brost    2023-03-30  1891  		return -EINVAL;
dd08ebf6c3525a Matthew Brost    2023-03-30  1892  
6b8c1edc4f698d Rodrigo Vivi     2023-11-22  1893  	/* at least one valid memory placement must be specified */
6b8c1edc4f698d Rodrigo Vivi     2023-11-22  1894  	if (XE_IOCTL_DBG(xe, (args->placement & ~xe->info.mem_region_mask) ||
6b8c1edc4f698d Rodrigo Vivi     2023-11-22  1895  			 !args->placement))
6b8c1edc4f698d Rodrigo Vivi     2023-11-22  1896  		return -EINVAL;
6b8c1edc4f698d Rodrigo Vivi     2023-11-22  1897  
b8c1ba831e6750 Francois Dugast  2023-07-17  1898  	if (XE_IOCTL_DBG(xe, args->flags &
d5dc73dbd148ef Francois Dugast  2023-11-14  1899  			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
d5dc73dbd148ef Francois Dugast  2023-11-14  1900  			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
6b8c1edc4f698d Rodrigo Vivi     2023-11-22  1901  			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
dd08ebf6c3525a Matthew Brost    2023-03-30  1902  		return -EINVAL;
dd08ebf6c3525a Matthew Brost    2023-03-30  1903  
b8c1ba831e6750 Francois Dugast  2023-07-17  1904  	if (XE_IOCTL_DBG(xe, args->handle))
dd08ebf6c3525a Matthew Brost    2023-03-30  1905  		return -EINVAL;
dd08ebf6c3525a Matthew Brost    2023-03-30  1906  
b8c1ba831e6750 Francois Dugast  2023-07-17  1907  	if (XE_IOCTL_DBG(xe, !args->size))
d79bdcdf06a3b4 Matthew Auld     2022-12-22  1908  		return -EINVAL;
d79bdcdf06a3b4 Matthew Auld     2022-12-22  1909  
b8c1ba831e6750 Francois Dugast  2023-07-17  1910  	if (XE_IOCTL_DBG(xe, args->size > SIZE_MAX))
dd08ebf6c3525a Matthew Brost    2023-03-30  1911  		return -EINVAL;
dd08ebf6c3525a Matthew Brost    2023-03-30  1912  
b8c1ba831e6750 Francois Dugast  2023-07-17  1913  	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
dd08ebf6c3525a Matthew Brost    2023-03-30  1914  		return -EINVAL;
dd08ebf6c3525a Matthew Brost    2023-03-30  1915  
622f709ca6297d Pallavi Mishra   2023-08-11  1916  	bo_flags = 0;
d5dc73dbd148ef Francois Dugast  2023-11-14  1917  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
dd08ebf6c3525a Matthew Brost    2023-03-30  1918  		bo_flags |= XE_BO_DEFER_BACKING;
dd08ebf6c3525a Matthew Brost    2023-03-30  1919  
d5dc73dbd148ef Francois Dugast  2023-11-14  1920  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
dd08ebf6c3525a Matthew Brost    2023-03-30  1921  		bo_flags |= XE_BO_SCANOUT_BIT;
dd08ebf6c3525a Matthew Brost    2023-03-30  1922  
6b8c1edc4f698d Rodrigo Vivi     2023-11-22  1923  	bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
cd928fced99685 Matthew Auld     2023-03-31  1924  
d5dc73dbd148ef Francois Dugast  2023-11-14  1925  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
cd928fced99685 Matthew Auld     2023-03-31  1926  		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
cd928fced99685 Matthew Auld     2023-03-31  1927  			return -EINVAL;
cd928fced99685 Matthew Auld     2023-03-31  1928  
cd928fced99685 Matthew Auld     2023-03-31  1929  		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
cd928fced99685 Matthew Auld     2023-03-31  1930  	}
cd928fced99685 Matthew Auld     2023-03-31  1931  
622f709ca6297d Pallavi Mishra   2023-08-11  1932  	if (XE_IOCTL_DBG(xe, !args->cpu_caching ||
622f709ca6297d Pallavi Mishra   2023-08-11  1933  			 args->cpu_caching > DRM_XE_GEM_CPU_CACHING_WC))
622f709ca6297d Pallavi Mishra   2023-08-11  1934  		return -EINVAL;
622f709ca6297d Pallavi Mishra   2023-08-11  1935  
622f709ca6297d Pallavi Mishra   2023-08-11  1936  	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_CREATE_VRAM_MASK &&
622f709ca6297d Pallavi Mishra   2023-08-11  1937  			 args->cpu_caching != DRM_XE_GEM_CPU_CACHING_WC))
622f709ca6297d Pallavi Mishra   2023-08-11  1938  		return -EINVAL;
622f709ca6297d Pallavi Mishra   2023-08-11  1939  
622f709ca6297d Pallavi Mishra   2023-08-11  1940  	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_SCANOUT_BIT &&
622f709ca6297d Pallavi Mishra   2023-08-11  1941  			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
622f709ca6297d Pallavi Mishra   2023-08-11  1942  		return -EINVAL;
622f709ca6297d Pallavi Mishra   2023-08-11  1943  
9c0d779fc67bd1 Pallavi Mishra   2023-08-31  1944  	if (args->vm_id) {
9c0d779fc67bd1 Pallavi Mishra   2023-08-31  1945  		vm = xe_vm_lookup(xef, args->vm_id);
9c0d779fc67bd1 Pallavi Mishra   2023-08-31  1946  		if (XE_IOCTL_DBG(xe, !vm))
9c0d779fc67bd1 Pallavi Mishra   2023-08-31  1947  			return -ENOENT;
d00e9cc28e1e42 Thomas Hellström 2023-09-08  1948  		err = xe_vm_lock(vm, true);
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1949  		if (err)
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1950  			goto out_vm;
9c0d779fc67bd1 Pallavi Mishra   2023-08-31  1951  	}
9c0d779fc67bd1 Pallavi Mishra   2023-08-31  1952  
622f709ca6297d Pallavi Mishra   2023-08-11  1953  	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
622f709ca6297d Pallavi Mishra   2023-08-11  1954  			       ttm_bo_type_device, bo_flags);
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1955  
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1956  	if (vm)
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1957  		xe_vm_unlock(vm);
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1958  
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1959  	if (IS_ERR(bo)) {
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1960  		err = PTR_ERR(bo);
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1961  		goto out_vm;
dd08ebf6c3525a Matthew Brost    2023-03-30  1962  	}
dd08ebf6c3525a Matthew Brost    2023-03-30  1963  
dd08ebf6c3525a Matthew Brost    2023-03-30  1964  	err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
dd08ebf6c3525a Matthew Brost    2023-03-30  1965  	if (err)
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1966  		goto out_bulk;
dd08ebf6c3525a Matthew Brost    2023-03-30  1967  
dd08ebf6c3525a Matthew Brost    2023-03-30  1968  	args->handle = handle;
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1969  	goto out_put;
dd08ebf6c3525a Matthew Brost    2023-03-30  1970  
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1971  out_bulk:
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1972  	if (vm && !xe_vm_in_fault_mode(vm)) {
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1973  		xe_vm_lock(vm, false);
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1974  		__xe_bo_unset_bulk_move(bo);
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1975  		xe_vm_unlock(vm);
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1976  	}
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1977  out_put:
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1978  	xe_bo_put(bo);
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1979  out_vm:
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1980  	if (vm)
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1981  		xe_vm_put(vm);
e7b4ebd7c6b3d2 Matthew Auld     2023-10-09  1982  
ee82d2da9c8ac1 Matthew Auld     2023-07-13  1983  	return err;
dd08ebf6c3525a Matthew Brost    2023-03-30  1984  }
dd08ebf6c3525a Matthew Brost    2023-03-30  1985  

:::::: The code at line 1888 was first introduced by commit
:::::: 7a56bd0cfbeafab33030c782c40b009e39c4bbc0 drm/xe/uapi: Fix various struct padding for 64b alignment

:::::: TO: Rodrigo Vivi <rodrigo.vivi@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
