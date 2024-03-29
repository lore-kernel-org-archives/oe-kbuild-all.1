Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF11C0DE2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711725597; cv=none; b=sdZBAxRYS1QIpx7YOP30akUGqND+5E9P3jmF2LxklBGue+m7NuBPdk6v16Kngaj75xcX61ZKMb5NizS+decivpRhBK1caqI698ZwUpmO1HK8XK/nIwCPWPstZbKUpT3Jr2wbG/OYGqeysh6IiIL6BQQyCmexDF8QDT+6OBuG0+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711725597; c=relaxed/simple;
	bh=6lRyftTz6DnnozwPgVFSAhecaNqGp6DtbqpR95KuyLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Olot7tKv9BJLNkUH6W2HwIA+nzy0ngi8d6djOl6AXxd4ce91vD6SHMqsY81iHOWMhpuEbJNDvzUGN3+nJ8A8SBGPvhE7gfIDxRiUOnuMU7Q6+3zcCKPI7RnyiSoDTlca5VzHLHxBSO4Emev60RkySfy18XO6qQV72zDmQsH9Sfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFBSiDmp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFBSiDmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711725597; x=1743261597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lRyftTz6DnnozwPgVFSAhecaNqGp6DtbqpR95KuyLY=;
  b=oFBSiDmpoM37oUmErVXy9WSt6FwLE6HLla/RBXMfXeq7eu3LHtJBUFSH
   bTGM7gTbTupjEIPydHyILDZ90KnY2Uj26s6Fm7uu/hLkIQVqpkZ3ot1eP
   frnfKWPXHnZxDPiLlEXlivjZZBP03ixnLFHwdhKYrEDr0gQutsxFbj1cE
   8TKOA1NgJgeAHcdbvWk6REtxboVGZWQmf4fAFMFGxlMQInO8XD4YGpzGZ
   ij/0Fjfe9dVkz5agnqCEJniZPolQjVCPn+WgHZgDyjGVa+5jI3eoVH1MZ
   hILj9X3FtfOFNNPsFzXA8Eow7e/PI4hSovuStpiFU4Ko8KmxEyNxEmIrI
   Q==;
X-CSE-ConnectionGUID: XJD2bzHTTMG27XsHyH9ppg==
X-CSE-MsgGUID: HCFKyGq7QjaysszglbtWDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="17472390"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="17472390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 08:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="17636361"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Mar 2024 08:19:54 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqE1I-0003Jy-0n;
	Fri, 29 Mar 2024 15:19:52 +0000
Date: Fri, 29 Mar 2024 23:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2024.03.27b 63/69]
 arch/sh/include/asm/cmpxchg.h:60:24: error: implicit declaration of function
 'cmpxchg_emu_u8'
Message-ID: <202403292318.88dppMPt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2024.03.27b
head:   786fab3085d764055a78edb54023420920344333
commit: 4977f14819143065158973013b51a3c1f926e61e [63/69] sh: Emulate one-byte and two-byte cmpxchg
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240329/202403292318.88dppMPt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403292318.88dppMPt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403292318.88dppMPt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sh/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sh/include/asm/bitops.h:63,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   arch/sh/include/asm/cmpxchg.h: In function '__cmpxchg':
>> arch/sh/include/asm/cmpxchg.h:60:24: error: implicit declaration of function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
      60 |                 return cmpxchg_emu_u8((volatile u8 *)ptr, old, new);
         |                        ^~~~~~~~~~~~~~
>> arch/sh/include/asm/cmpxchg.h:62:24: error: implicit declaration of function 'cmpxchg_emu_u16' [-Werror=implicit-function-declaration]
      62 |                 return cmpxchg_emu_u16((volatile u16 *)ptr, old, new);
         |                        ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/cmpxchg_emu_u8 +60 arch/sh/include/asm/cmpxchg.h

    54	
    55	static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
    56			unsigned long new, int size)
    57	{
    58		switch (size) {
    59		case 1:
  > 60			return cmpxchg_emu_u8((volatile u8 *)ptr, old, new);
    61		case 2:
  > 62			return cmpxchg_emu_u16((volatile u16 *)ptr, old, new);
    63		case 4:
    64			return __cmpxchg_u32(ptr, old, new);
    65		}
    66		__cmpxchg_called_with_bad_pointer();
    67		return old;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
