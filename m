Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7484D34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254686; cv=none; b=Zv534PsXW/dbpo+v2inh68N9dkF4BBG3q64omSEl7WPhzBe/OpWkoVcNfxQXiPXm83euz1ghrGtMM4lDlATnKtQQmEjsn0ujj+2/6PpptVx+D9m6kQjA8P9VwLKtNOcsXdw4u3nwu0IkiuJgemMj5wPsnIkyjh240yNgWHFafjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254686; c=relaxed/simple;
	bh=XN0ROJs8G1T6mrD150SpOmdT6IIzw10lOD9nPGRrzdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LpoXX0PQKeDxv0jE+faspbG+Lg0dA00w8RhRLbPraVWVxKj4qm0oLcBZjzgktpCmjkHEP5sCSeUQ1EgszvAf8KABoVLHp7KTROJy2qGQpiCZSHshyXrAMmJAKjkaq1WRWbcqO54znUHsxlhdcBtyinayia9QuGNsWv2hA93YEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1dSZmLV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1dSZmLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738254685; x=1769790685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XN0ROJs8G1T6mrD150SpOmdT6IIzw10lOD9nPGRrzdA=;
  b=L1dSZmLVK22Yc/LgSTaLnPBRlMd2qdTdSvYY4d5b1+JI/DuliO3SjHDd
   eSWN2XE9uN4ZNUYEa+pXCv47Z53VzvWNmMjxx5kempMXB2AsglPCHDeWT
   vdQdgCEhK+qQ3JJzlJfKcCxBAABiCufn3pUcrQmNhy90KRTa2OFK1iGGY
   4mcK59YmYfc298odxQNQq5Kxq9mgPRJP5lZ4a1vyT3AitVcsA7WfNKtsv
   8fN46c4EbuKH0S23vXWeSXoRKWBMiNAq/LgnQE2sXHVDsLlmYhkOlzxDq
   G4wlRJJo/oVieMypVK/yrrOYR6GP3ZG22IKY6tortpHCm9Uc5iqjJS2vI
   Q==;
X-CSE-ConnectionGUID: /KuMd0vnSayqZXAjKNU54A==
X-CSE-MsgGUID: Cx3IUFVtTBGg5pMbmoCkng==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56237099"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="56237099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 08:31:24 -0800
X-CSE-ConnectionGUID: fAAOyHr4Q/+ATACNfPzUSg==
X-CSE-MsgGUID: A4ShULDYSbO5GSD0HTN94A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109977892"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jan 2025 08:31:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdXRo-000kgN-0l;
	Thu, 30 Jan 2025 16:31:20 +0000
Date: Fri, 31 Jan 2025 00:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/um-io 3/3] lib/iomap.c:79:14: warning: no
 previous prototype for 'ioread8'
Message-ID: <202501310009.r9wOa49B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/um-io
head:   1e7aceb3e7b5d015e6778e77383db706a4ae066b
commit: 1e7aceb3e7b5d015e6778e77383db706a4ae066b [3/3] iomap: Fix -Wmissing-prototypes on UM
config: m68k-m5475evb_defconfig (https://download.01.org/0day-ci/archive/20250131/202501310009.r9wOa49B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310009.r9wOa49B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310009.r9wOa49B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/iomap.c:79:14: warning: no previous prototype for 'ioread8' [-Wmissing-prototypes]
      79 | unsigned int ioread8(const void __iomem *addr)
         |              ^~~~~~~
>> lib/iomap.c:85:14: warning: no previous prototype for 'ioread16' [-Wmissing-prototypes]
      85 | unsigned int ioread16(const void __iomem *addr)
         |              ^~~~~~~~
>> lib/iomap.c:91:14: warning: no previous prototype for 'ioread16be' [-Wmissing-prototypes]
      91 | unsigned int ioread16be(const void __iomem *addr)
         |              ^~~~~~~~~~
>> lib/iomap.c:97:14: warning: no previous prototype for 'ioread32' [-Wmissing-prototypes]
      97 | unsigned int ioread32(const void __iomem *addr)
         |              ^~~~~~~~
>> lib/iomap.c:103:14: warning: no previous prototype for 'ioread32be' [-Wmissing-prototypes]
     103 | unsigned int ioread32be(const void __iomem *addr)
         |              ^~~~~~~~~~
>> lib/iomap.c:203:6: warning: no previous prototype for 'iowrite8' [-Wmissing-prototypes]
     203 | void iowrite8(u8 val, void __iomem *addr)
         |      ^~~~~~~~
>> lib/iomap.c:209:6: warning: no previous prototype for 'iowrite16' [-Wmissing-prototypes]
     209 | void iowrite16(u16 val, void __iomem *addr)
         |      ^~~~~~~~~
>> lib/iomap.c:215:6: warning: no previous prototype for 'iowrite16be' [-Wmissing-prototypes]
     215 | void iowrite16be(u16 val, void __iomem *addr)
         |      ^~~~~~~~~~~
>> lib/iomap.c:221:6: warning: no previous prototype for 'iowrite32' [-Wmissing-prototypes]
     221 | void iowrite32(u32 val, void __iomem *addr)
         |      ^~~~~~~~~
>> lib/iomap.c:227:6: warning: no previous prototype for 'iowrite32be' [-Wmissing-prototypes]
     227 | void iowrite32be(u32 val, void __iomem *addr)
         |      ^~~~~~~~~~~
>> lib/iomap.c:360:6: warning: no previous prototype for 'ioread8_rep' [-Wmissing-prototypes]
     360 | void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
         |      ^~~~~~~~~~~
>> lib/iomap.c:366:6: warning: no previous prototype for 'ioread16_rep' [-Wmissing-prototypes]
     366 | void ioread16_rep(const void __iomem *addr, void *dst, unsigned long count)
         |      ^~~~~~~~~~~~
>> lib/iomap.c:372:6: warning: no previous prototype for 'ioread32_rep' [-Wmissing-prototypes]
     372 | void ioread32_rep(const void __iomem *addr, void *dst, unsigned long count)
         |      ^~~~~~~~~~~~
>> lib/iomap.c:382:6: warning: no previous prototype for 'iowrite8_rep' [-Wmissing-prototypes]
     382 | void iowrite8_rep(void __iomem *addr, const void *src, unsigned long count)
         |      ^~~~~~~~~~~~
>> lib/iomap.c:388:6: warning: no previous prototype for 'iowrite16_rep' [-Wmissing-prototypes]
     388 | void iowrite16_rep(void __iomem *addr, const void *src, unsigned long count)
         |      ^~~~~~~~~~~~~
>> lib/iomap.c:394:6: warning: no previous prototype for 'iowrite32_rep' [-Wmissing-prototypes]
     394 | void iowrite32_rep(void __iomem *addr, const void *src, unsigned long count)
         |      ^~~~~~~~~~~~~


vim +/ioread8 +79 lib/iomap.c

34ba8a5cd0b0d5 Linus Torvalds      2006-11-11   73  
a28a4d4723c11f Alexander Potapenko 2022-09-15   74  /*
a28a4d4723c11f Alexander Potapenko 2022-09-15   75   * Here and below, we apply __no_kmsan_checks to functions reading data from
a28a4d4723c11f Alexander Potapenko 2022-09-15   76   * hardware, to ensure that KMSAN marks their return values as initialized.
a28a4d4723c11f Alexander Potapenko 2022-09-15   77   */
a28a4d4723c11f Alexander Potapenko 2022-09-15   78  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  @79  unsigned int ioread8(const void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16   80  {
^1da177e4c3f41 Linus Torvalds      2005-04-16   81  	IO_COND(addr, return inb(port), return readb(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04   82  	return 0xff;
^1da177e4c3f41 Linus Torvalds      2005-04-16   83  }
a28a4d4723c11f Alexander Potapenko 2022-09-15   84  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  @85  unsigned int ioread16(const void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16   86  {
^1da177e4c3f41 Linus Torvalds      2005-04-16   87  	IO_COND(addr, return inw(port), return readw(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04   88  	return 0xffff;
^1da177e4c3f41 Linus Torvalds      2005-04-16   89  }
a28a4d4723c11f Alexander Potapenko 2022-09-15   90  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  @91  unsigned int ioread16be(const void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16   92  {
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11   93  	IO_COND(addr, return pio_read16be(port), return mmio_read16be(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04   94  	return 0xffff;
dae409a2778877 James Bottomley     2005-04-16   95  }
a28a4d4723c11f Alexander Potapenko 2022-09-15   96  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  @97  unsigned int ioread32(const void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16   98  {
^1da177e4c3f41 Linus Torvalds      2005-04-16   99  	IO_COND(addr, return inl(port), return readl(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04  100  	return 0xffffffff;
^1da177e4c3f41 Linus Torvalds      2005-04-16  101  }
a28a4d4723c11f Alexander Potapenko 2022-09-15  102  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14 @103  unsigned int ioread32be(const void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16  104  {
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  105  	IO_COND(addr, return pio_read32be(port), return mmio_read32be(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04  106  	return 0xffffffff;
dae409a2778877 James Bottomley     2005-04-16  107  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  108  EXPORT_SYMBOL(ioread8);
^1da177e4c3f41 Linus Torvalds      2005-04-16  109  EXPORT_SYMBOL(ioread16);
dae409a2778877 James Bottomley     2005-04-16  110  EXPORT_SYMBOL(ioread16be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  111  EXPORT_SYMBOL(ioread32);
dae409a2778877 James Bottomley     2005-04-16  112  EXPORT_SYMBOL(ioread32be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  113  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  114  #ifdef readq
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  115  static u64 pio_read64_lo_hi(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  116  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  117  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  118  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  119  	lo = inl(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  120  	hi = inl(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  121  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  122  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  123  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  124  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  125  static u64 pio_read64_hi_lo(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  126  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  127  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  128  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  129  	hi = inl(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  130  	lo = inl(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  131  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  132  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  133  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  134  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  135  static u64 pio_read64be_lo_hi(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  136  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  137  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  138  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  139  	lo = pio_read32be(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  140  	hi = pio_read32be(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  141  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  142  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  143  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  144  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  145  static u64 pio_read64be_hi_lo(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  146  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  147  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  148  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  149  	hi = pio_read32be(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  150  	lo = pio_read32be(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  151  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  152  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  153  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  154  
a28a4d4723c11f Alexander Potapenko 2022-09-15  155  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  156  u64 ioread64_lo_hi(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  157  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  158  	IO_COND(addr, return pio_read64_lo_hi(port), return readq(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  159  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  160  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  161  
a28a4d4723c11f Alexander Potapenko 2022-09-15  162  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  163  u64 ioread64_hi_lo(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  164  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  165  	IO_COND(addr, return pio_read64_hi_lo(port), return readq(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  166  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  167  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  168  
a28a4d4723c11f Alexander Potapenko 2022-09-15  169  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  170  u64 ioread64be_lo_hi(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  171  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  172  	IO_COND(addr, return pio_read64be_lo_hi(port),
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  173  		return mmio_read64be(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  174  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  175  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  176  
a28a4d4723c11f Alexander Potapenko 2022-09-15  177  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  178  u64 ioread64be_hi_lo(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  179  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  180  	IO_COND(addr, return pio_read64be_hi_lo(port),
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  181  		return mmio_read64be(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  182  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  183  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  184  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  185  EXPORT_SYMBOL(ioread64_lo_hi);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  186  EXPORT_SYMBOL(ioread64_hi_lo);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  187  EXPORT_SYMBOL(ioread64be_lo_hi);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  188  EXPORT_SYMBOL(ioread64be_hi_lo);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  189  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  190  #endif /* readq */
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  191  
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  192  #ifndef pio_write16be
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  193  #define pio_write16be(val,port) outw(swab16(val),port)
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  194  #define pio_write32be(val,port) outl(swab32(val),port)
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  195  #endif
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  196  
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  197  #ifndef mmio_write16be
aecc787c06f430 Logan Gunthorpe     2019-01-16  198  #define mmio_write16be(val,port) writew(swab16(val),port)
aecc787c06f430 Logan Gunthorpe     2019-01-16  199  #define mmio_write32be(val,port) writel(swab32(val),port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  200  #define mmio_write64be(val,port) writeq(swab64(val),port)
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  201  #endif
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  202  
9f741cb8fecef9 Harvey Harrison     2008-02-08 @203  void iowrite8(u8 val, void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  204  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  205  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  206  	kmsan_check_memory(&val, sizeof(val));
^1da177e4c3f41 Linus Torvalds      2005-04-16  207  	IO_COND(addr, outb(val,port), writeb(val, addr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  208  }
9f741cb8fecef9 Harvey Harrison     2008-02-08 @209  void iowrite16(u16 val, void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  210  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  211  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  212  	kmsan_check_memory(&val, sizeof(val));
^1da177e4c3f41 Linus Torvalds      2005-04-16  213  	IO_COND(addr, outw(val,port), writew(val, addr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  214  }
9f741cb8fecef9 Harvey Harrison     2008-02-08 @215  void iowrite16be(u16 val, void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16  216  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  217  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  218  	kmsan_check_memory(&val, sizeof(val));
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  219  	IO_COND(addr, pio_write16be(val,port), mmio_write16be(val, addr));
dae409a2778877 James Bottomley     2005-04-16  220  }
9f741cb8fecef9 Harvey Harrison     2008-02-08 @221  void iowrite32(u32 val, void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  222  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  223  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  224  	kmsan_check_memory(&val, sizeof(val));
^1da177e4c3f41 Linus Torvalds      2005-04-16  225  	IO_COND(addr, outl(val,port), writel(val, addr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  226  }
9f741cb8fecef9 Harvey Harrison     2008-02-08 @227  void iowrite32be(u32 val, void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16  228  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  229  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  230  	kmsan_check_memory(&val, sizeof(val));
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  231  	IO_COND(addr, pio_write32be(val,port), mmio_write32be(val, addr));
dae409a2778877 James Bottomley     2005-04-16  232  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  233  EXPORT_SYMBOL(iowrite8);
^1da177e4c3f41 Linus Torvalds      2005-04-16  234  EXPORT_SYMBOL(iowrite16);
dae409a2778877 James Bottomley     2005-04-16  235  EXPORT_SYMBOL(iowrite16be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  236  EXPORT_SYMBOL(iowrite32);
dae409a2778877 James Bottomley     2005-04-16  237  EXPORT_SYMBOL(iowrite32be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  238  

:::::: The code at line 79 was first introduced by commit
:::::: 8f28ca6bd8211214faf717677bbffe375c2a6072 iomap: constify ioreadX() iomem argument (as in generic implementation)

:::::: TO: Krzysztof Kozlowski <krzk@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
