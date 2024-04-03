Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89F6645
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712120835; cv=none; b=RlvSmRkknC6CZj+Y03EFh/nQIp1N0lEMc6Rtd/9Pm3LvVTx3kQvHuqB/EQFBEfGMCbErCtVhJIvJ2L78V+WrDxrTQvAHXjZ0jmKnqiEUP0kLHaweAzstgicOfQUK9o3ZJ38Lh2lst5ffGG0LhYymlPlZh8LGCok6DUa9+UM3ttY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712120835; c=relaxed/simple;
	bh=BNqTbYKyJ7cwXLC/m3sM3toHMSMYBv5P0eOLy24nGTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fhlyshx+aiaFaHRjMNr1vws8l8cjv9W66t2Fd1IFAm2wHq/DajBYiDciZ3JUWAm1SkFn9TEKyLo18LpuCLZ0Yk82Y6I8IJPopE8NGrcpM4+6yuXftVvFf6+VH2GsW+O+OUrdkeuMgxmerBIU0OqJbpLQwt4zWxD93dG+0M0LEa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPS/LRn/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPS/LRn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712120834; x=1743656834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BNqTbYKyJ7cwXLC/m3sM3toHMSMYBv5P0eOLy24nGTY=;
  b=BPS/LRn/MKh8MiSqNxnY0ozcTJm1D1uumkjtsbV/9k1hZnrDrX9GAbeR
   gtEv3U5LGjWmIwp+HXFndiJa5Jgdxmw74YBPyyDktPndHlV82gtyTxpC6
   27zDmL5tS3OycIix4rrF1TVlZ+Ixx0k/xxNfO/rFSaCDywtwa0njUu+z2
   eHAZwvqlAStMZf4Ts75cDJpvtAy+WS+raHorZsZsHwAmGAiwQtq7kjywt
   UmvU8s8v5cXU/ZBjCXe9DxyRy1ZzFyvG3tkxM4NeaXQHcebCindWEmy4y
   67QkQiLQFVIhB1x5WiXTlomuUgdfn92XM6eissll9Fao9Vqae+mjqkQeJ
   g==;
X-CSE-ConnectionGUID: 9oK8KU3xSdiXxxQwH+HAEQ==
X-CSE-MsgGUID: GQnb2TCCQyCMHgXFbkuwSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11150462"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="11150462"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 22:07:13 -0700
X-CSE-ConnectionGUID: H6YDsqcxTPmsHub5ZP8axA==
X-CSE-MsgGUID: EYYbgLb2TFyyj5sRKTbFkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="22772207"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Apr 2024 22:07:12 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrsq5-0001sn-2E;
	Wed, 03 Apr 2024 05:07:09 +0000
Date: Wed, 3 Apr 2024 13:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 38/51]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:14162:11: error: call to
 undeclared function 'find_and_set_bit'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202404031255.s5gucI8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and-v4
head:   db33a7d65f9e64f900f68e46da4f113fbe6a7faa
commit: 99282ba7d9d41b3728ddbdb2b7c416c6323bd24e [38/51] broadcom bnxt
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240403/202404031255.s5gucI8X-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031255.s5gucI8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031255.s5gucI8X-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/broadcom/bnxt/bnxt.c:11:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
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
   In file included from drivers/net/ethernet/broadcom/bnxt/bnxt.c:21:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/net/ethernet/broadcom/bnxt/bnxt.c:21:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/net/ethernet/broadcom/bnxt/bnxt.c:21:
   In file included from include/linux/pci.h:39:
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
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:14162:11: error: call to undeclared function 'find_and_set_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    14162 |         bit_id = find_and_set_bit(bp->ntp_fltr_bmap, bp->max_fltr);
          |                  ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:14162:11: note: did you mean 'test_and_set_bit'?
   include/asm-generic/bitops/instrumented-atomic.h:68:29: note: 'test_and_set_bit' declared here
      68 | static __always_inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
         |                             ^
   17 warnings and 1 error generated.


vim +/find_and_set_bit +14162 drivers/net/ethernet/broadcom/bnxt/bnxt.c

 14155	
 14156	int bnxt_insert_ntp_filter(struct bnxt *bp, struct bnxt_ntuple_filter *fltr,
 14157				   u32 idx)
 14158	{
 14159		struct hlist_head *head;
 14160		int bit_id;
 14161	
 14162		bit_id = find_and_set_bit(bp->ntp_fltr_bmap, bp->max_fltr);
 14163		if (bit_id >= bp->max_fltr)
 14164			return -ENOMEM;
 14165	
 14166		fltr->base.sw_id = (u16)bit_id;
 14167		fltr->base.type = BNXT_FLTR_TYPE_NTUPLE;
 14168		fltr->base.flags |= BNXT_ACT_RING_DST;
 14169		head = &bp->ntp_fltr_hash_tbl[idx];
 14170		hlist_add_head_rcu(&fltr->base.hash, head);
 14171		set_bit(BNXT_FLTR_INSERTED, &fltr->base.state);
 14172		bnxt_insert_usr_fltr(bp, &fltr->base);
 14173		bp->ntp_fltr_count++;
 14174	
 14175		return 0;
 14176	}
 14177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
