Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B8365C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 01:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713489176; cv=none; b=OAiArcASLCMU3rpy2hdfcIvs/zdE26R+yrH/eTh5nUPInVp//R2VmK7pTbZLOHht0lgozAvGhYx4Bb8QvySbL/vGRJZaZvbJlYRjOOm9cLRQbbCfYUFmCTuNcZ9MQUHRbz8HFPrwrAf9NIGsXFGencQHNb/bfROw3GmV5FpQViA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713489176; c=relaxed/simple;
	bh=dQT4jsLRl5WqpTRCvYhvqE39IdgEsHaUVJJbgLgwztc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JmhILx5JH5nd3W+V9f//9WvJSsgHmb4eamD52qq7bacvC9siTl5VqapNn+bWrqoQjbJX9cTq8H+IX0iTKjd3hjY/6inMI3q5A9ynAG9q8SYZTtOx1iDCFbZUDZLBixI8ncNwoA8VoTMf8GCYrD+vBKIt8yRNk3pNnuKnAx2NS/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0CE3jNx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0CE3jNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713489174; x=1745025174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dQT4jsLRl5WqpTRCvYhvqE39IdgEsHaUVJJbgLgwztc=;
  b=C0CE3jNxU9Uyp6cf/ZZG3q/Sl+Z3el/acmuCOuwQuHhb6R57pf8cpder
   KpEmuZpeUIcoWqC6sLhKi7ige3s5vxvQLmMoXKV9+LS1kJtnjFTeNTLsJ
   WGz13I37xxh6VcOxXfpy1TjpuO/lu0nudE9BE/LZYRUwVMvJ1BYL3MPRu
   DMM6vvcribhBxMDYd9aBUO5RiADToDntZLUh2VfapMMclBEWKfR9C4MY8
   Bts8SucnQM/IWBGmVFoDHpOaePI8xPSIBofiikzEsdS+wjNlrxJPYbDwh
   ate3tWBuItMjwAt7oPH/yij7nB3/3HRnVwLIV1QM9xHyQiGa/pSoadiSE
   w==;
X-CSE-ConnectionGUID: pkYyu4C7TL+biqUjQk809Q==
X-CSE-MsgGUID: ACaBpgRrQem9YP+Pl9fuuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9197868"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9197868"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 18:12:53 -0700
X-CSE-ConnectionGUID: 0spCgfwwT4CfgjpviYl6TQ==
X-CSE-MsgGUID: crZ3aMZ9RvGzMqny6DOD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23217982"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Apr 2024 18:12:51 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxco5-0009R0-0S;
	Fri, 19 Apr 2024 01:12:49 +0000
Date: Fri, 19 Apr 2024 09:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Michael Ellerman <mpe@ellerman.id.au>
Subject: [linuxppc:next-test 11/11] arch/powerpc/include/asm/io.h:698:14:
 error: implicit declaration of function 'outb'; did you mean '_outsb'?
Message-ID: <202404190958.9QODkytX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next-test
head:   3cfdbc2274139bbcc09a44f8aa18d08c0abfd51e
commit: 3cfdbc2274139bbcc09a44f8aa18d08c0abfd51e [11/11] powerpc: drop port I/O helpers for CONFIG_HAS_IOPORT=n
config: powerpc-ppa8548_defconfig (https://download.01.org/0day-ci/archive/20240419/202404190958.9QODkytX-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190958.9QODkytX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190958.9QODkytX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from drivers/tty/serial/8250/8250_port.c:18:
   drivers/tty/serial/8250/8250_port.c: In function 'hub6_serial_in':
>> arch/powerpc/include/asm/io.h:698:14: error: implicit declaration of function 'outb'; did you mean '_outsb'? [-Werror=implicit-function-declaration]
     698 | #define outb outb
         |              ^~~~
   drivers/tty/serial/8250/8250_port.c:344:9: note: in expansion of macro 'outb'
     344 |         outb(p->hub6 - 1 + offset, p->iobase);
         |         ^~~~
>> arch/powerpc/include/asm/io.h:695:13: error: implicit declaration of function 'inb'; did you mean '_insb'? [-Werror=implicit-function-declaration]
     695 | #define inb inb
         |             ^~~
   drivers/tty/serial/8250/8250_port.c:345:16: note: in expansion of macro 'inb'
     345 |         return inb(p->iobase + 1);
         |                ^~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/kfifo.h:42,
                    from include/linux/tty_port.h:5,
                    from include/linux/tty.h:11,
                    from drivers/tty/serial/8250/8250_early.c:26:
   drivers/tty/serial/8250/8250_early.c: In function 'serial8250_early_in':
>> arch/powerpc/include/asm/io.h:695:13: error: implicit declaration of function 'inb'; did you mean '_insb'? [-Werror=implicit-function-declaration]
     695 | #define inb inb
         |             ^~~
   drivers/tty/serial/8250/8250_early.c:50:24: note: in expansion of macro 'inb'
      50 |                 return inb(port->iobase + offset);
         |                        ^~~
   drivers/tty/serial/8250/8250_early.c: In function 'serial8250_early_out':
>> arch/powerpc/include/asm/io.h:698:14: error: implicit declaration of function 'outb'; did you mean '_outsb'? [-Werror=implicit-function-declaration]
     698 | #define outb outb
         |              ^~~~
   drivers/tty/serial/8250/8250_early.c:74:17: note: in expansion of macro 'outb'
      74 |                 outb(value, port->iobase + offset);
         |                 ^~~~
   cc1: some warnings being treated as errors


vim +698 arch/powerpc/include/asm/io.h

3cfdbc2274139b arch/powerpc/include/asm/io.h Arnd Bergmann          2024-04-16  694  
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21 @695  #define inb inb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  696  #define inw inw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  697  #define inl inl
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21 @698  #define outb outb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  699  #define outw outw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  700  #define outl outl
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  701  #define insb insb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  702  #define insw insw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  703  #define insl insl
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  704  #define outsb outsb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  705  #define outsw outsw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  706  #define outsl outsl
68a64357d15ae4 include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-13  707  #ifdef __powerpc64__
4cb3cee03d558f include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-11  708  #define readq	readq
4cb3cee03d558f include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-11  709  #define writeq	writeq
68a64357d15ae4 include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-13  710  #endif
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  711  #define memset_io memset_io
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  712  #define memcpy_fromio memcpy_fromio
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  713  #define memcpy_toio memcpy_toio
68a64357d15ae4 include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-13  714  

:::::: The code at line 698 was first introduced by commit
:::::: 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e powerpc: inline iomap accessors

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
