Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2B4A3E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 02:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738377061; cv=none; b=m7oJiPsenpUyq08ziwbH8ohwRC98gmmem9k4+LJ4rQX9BUehokTf1jzpMNNdVPECYO17SWlI2iV71ZWP98s/xRlL/o6Kmv6q1Wy4PvyrNyfhYa6gtxfBjJqCh7PYkxMuOghqHa5QegPNuXvXXi7vuzOU2SDaqC+rUqI5py1HmFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738377061; c=relaxed/simple;
	bh=jIdbeTe6+04WhwVzja9KKvir/vvyOVWL/+4OoiZ46mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iRkiMzH8PTSzvTod4ivaZuXRFEtEkweeNewaZvT+vsUgUay+GE26uZ2OuziOG3vlfd9Jvf2bq3vRj46QftrFanojC1hhB1S4RCulrTx18enzrAR+n7hszQ2BBVXnh2Fjv3j/rtbu6IrNV3grs3tCe5WGzAaxcNF4AQN319kCiCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLRNjUGk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLRNjUGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738377059; x=1769913059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jIdbeTe6+04WhwVzja9KKvir/vvyOVWL/+4OoiZ46mw=;
  b=QLRNjUGkh0L01uafmYbqSlcvPaRPPwQPBvyVNAHV7LeA8u8HVuMK3klE
   Rskcq38SVU5GP0rAEk2uQVFv7oc4UnodMdQ05fto+Db5VlWdrulLggItl
   Koy0WImIs7nLBM+aS6XGRpVObbhLSg+hN8u5QOME3FUIgpgWzt/QIDd/e
   EmYsZsFp7SSGpvANx5O4Is5ghjRzRQtMWPdjEMj+hNeHRrj+44J/8UBQ2
   NKCPfBO5D0BDXjZ5Rrz23BvdiXB62XRRF+fvO5J+H+4w9W0/f1S76pSYD
   Gt1+6x1NPzyYyotUteBXxhweUyyAYpQk6PGyA9Q/Pf7CNT2ZSYfklvNKP
   g==;
X-CSE-ConnectionGUID: U2oS22n5Ssm2tfjurB73AA==
X-CSE-MsgGUID: uLrxIa1NRTuGzp8rFDGoCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38160625"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="38160625"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 18:30:59 -0800
X-CSE-ConnectionGUID: XwREK62IRaWzk1xmKqaPGA==
X-CSE-MsgGUID: Vk7tIN3RSR+tQcvv//XJNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133040941"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2025 18:30:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te3Hb-000nd3-08;
	Sat, 01 Feb 2025 02:30:55 +0000
Date: Sat, 1 Feb 2025 10:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-mk-pte 7/9]
 sound/pci/ctxfi/cthw20k2.c:2029:43: warning: shift count >= width of type
Message-ID: <202502011055.NNbcHSGc-lkp@intel.com>
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
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250201/202502011055.NNbcHSGc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011055.NNbcHSGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011055.NNbcHSGc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:27: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k2.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:10: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k2.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k2.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k2.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k2.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> sound/pci/ctxfi/cthw20k2.c:2029:43: warning: shift count >= width of type [-Wshift-count-overflow]
    2029 |         if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(dma_bits)))
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   62 warnings and 2 errors generated.
--
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:27: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k1.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:10: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k1.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k1.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k1.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/pci/ctxfi/cthw20k1.c:16:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> sound/pci/ctxfi/cthw20k1.c:1904:43: warning: shift count >= width of type [-Wshift-count-overflow]
    1904 |         if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(dma_bits)))
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   62 warnings and 2 errors generated.
--
         |         ^
   In file included from drivers/crypto/hisilicon/sec/sec_algs.c:4:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/crypto/hisilicon/sec/sec_algs.c:4:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/crypto/hisilicon/sec/sec_algs.c:4:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/crypto/hisilicon/sec/sec_algs.c:4:
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
   In file included from drivers/crypto/hisilicon/sec/sec_algs.c:4:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/crypto/hisilicon/sec/sec_algs.c:4:
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
>> drivers/crypto/hisilicon/sec/sec_algs.c:912:2: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     912 |         INIT_KFIFO(ctx->queue->softqueue);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:135:69: note: expanded from macro 'INIT_KFIFO'
     135 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
         |                       ~                             ~~~~~~~~~~~~~~~~~~~~~~~^~~
   62 warnings and 2 errors generated.
..


vim +2029 sound/pci/ctxfi/cthw20k2.c

bc5304b6fb6c57 Takashi Iwai    2009-07-20  2016  
8cc72361481f00 Wai Yew CHAY    2009-05-14  2017  static int hw_card_start(struct hw *hw)
8cc72361481f00 Wai Yew CHAY    2009-05-14  2018  {
8cc72361481f00 Wai Yew CHAY    2009-05-14  2019  	int err = 0;
8cc72361481f00 Wai Yew CHAY    2009-05-14  2020  	struct pci_dev *pci = hw->pci;
8cc72361481f00 Wai Yew CHAY    2009-05-14  2021  	unsigned int gctl;
15c75b09f8d190 Takashi Iwai    2017-02-28  2022  	const unsigned int dma_bits = BITS_PER_LONG;
8cc72361481f00 Wai Yew CHAY    2009-05-14  2023  
8cc72361481f00 Wai Yew CHAY    2009-05-14  2024  	err = pci_enable_device(pci);
8cc72361481f00 Wai Yew CHAY    2009-05-14  2025  	if (err < 0)
8cc72361481f00 Wai Yew CHAY    2009-05-14  2026  		return err;
8cc72361481f00 Wai Yew CHAY    2009-05-14  2027  
8cc72361481f00 Wai Yew CHAY    2009-05-14  2028  	/* Set DMA transfer mask */
669f65eaeb969e Takashi Iwai    2021-01-14 @2029  	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(dma_bits)))
669f65eaeb969e Takashi Iwai    2021-01-14  2030  		dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32));
8cc72361481f00 Wai Yew CHAY    2009-05-14  2031  
29959a09cc1aab Wai Yew CHAY    2009-06-22  2032  	if (!hw->io_base) {
8cc72361481f00 Wai Yew CHAY    2009-05-14  2033  		err = pci_request_regions(pci, "XFi");
8cc72361481f00 Wai Yew CHAY    2009-05-14  2034  		if (err < 0)
8cc72361481f00 Wai Yew CHAY    2009-05-14  2035  			goto error1;
8cc72361481f00 Wai Yew CHAY    2009-05-14  2036  
8cc72361481f00 Wai Yew CHAY    2009-05-14  2037  		hw->io_base = pci_resource_start(hw->pci, 2);
7a7686bd0d153c Sudip Mukherjee 2014-09-23  2038  		hw->mem_base = ioremap(hw->io_base,
8cc72361481f00 Wai Yew CHAY    2009-05-14  2039  				       pci_resource_len(hw->pci, 2));
35ebf6e7210dc0 Takashi Iwai    2009-07-22  2040  		if (!hw->mem_base) {
8cc72361481f00 Wai Yew CHAY    2009-05-14  2041  			err = -ENOENT;
8cc72361481f00 Wai Yew CHAY    2009-05-14  2042  			goto error2;
8cc72361481f00 Wai Yew CHAY    2009-05-14  2043  		}
29959a09cc1aab Wai Yew CHAY    2009-06-22  2044  	}
8cc72361481f00 Wai Yew CHAY    2009-05-14  2045  
8cc72361481f00 Wai Yew CHAY    2009-05-14  2046  	/* Switch to 20k2 mode from UAA mode. */
8cc72361481f00 Wai Yew CHAY    2009-05-14  2047  	gctl = hw_read_20kx(hw, GLOBAL_CNTL_GCTL);
8cc72361481f00 Wai Yew CHAY    2009-05-14  2048  	set_field(&gctl, GCTL_UAA, 0);
8cc72361481f00 Wai Yew CHAY    2009-05-14  2049  	hw_write_20kx(hw, GLOBAL_CNTL_GCTL, gctl);
8cc72361481f00 Wai Yew CHAY    2009-05-14  2050  
bc5304b6fb6c57 Takashi Iwai    2009-07-20  2051  	if (hw->irq < 0) {
bc5304b6fb6c57 Takashi Iwai    2009-07-20  2052  		err = request_irq(pci->irq, ct_20k2_interrupt, IRQF_SHARED,
934c2b6d0cb50f Takashi Iwai    2011-06-10  2053  				  KBUILD_MODNAME, hw);
bc5304b6fb6c57 Takashi Iwai    2009-07-20  2054  		if (err < 0) {
0cae90a96c15f2 Sudip Mukherjee 2014-09-29  2055  			dev_err(hw->card->dev,
0cae90a96c15f2 Sudip Mukherjee 2014-09-29  2056  				"XFi: Cannot get irq %d\n", pci->irq);
bc5304b6fb6c57 Takashi Iwai    2009-07-20  2057  			goto error2;
8cc72361481f00 Wai Yew CHAY    2009-05-14  2058  		}
8cc72361481f00 Wai Yew CHAY    2009-05-14  2059  		hw->irq = pci->irq;
5e0890c1cb7dbc Takashi Iwai    2019-12-10  2060  		hw->card->sync_irq = hw->irq;
bc5304b6fb6c57 Takashi Iwai    2009-07-20  2061  	}
8cc72361481f00 Wai Yew CHAY    2009-05-14  2062  
8cc72361481f00 Wai Yew CHAY    2009-05-14  2063  	pci_set_master(pci);
8cc72361481f00 Wai Yew CHAY    2009-05-14  2064  
8cc72361481f00 Wai Yew CHAY    2009-05-14  2065  	return 0;
8cc72361481f00 Wai Yew CHAY    2009-05-14  2066  

:::::: The code at line 2029 was first introduced by commit
:::::: 669f65eaeb969ef60811939a5811479d3e8087af ALSA: pci: Simplify with dma_set_mask_and_coherent()

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
