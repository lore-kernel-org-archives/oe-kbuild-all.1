Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2084346D09B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620987; cv=none; b=f5wAZeoGgj3/89mN1YggGX9GXTkdZ99Y4+OMcU5+EkzocSx/DBFVyY69jXCB9q1S7LQ+LWFr4TY/2wvgQ09ZZ0N7NiNQFnwQxCmriVhwe+mAKbXWeaAzaG26b/CGWGLg+dLJcfJHfQrOYQJWLVbbygEL2MWWBZnXHykxCyQ+uGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620987; c=relaxed/simple;
	bh=wxinR0l5WufoBm+B3acO6EkPHcaSG9iVFU5iaOQk1tE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=efMHyhPcXchr9La3Y92rkMZywlgiNwwQqvfRq747m7tDul0XmZpUf/y2/g3J+MKZ1AJEw98O2hXbasoDnKer0gc7sC/eBAMGNpSYpmQB2kF9FKxyRwZplZNvKfBl0anGfXFz/ZzO45wA040ehpWpC3zzvCFF5ANP4diCV9gnjy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5JDh3ZK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5JDh3ZK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786620982; x=1818156982;
  h=date:from:to:cc:subject:message-id;
  bh=wxinR0l5WufoBm+B3acO6EkPHcaSG9iVFU5iaOQk1tE=;
  b=L5JDh3ZKRtikQzDOF8TmeTdGpKUFyAtCPsLf2gp1uZhJxxDSNlSrvY8t
   J0BCcs5vjh21VSbuSQ0WoNsGWB59jq7FwJULLTYo/9ETMMZ415SNkW1p4
   2ZLtyJRKTXH17dhLqdLksTsnhO5gy3E47TlI3wXKzEbkIN6ujOp9B63Gy
   2uSCguxH4EzOLYKqliziZ4K/EFfcRIqkqk4hjMTxKm6gfjtso1OYbRV4i
   mTHtjUUgKf2/eKCLQgyOG3K/Kakp3edrwT4NkVjSLBt3Cdey6Sg2xWz1P
   pJFahvC0+4God46TSkh9Ts64G+/RmHAJHDx4cIh4/TkGCUu10RsPZGSvl
   Q==;
X-CSE-ConnectionGUID: Y6DJVVmeRYeUO5NPaloEPQ==
X-CSE-MsgGUID: Vd021uCPQ4aqWxxNQY//EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86310800"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="86310800"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:36:19 -0700
X-CSE-ConnectionGUID: ATRvBC7zS5SK6/dCHNAAkQ==
X-CSE-MsgGUID: 2NkTyOcTSLSllYG0kxzK5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264497612"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2026 04:36:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTjL-00000000Ttg-1v2B;
	Thu, 13 Aug 2026 11:36:15 +0000
Date: Thu, 13 Aug 2026 19:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>
Subject: arch/m68k/include/asm/nettel.h:60: undefined reference to
 `ppdata'
Message-ID: <202608131917.ZNBnMX82-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: f47c1b77d0a2a9c0d49ec14302e74f933398d1a3 clk: Move clk_{save,restore}_context() to COMMON_CLK section
date:   7 months ago
config: m68k-randconfig-r071-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131917.ZNBnMX82-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131917.ZNBnMX82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f47c1b77d0a2 ("clk: Move clk_{save,restore}_context() to COMMON_CLK section")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131917.ZNBnMX82-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: arch/m68k/coldfire/nettel.o: in function `init_nettel':
>> arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
>> m68k-linux-ld: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
>> m68k-linux-ld: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
   m68k-linux-ld: arch/m68k/include/asm/nettel.h:61: undefined reference to `ppdata'
>> m68k-linux-ld: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
   m68k-linux-ld: arch/m68k/coldfire/nettel.o:arch/m68k/include/asm/nettel.h:61: more undefined references to `ppdata' follow


vim +60 arch/m68k/include/asm/nettel.h

^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  55  
^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  56  static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  57  {
^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  58  	volatile unsigned short *pp;
732c611e5bbb76 arch/m68k/include/asm/nettel.h sfking@fdwdc.com 2009-06-19  59  	pp = (volatile unsigned short *) MCFSIM_PADAT;
^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16 @60  	ppdata = (ppdata & ~mask) | bits;
^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  61  	*pp = ppdata;
^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  62  }
^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  63  #endif
^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  64  

:::::: The code at line 60 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
