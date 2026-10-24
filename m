Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792804931;
	b=b0QGvHOD/YAjJGZNUzNbDFb6O2IG/fc2kDC7hqq0wc/rQnmpTHEu0q1bAc6ZwuUL6Tbt
	 Hit615YHSrfOEIQKCuLiRGbOTJotFTTBpxkkO2WMN9UM7JiUIXEWRi7VUZJC/KbEV2Py6
	 teFHdkZPPPc8Vp0tG+2+wWU7vK3CncUtHil7cVc2tCKe69jWk4UA0osaMJ8iwFlc1UJx7
	 XQe215GbBmmRIBPjSMVhVm+F6MdoRFxzhcp6JuVCULWOGRO4w2VF2vUiYqRhmvC0e1JdF
	 mPMxRCz3agEhEm0fQXlEzulwmm835sxNxwkXXJywJzjbOeVk4ZRK82bQXrMlf0LrRTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792804931;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dXomDKP+6iC1x+hzsBsheI6h0HuapY+wMa9qS4PkLWw=;
	b=YavCRZxya7QHWJeqAHvm7QS6HdhmKLmE5x+3GKWwrJTts39iBlfd2L+11DQvJHu7qBMI
	 EZKW/WlyCKdSnyMGZuEgVS8estShpbNNYFclAabyyXGyEiESDD3cAZeVnLe9tOlgO49Hj
	 2kbrpvv9udSKIXGADPx94ktbWWjivnJEzIx+/LVW04QPv5fFzu6l0pGKPYJZSNa/XiPcB
	 qXEkHaSbpWzqvlDv8cNkvj7YNjMmeLDUqI7mqNKL1FOdMLVQoEhQgyJI7Uz7s/N6e6VeS
	 oHjM4mwMNotaTm6Avru79qEG6Z4q2lsKJRvBKAMYvLcM8RS2mr7Rf8pNmpYM4bgFwkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMdPlN1N;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DEC606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 01:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80DEC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMdPlN1N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792804931; x=1824340931;
  h=date:from:to:cc:subject:message-id;
  bh=kNm67cH1/VOMjNHmc6oAYnWZ8+jsHnjI62xbL61Z0L8=;
  b=JMdPlN1NRdSFltL2p8fIToAQ6i8ZzNvxfwjzAADqq0vev1SOALTje1Rz
   d1HpS/hNSdN7N4pL34JHsXI8W72rax/q/VX0a6F4gceWwNSf/Rz/IEEPP
   Q2l8D98LYJMVuF599kMMbRSgTkz/roOAtpEvnecQgl/bg5WPBQK9Rq/sF
   SRch1OSAWH9i3nI6z8x+5EXiStDKu2x2n/w/YmVt/BRiaE62nsvkwFyXj
   HL/oE+kubL3OiGDE2AI2wYJIb5MdPqxFMosq0DRSwjsbgFSslEH1ki2bm
   h2+GgXaLSWNc8oL/Mlad8Cvleta7Ik8MkLUqrFwT48qX4MxkD5wjUE7WN
   Q==;
X-CSE-ConnectionGUID: /f1ruSzUQmivZqJ7hNZCDw==
X-CSE-MsgGUID: C+yeZpZjQm+MjS9ZmSxoag==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1452288"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1452288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 18:22:09 -0700
X-CSE-ConnectionGUID: wJ5nnj7iRbqrmkOVkmHL3w==
X-CSE-MsgGUID: giHwh7YtTE+4pfmsGy5FSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3739230"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2026 18:22:07 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKQST-0000000034Z-09zB;
	Sat, 24 Oct 2026 01:22:05 +0000
Date: Sat, 24 Oct 2026 03:21:56 +0200
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 85/98] fs/rpdfs/meta.c:184:6:
 warning: variable 'folio' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202610240323.tsZvBjRr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Zach,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   8a293e5c1bf0416f4d4e116bf8693c00dbe876da
commit: 2f7d4b4295890ece08df31aa8e2d0150594c6c07 [85/98] rpdfs: update inode code
config: riscv-randconfig-r2200-20261024 (https://download.01.org/0day-ci/archive/20261024/202610240323.tsZvBjRr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240323.tsZvBjRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240323.tsZvBjRr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from fs/rpdfs/meta.c:4:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from fs/rpdfs/meta.c:4:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from fs/rpdfs/meta.c:4:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/rpdfs/meta.c:4:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/rpdfs/meta.c:4:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/rpdfs/meta.c:4:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> fs/rpdfs/meta.c:184:6: warning: variable 'folio' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 |             WARN_ON_ONCE((mgf & MGF_READ) && (mgf & MGF_WRITE))) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:33: note: expanded from macro 'WARN_ON_ONCE'
     110 | #define WARN_ON_ONCE(condition) ({                              \
         |                                 ^
   fs/rpdfs/meta.c:226:9: note: uninitialized use occurs here
     226 |         return folio;
         |                ^~~~~
   fs/rpdfs/meta.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 |             WARN_ON_ONCE((mgf & MGF_READ) && (mgf & MGF_WRITE))) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     187 |                 ret = -EINVAL;
         |                 ~~~~~~~~~~~~~~
     188 |                 goto out;
         |                 ~~~~~~~~~
     189 |         }
         |         ~
>> fs/rpdfs/meta.c:184:6: warning: variable 'folio' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:33: note: expanded from macro 'WARN_ON_ONCE'
     110 | #define WARN_ON_ONCE(condition) ({                              \
         |                                 ^
   fs/rpdfs/meta.c:226:9: note: uninitialized use occurs here
     226 |         return folio;
         |                ^~~~~
   fs/rpdfs/meta.c:184:6: note: remove the '||' if its condition is always false
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:33: note: expanded from macro 'WARN_ON_ONCE'
     110 | #define WARN_ON_ONCE(condition) ({                              \
         |                                 ^
>> fs/rpdfs/meta.c:184:6: warning: variable 'folio' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:33: note: expanded from macro 'WARN_ON_ONCE'
     110 | #define WARN_ON_ONCE(condition) ({                              \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     111 |         int __ret_warn_on = !!(condition);                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     112 |         if (unlikely(__ret_warn_on))                            \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     114 |                              BUGFLAG_TAINT(TAINT_WARN));        \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     115 |         unlikely(__ret_warn_on);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 | })
         | ~~
   fs/rpdfs/meta.c:226:9: note: uninitialized use occurs here
     226 |         return folio;
         |                ^~~~~
   fs/rpdfs/meta.c:184:6: note: remove the '||' if its condition is always false
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:33: note: expanded from macro 'WARN_ON_ONCE'
     110 | #define WARN_ON_ONCE(condition) ({                              \
         |                                 ^
   fs/rpdfs/meta.c:178:21: note: initialize the variable 'folio' to silence this warning
     178 |         struct folio *folio;
         |                            ^
         |                             = NULL
   10 warnings generated.


vim +184 fs/rpdfs/meta.c

2658c3c902752b Zach Brown 2026-07-09  150  
2658c3c902752b Zach Brown 2026-07-09  151  /*
2658c3c902752b Zach Brown 2026-07-09  152   * Get a folio that contains the block of the described type and index.
2658c3c902752b Zach Brown 2026-07-09  153   * Modeled loosely after __filemap_get_folio, except that we have much
2658c3c902752b Zach Brown 2026-07-09  154   * less variation in callers.
2658c3c902752b Zach Brown 2026-07-09  155   *
2658c3c902752b Zach Brown 2026-07-09  156   * Generally folios are returned without the folio lock held.  Callers
2658c3c902752b Zach Brown 2026-07-09  157   * are expected to have higher level serialization of safe access to the
2658c3c902752b Zach Brown 2026-07-09  158   * block's contents.
2658c3c902752b Zach Brown 2026-07-09  159   *
2658c3c902752b Zach Brown 2026-07-09  160   * The waiting flags (_READ, _WRITE) are killable and only suitable for
2658c3c902752b Zach Brown 2026-07-09  161   * task contexts.
2658c3c902752b Zach Brown 2026-07-09  162   *
2658c3c902752b Zach Brown 2026-07-09  163   * MGF_NEW: return a locked folio that is not uptodate and whose
2658c3c902752b Zach Brown 2026-07-09  164   * contents are uninitialized.  The caller must unlock, and must either
2658c3c902752b Zach Brown 2026-07-09  165   * mark the folio in error or initialize the contents and set it
2658c3c902752b Zach Brown 2026-07-09  166   * uptodate.
2658c3c902752b Zach Brown 2026-07-09  167   *
2658c3c902752b Zach Brown 2026-07-09  168   * MGF_READ: return a folio that is uptodate.  The folio may be
2658c3c902752b Zach Brown 2026-07-09  169   * undergoing writeback.
2658c3c902752b Zach Brown 2026-07-09  170   *
2658c3c902752b Zach Brown 2026-07-09  171   * MGF_WRITE: return a locked folio that is uptodate and not under
2658c3c902752b Zach Brown 2026-07-09  172   * writeback.  The folio is returned locked so that writeback won't
2658c3c902752b Zach Brown 2026-07-09  173   * start until the caller unlocks.
2658c3c902752b Zach Brown 2026-07-09  174   */
2658c3c902752b Zach Brown 2026-07-09  175  struct folio *rpdfs_meta_get_folio(struct inode *inode, mgf_t mgf, u8 type, u64 t_index)
2658c3c902752b Zach Brown 2026-07-09  176  {
2658c3c902752b Zach Brown 2026-07-09  177  	struct address_space *mapping = shadow_mapping(inode);
2658c3c902752b Zach Brown 2026-07-09  178  	struct folio *folio;
2658c3c902752b Zach Brown 2026-07-09  179  	pgoff_t f_index;
2658c3c902752b Zach Brown 2026-07-09  180  	int ret;
2658c3c902752b Zach Brown 2026-07-09  181  
2658c3c902752b Zach Brown 2026-07-09  182  	BUILD_BUG_ON(PAGE_SIZE != RPDFS_BLOCK_SIZE);
2658c3c902752b Zach Brown 2026-07-09  183  
2658c3c902752b Zach Brown 2026-07-09 @184  	if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
2658c3c902752b Zach Brown 2026-07-09  185  	    WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
2658c3c902752b Zach Brown 2026-07-09  186  	    WARN_ON_ONCE((mgf & MGF_READ) && (mgf & MGF_WRITE))) {
2658c3c902752b Zach Brown 2026-07-09  187  		ret = -EINVAL;
2658c3c902752b Zach Brown 2026-07-09  188  		goto out;
2658c3c902752b Zach Brown 2026-07-09  189  	}
2658c3c902752b Zach Brown 2026-07-09  190  
2658c3c902752b Zach Brown 2026-07-09  191  	ret = folio_index_from_type(inode, type, t_index, &f_index);
2658c3c902752b Zach Brown 2026-07-09  192  	if (ret < 0) {
2658c3c902752b Zach Brown 2026-07-09  193  		folio = ERR_PTR(ret);
2658c3c902752b Zach Brown 2026-07-09  194  		goto out;
2658c3c902752b Zach Brown 2026-07-09  195  	}
2658c3c902752b Zach Brown 2026-07-09  196  
2658c3c902752b Zach Brown 2026-07-09  197  	if (mgf & MGF_NEW) {
2658c3c902752b Zach Brown 2026-07-09  198  		folio = __filemap_get_folio(mapping, f_index, FGP_LOCK|FGP_CREAT, GFP_NOFS);
2658c3c902752b Zach Brown 2026-07-09  199  		goto out;
2658c3c902752b Zach Brown 2026-07-09  200  	}
2658c3c902752b Zach Brown 2026-07-09  201  
2658c3c902752b Zach Brown 2026-07-09  202  	folio = mapping_read_folio_gfp(mapping, f_index, GFP_NOFS);
2658c3c902752b Zach Brown 2026-07-09  203  	if (IS_ERR(folio))
2658c3c902752b Zach Brown 2026-07-09  204  		goto out;
2658c3c902752b Zach Brown 2026-07-09  205  
2658c3c902752b Zach Brown 2026-07-09  206  	if (mgf & MGF_WRITE) {
2658c3c902752b Zach Brown 2026-07-09  207  		ret = folio_lock_killable(folio);
2658c3c902752b Zach Brown 2026-07-09  208  		if (ret == 0) {
2658c3c902752b Zach Brown 2026-07-09  209  			ret = folio_wait_writeback_killable(folio);
2658c3c902752b Zach Brown 2026-07-09  210  			if (ret < 0)
2658c3c902752b Zach Brown 2026-07-09  211  				folio_unlock(folio);
2658c3c902752b Zach Brown 2026-07-09  212  		}
2658c3c902752b Zach Brown 2026-07-09  213  		if (ret < 0) {
2658c3c902752b Zach Brown 2026-07-09  214  			folio_put(folio);
2658c3c902752b Zach Brown 2026-07-09  215  			folio = ERR_PTR(ret);
2658c3c902752b Zach Brown 2026-07-09  216  			goto out;
2658c3c902752b Zach Brown 2026-07-09  217  		}
2658c3c902752b Zach Brown 2026-07-09  218  	}
2658c3c902752b Zach Brown 2026-07-09  219  
2658c3c902752b Zach Brown 2026-07-09  220  out:
2658c3c902752b Zach Brown 2026-07-09  221  	if (!IS_ERR(folio))
2658c3c902752b Zach Brown 2026-07-09  222  		rpdfs_prd("mgf %x type %u index %llu "RFF, mgf, type, t_index, RFA(folio));
2658c3c902752b Zach Brown 2026-07-09  223  	else
2658c3c902752b Zach Brown 2026-07-09  224  		rpdfs_prd("mgf %x type %u index %llu ret %ld", mgf, type, t_index, PTR_ERR(folio));
2658c3c902752b Zach Brown 2026-07-09  225  
2658c3c902752b Zach Brown 2026-07-09  226  	return folio;
2658c3c902752b Zach Brown 2026-07-09  227  }
2658c3c902752b Zach Brown 2026-07-09  228  

:::::: The code at line 184 was first introduced by commit
:::::: 2658c3c902752b51b9bebb9bb36cf7dcde32d28d rpdfs: add meta code for caching metadata

:::::: TO: Zach Brown <zab@zabbo.net>
:::::: CC: Zach Brown <zab@zabbo.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
