Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1A72FDC36
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 18:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765046640; cv=none; b=KTUI9ekSc2hLvQO5VV9GmGhHTmyOH9HJ5iV8FJeZxw47aMYvtRLj8GCEwL6bO9MBkqNsM6xV4j05/OKsZW4BRjqjK78HUYJ8WnceYheryUpfDcfT9GOYQYyHndHVroKnKePYlEMENPkhWEDLzMCSL9ED6GzphRRLFbsFdFJ1v+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765046640; c=relaxed/simple;
	bh=+j4GMEQKW7lkjZQLS9ZgugF1pwrQahe9ACh4IXRpICU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sfO0GG+vue1+U9RGFEQ4O72tue06NNT9FyPokfQSgKrgK+09glMAVXKJlLFYerzJMb5aM5lEsRLnc29xT0KKRVycI8RORXt2A3kKVEjCBC7Ms+I7XFBkRXi3wXNIc/AFt7MD+ijAtkWxNyPDOLcToqacm+ma1DXDXgeaBwQQDFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWMuj2sI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWMuj2sI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765046638; x=1796582638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+j4GMEQKW7lkjZQLS9ZgugF1pwrQahe9ACh4IXRpICU=;
  b=KWMuj2sIj1GQ8N2pWZtu5NDiGxgRYoCLh69guoEvlhBOwBi9AIiP4yuU
   LC1lJWzfHLDS8Cq8VFVfVjNKNUHOknADKVDyw8r1t8adCEkwWLbuxz1Hw
   7ffukSsnRsElB0Myrb2hO252v+icYXYlNUn2SfncqR56EcovYzlMt2HR0
   3hM4Y062pQnDCC6QyY0Il2mreFYqzVHrnGQwt7PU+eGALBybvK9QfidVk
   K45fqAdcMnjaMN6Jdmg4fas08FEK2aVVMHkLvuapYB+FoRc3x6fOYlWOy
   ys1006MQ39n2XZtqtXH+8i5okMk2m3kqXLccncWHXmFO1kh/IyHFknQL2
   g==;
X-CSE-ConnectionGUID: QhNGGzVsRCyT3own8UFZJQ==
X-CSE-MsgGUID: FA9wPPwkRV+ppuOSwyQ+nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67129404"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67129404"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 10:43:57 -0800
X-CSE-ConnectionGUID: DojonefgTQy8mq5YjTKqsw==
X-CSE-MsgGUID: ZCuOnrNiTi+2kb5eq5Xe3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="195202426"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Dec 2025 10:43:56 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRxG5-00000000IgD-3744;
	Sat, 06 Dec 2025 18:43:53 +0000
Date: Sun, 7 Dec 2025 02:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: include/linux/bitmap.h:820:20: warning: 'bitmap[0]' is used
 uninitialized
Message-ID: <202512070218.XVMUQCl7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f468cf53c5240bf5063d0c6fe620b5ae2de37801
commit: 7ef502fb35b283e0f85ed7b34e2d963343981a8c PCI: Add Renesas RZ/G3S host controller driver
date:   11 days ago
config: riscv-randconfig-001-20251207 (https://download.01.org/0day-ci/archive/20251207/202512070218.XVMUQCl7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070218.XVMUQCl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070218.XVMUQCl7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/pcie-rzg3s-host.c:13:
   In function 'bitmap_write',
       inlined from 'rzg3s_pcie_msi_irq.part.0' at drivers/pci/controller/pcie-rzg3s-host.c:501:3:
>> include/linux/bitmap.h:820:20: warning: 'bitmap[0]' is used uninitialized [-Wuninitialized]
     820 |         map[index] &= (fit ? (~(mask << offset)) : ~BITMAP_FIRST_WORD_MASK(start));
         |                    ^~
   In file included from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/riscv/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/pci/controller/pcie-rzg3s-host.c:12:
   drivers/pci/controller/pcie-rzg3s-host.c: In function 'rzg3s_pcie_msi_irq.part.0':
   drivers/pci/controller/pcie-rzg3s-host.c:482:24: note: 'bitmap[0]' was declared here
     482 |         DECLARE_BITMAP(bitmap, RZG3S_PCI_MSI_INT_NR);
         |                        ^~~~~~
   include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMAP'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                       ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=y] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]


vim +820 include/linux/bitmap.h

63c15822b8dd02a Syed Nayyar Waris 2024-03-27  784  
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  785  /**
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  786   * bitmap_write - write n-bit value within a memory region
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  787   * @map: address to the bitmap memory region
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  788   * @value: value to write, clamped to nbits
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  789   * @start: bit offset of the n-bit value
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  790   * @nbits: size of value in bits, nonzero, up to BITS_PER_LONG.
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  791   *
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  792   * bitmap_write() behaves as-if implemented as @nbits calls of __assign_bit(),
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  793   * i.e. bits beyond @nbits are ignored:
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  794   *
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  795   *   for (bit = 0; bit < nbits; bit++)
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  796   *           __assign_bit(start + bit, bitmap, val & BIT(bit));
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  797   *
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  798   * For @nbits == 0 and @nbits > BITS_PER_LONG no writes are performed.
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  799   */
ed8cd2b3bd9f070 Yury Norov        2024-07-18  800  static __always_inline
ed8cd2b3bd9f070 Yury Norov        2024-07-18  801  void bitmap_write(unsigned long *map, unsigned long value,
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  802  		  unsigned long start, unsigned long nbits)
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  803  {
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  804  	size_t index;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  805  	unsigned long offset;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  806  	unsigned long space;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  807  	unsigned long mask;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  808  	bool fit;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  809  
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  810  	if (unlikely(!nbits || nbits > BITS_PER_LONG))
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  811  		return;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  812  
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  813  	mask = BITMAP_LAST_WORD_MASK(nbits);
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  814  	value &= mask;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  815  	offset = start % BITS_PER_LONG;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  816  	space = BITS_PER_LONG - offset;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  817  	fit = space >= nbits;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  818  	index = BIT_WORD(start);
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  819  
63c15822b8dd02a Syed Nayyar Waris 2024-03-27 @820  	map[index] &= (fit ? (~(mask << offset)) : ~BITMAP_FIRST_WORD_MASK(start));
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  821  	map[index] |= value << offset;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  822  	if (fit)
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  823  		return;
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  824  
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  825  	map[index + 1] &= BITMAP_FIRST_WORD_MASK(start + nbits);
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  826  	map[index + 1] |= (value >> space);
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  827  }
63c15822b8dd02a Syed Nayyar Waris 2024-03-27  828  

:::::: The code at line 820 was first introduced by commit
:::::: 63c15822b8dd02a2423cfd92232245ace3f7a11b lib/bitmap: add bitmap_{read,write}()

:::::: TO: Syed Nayyar Waris <syednwaris@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
