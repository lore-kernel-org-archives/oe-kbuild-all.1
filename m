Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B37D163A97
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 05:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729055287; cv=none; b=hOehdg4A1yUjYhiAKNd4P6SzcsaekYcqQ+YziMJBycALRloORjujqGg6HI/n5ySbhaWskyGG/wS6YlmNnobYvA7TVW2b2nF8BcEWVBDUU+mQrjzCBiiGGE59H8YQMTUQrYScoJG6ptMj4dZvmEeqw4jFAqVJm3kbRqEI00Y1VEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729055287; c=relaxed/simple;
	bh=n3wOL5ytLHcwkp8XfC4UFVPUBg9Q+LmkVFsZJHmBn/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQm3aDWWL7SD/F39jVMdBT2J5BOejYcOiEAFJ77O058QdIkiDnZY/3pZKlPUf7mj+iqQNMt2xfnvcuMJt9VcVFR2srWZGyltB0Jhk9wDDbPsrE51wWJAmeKz25/aABmES1ivQF+I8A08ONfgVgWeTAktP2aIiKfLdClr8QSxl/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dR1yCp8P; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dR1yCp8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729055285; x=1760591285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3wOL5ytLHcwkp8XfC4UFVPUBg9Q+LmkVFsZJHmBn/4=;
  b=dR1yCp8PEBvPhj7kQsWp1tLj5rxWpOmZmTpbzS65F6fyPUZF/O2VBtKl
   GSe3ccSueIUlJs3lpHtF4NVyWmV8jzmCKQ3GDYghY/APhFDkKAyJQE9bM
   0PVvtdC7peDR/AHf1pq9RbHf7mFv+gq5n9m0h0qYqdHfDTvuqhRl3ZGLO
   r0x1FDUfOClfNA8XPS/RrH5katBVgUOLNFw35fS0lDJZFMIXmU0ehuX1T
   6DogU+ucX5jjKxtycb1gKtOSatx+Xcc+18m3mcY+G1y+4QLAlN6xvZy50
   0jfh1UgvnNBEy/BK/qA7tgcf7kAUTL/1ow+fxnCzhNXSEzDICG5kXrHCM
   Q==;
X-CSE-ConnectionGUID: GmhkHt9RQR27GTyDoB9reQ==
X-CSE-MsgGUID: Rm4mmQUNQP2DdirAh+CIcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28681942"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="28681942"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 22:07:56 -0700
X-CSE-ConnectionGUID: 8aGcjg58RlOLYbMyyHEsxA==
X-CSE-MsgGUID: Y+QA+U1LQrGbWInWzzd0AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="101432851"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Oct 2024 22:07:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0wGG-000KKn-00;
	Wed, 16 Oct 2024 05:07:52 +0000
Date: Wed, 16 Oct 2024 13:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nvme-dma 5/10] include/linux/dma-mapping.h:359:9: warning:
 implicit conversion from 'dma_addr_t' (aka 'unsigned long long') to 'int'
 changes value from 18446744073709551615 to -1
Message-ID: <202410161335.rDl9DUym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git nvme-dma
head:   080c3a9ad1b0163ed2b4f9f9fba9a9fd8fe8919f
commit: 4efd58fca48c18675130589882ca529988ede443 [5/10] dma-mapping: change the dma_alloc_iova / dma_link_range API
config: um-defconfig (https://download.01.org/0day-ci/archive/20241016/202410161335.rDl9DUym-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161335.rDl9DUym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161335.rDl9DUym-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from init/main.c:105:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
>> include/linux/dma-mapping.h:359:9: warning: implicit conversion from 'dma_addr_t' (aka 'unsigned long long') to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     359 |         return DMA_MAPPING_ERROR;
         |         ~~~~~~ ^~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:29: note: expanded from macro 'DMA_MAPPING_ERROR'
      76 | #define DMA_MAPPING_ERROR               (~(dma_addr_t)0)
         |                                          ^~~~~~~~~~~~~~
   14 warnings generated.
--
   In file included from init/init_task.c:2:
   In file included from include/linux/init_task.h:9:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from init/init_task.c:2:
   In file included from include/linux/init_task.h:9:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from init/init_task.c:2:
   In file included from include/linux/init_task.h:9:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from init/init_task.c:2:
   In file included from include/linux/init_task.h:9:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from init/init_task.c:2:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
>> include/linux/dma-mapping.h:359:9: warning: implicit conversion from 'dma_addr_t' (aka 'unsigned long long') to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     359 |         return DMA_MAPPING_ERROR;
         |         ~~~~~~ ^~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:29: note: expanded from macro 'DMA_MAPPING_ERROR'
      76 | #define DMA_MAPPING_ERROR               (~(dma_addr_t)0)
         |                                          ^~~~~~~~~~~~~~
   14 warnings generated.


vim +359 include/linux/dma-mapping.h

ed6ccf10f24bdf Christoph Hellwig 2018-12-26  122  
4efd58fca48c18 Christoph Hellwig 2024-10-05  123  dma_addr_t dma_alloc_iova(struct dma_iova_state *state, phys_addr_t phys,
3a3a931ee872aa Leon Romanovsky   2024-01-29  124  		size_t size);
3a3a931ee872aa Leon Romanovsky   2024-01-29  125  void dma_free_iova(struct dma_iova_state *state);
d86a03930160dd Christoph Hellwig 2024-10-05  126  void dma_unlink_and_free_iova(struct dma_iova_state *state,
d86a03930160dd Christoph Hellwig 2024-10-05  127  		dma_addr_t dma_addr, size_t size);
a0f188d99350ca Leon Romanovsky   2024-01-29  128  dma_addr_t dma_hmm_link_page(struct dma_iova_state *state, unsigned long *pfn,
a0f188d99350ca Leon Romanovsky   2024-01-29  129  			     dma_addr_t dma_offset);
a0f188d99350ca Leon Romanovsky   2024-01-29  130  void dma_hmm_unlink_page(struct dma_iova_state *state, unsigned long *pfn,
a0f188d99350ca Leon Romanovsky   2024-01-29  131  			 dma_addr_t dma_offset);
3a3a931ee872aa Leon Romanovsky   2024-01-29  132  
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  133  dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  134  		size_t offset, size_t size, enum dma_data_direction dir,
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  135  		unsigned long attrs);
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  136  void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  137  		enum dma_data_direction dir, unsigned long attrs);
2a047e0662aee1 Christoph Hellwig 2021-08-09  138  unsigned int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
2a047e0662aee1 Christoph Hellwig 2021-08-09  139  		int nents, enum dma_data_direction dir, unsigned long attrs);
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  140  void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  141  				      int nents, enum dma_data_direction dir,
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  142  				      unsigned long attrs);
fffe3cc8c2194f Logan Gunthorpe   2021-07-29  143  int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
fffe3cc8c2194f Logan Gunthorpe   2021-07-29  144  		enum dma_data_direction dir, unsigned long attrs);
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  145  dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  146  		size_t size, enum dma_data_direction dir, unsigned long attrs);
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  147  void dma_unmap_resource(struct device *dev, dma_addr_t addr, size_t size,
d3fa60d7bfdc9a Christoph Hellwig 2020-07-08  148  		enum dma_data_direction dir, unsigned long attrs);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  149  void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  150  		gfp_t flag, unsigned long attrs);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  151  void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  152  		dma_addr_t dma_handle, unsigned long attrs);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  153  void *dmam_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  154  		gfp_t gfp, unsigned long attrs);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  155  void dmam_free_coherent(struct device *dev, size_t size, void *vaddr,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  156  		dma_addr_t dma_handle);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  157  int dma_get_sgtable_attrs(struct device *dev, struct sg_table *sgt,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  158  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  159  		unsigned long attrs);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  160  int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  161  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  162  		unsigned long attrs);
e29ccc188f3dae Christoph Hellwig 2019-08-03  163  bool dma_can_mmap(struct device *dev);
159bf19270e80b Logan Gunthorpe   2022-07-08  164  bool dma_pci_p2pdma_supported(struct device *dev);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  165  int dma_set_mask(struct device *dev, u64 mask);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  166  int dma_set_coherent_mask(struct device *dev, u64 mask);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  167  u64 dma_get_required_mask(struct device *dev);
8ae0e970319ac0 Jia He            2023-10-28  168  bool dma_addressing_limited(struct device *dev);
133d624b1cee16 Joerg Roedel      2019-02-07  169  size_t dma_max_mapping_size(struct device *dev);
a229cc14f33953 John Garry        2022-07-14  170  size_t dma_opt_mapping_size(struct device *dev);
6ba99411b858bd Yoshihiro Shimoda 2019-08-28  171  unsigned long dma_get_merge_boundary(struct device *dev);
7d5b5738d1514e Christoph Hellwig 2021-01-28  172  struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
7d5b5738d1514e Christoph Hellwig 2021-01-28  173  		enum dma_data_direction dir, gfp_t gfp, unsigned long attrs);
7d5b5738d1514e Christoph Hellwig 2021-01-28  174  void dma_free_noncontiguous(struct device *dev, size_t size,
7d5b5738d1514e Christoph Hellwig 2021-01-28  175  		struct sg_table *sgt, enum dma_data_direction dir);
7d5b5738d1514e Christoph Hellwig 2021-01-28  176  void *dma_vmap_noncontiguous(struct device *dev, size_t size,
7d5b5738d1514e Christoph Hellwig 2021-01-28  177  		struct sg_table *sgt);
7d5b5738d1514e Christoph Hellwig 2021-01-28  178  void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
7d5b5738d1514e Christoph Hellwig 2021-01-28  179  int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
7d5b5738d1514e Christoph Hellwig 2021-01-28  180  		size_t size, struct sg_table *sgt);
a3f49da23c837a Leon Romanovsky   2024-04-04  181  void dma_set_iova_state(struct dma_iova_state *state, struct page *page,
a3f49da23c837a Leon Romanovsky   2024-04-04  182  			size_t size);
a3f49da23c837a Leon Romanovsky   2024-04-04  183  bool dma_can_use_iova(struct dma_iova_state *state);
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  184  int dma_start_range(struct dma_iova_state *state);
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  185  void dma_end_range(struct dma_iova_state *state);
4efd58fca48c18 Christoph Hellwig 2024-10-05  186  int dma_link_range_attrs(struct dma_iova_state *state, phys_addr_t phys,
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  187  		size_t size, unsigned long attrs);
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  188  #else /* CONFIG_HAS_DMA */
4efd58fca48c18 Christoph Hellwig 2024-10-05  189  static inline dma_addr_t dma_alloc_iova(struct dma_iova_state *state,
3a3a931ee872aa Leon Romanovsky   2024-01-29  190  		phys_addr_t phys, size_t size)
3a3a931ee872aa Leon Romanovsky   2024-01-29  191  {
4efd58fca48c18 Christoph Hellwig 2024-10-05  192  	return DMA_MAPPING_ERROR;
3a3a931ee872aa Leon Romanovsky   2024-01-29  193  }
3a3a931ee872aa Leon Romanovsky   2024-01-29  194  static inline void dma_free_iova(struct dma_iova_state *state)
3a3a931ee872aa Leon Romanovsky   2024-01-29  195  {
3a3a931ee872aa Leon Romanovsky   2024-01-29  196  }
d86a03930160dd Christoph Hellwig 2024-10-05  197  static inline void dma_unlink_and_free_iova(struct dma_iova_state *state,
d86a03930160dd Christoph Hellwig 2024-10-05  198  		dma_addr_t dma_addr, size_t size)
d86a03930160dd Christoph Hellwig 2024-10-05  199  {
d86a03930160dd Christoph Hellwig 2024-10-05  200  }
a0f188d99350ca Leon Romanovsky   2024-01-29  201  static inline dma_addr_t dma_hmm_link_page(struct dma_iova_state *state,
a0f188d99350ca Leon Romanovsky   2024-01-29  202  					   unsigned long *pfn,
a0f188d99350ca Leon Romanovsky   2024-01-29  203  					   dma_addr_t dma_offset)
a0f188d99350ca Leon Romanovsky   2024-01-29  204  {
a0f188d99350ca Leon Romanovsky   2024-01-29  205  	return DMA_MAPPING_ERROR;
a0f188d99350ca Leon Romanovsky   2024-01-29  206  }
a0f188d99350ca Leon Romanovsky   2024-01-29  207  static inline void dma_hmm_unlink_page(struct dma_iova_state *state,
a0f188d99350ca Leon Romanovsky   2024-01-29  208  				       unsigned long *pfn,
a0f188d99350ca Leon Romanovsky   2024-01-29  209  				       dma_addr_t dma_offset)
a0f188d99350ca Leon Romanovsky   2024-01-29  210  {
a0f188d99350ca Leon Romanovsky   2024-01-29  211  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  212  static inline dma_addr_t dma_map_page_attrs(struct device *dev,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  213  		struct page *page, size_t offset, size_t size,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  214  		enum dma_data_direction dir, unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  215  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  216  	return DMA_MAPPING_ERROR;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  217  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  218  static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  219  		size_t size, enum dma_data_direction dir, unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  220  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  221  }
2a047e0662aee1 Christoph Hellwig 2021-08-09  222  static inline unsigned int dma_map_sg_attrs(struct device *dev,
2a047e0662aee1 Christoph Hellwig 2021-08-09  223  		struct scatterlist *sg, int nents, enum dma_data_direction dir,
2a047e0662aee1 Christoph Hellwig 2021-08-09  224  		unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  225  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  226  	return 0;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  227  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  228  static inline void dma_unmap_sg_attrs(struct device *dev,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  229  		struct scatterlist *sg, int nents, enum dma_data_direction dir,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  230  		unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  231  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  232  }
fffe3cc8c2194f Logan Gunthorpe   2021-07-29  233  static inline int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
fffe3cc8c2194f Logan Gunthorpe   2021-07-29  234  		enum dma_data_direction dir, unsigned long attrs)
fffe3cc8c2194f Logan Gunthorpe   2021-07-29  235  {
fffe3cc8c2194f Logan Gunthorpe   2021-07-29  236  	return -EOPNOTSUPP;
fffe3cc8c2194f Logan Gunthorpe   2021-07-29  237  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  238  static inline dma_addr_t dma_map_resource(struct device *dev,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  239  		phys_addr_t phys_addr, size_t size, enum dma_data_direction dir,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  240  		unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  241  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  242  	return DMA_MAPPING_ERROR;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  243  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  244  static inline void dma_unmap_resource(struct device *dev, dma_addr_t addr,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  245  		size_t size, enum dma_data_direction dir, unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  246  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  247  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  248  static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  249  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  250  	return -ENOMEM;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  251  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  252  static inline void *dma_alloc_attrs(struct device *dev, size_t size,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  253  		dma_addr_t *dma_handle, gfp_t flag, unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  254  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  255  	return NULL;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  256  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  257  static void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  258  		dma_addr_t dma_handle, unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  259  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  260  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  261  static inline void *dmam_alloc_attrs(struct device *dev, size_t size,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  262  		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  263  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  264  	return NULL;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  265  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  266  static inline void dmam_free_coherent(struct device *dev, size_t size,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  267  		void *vaddr, dma_addr_t dma_handle)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  268  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  269  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  270  static inline int dma_get_sgtable_attrs(struct device *dev,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  271  		struct sg_table *sgt, void *cpu_addr, dma_addr_t dma_addr,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  272  		size_t size, unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  273  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  274  	return -ENXIO;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  275  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  276  static inline int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  277  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  278  		unsigned long attrs)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  279  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  280  	return -ENXIO;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  281  }
e29ccc188f3dae Christoph Hellwig 2019-08-03  282  static inline bool dma_can_mmap(struct device *dev)
e29ccc188f3dae Christoph Hellwig 2019-08-03  283  {
e29ccc188f3dae Christoph Hellwig 2019-08-03  284  	return false;
e29ccc188f3dae Christoph Hellwig 2019-08-03  285  }
159bf19270e80b Logan Gunthorpe   2022-07-08  286  static inline bool dma_pci_p2pdma_supported(struct device *dev)
159bf19270e80b Logan Gunthorpe   2022-07-08  287  {
159bf19270e80b Logan Gunthorpe   2022-07-08  288  	return false;
159bf19270e80b Logan Gunthorpe   2022-07-08  289  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  290  static inline int dma_set_mask(struct device *dev, u64 mask)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  291  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  292  	return -EIO;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  293  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  294  static inline int dma_set_coherent_mask(struct device *dev, u64 mask)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  295  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  296  	return -EIO;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  297  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  298  static inline u64 dma_get_required_mask(struct device *dev)
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  299  {
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  300  	return 0;
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  301  }
8ae0e970319ac0 Jia He            2023-10-28  302  static inline bool dma_addressing_limited(struct device *dev)
8ae0e970319ac0 Jia He            2023-10-28  303  {
8ae0e970319ac0 Jia He            2023-10-28  304  	return false;
8ae0e970319ac0 Jia He            2023-10-28  305  }
133d624b1cee16 Joerg Roedel      2019-02-07  306  static inline size_t dma_max_mapping_size(struct device *dev)
133d624b1cee16 Joerg Roedel      2019-02-07  307  {
133d624b1cee16 Joerg Roedel      2019-02-07  308  	return 0;
133d624b1cee16 Joerg Roedel      2019-02-07  309  }
a229cc14f33953 John Garry        2022-07-14  310  static inline size_t dma_opt_mapping_size(struct device *dev)
a229cc14f33953 John Garry        2022-07-14  311  {
a229cc14f33953 John Garry        2022-07-14  312  	return 0;
a229cc14f33953 John Garry        2022-07-14  313  }
6ba99411b858bd Yoshihiro Shimoda 2019-08-28  314  static inline unsigned long dma_get_merge_boundary(struct device *dev)
6ba99411b858bd Yoshihiro Shimoda 2019-08-28  315  {
6ba99411b858bd Yoshihiro Shimoda 2019-08-28  316  	return 0;
6ba99411b858bd Yoshihiro Shimoda 2019-08-28  317  }
7d5b5738d1514e Christoph Hellwig 2021-01-28  318  static inline struct sg_table *dma_alloc_noncontiguous(struct device *dev,
7d5b5738d1514e Christoph Hellwig 2021-01-28  319  		size_t size, enum dma_data_direction dir, gfp_t gfp,
7d5b5738d1514e Christoph Hellwig 2021-01-28  320  		unsigned long attrs)
7d5b5738d1514e Christoph Hellwig 2021-01-28  321  {
7d5b5738d1514e Christoph Hellwig 2021-01-28  322  	return NULL;
7d5b5738d1514e Christoph Hellwig 2021-01-28  323  }
7d5b5738d1514e Christoph Hellwig 2021-01-28  324  static inline void dma_free_noncontiguous(struct device *dev, size_t size,
7d5b5738d1514e Christoph Hellwig 2021-01-28  325  		struct sg_table *sgt, enum dma_data_direction dir)
7d5b5738d1514e Christoph Hellwig 2021-01-28  326  {
7d5b5738d1514e Christoph Hellwig 2021-01-28  327  }
7d5b5738d1514e Christoph Hellwig 2021-01-28  328  static inline void *dma_vmap_noncontiguous(struct device *dev, size_t size,
7d5b5738d1514e Christoph Hellwig 2021-01-28  329  		struct sg_table *sgt)
7d5b5738d1514e Christoph Hellwig 2021-01-28  330  {
7d5b5738d1514e Christoph Hellwig 2021-01-28  331  	return NULL;
7d5b5738d1514e Christoph Hellwig 2021-01-28  332  }
7d5b5738d1514e Christoph Hellwig 2021-01-28  333  static inline void dma_vunmap_noncontiguous(struct device *dev, void *vaddr)
7d5b5738d1514e Christoph Hellwig 2021-01-28  334  {
7d5b5738d1514e Christoph Hellwig 2021-01-28  335  }
7d5b5738d1514e Christoph Hellwig 2021-01-28  336  static inline int dma_mmap_noncontiguous(struct device *dev,
7d5b5738d1514e Christoph Hellwig 2021-01-28  337  		struct vm_area_struct *vma, size_t size, struct sg_table *sgt)
7d5b5738d1514e Christoph Hellwig 2021-01-28  338  {
7d5b5738d1514e Christoph Hellwig 2021-01-28  339  	return -EINVAL;
7d5b5738d1514e Christoph Hellwig 2021-01-28  340  }
a3f49da23c837a Leon Romanovsky   2024-04-04  341  static inline void dma_set_iova_state(struct dma_iova_state *state,
a3f49da23c837a Leon Romanovsky   2024-04-04  342  				      struct page *page, size_t size)
a3f49da23c837a Leon Romanovsky   2024-04-04  343  {
a3f49da23c837a Leon Romanovsky   2024-04-04  344  }
a3f49da23c837a Leon Romanovsky   2024-04-04  345  static inline bool dma_can_use_iova(struct dma_iova_state *state)
a3f49da23c837a Leon Romanovsky   2024-04-04  346  {
a3f49da23c837a Leon Romanovsky   2024-04-04  347  	return false;
a3f49da23c837a Leon Romanovsky   2024-04-04  348  }
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  349  static inline int dma_start_range(struct dma_iova_state *state)
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  350  {
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  351  	return -EOPNOTSUPP;
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  352  }
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  353  static inline void dma_end_range(struct dma_iova_state *state)
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  354  {
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  355  }
4efd58fca48c18 Christoph Hellwig 2024-10-05  356  static inline int dma_link_range_attrs(struct dma_iova_state *state,
4efd58fca48c18 Christoph Hellwig 2024-10-05  357  		phys_addr_t phys, size_t size, unsigned long attrs)
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  358  {
b8d87fd0fcd02e Leon Romanovsky   2024-04-18 @359  	return DMA_MAPPING_ERROR;
b8d87fd0fcd02e Leon Romanovsky   2024-04-18  360  }
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  361  #endif /* CONFIG_HAS_DMA */
ed6ccf10f24bdf Christoph Hellwig 2018-12-26  362  

:::::: The code at line 359 was first introduced by commit
:::::: b8d87fd0fcd02e97d5c56e502decbcc1ab3d5f74 dma-mapping: implement link range API

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
