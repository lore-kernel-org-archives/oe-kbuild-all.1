Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FDA947A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678369109; x=1709905109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+1N7oZ9WN4UEJjvPuArIvxFA+XkZ8qX43BySx68wsF8=;
  b=MMDSQRZLswb/UA+9gPR7H2kVygi0mp4opjubyt9sy/DM1CcIHun7p+Ws
   5XC8oOTMhTKuuBSLtkp/TiRML2rvvv+NrWWWHbCpNgqaST27+CcQtGWRP
   kVjQ/aCY8MT0vSPXBTswZmIq/JuAnjWmCbqjvz7HildCbTEGjniMToLqk
   uf+JgEcXALAwrcKtAZs7+DeoJav95vFYKcXI32/vxI5ifu2XnDouJ0Xa7
   rCi+FqCWm+1SViMpqnYbd+SP/CNnYm+oDOZX2BdqJmz3xrIQ3PIAqc+O8
   Qdaw+cjQDm+BrmkA5I9HeH7vrZif4+MAkhbi/FOPTZ1mBZRXQ3LLU9hGR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337971810"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="337971810"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 05:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="677374574"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="677374574"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2023 05:38:25 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paGTR-0002yt-0i;
	Thu, 09 Mar 2023 13:38:25 +0000
Date: Thu, 9 Mar 2023 21:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [niks:has_ioport_v3 38/38] include/uapi/linux/swab.h:120:9: error:
 call to '_inl' declared with attribute error: inl() requires
 CONFIG_HAS_IOPORT
Message-ID: <202303092119.ilYaiOrm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v3
head:   74753ca279ac0e793b76aa032b00fd1bff36f218
commit: 88531a05c1cf54fae93cea9ac2120de9da9783fd [38/38] asm-generic/io.h: drop inb() etc for HAS_IOPORT=n
config: m68k-randconfig-s041-20230309 (https://download.01.org/0day-ci/archive/20230309/202303092119.ilYaiOrm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=88531a05c1cf54fae93cea9ac2120de9da9783fd
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v3
        git checkout 88531a05c1cf54fae93cea9ac2120de9da9783fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092119.ilYaiOrm-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/iomap.c: In function 'iowrite16be':
   include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   lib/iomap.c:193:33: note: in expansion of macro 'outw'
     193 | #define pio_write16be(val,port) outw(swab16(val),port)
         |                                 ^~~~
   lib/iomap.c:219:23: note: in expansion of macro 'pio_write16be'
     219 |         IO_COND(addr, pio_write16be(val,port), mmio_write16be(val, addr));
         |                       ^~~~~~~~~~~~~
   lib/iomap.c: In function 'iowrite32be':
   include/asm-generic/io.h:625:15: error: call to '_outl' declared with attribute error: outl() requires CONFIG_HAS_IOPORT
     625 | #define _outl _outl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:662:14: note: in expansion of macro '_outl'
     662 | #define outl _outl
         |              ^~~~~
   lib/iomap.c:194:33: note: in expansion of macro 'outl'
     194 | #define pio_write32be(val,port) outl(swab32(val),port)
         |                                 ^~~~
   lib/iomap.c:231:23: note: in expansion of macro 'pio_write32be'
     231 |         IO_COND(addr, pio_write32be(val,port), mmio_write32be(val, addr));
         |                       ^~~~~~~~~~~~~
   lib/iomap.c: In function 'ioread8':
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   lib/iomap.c:81:30: note: in expansion of macro 'inb'
      81 |         IO_COND(addr, return inb(port), return readb(addr));
         |                              ^~~
   lib/iomap.c: In function 'ioread16':
   include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   lib/iomap.c:87:30: note: in expansion of macro 'inw'
      87 |         IO_COND(addr, return inw(port), return readw(addr));
         |                              ^~~
   lib/iomap.c: In function 'ioread16be':
   include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/linux/swab.h:7:17: note: in expansion of macro '__swab16'
       7 | # define swab16 __swab16
         |                 ^~~~~~~~
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   lib/iomap.c:64:35: note: in expansion of macro 'inw'
      64 | #define pio_read16be(port) swab16(inw(port))
         |                                   ^~~
   lib/iomap.c:93:30: note: in expansion of macro 'pio_read16be'
      93 |         IO_COND(addr, return pio_read16be(port), return mmio_read16be(addr));
         |                              ^~~~~~~~~~~~
   lib/iomap.c: In function 'ioread32be':
>> include/uapi/linux/swab.h:120:9: error: call to '_inl' declared with attribute error: inl() requires CONFIG_HAS_IOPORT
     120 |         __fswab32(x))
         |         ^~~~~~~~~~~~
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/linux/swab.h:8:17: note: in expansion of macro '__swab32'
       8 | # define swab32 __swab32
         |                 ^~~~~~~~
   lib/iomap.c:65:28: note: in expansion of macro 'swab32'
      65 | #define pio_read32be(port) swab32(inl(port))
         |                            ^~~~~~
   lib/iomap.c:105:30: note: in expansion of macro 'pio_read32be'
     105 |         IO_COND(addr, return pio_read32be(port), return mmio_read32be(addr));
         |                              ^~~~~~~~~~~~
   lib/iomap.c: In function 'iowrite8_rep':
   include/asm-generic/io.h:758:15: error: call to 'outsb' declared with attribute error: outsb() requires HAS_IOPORT
     758 | #define outsb outsb
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:386:23: note: in expansion of macro 'outsb'
     386 |         IO_COND(addr, outsb(port, src, count), mmio_outsb(addr, src, count));
         |                       ^~~~~
   lib/iomap.c: In function 'ioread32':
   include/asm-generic/io.h:577:14: error: call to '_inl' declared with attribute error: inl() requires CONFIG_HAS_IOPORT
     577 | #define _inl _inl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:650:13: note: in expansion of macro '_inl'
     650 | #define inl _inl
         |             ^~~~
   lib/iomap.c:99:30: note: in expansion of macro 'inl'
      99 |         IO_COND(addr, return inl(port), return readl(addr));
         |                              ^~~
   lib/iomap.c: In function 'iowrite8':
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   lib/iomap.c:207:23: note: in expansion of macro 'outb'
     207 |         IO_COND(addr, outb(val,port), writeb(val, addr));
         |                       ^~~~
   lib/iomap.c: In function 'iowrite16':
   include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   lib/iomap.c:213:23: note: in expansion of macro 'outw'
     213 |         IO_COND(addr, outw(val,port), writew(val, addr));
         |                       ^~~~
   lib/iomap.c: In function 'iowrite32':
   include/asm-generic/io.h:625:15: error: call to '_outl' declared with attribute error: outl() requires CONFIG_HAS_IOPORT
     625 | #define _outl _outl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:662:14: note: in expansion of macro '_outl'
     662 | #define outl _outl
         |              ^~~~~
   lib/iomap.c:225:23: note: in expansion of macro 'outl'
     225 |         IO_COND(addr, outl(val,port), writel(val, addr));
         |                       ^~~~
   lib/iomap.c: In function 'iowrite16_rep':
   include/asm-generic/io.h:772:15: error: call to 'outsw' declared with attribute error: outsw() requires HAS_IOPORT
     772 | #define outsw outsw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:392:23: note: in expansion of macro 'outsw'
     392 |         IO_COND(addr, outsw(port, src, count), mmio_outsw(addr, src, count));
         |                       ^~~~~
   lib/iomap.c: In function 'iowrite32_rep':
>> include/asm-generic/io.h:786:15: error: call to 'outsl' declared with attribute error: outsl() requires HAS_IOPORT
     786 | #define outsl outsl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:398:23: note: in expansion of macro 'outsl'
     398 |         IO_COND(addr, outsl(port, src,count), mmio_outsl(addr, src, count));
         |                       ^~~~~
   lib/iomap.c: In function 'ioread8_rep':
   include/asm-generic/io.h:719:14: error: call to 'insb' declared with attribute error: insb() requires HAS_IOPORT
     719 | #define insb insb
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:362:23: note: in expansion of macro 'insb'
     362 |         IO_COND(addr, insb(port,dst,count), mmio_insb(addr, dst, count));
         |                       ^~~~
   lib/iomap.c: In function 'ioread16_rep':
   include/asm-generic/io.h:732:14: error: call to 'insw' declared with attribute error: insw() requires HAS_IOPORT
     732 | #define insw insw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:368:23: note: in expansion of macro 'insw'
     368 |         IO_COND(addr, insw(port,dst,count), mmio_insw(addr, dst, count));
         |                       ^~~~
   lib/iomap.c: In function 'ioread32_rep':
>> include/asm-generic/io.h:745:14: error: call to 'insl' declared with attribute error: insl() requires HAS_IOPORT
     745 | #define insl insl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:374:23: note: in expansion of macro 'insl'
     374 |         IO_COND(addr, insl(port,dst,count), mmio_insl(addr, dst, count));
         |                       ^~~~


vim +/_inl +120 include/uapi/linux/swab.h

607ca46e97a1b6 David Howells 2012-10-13  109  
607ca46e97a1b6 David Howells 2012-10-13  110  /**
607ca46e97a1b6 David Howells 2012-10-13  111   * __swab32 - return a byteswapped 32-bit value
607ca46e97a1b6 David Howells 2012-10-13  112   * @x: value to byteswap
607ca46e97a1b6 David Howells 2012-10-13  113   */
7322dd755e7dd3 Arnd Bergmann 2016-05-05  114  #ifdef __HAVE_BUILTIN_BSWAP32__
7322dd755e7dd3 Arnd Bergmann 2016-05-05  115  #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
7322dd755e7dd3 Arnd Bergmann 2016-05-05  116  #else
607ca46e97a1b6 David Howells 2012-10-13  117  #define __swab32(x)				\
d30dfd490f7dc4 Justin Stitt  2022-06-08  118  	(__u32)(__builtin_constant_p(x) ?	\
607ca46e97a1b6 David Howells 2012-10-13  119  	___constant_swab32(x) :			\
607ca46e97a1b6 David Howells 2012-10-13 @120  	__fswab32(x))
7322dd755e7dd3 Arnd Bergmann 2016-05-05  121  #endif
607ca46e97a1b6 David Howells 2012-10-13  122  

:::::: The code at line 120 was first introduced by commit
:::::: 607ca46e97a1b6594b29647d98a32d545c24bdff UAPI: (Scripted) Disintegrate include/linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
