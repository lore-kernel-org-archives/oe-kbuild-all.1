Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CA9C2E9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 01:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712194766; cv=none; b=Kepb1yfFjMEhZk7hQ87Nx9cM+ijaTxYkR7bwOrh8BBbOjsRcehkp5XiR48uvNsZB/GoqoUdcjGc4R5wR3Coa2Whhg4vFbhMqLT4seLjPvA7w0Qb+H+XRYX2FPnfxLXjhnD/6Xl4DQxx9W9FFUxGYCOreFN4vDZTLF5xlcB0RreY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712194766; c=relaxed/simple;
	bh=5hgfNznvStVQ+8zpt7l4KsIWlOTwK7R4CLw8TVb2zxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EyfyKTRXPiTKjvkFyR/tO0oVPXpEVh5QCcXic3ogDWfi7/hN9OBfoZb78FAZYQOb0qexXMKtvEaHz72T7Z3CQuFHB6CAb8hbWF3rHStSB5QMWR4/s12dVkxIOM7S2Z3UwgMmJ856GRPAYS2BHdXVGF4IhbZ+/UpnksRi2XS9LzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5ggjhNr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5ggjhNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712194765; x=1743730765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5hgfNznvStVQ+8zpt7l4KsIWlOTwK7R4CLw8TVb2zxE=;
  b=m5ggjhNra3uTR3HfAGC/MF+iJn/JGUfqiHdNZJI7d8S/K9BeO9BlONI2
   iBDuQlf0Uu3GaVVo0G4M7+LJ4LoIyviZxXaUbn1khfvtFKLr0q9rfPo01
   2CiSwzmpJP03UlNRPprJSpmHmShHSZ5t4PGejL4hFF1fetaHy1nMlrq0q
   hEFJSgCleV0EKnQzbSkgUIG2jPHw5as6KmfLHqj82RJOiTutWkRsSmyEN
   rWlFAb23XGskeZArzC/wZg8mCdeq+Xegw37pUUho748DstXeYaBnTJhjg
   pH+2VXec2vHxuUy7HExhww9lA4ndVh5T8ZPg3cpjMeOHjCBVHXsFf8Hhc
   Q==;
X-CSE-ConnectionGUID: luJYCrxiQ7qHKQizOs6TOQ==
X-CSE-MsgGUID: pCFBPfsLSoyaGneVWLuLuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10426907"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="10426907"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 18:39:22 -0700
X-CSE-ConnectionGUID: gJRJZvXJSu2+Cs3y85+qtQ==
X-CSE-MsgGUID: aWiUlupvQYiTgX38hwRwHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23380974"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2024 18:39:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsC4T-0000Rq-3B;
	Thu, 04 Apr 2024 01:39:17 +0000
Date: Thu, 4 Apr 2024 09:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2523/3504]
 arch/parisc/include/asm/cmpxchg.h:75:24: error: implicit declaration of
 function 'cmpxchg_emu_u16'
Message-ID: <202404040944.CqvTiLwp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
commit: 2f6e60c348365df92f431f9101f7fa8f29c7a178 [2523/3504] parisc: Emulate two-byte cmpxchg
config: parisc-randconfig-r036-20230421 (https://download.01.org/0day-ci/archive/20240404/202404040944.CqvTiLwp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040944.CqvTiLwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040944.CqvTiLwp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/parisc/include/asm/cmpxchg.h: In function '__cmpxchg':
>> arch/parisc/include/asm/cmpxchg.h:75:24: error: implicit declaration of function 'cmpxchg_emu_u16' [-Werror=implicit-function-declaration]
      75 |         case 2: return cmpxchg_emu_u16((volatile u16 *)ptr, old, new);
         |                        ^~~~~~~~~~~~~~~
>> arch/parisc/include/asm/cmpxchg.h:75:66: error: 'new' undeclared (first use in this function); did you mean 'new_'?
      75 |         case 2: return cmpxchg_emu_u16((volatile u16 *)ptr, old, new);
         |                                                                  ^~~
         |                                                                  new_
   arch/parisc/include/asm/cmpxchg.h:75:66: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/cmpxchg_emu_u16 +75 arch/parisc/include/asm/cmpxchg.h

    64	
    65	/* don't worry...optimizer will get rid of most of this */
    66	static inline unsigned long
    67	__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new_, int size)
    68	{
    69		switch (size) {
    70	#ifdef CONFIG_64BIT
    71		case 8: return __cmpxchg_u64((u64 *)ptr, old, new_);
    72	#endif
    73		case 4: return __cmpxchg_u32((unsigned int *)ptr,
    74					     (unsigned int)old, (unsigned int)new_);
  > 75		case 2: return cmpxchg_emu_u16((volatile u16 *)ptr, old, new);
    76		case 1: return __cmpxchg_u8((u8 *)ptr, old & 0xff, new_ & 0xff);
    77		}
    78		__cmpxchg_called_with_bad_pointer();
    79		return old;
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
