Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F7725A655
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 02:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738634701; cv=none; b=Xfoc2EkJoEi5w0oLwgNC5RGULZUbYVc0scbMUIfhALFXVHTPPQlP+Dkimvxex7azBeVkzNxFfb4PnKVCwE7xD0LiJvTpt1Ic93fw4i7Y25FWpWaKCmRLaFXE6AkYNowgHDd0q4BaTk0dQdvqPcejgSCS8VkkTHRl9++oFeM8HLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738634701; c=relaxed/simple;
	bh=BjC6LXHXLIJnKTywJrfZVHiHZokSbexr9o5mQZ8Il/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZ9uqeeyqyhumBQaZowfS343raeySnT6ka196w+uqzG1QldWfMlml1DmtPiof3Ptj90KVjCWYn2fzGES5G8A7uDuONu9DpdOAIzBgVEBYtV9La4OaJ4eLOWfwul/D7lDXgah3lLLeOWxCiX6IWO4/12SDHZXGoGhnOLCr3OcBYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8kVWqnt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8kVWqnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738634698; x=1770170698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BjC6LXHXLIJnKTywJrfZVHiHZokSbexr9o5mQZ8Il/U=;
  b=S8kVWqntJTx0AliHSjsxD7htTxceLv1IcDG5Yo9BLfY/WU5TzCVAVDcS
   gZ5/FX+WQZA4UMj6J3czWlsIh+wMHCmDthU2/CyyiqSSEAyHzeiuRNF0s
   lZ+BkjPeVmG8ShsohSQWH9j39jBYwZMa/fb5N1LwcZ+5XDSrnrJPRuwut
   4Vr4WcVtAjJArEgXfr/k866OpHdlxYp5WkqjAadoCLMgnUiUfJxr00zIA
   n2tgfZAMa9c00DoajFBktlRZHRUJjBFprreGD5UZ2OHiOxTZt+fMeumDa
   qE4jgMYSWLF4Hm7bGxfhz7usY8R5+smOOTBQN0gISBrWPvF1YIgQJCtMp
   Q==;
X-CSE-ConnectionGUID: rfRlUytrQoGody6bWvTJbg==
X-CSE-MsgGUID: cgfHQHLETxi7RbSwFXk7Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="41978886"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="41978886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 18:04:57 -0800
X-CSE-ConnectionGUID: Cp/SYXmDS0qPj2T2EcyTcg==
X-CSE-MsgGUID: uvSn6KNKQA6lOjln1zB0jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115070599"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Feb 2025 18:04:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf8J4-000rpj-0A;
	Tue, 04 Feb 2025 02:04:54 +0000
Date: Tue, 4 Feb 2025 10:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-mk-pte 7/9]
 drivers/iommu/ipmmu-vmsa.c:437:44: warning: implicit conversion from
 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from
 18446744073709551615 to 4294967295
Message-ID: <202502040903.hKBc7fxI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-mk-pte
head:   44333e58349adcdfcb5b34f6086bf7c01dfd9c9a
commit: a225e946006795d33af26ec560a4f454379959e1 [7/9] um: Remove custom definition of mk_pte()
config: um-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040903.hKBc7fxI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040903.hKBc7fxI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040903.hKBc7fxI-lkp@intel.com/

All warnings (new ones prefixed by >>):

         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/ipmmu-vmsa.c:11:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/ipmmu-vmsa.c:11:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/ipmmu-vmsa.c:11:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iommu/ipmmu-vmsa.c:11:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iommu/ipmmu-vmsa.c:11:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/iommu/ipmmu-vmsa.c:437:44: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     437 |         domain->io_domain.geometry.aperture_end = DMA_BIT_MASK(32);
         |                                                 ~ ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:40: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   41 warnings and 2 errors generated.
--
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/rockchip-iommu.c:13:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/rockchip-iommu.c:13:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/rockchip-iommu.c:13:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iommu/rockchip-iommu.c:13:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iommu/rockchip-iommu.c:13:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/iommu/rockchip-iommu.c:1083:46: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1083 |         rk_domain->domain.geometry.aperture_end   = DMA_BIT_MASK(32);
         |                                                   ~ ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:40: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   41 warnings and 2 errors generated.
--
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     163 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:141:3: note: expanded from macro '_SIG_SET_BINOP'
     141 |                 r->sig[2] = op(a2, b2);                                 \
         |                 ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/ethernet/natsemi/ns83820.c:87:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:27: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/ethernet/natsemi/ns83820.c:87:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/ethernet/natsemi/ns83820.c:87:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/ethernet/natsemi/ns83820.c:87:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> drivers/net/ethernet/natsemi/ns83820.c:850:23: warning: shift count >= width of type [-Wshift-count-overflow]
     850 |                 dma_addr_t bufptr = desc_addr_get(desc + DESC_BUFPTR);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/natsemi/ns83820.c:375:58: note: expanded from macro 'desc_addr_get'
     375 |         (HW_ADDR_LEN == 8 ? ((dma_addr_t)le32_to_cpu((desc)[1]))<<32 : 0))
         |                                                                 ^ ~~
   drivers/net/ethernet/natsemi/ns83820.c:988:10: warning: shift count >= width of type [-Wshift-count-overflow]
     988 |                 addr = desc_addr_get(desc + DESC_BUFPTR);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/natsemi/ns83820.c:375:58: note: expanded from macro 'desc_addr_get'
     375 |         (HW_ADDR_LEN == 8 ? ((dma_addr_t)le32_to_cpu((desc)[1]))<<32 : 0))
         |                                                                 ^ ~~
   drivers/net/ethernet/natsemi/ns83820.c:1025:7: warning: shift count >= width of type [-Wshift-count-overflow]
    1025 |                                          desc_addr_get(desc + DESC_BUFPTR),
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/natsemi/ns83820.c:375:58: note: expanded from macro 'desc_addr_get'
     375 |         (HW_ADDR_LEN == 8 ? ((dma_addr_t)le32_to_cpu((desc)[1]))<<32 : 0))
         |                                                                 ^ ~~
   include/linux/dma-mapping.h:461:64: note: expanded from macro 'dma_unmap_single'
     461 | #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
         |                                                                ^
   drivers/net/ethernet/natsemi/ns83820.c:1704:6: warning: variable 'loops' set but not used [-Wunused-but-set-variable]
    1704 |         int loops = 0;
         |             ^
   drivers/net/ethernet/natsemi/ns83820.c:1907:32: warning: shift count >= width of type [-Wshift-count-overflow]
    1907 |                 !dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(64))) {
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   45 warnings and 2 errors generated.


vim +437 drivers/iommu/ipmmu-vmsa.c

892db541cc68eb Geert Uytterhoeven 2019-05-27  416  
892db541cc68eb Geert Uytterhoeven 2019-05-27  417  static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
892db541cc68eb Geert Uytterhoeven 2019-05-27  418  {
892db541cc68eb Geert Uytterhoeven 2019-05-27  419  	int ret;
892db541cc68eb Geert Uytterhoeven 2019-05-27  420  
892db541cc68eb Geert Uytterhoeven 2019-05-27  421  	/*
892db541cc68eb Geert Uytterhoeven 2019-05-27  422  	 * Allocate the page table operations.
892db541cc68eb Geert Uytterhoeven 2019-05-27  423  	 *
892db541cc68eb Geert Uytterhoeven 2019-05-27  424  	 * VMSA states in section B3.6.3 "Control of Secure or Non-secure memory
892db541cc68eb Geert Uytterhoeven 2019-05-27  425  	 * access, Long-descriptor format" that the NStable bit being set in a
892db541cc68eb Geert Uytterhoeven 2019-05-27  426  	 * table descriptor will result in the NStable and NS bits of all child
892db541cc68eb Geert Uytterhoeven 2019-05-27  427  	 * entries being ignored and considered as being set. The IPMMU seems
892db541cc68eb Geert Uytterhoeven 2019-05-27  428  	 * not to comply with this, as it generates a secure access page fault
892db541cc68eb Geert Uytterhoeven 2019-05-27  429  	 * if any of the NStable and NS bits isn't set when running in
892db541cc68eb Geert Uytterhoeven 2019-05-27  430  	 * non-secure mode.
892db541cc68eb Geert Uytterhoeven 2019-05-27  431  	 */
892db541cc68eb Geert Uytterhoeven 2019-05-27  432  	domain->cfg.quirks = IO_PGTABLE_QUIRK_ARM_NS;
892db541cc68eb Geert Uytterhoeven 2019-05-27  433  	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
892db541cc68eb Geert Uytterhoeven 2019-05-27  434  	domain->cfg.ias = 32;
892db541cc68eb Geert Uytterhoeven 2019-05-27  435  	domain->cfg.oas = 40;
298f78895b0819 Will Deacon        2019-07-02  436  	domain->cfg.tlb = &ipmmu_flush_ops;
892db541cc68eb Geert Uytterhoeven 2019-05-27 @437  	domain->io_domain.geometry.aperture_end = DMA_BIT_MASK(32);
892db541cc68eb Geert Uytterhoeven 2019-05-27  438  	domain->io_domain.geometry.force_aperture = true;
892db541cc68eb Geert Uytterhoeven 2019-05-27  439  	/*
892db541cc68eb Geert Uytterhoeven 2019-05-27  440  	 * TODO: Add support for coherent walk through CCI with DVM and remove
892db541cc68eb Geert Uytterhoeven 2019-05-27  441  	 * cache handling. For now, delegate it to the io-pgtable code.
892db541cc68eb Geert Uytterhoeven 2019-05-27  442  	 */
3430abd6f403ce Joerg Roedel       2019-07-01  443  	domain->cfg.coherent_walk = false;
892db541cc68eb Geert Uytterhoeven 2019-05-27  444  	domain->cfg.iommu_dev = domain->mmu->root->dev;
892db541cc68eb Geert Uytterhoeven 2019-05-27  445  
892db541cc68eb Geert Uytterhoeven 2019-05-27  446  	/*
892db541cc68eb Geert Uytterhoeven 2019-05-27  447  	 * Find an unused context.
892db541cc68eb Geert Uytterhoeven 2019-05-27  448  	 */
892db541cc68eb Geert Uytterhoeven 2019-05-27  449  	ret = ipmmu_domain_allocate_context(domain->mmu->root, domain);
892db541cc68eb Geert Uytterhoeven 2019-05-27  450  	if (ret < 0)
892db541cc68eb Geert Uytterhoeven 2019-05-27  451  		return ret;
892db541cc68eb Geert Uytterhoeven 2019-05-27  452  
892db541cc68eb Geert Uytterhoeven 2019-05-27  453  	domain->context_id = ret;
892db541cc68eb Geert Uytterhoeven 2019-05-27  454  
892db541cc68eb Geert Uytterhoeven 2019-05-27  455  	domain->iop = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &domain->cfg,
892db541cc68eb Geert Uytterhoeven 2019-05-27  456  					   domain);
892db541cc68eb Geert Uytterhoeven 2019-05-27  457  	if (!domain->iop) {
892db541cc68eb Geert Uytterhoeven 2019-05-27  458  		ipmmu_domain_free_context(domain->mmu->root,
892db541cc68eb Geert Uytterhoeven 2019-05-27  459  					  domain->context_id);
892db541cc68eb Geert Uytterhoeven 2019-05-27  460  		return -EINVAL;
892db541cc68eb Geert Uytterhoeven 2019-05-27  461  	}
d25a2a16f0889d Laurent Pinchart   2014-04-02  462  
892db541cc68eb Geert Uytterhoeven 2019-05-27  463  	ipmmu_domain_setup_context(domain);
d25a2a16f0889d Laurent Pinchart   2014-04-02  464  	return 0;
d25a2a16f0889d Laurent Pinchart   2014-04-02  465  }
d25a2a16f0889d Laurent Pinchart   2014-04-02  466  

:::::: The code at line 437 was first introduced by commit
:::::: 892db541cc68eb39d7813af34f33ce74a0014a1d iommu/ipmmu-vmsa: Extract hardware context initialization

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
