Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AB67C6DF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026891; cv=none; b=KMJNmbDGm3dkOOnZZBMTM4GGfKQvxgxgKtdKK1AmIBuiQRFcZwo3tiMg04WPs5adMVmN2EQp4rdh59HEA8m0T4P+16RDrcXRvMZhXEGhUwLgNQSIwxz5rW9bwl0+q4eW/OKcRbgxfQprEWT5PeO5OouuarOsEarUI3f1xjauWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026891; c=relaxed/simple;
	bh=oew3dtEZkSQsyDp/vpygwbfO+3aPOVJ2f7ERiGfGNqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhRSrAvFbMdl8/84TMbDrcAeo5XQLDqLS/E9CZT+Y7AwcDTRQE6hbgjYy6WKIsH88A7sWZWQMz70meEO6tT8LnSYJSZiCZrPRvN+Nf2JrstD+EAfSwRWmPgqLt5qKDir510zjePmRQZ0YyEennBNzlKxZyGKiVaBKrMm8I9LghE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQ0KfmcN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQ0KfmcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711026890; x=1742562890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oew3dtEZkSQsyDp/vpygwbfO+3aPOVJ2f7ERiGfGNqo=;
  b=WQ0KfmcNT32fr9pqdVA/EgKOLdDTD76XFcHc7dBFu3o/AJPek07m+uPy
   gDj2AY74B43q33LGCF43641aYD1gfPrRwmp9rv4qiI53fVEoYyYYIciuM
   IAbgfQlRAjlVbeNgQ7/RA/Ci1yT+dNiM1+AF9wgLT/ZWxxIIVZStmPt3h
   dm+QVCam1YLDYM4xGRjkFgxRZTeebprObrM1vujmyGEMlR8D0ZzKjNaIe
   mEyZjLG74nMQTXwloBKLAN/0NhEBcvDWtBMkTSjOtFnPmI/ZALtLdByZm
   tIfGMW/9N4h2b217LKPrABTLZK1KZP0gNagqBQj6UL367Uo/0QLOZSSum
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5904348"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5904348"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 06:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="18974596"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Mar 2024 06:14:47 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnIFo-000JRf-1b;
	Thu, 21 Mar 2024 13:14:44 +0000
Date: Thu, 21 Mar 2024 21:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:twf-hoist 568/627] fs/iomap/buffered-io.c:432:10: error:
 call to undeclared function 'iomap_fsverity_read_bio_alloc'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202403212141.pyxaqHG7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git twf-hoist
head:   709c2aed7586c3ac6a9d636355c623611d5c14d1
commit: f0f93bf8ee6030bdb20d406b20b6632cac7aa8bc [568/627] iomap: dynamically allocate fsverity bioset
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240321/202403212141.pyxaqHG7-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403212141.pyxaqHG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403212141.pyxaqHG7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/iomap/buffered-io.c:10:
   In file included from include/linux/iomap.h:7:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/iomap/buffered-io.c:10:
   In file included from include/linux/iomap.h:7:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/iomap/buffered-io.c:10:
   In file included from include/linux/iomap.h:7:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> fs/iomap/buffered-io.c:432:10: error: call to undeclared function 'iomap_fsverity_read_bio_alloc'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
                          ^
   fs/iomap/buffered-io.c:432:10: note: did you mean 'iomap_read_bio_alloc'?
   fs/iomap/buffered-io.c:426:20: note: 'iomap_read_bio_alloc' declared here
   static struct bio *iomap_read_bio_alloc(struct inode *inode,
                      ^
   fs/iomap/buffered-io.c:432:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct bio *' [-Wint-conversion]
                   return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 2 errors generated.


vim +/iomap_fsverity_read_bio_alloc +432 fs/iomap/buffered-io.c

   425	
   426	static struct bio *iomap_read_bio_alloc(struct inode *inode,
   427			struct block_device *bdev, int nr_vecs, gfp_t gfp)
   428	{
   429		struct bio *bio;
   430	
   431		if (fsverity_active(inode))
 > 432			return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
   433	
   434		bio = bio_alloc(bdev, nr_vecs, REQ_OP_READ, gfp);
   435		if (bio)
   436			bio->bi_end_io = iomap_read_end_io;
   437		return bio;
   438	}
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
