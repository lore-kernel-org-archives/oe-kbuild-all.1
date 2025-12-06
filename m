Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5012D8DA8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765019037; cv=none; b=GNa5QDu7lP19qi8TW7PCbL74dsRcqykSiCfEkVCDy+eXfCKwzp+dB5ty3QEtjaRlDojdUNOXIfVvSSCQsh+CtTlhMdtjN2eaISlmCnDbt5FJaKe3XCI6vaSmiYWrPehvt8sUdrJhuy10LY9wzkrqUO5SDHgjuc6drf8rfpXGMQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765019037; c=relaxed/simple;
	bh=FVxBYX059zmwCjaaWd+BJKUVV9gcvVshUbIrs0uyIi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oz6D/9HwN4zER9NQQukbI68N2nCOD2brkHooGE2IAU/HW57W1TeoqDiawIV+ZPtukFVXgPngrsqd0oDPJpcHjy80i62qR9ydgNSXHfuxaeLCwuvK21t/kKlZ0n7peqM7Jmdh3LSTdpaNNr+vf9kxnUr+EduzOA0SeBuXCHiQlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2NgFOFT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2NgFOFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765019036; x=1796555036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FVxBYX059zmwCjaaWd+BJKUVV9gcvVshUbIrs0uyIi4=;
  b=C2NgFOFTF6LhX8JqWRniEZPZkTubQWvS5RMFVW8nBHSi0qCtjrEEPjys
   B2T6iJKfEcBJO01j2/C1vMZwoO23rR+Db+WVwm8VT+5/8ZlT41Os5DaWl
   qrjnow+8OPLM2b+guZl4K/W6dWu7hmF3waPyEkohcZ1t1ewhgsKF8/j8R
   fJbGa+UftZJHnUHJT06fSV0f244dmXIHIK/oMvN7IK29aTO74cmOJxGRJ
   lNwX9Je6wjpLBvyW8SreeeO+89Llgw/FrdKNV6XtrY6Or0tPbYDojgK51
   M6woZ7B8rXxVrSclDCVaN59b3BwLRUpjoI2GpQvjFrAuROsiePk6FcXLB
   A==;
X-CSE-ConnectionGUID: MLH7zRx4Sh2VmJiPlfFpkA==
X-CSE-MsgGUID: DaosuZmCRWqGRVM4yA9wRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78391420"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78391420"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 03:03:55 -0800
X-CSE-ConnectionGUID: gkEAMfGgTL+7IUQelfAEYA==
X-CSE-MsgGUID: xKlkZM0pQBuSzjrq0LyKmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195582696"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Dec 2025 03:03:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRq4s-00000000G6J-2ieD;
	Sat, 06 Dec 2025 11:03:50 +0000
Date: Sat, 6 Dec 2025 19:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: include/linux/bitmap.h:820:13: warning: 'bitmap' is used
 uninitialized in this function
Message-ID: <202512061812.Xbqmd2Gn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   416f99c3b16f582a3fc6d64a1f77f39d94b76de5
commit: 7ef502fb35b283e0f85ed7b34e2d963343981a8c PCI: Add Renesas RZ/G3S host controller driver
date:   11 days ago
config: sparc64-randconfig-r133-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061812.Xbqmd2Gn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061812.Xbqmd2Gn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061812.Xbqmd2Gn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/pcie-rzg3s-host.c:13:
   drivers/pci/controller/pcie-rzg3s-host.c: In function 'rzg3s_pcie_msi_irq.part.0':
>> include/linux/bitmap.h:820:13: warning: 'bitmap' is used uninitialized in this function [-Wuninitialized]
     820 |  map[index] &= (fit ? (~(mask << offset)) : ~BITMAP_FIRST_WORD_MASK(start));
         |             ^~
   In file included from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/sparc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/pci/controller/pcie-rzg3s-host.c:12:
   drivers/pci/controller/pcie-rzg3s-host.c:482:17: note: 'bitmap' was declared here
     482 |  DECLARE_BITMAP(bitmap, RZG3S_PCI_MSI_INT_NR);
         |                 ^~~~~~
   include/linux/types.h:11:16: note: in definition of macro 'DECLARE_BITMAP'
      11 |  unsigned long name[BITS_TO_LONGS(bits)]
         |                ^~~~


vim +/bitmap +820 include/linux/bitmap.h

63c15822b8dd02 Syed Nayyar Waris 2024-03-27  784  
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  785  /**
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  786   * bitmap_write - write n-bit value within a memory region
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  787   * @map: address to the bitmap memory region
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  788   * @value: value to write, clamped to nbits
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  789   * @start: bit offset of the n-bit value
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  790   * @nbits: size of value in bits, nonzero, up to BITS_PER_LONG.
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  791   *
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  792   * bitmap_write() behaves as-if implemented as @nbits calls of __assign_bit(),
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  793   * i.e. bits beyond @nbits are ignored:
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  794   *
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  795   *   for (bit = 0; bit < nbits; bit++)
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  796   *           __assign_bit(start + bit, bitmap, val & BIT(bit));
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  797   *
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  798   * For @nbits == 0 and @nbits > BITS_PER_LONG no writes are performed.
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  799   */
ed8cd2b3bd9f07 Yury Norov        2024-07-18  800  static __always_inline
ed8cd2b3bd9f07 Yury Norov        2024-07-18  801  void bitmap_write(unsigned long *map, unsigned long value,
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  802  		  unsigned long start, unsigned long nbits)
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  803  {
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  804  	size_t index;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  805  	unsigned long offset;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  806  	unsigned long space;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  807  	unsigned long mask;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  808  	bool fit;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  809  
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  810  	if (unlikely(!nbits || nbits > BITS_PER_LONG))
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  811  		return;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  812  
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  813  	mask = BITMAP_LAST_WORD_MASK(nbits);
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  814  	value &= mask;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  815  	offset = start % BITS_PER_LONG;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  816  	space = BITS_PER_LONG - offset;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  817  	fit = space >= nbits;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  818  	index = BIT_WORD(start);
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  819  
63c15822b8dd02 Syed Nayyar Waris 2024-03-27 @820  	map[index] &= (fit ? (~(mask << offset)) : ~BITMAP_FIRST_WORD_MASK(start));
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  821  	map[index] |= value << offset;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  822  	if (fit)
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  823  		return;
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  824  
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  825  	map[index + 1] &= BITMAP_FIRST_WORD_MASK(start + nbits);
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  826  	map[index + 1] |= (value >> space);
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  827  }
63c15822b8dd02 Syed Nayyar Waris 2024-03-27  828  

:::::: The code at line 820 was first introduced by commit
:::::: 63c15822b8dd02a2423cfd92232245ace3f7a11b lib/bitmap: add bitmap_{read,write}()

:::::: TO: Syed Nayyar Waris <syednwaris@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
