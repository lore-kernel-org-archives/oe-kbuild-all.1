Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF51B7F4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065092; cv=none; b=ACCv70WWs8eN5ZIMN6udei7DiA2ft+kr4MOJgAFMwt6VI4rN9+aHq7gEVIt09MGTuHMXO05Z/jEf9rs9hgWIYPkbad5Oi0Lrdknrn8D/eDqWi+AgCiHCDQerDofrWqe1Apvj5mlf2zS02ADFYoMttHOkxffbW4sue1bPr+Usq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065092; c=relaxed/simple;
	bh=HM/VpYSat9Qynxx0g0mX0Gx/swWTLDM9molyWQ/jIww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BpXSvNMAHgxARq8Xh3H6TBmJyGoT2yjENmzP+dQ6mJJA+P++qAlC+mgBs38LEYItGGaycBmkRxpjsRrzx1gLiSqPVJHlxbk+kI6DrYvy4cu4d1i0YbeS0JFfU7G8UrTF2dqzkhwxBndptrvpPp3wu8uhPFB9BvNQmcFSA8pvG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuEJOITs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuEJOITs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065092; x=1763601092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HM/VpYSat9Qynxx0g0mX0Gx/swWTLDM9molyWQ/jIww=;
  b=PuEJOITsAv1hsxsm45LnrRo/HZjEJAlE1Uy4rYkBgQQKnei5Bm6qFYf9
   vRVcBolpYrnEZVubfZrQ6AoqLjHRFrRIO4m+nle7SPXVJt6zRRbgodm2Z
   Gj/zOcmrQaRew8Ix2gYQK96eArJOCjTAGNKjuoS+HkKvcx9BmyG3VIIYZ
   lkC6xEEO5uH4QagPBVibGFRckYKuRWUEDvv5WS3FgBnRNKUe6DuThQg5I
   nuvrmAAXIdUy6PL4LyFIrv+sh0NT2ON+A85erd0o64W0/n5WiuHrkzlxQ
   e5zesz9Nvq6FlIt202vEeyhr/K6UPUDegnoxsaBYpdis5UcLyJ+9LER2X
   A==;
X-CSE-ConnectionGUID: ws2c1fSeR3iDq77+cUhRIw==
X-CSE-MsgGUID: UF8IUhnHTD2s2NO8mBEVag==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31851270"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31851270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:11:29 -0800
X-CSE-ConnectionGUID: bz31I5dbQDuaGHE2nuF54g==
X-CSE-MsgGUID: PnlxZYZkRliGQGkc3BYC7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90572461"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 17:11:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZFd-0000Ny-1Y;
	Wed, 20 Nov 2024 01:11:25 +0000
Date: Wed, 20 Nov 2024 09:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-v2 2/21] drivers/virtio/virtio_msg_mmio.c:79:3:
 error: call to undeclared function 'writeq'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202411191846.kr6dffb0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-v2
head:   702c1af18bf513f8297bfbb99b859c37b7b900ab
commit: 91dc384463e6fcf24e2c988696689cb6a539cb94 [2/21] virtio: Add support for MMIO based channel bus
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20241119/202411191846.kr6dffb0-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191846.kr6dffb0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191846.kr6dffb0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_msg_mmio.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/virtio/virtio_msg_mmio.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/virtio/virtio_msg_mmio.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/virtio/virtio_msg_mmio.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/virtio/virtio_msg_mmio.c:79:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |                 writeq(*(data + i), addr + i);
         |                 ^
>> drivers/virtio/virtio_msg_mmio.c:87:17: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      87 |                 *(data + i) = readq(addr + i);
         |                               ^
   drivers/virtio/virtio_msg_mmio.c:187:46: warning: shift count >= width of type [-Wshift-count-overflow]
     187 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   8 warnings and 2 errors generated.


vim +/writeq +79 drivers/virtio/virtio_msg_mmio.c

    68	
    69	static int virtio_msg_mmio_send(struct virtio_msg_device *vmdev,
    70					struct virtio_msg *request,
    71					struct virtio_msg *response)
    72	{
    73		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
    74		int i, len = sizeof(*request) / sizeof(u64);
    75		u64 *data = (u64 *) request;
    76		u64 *addr = vmmdev->base;
    77	
    78		for (i = 0; i < len; i++)
  > 79			writeq(*(data + i), addr + i);
    80	
    81		if (!response)
    82			return 0;
    83	
    84		data = (u64 *) response;
    85	
    86		for (i = 0; i < len; i++)
  > 87			*(data + i) = readq(addr + i);
    88	
    89		return 0;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
