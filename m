Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C61D5CE5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729847704; cv=none; b=HjyPQwoWIoDVfDIrIw/bDky25n27uTkg4M5HVQzXEuVtt7ED7oNGbFSlWd7OmYm3Re1KUlTe/nUN3S3V6q2Ma7oFmmSxhETb5O5AVZmpxkha70i3EDk8Sp3Jp4owH1Ps4y/w4uKENYle1C7iR2BosasTy1M/Feo96lRT3HyUS1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729847704; c=relaxed/simple;
	bh=hSXrus4OLISP8b7zxrlj3Mj9ydw3It4+3hykh25u9fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lxug7/ILl3UEp0o/2mThIAcFdQdS5nR5RvKQFuUaX6IgUUdevquVoywtqHfv3A+u6OyvoD0muQqRA66KoRjKBbhtWG9xpRvquvERwgtw+UNfoNjptsCInTwEKFEeyq8vSq9U4UvORNUggQ87Ew6d2dsPa39NZUAVQ8hN5T2hrQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuIKHskX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuIKHskX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729847702; x=1761383702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hSXrus4OLISP8b7zxrlj3Mj9ydw3It4+3hykh25u9fg=;
  b=PuIKHskXjeEKdefMVDTJ6RgErdTUmAW/kIGg07Tv0E/tqJGE/RsscP+B
   mo5XpbsysJ6QZGM1E57JongEHf27ZkxRleZFxrt5HwZFMonNTN53z6+hf
   TKrtZXDiAWdbvxAa2Ew/VSFT+tHWdMEhMWuVg0344yU2j8HF2u0pxlf5i
   uslGQW867Fy5C2ukES+2iK+upGCaM+sI4vOTw9XaBzaSpCKi1y+i9fzi8
   QOqNpe/5TpMI1vA9zCon1+zpuOM3UcpFPSR4RiLDMqeFw9HOsIg3pv/M5
   8JS6jOeNlLInU9bB2sNL3GUaxwea9K0G6M6clS+XfkspN0iHXju8fhQFE
   Q==;
X-CSE-ConnectionGUID: bQkUm2lkSwOT+osoVUN9ZA==
X-CSE-MsgGUID: VaszW/H8Sn+/dzzdN1Nj5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52066556"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52066556"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:14:55 -0700
X-CSE-ConnectionGUID: JxqMWnkLRaKm7OJEnz9lnw==
X-CSE-MsgGUID: 60TwJY6WTQ6lVoj3KkR8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85653618"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2024 02:14:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4GPD-000XyK-0y;
	Fri, 25 Oct 2024 09:14:51 +0000
Date: Fri, 25 Oct 2024 17:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/unfudge_irq_bypass 2/41]
 include/asm-generic/bitops/fls64.h:24:20: sparse: sparse: cast truncates
 bits from constant value (ffffffffff000 becomes fffff000)
Message-ID: <202410251737.wKF9c3O3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/unfudge_irq_bypass
head:   d843694acf36ce387aa2bb77d0d290492d6870b8
commit: 1a7d10e3e2f52c629b2957b331f206685f11d310 [2/41] KVM: SVM: Drop pointless masking of kernel page pa's with AVIC HPA masks
config: i386-randconfig-r131-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251737.wKF9c3O3-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251737.wKF9c3O3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251737.wKF9c3O3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/svm/avic.c: note: in included file (through arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/fls64.h:24:20: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)

vim +24 include/asm-generic/bitops/fls64.h

a54baa1487c51c8 Akinobu Mita           2006-03-26   6  
d57594c203b1e7b Alexander van Heukelum 2008-03-15   7  /**
d57594c203b1e7b Alexander van Heukelum 2008-03-15   8   * fls64 - find last set bit in a 64-bit word
d57594c203b1e7b Alexander van Heukelum 2008-03-15   9   * @x: the word to search
d57594c203b1e7b Alexander van Heukelum 2008-03-15  10   *
d57594c203b1e7b Alexander van Heukelum 2008-03-15  11   * This is defined in a similar way as the libc and compiler builtin
d57594c203b1e7b Alexander van Heukelum 2008-03-15  12   * ffsll, but returns the position of the most significant set bit.
d57594c203b1e7b Alexander van Heukelum 2008-03-15  13   *
d57594c203b1e7b Alexander van Heukelum 2008-03-15  14   * fls64(value) returns 0 if value is 0 or the position of the last
d57594c203b1e7b Alexander van Heukelum 2008-03-15  15   * set bit if value is nonzero. The last (most significant) bit is
d57594c203b1e7b Alexander van Heukelum 2008-03-15  16   * at position 64.
d57594c203b1e7b Alexander van Heukelum 2008-03-15  17   */
d57594c203b1e7b Alexander van Heukelum 2008-03-15  18  #if BITS_PER_LONG == 32
c8399943bdb70fe Andi Kleen             2009-01-12  19  static __always_inline int fls64(__u64 x)
2dfc383ad587bbe Akinobu Mita           2006-03-26  20  {
2dfc383ad587bbe Akinobu Mita           2006-03-26  21  	__u32 h = x >> 32;
2dfc383ad587bbe Akinobu Mita           2006-03-26  22  	if (h)
2dfc383ad587bbe Akinobu Mita           2006-03-26  23  		return fls(h) + 32;
2dfc383ad587bbe Akinobu Mita           2006-03-26 @24  	return fls(x);
2dfc383ad587bbe Akinobu Mita           2006-03-26  25  }
d57594c203b1e7b Alexander van Heukelum 2008-03-15  26  #elif BITS_PER_LONG == 64
c8399943bdb70fe Andi Kleen             2009-01-12  27  static __always_inline int fls64(__u64 x)
d57594c203b1e7b Alexander van Heukelum 2008-03-15  28  {
d57594c203b1e7b Alexander van Heukelum 2008-03-15  29  	if (x == 0)
d57594c203b1e7b Alexander van Heukelum 2008-03-15  30  		return 0;
d57594c203b1e7b Alexander van Heukelum 2008-03-15  31  	return __fls(x) + 1;
d57594c203b1e7b Alexander van Heukelum 2008-03-15  32  }
d57594c203b1e7b Alexander van Heukelum 2008-03-15  33  #else
d57594c203b1e7b Alexander van Heukelum 2008-03-15  34  #error BITS_PER_LONG not 32 or 64
d57594c203b1e7b Alexander van Heukelum 2008-03-15  35  #endif
2dfc383ad587bbe Akinobu Mita           2006-03-26  36  

:::::: The code at line 24 was first introduced by commit
:::::: 2dfc383ad587bbead84739a9ff9273df3eda983d [PATCH] bitops: generic fls64()

:::::: TO: Akinobu Mita <mita@miraclelinux.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
