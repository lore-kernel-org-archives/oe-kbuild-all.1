Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489313502A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 05:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782191730; cv=none; b=M7qscxJ0KbgUc/hR0+x/wkF99HBmlM0m0341OdHxTs9gxSj1aLmWjKyCvvpeRsZ3fxNFVnCtrQv1WPaLOKuVnrnLb3Py/rhyWD/fUX+I9LYmeIngt7ZhYz8NFXyNtW6nLaMKTigQ5hz6YNytCy6dCjqBxfY3GGQMmhVmAUqfw+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782191730; c=relaxed/simple;
	bh=lnJVi4rixBZ0aTZ0MgGkCPPqrp1JNsoCDzUxb3efMY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j4yhVmD4WDU5MI/4YgxIuOU6C9RL80Eb1xFGlkO0CEfgtIvhBitTt5WRmRXGdD5QNs7XOwlU+U1n34cU/5a4lSQ3YhkSwccNVuT/eFbnp7W2afc0xywk3Ej5xepNqQ7Ztb7+3+2qTQhV35etBAn7/O/wS0WWtPZrTaNVbF7LvCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgEnwpaQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgEnwpaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782191729; x=1813727729;
  h=date:from:to:cc:subject:message-id;
  bh=lnJVi4rixBZ0aTZ0MgGkCPPqrp1JNsoCDzUxb3efMY8=;
  b=OgEnwpaQbrWSTF2kGiUk4RHgX5ljsXL6MKqQ7gkoUoQ1v91cB70iimBu
   +M/QAHR9dlgHppaH7x1kt1qH3SU/+teo1HhfWNh9ADFZiqzgBO74D5IWC
   W6qVabCp2Hic7P+cY6h5VEwc9Ldg9AVPKYYX+HpjGgm324pslsD7kzbqy
   LlgaCRifCXdvN+sv0QFuDgIS/ElKa2k0lnuc5jKVcS1rjyK6V0h2SwrMd
   5c805ZmBe22ufzD/hQBUZ3tYBaW83BASRUhQwFvR8WNpMdFOczEKJ7mcC
   tBWmI3xNTIl3RbsEBTjTwX3d+kX8pSuiJtP6wfrnTfd2XTVzG3NdNF1cx
   w==;
X-CSE-ConnectionGUID: mrDPwyrrR0e5D0XvFesBtw==
X-CSE-MsgGUID: qTJ2TRCXSxK1ro6PG0H18g==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94423176"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94423176"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 22:15:27 -0700
X-CSE-ConnectionGUID: AfHbOVkCQSqCJshaZKOXVg==
X-CSE-MsgGUID: RYSHrChGStipRFjiC8jTag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="254503798"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2026 22:15:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbtTn-000000002Gg-1fuY;
	Tue, 23 Jun 2026 05:15:23 +0000
Date: Tue, 23 Jun 2026 13:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 9/36]
 arch/parisc/include/asm/io.h:209:14: error: invalid use of void expression
Message-ID: <202606231352.5tRFqQNB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: 27573170c5c905b0eb87738b380997cc16ab1bb3 [9/36] arcnet: Remove function timing code
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260623/202606231352.5tRFqQNB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231352.5tRFqQNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231352.5tRFqQNB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/arcnet/com20020.c: In function 'com20020_copy_from_card':
   drivers/net/arcnet/com20020.c:73:9: error: implicit declaration of function 'TIME'; did you mean 'ETIME'? [-Wimplicit-function-declaration]
      73 |         TIME(dev, "insb", count,
         |         ^~~~
         |         ETIME
   In file included from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:44,
                    from include/linux/netdevice.h:38,
                    from drivers/net/arcnet/com20020.c:37:
>> arch/parisc/include/asm/io.h:209:14: error: invalid use of void expression
     209 | #define insb insb
   drivers/net/arcnet/com20020.c:74:14: note: in expansion of macro 'insb'
      74 |              insb(ioaddr + COM20020_REG_RW_MEMDATA, buf, count));
         |              ^~~~
   drivers/net/arcnet/com20020.c: In function 'com20020_copy_to_card':
   arch/parisc/include/asm/io.h:212:15: error: invalid use of void expression
     212 | #define outsb outsb
   drivers/net/arcnet/com20020.c:88:14: note: in expansion of macro 'outsb'
      88 |              outsb(ioaddr + COM20020_REG_RW_MEMDATA, buf, count));
         |              ^~~~~


vim +209 arch/parisc/include/asm/io.h

^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  199  
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  200  /*
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  201   * String versions of in/out ops:
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  202   */
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  203  extern void insb (unsigned long port, void *dst, unsigned long count);
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  204  extern void insw (unsigned long port, void *dst, unsigned long count);
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  205  extern void insl (unsigned long port, void *dst, unsigned long count);
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  206  extern void outsb (unsigned long port, const void *src, unsigned long count);
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  207  extern void outsw (unsigned long port, const void *src, unsigned long count);
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  208  extern void outsl (unsigned long port, const void *src, unsigned long count);
437b6b35362b20 arch/parisc/include/asm/io.h Linus Walleij  2022-09-04 @209  #define insb insb
437b6b35362b20 arch/parisc/include/asm/io.h Linus Walleij  2022-09-04  210  #define insw insw
437b6b35362b20 arch/parisc/include/asm/io.h Linus Walleij  2022-09-04  211  #define insl insl
437b6b35362b20 arch/parisc/include/asm/io.h Linus Walleij  2022-09-04  212  #define outsb outsb
437b6b35362b20 arch/parisc/include/asm/io.h Linus Walleij  2022-09-04  213  #define outsw outsw
437b6b35362b20 arch/parisc/include/asm/io.h Linus Walleij  2022-09-04  214  #define outsl outsl
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  215  

:::::: The code at line 209 was first introduced by commit
:::::: 437b6b35362b206fdf881fe6dea76720eedb6d25 parisc: Use the generic IO helpers

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
