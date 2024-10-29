Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9633207
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 21:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730236174; cv=none; b=Zooe8DTT4q+IT9HzMAmEkJ0SN0KbDw0MAkAvh86lPVOUBmWIQEcmZu4FQzPxvYrXsIuTG0sGHhEsBmqAzFpToPPAJCKFBhE+xY22Rb/qq2SrWuLcp03xAhqiWw7c1iIgrEFVCOosqCF3GTZSx2wwrK69q53W6LzURYfDmDv+EYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730236174; c=relaxed/simple;
	bh=7uozQA0aAOsoTFl2W+lJ+F6KLsHcHTFrFFeFkBFpAys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6IXc3te9FL3Z8L/zLKwVWHq0xxpt6ue6HD8hRw7q1tpAgKP8Nggc0W8taD41QCcc17z5t7Zu2QGOmbB7IQTtYreF7t5G5yWovOapokbp5pkl9RrbT5nkPiqhSYXXcuE9N+x15QU2lvGy96l695+YhPinS2xnfsbPphwgQ5Lcd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLK9ECeQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLK9ECeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730236172; x=1761772172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7uozQA0aAOsoTFl2W+lJ+F6KLsHcHTFrFFeFkBFpAys=;
  b=jLK9ECeQo0KnT660mc/l9NBz1ccFTUp4X03LRmCSbAIXayPAMqKOHCJa
   GxVZV696QV7WmFAPecTpS/wD239vdmV8FhJnit8c4kHv2yo2A3P5JvFo2
   Pk/OPF2A6BNxPhFvwQ75syMvmcEJF+6u+d3WIf1spgAkeN21h8oiaQ7Jb
   7mtLwDbK510W+2crIfqG4SgeMxt/dSGpvL5ytI0GBLykjtmsjvRVkHutj
   IsTbq6ivUmMwvmnUO3UTUfLSfmqHfNICjImNaAL3TeyFSNpUUi3vgaO5S
   PdLvElCnFDABP+FIFRkGd3g2ggAPXfAy7RYg9aSSL+g+cqkYl5xDhtchS
   w==;
X-CSE-ConnectionGUID: k2K9aZ6vRQ2fG8DPxf1rfw==
X-CSE-MsgGUID: P/UvDOaKRX6NCQOLdqZxTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30118228"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="30118228"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 14:09:31 -0700
X-CSE-ConnectionGUID: JBjPHGGPQ3mas/TaZHZ1cw==
X-CSE-MsgGUID: kIkhJi3YSDSHtCBy4X2vOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="105419849"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2024 14:09:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5tSx-000e9U-1c;
	Tue, 29 Oct 2024 21:09:27 +0000
Date: Wed, 30 Oct 2024 05:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 2/10] drivers/virtio/virtio_msg_mmio.c:79:3:
 error: call to undeclared function 'writeq'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202410300422.u6HNVFIz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   4cdd999c9cdc0ddc577311c6fd904523176a1832
commit: bea6928905ca9df686467ece8a8d226a11eeda75 [2/10] virtio: Add support for MMIO based channel bus
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410300422.u6HNVFIz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300422.u6HNVFIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300422.u6HNVFIz-lkp@intel.com/

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
   drivers/virtio/virtio_msg_mmio.c:188:46: warning: shift count >= width of type [-Wshift-count-overflow]
     188 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   8 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


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
