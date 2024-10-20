Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CFF194C78
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729449669; cv=none; b=UKj82WLnGaANZifM48i11RSPMWfpxNO9giJzCRO6H4qoY7TLNbbOGbB6O3JG5xN5sRrynqXB354nq41UMT71d4Mxst+ytmu45ldYAbF1Kz9HGA82IvMW3p6zs0nGCEGvW2O6bUrqSiXir3XXBumiawaRzbzZy7NIu2qckuGA7po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729449669; c=relaxed/simple;
	bh=S6e4qHXws3LBaGWzAPRnJQX6u1kW8fxt5hm2/FDeLww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMgrZamujunqYf/c6iVmio9j4PKF6HGwWa9aXF6uIGv23Qpox2rE0JAXEV3c/AqHdsLDsqg/IWUrctrGAdBbK79L88P2ydTFFOrwoaJ1eUym8N6Z/awi9CcLZ/m3toAMZnPcGv/+9LjD733uo3Lmjc6DZaFd+ghjD4zEZmVVi3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddWUoeE+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddWUoeE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729449667; x=1760985667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6e4qHXws3LBaGWzAPRnJQX6u1kW8fxt5hm2/FDeLww=;
  b=ddWUoeE+wI9x7WxVDNEbJKIvnaX5SsWOsJXIGzEsFPrHrbFuduCyZU0a
   IDbNyTQWSfsNMpVY2+pjelXrJ/Izyz2hygOaAbnsHaJ8U43weFH3hj4mJ
   dx9d+uIadC7PCtqaQggc0bD4Y1A7KB0manpq82cprcWGXRLciBjLtZRr3
   s/qhP57LH3iADuxWTwFOd1FugIAJ97yPh229+/6kSIAEIUdIa3iaugbcd
   nQZGkoXcURlj4jXhicXKbp902kECtp0S7zOJlP7vf56RZ4vr6yfxnNKLs
   3nRPMi36YYYUsuzmLNCepsnSEw5thCWqEz2rMFoMKBwgGPo+6vQ5Gnlld
   Q==;
X-CSE-ConnectionGUID: JpN2COakQmyVq5oXqayeKQ==
X-CSE-MsgGUID: NfjCIIKoTh6BEgFDCjgFnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="39515121"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="39515121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 11:41:04 -0700
X-CSE-ConnectionGUID: +uuJogFRSaKu8XU8KJfqmQ==
X-CSE-MsgGUID: 8EQso1pDQyC8TESPPHEWeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84141973"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Oct 2024 11:41:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2arM-000QhJ-2A;
	Sun, 20 Oct 2024 18:41:00 +0000
Date: Mon, 21 Oct 2024 02:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-split-wip 7/8] block/blk-merge.c:571:43: error: too
 many arguments to function call, expected 4, have 5
Message-ID: <202410210207.PQlkW8lg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-split-wip
head:   9fc25a7b75656585da9e0c3d06d09c93581585f5
commit: d50f6fc2c4dd093d5e21baefd10df6df2cb31cc7 [7/8] FOLD: remove the mapped_size counter
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241021/202410210207.PQlkW8lg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210207.PQlkW8lg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210207.PQlkW8lg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/blk-merge.c:7:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from block/blk-merge.c:7:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from block/blk-merge.c:7:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
>> block/blk-merge.c:571:43: error: too many arguments to function call, expected 4, have 5
     571 |         dma_iova_sync(dma_dev, state, 0, mapped, 0);
         |         ~~~~~~~~~~~~~                            ^
   include/linux/dma-mapping.h:333:19: note: 'dma_iova_sync' declared here
     333 | static inline int dma_iova_sync(struct device *dev,
         |                   ^             ~~~~~~~~~~~~~~~~~~~
     334 |                 struct dma_iova_state *state, size_t size, int ret)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-merge.c:575:43: error: too many arguments to function call, expected 4, have 5
     575 |         dma_iova_sync(dma_dev, state, 0, mapped, error);
         |         ~~~~~~~~~~~~~                            ^~~~~
   include/linux/dma-mapping.h:333:19: note: 'dma_iova_sync' declared here
     333 | static inline int dma_iova_sync(struct device *dev,
         |                   ^             ~~~~~~~~~~~~~~~~~~~
     334 |                 struct dma_iova_state *state, size_t size, int ret)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 2 errors generated.


vim +571 block/blk-merge.c

   546	
   547	static bool blk_rq_dma_map_iova(struct request *req, struct device *dma_dev,
   548			struct dma_iova_state *state, struct blk_dma_iter *iter,
   549			struct phys_vec *vec)
   550	{
   551		unsigned int total_len = blk_rq_payload_bytes(req);
   552		enum dma_data_direction dir = rq_dma_dir(req);
   553		unsigned int mapped = 0;
   554		int error = 0;
   555	
   556		iter->len = total_len;
   557		iter->addr = dma_iova_alloc(dma_dev, state, vec->paddr, total_len);
   558		if (dma_mapping_error(dma_dev, iter->addr)) {
   559			iter->status = BLK_STS_RESOURCE;
   560			return false;
   561		}
   562	
   563		do {
   564			error = dma_iova_link(dma_dev, state, vec->paddr, mapped,
   565					vec->len, dir, 0);
   566			if (error)
   567				goto fail;
   568			mapped += vec->len;
   569		} while (blk_map_iter_next(req, &iter->iter, vec));
   570	
 > 571		dma_iova_sync(dma_dev, state, 0, mapped, 0);
   572		return true;
   573	
   574	fail:
   575		dma_iova_sync(dma_dev, state, 0, mapped, error);
   576		iter->status = errno_to_blk_status(error);
   577		return false;
   578	}
   579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
