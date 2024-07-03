Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E8216F827
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012721; cv=none; b=IIpXzbDS3R4qjWLZgMHDb6ojBHQeRNlQD8Z4dn837UoqV6MxcgkNESvzQRLqNkrPxHuy4KEJ19NrR+092C90XN2ZG1LhSrq2wRPgPOxoZl5oQsB/H1B4BE2KwF0HjNSmlvw5qC18XTzQpWZCiYRiijMHUDY1OLs/4Mc+ILub7j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012721; c=relaxed/simple;
	bh=GBFDRnjMbd/IFldkxyvyXIcW+bwrngyp/0wd6Nxv6K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lTuoI6P5uocL6muy04MUoyJCuWjLCvlHA78TJQhOCfV4HMjHZcysZBU4MRbl59R6CaPtzC0ZvF3HdHi30Aw7/z4qheTZDtBEWUeVs07gy/lp0Hp8DUZE6szj3plBN8YHQPUnBCl4hth9dBpiAA3I2+IgOz7kx+EqcaxddLJ8FwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXfJQS5/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXfJQS5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720012719; x=1751548719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GBFDRnjMbd/IFldkxyvyXIcW+bwrngyp/0wd6Nxv6K0=;
  b=bXfJQS5/5eYd03iK80ocTGAX1c/7i7+Avs1ttTOrZg9IZKeRf/StZL1k
   SE3P29AVP2xzh7ljcrCbUeOsQMHPhsV9+2vJcn4CCRcQft1EPCuEPlSYV
   p91KeLokbeIqddxupJIl4jD+nePBC9kY4qERkSlHC3/EqRU74qxlBEWFC
   35cco9X4HNkssguHM3rv7/k973JtZRgf3EPipBfL6lZijEw3+hOrwSMKT
   relOOTlyVhZbmIn1a4nlyhXFaBHEc5x2gRbDyzopCFrBvhJn3sFsvi8o5
   ehwwYiuHwVoXqrX/SRNgGo30I9dU+G0dRaeWV4eDbVYM4tMyNt3tnBiro
   Q==;
X-CSE-ConnectionGUID: gzeG/XVFS0WXb39CG9Xyxw==
X-CSE-MsgGUID: xwwIQCcqTZGintQv6wbsuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17449831"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="17449831"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 06:18:39 -0700
X-CSE-ConnectionGUID: e4WgM56KRmOdvM1PAfLpJA==
X-CSE-MsgGUID: cSKVfupzSTWNkOWlxdZ6ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="50691957"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2024 06:18:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOzsZ-000Pkn-35;
	Wed, 03 Jul 2024 13:18:35 +0000
Date: Wed, 3 Jul 2024 21:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 6/6] include/linux/rmap.h:286:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202407032146.8YPjnhd4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   ff5e85c45e818366d70159de7e6e0d0cc781d2cb
commit: ff5e85c45e818366d70159de7e6e0d0cc781d2cb [6/6] rmap_id
config: s390-randconfig-r071-20240703 (https://download.01.org/0day-ci/archive/20240703/202407032146.8YPjnhd4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407032146.8YPjnhd4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407032146.8YPjnhd4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/main.c:29:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from init/main.c:29:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from init/main.c:29:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
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
   In file included from init/main.c:62:
>> include/linux/rmap.h:286:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     286 |         case RMAP_ID_UNIT_4UL_MIN_ORDER ... RMAP_ID_UNIT_4UL_MAX_ORDER:
         |         ^
   include/linux/rmap.h:286:2: note: insert '__attribute__((fallthrough));' to silence this warning
     286 |         case RMAP_ID_UNIT_4UL_MIN_ORDER ... RMAP_ID_UNIT_4UL_MAX_ORDER:
         |         ^
         |         __attribute__((fallthrough)); 
   include/linux/rmap.h:286:2: note: insert 'break;' to avoid fall-through
     286 |         case RMAP_ID_UNIT_4UL_MIN_ORDER ... RMAP_ID_UNIT_4UL_MAX_ORDER:
         |         ^
         |         break; 
   13 warnings generated.


vim +286 include/linux/rmap.h

   275	
   276	static inline void __folio_undo_large_mapcount_metadata(struct folio *folio,
   277			unsigned int order)
   278	{
   279	#ifdef CONFIG_DEBUG_VM
   280		VM_WARN_ON_ONCE(folio_large_mapcount_is_locked(folio));
   281		switch (order) {
   282		case RMAP_ID_UNIT_7UL_MIN_ORDER ... RMAP_ID_UNIT_7UL_MAX_ORDER:
   283			VM_WARN_ON_ONCE(folio->_rmap_sum6);
   284			VM_WARN_ON_ONCE(folio->_rmap_sum5);
   285			VM_WARN_ON_ONCE(folio->_rmap_sum4);
 > 286		case RMAP_ID_UNIT_4UL_MIN_ORDER ... RMAP_ID_UNIT_4UL_MAX_ORDER:
   287			VM_WARN_ON_ONCE(folio->_rmap_sum3);
   288			VM_WARN_ON_ONCE(folio->_rmap_sum2);
   289			fallthrough;
   290		case RMAP_ID_UNIT_2UL_MIN_ORDER ... RMAP_ID_UNIT_2UL_MAX_ORDER:
   291			VM_WARN_ON_ONCE(folio->_rmap_sum1);
   292			fallthrough;
   293		default:
   294			VM_WARN_ON_ONCE(folio->_rmap_sum0);
   295			break;
   296		}
   297	#endif /* CONFIG_DEBUG_VM */
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
