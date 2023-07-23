Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A6F3C1C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 23:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690153222; x=1721689222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gvPafaQjUnOqGHV2ibWH7Ml7XbWADGSbDAX8WZU4hP0=;
  b=Vz6+xM8AQN9fhZySnDAZvRPAOETy37kmRDrO2F3+H9ypUzsfqaLS0OM/
   UNH042P/PgiR27OZ09wFspkbBrLXFQQ17FaAx3YStp6983O6KWypjcG0k
   0Og0NEkpDowSId/BvNT0ngUQR1wTf42DoYmXRdfQX/j98f827ZaIpEIuE
   IT9ekALoFqLg6ZOZPb2JCSBQsdocHkXIhqz15SrQzxp5G6UH7i1ufEYK9
   9umzfRMvneowOosUF9YE4XEtcDyAH6bJfx5KTVUmKwX2nmEjAs1wn6424
   NOyerOM17zdzPfa1pFiO9ordf9sEXLRTSMKqRMnaIOO99Z90GZ+Kvch32
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="347597651"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="347597651"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 16:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="795578576"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="795578576"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jul 2023 16:00:20 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNi3n-0009K1-10;
	Sun, 23 Jul 2023 23:00:19 +0000
Date: Mon, 24 Jul 2023 06:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 6010/6356] include/asm-generic/termios.h:25:
 Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
Message-ID: <202307240620.JFnezTEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: 3271859c2d2709515db4ad7a6cbdd3617da04405 [6010/6356] tty: Prevent writing chars during tcsetattr TCSADRAIN/FLUSH
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230724/202307240620.JFnezTEx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240620.JFnezTEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240620.JFnezTEx-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/asm-generic/termios.h: Assembler messages:
   include/asm-generic/termios.h:59: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   include/asm-generic/termios.h:59: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   include/asm-generic/termios.h:60: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   include/asm-generic/termios.h:60: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   include/asm-generic/termios.h:61: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   include/asm-generic/termios.h:61: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   include/asm-generic/termios.h:62: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   include/asm-generic/termios.h:62: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   include/asm-generic/termios.h:63: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   include/asm-generic/termios.h:63: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
>> include/asm-generic/termios.h:25: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
>> include/asm-generic/termios.h:25: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   include/asm-generic/termios.h:29: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   include/asm-generic/termios.h:29: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   include/asm-generic/termios.h:33: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   include/asm-generic/termios.h:33: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   include/asm-generic/termios.h:37: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   include/asm-generic/termios.h:37: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   include/asm-generic/termios.h:41: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   include/asm-generic/termios.h:41: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   drivers/tty/tty_ioctl.c:859: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/tty/tty_ioctl.c:859: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   drivers/tty/tty_ioctl.c:863: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/tty/tty_ioctl.c:863: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required


vim +25 include/asm-generic/termios.h

6103ec56c65c337 Arnd Bergmann 2009-05-13  16  
6103ec56c65c337 Arnd Bergmann 2009-05-13  17  /*
6103ec56c65c337 Arnd Bergmann 2009-05-13  18   * Translate a "termio" structure into a "termios". Ugh.
6103ec56c65c337 Arnd Bergmann 2009-05-13  19   */
6103ec56c65c337 Arnd Bergmann 2009-05-13  20  static inline int user_termio_to_kernel_termios(struct ktermios *termios,
6103ec56c65c337 Arnd Bergmann 2009-05-13  21  						const struct termio __user *termio)
6103ec56c65c337 Arnd Bergmann 2009-05-13  22  {
6103ec56c65c337 Arnd Bergmann 2009-05-13  23  	unsigned short tmp;
6103ec56c65c337 Arnd Bergmann 2009-05-13  24  
6103ec56c65c337 Arnd Bergmann 2009-05-13 @25  	if (get_user(tmp, &termio->c_iflag) < 0)
6103ec56c65c337 Arnd Bergmann 2009-05-13  26  		goto fault;
6103ec56c65c337 Arnd Bergmann 2009-05-13  27  	termios->c_iflag = (0xffff0000 & termios->c_iflag) | tmp;
6103ec56c65c337 Arnd Bergmann 2009-05-13  28  
6103ec56c65c337 Arnd Bergmann 2009-05-13  29  	if (get_user(tmp, &termio->c_oflag) < 0)
6103ec56c65c337 Arnd Bergmann 2009-05-13  30  		goto fault;
6103ec56c65c337 Arnd Bergmann 2009-05-13  31  	termios->c_oflag = (0xffff0000 & termios->c_oflag) | tmp;
6103ec56c65c337 Arnd Bergmann 2009-05-13  32  
6103ec56c65c337 Arnd Bergmann 2009-05-13  33  	if (get_user(tmp, &termio->c_cflag) < 0)
6103ec56c65c337 Arnd Bergmann 2009-05-13  34  		goto fault;
6103ec56c65c337 Arnd Bergmann 2009-05-13  35  	termios->c_cflag = (0xffff0000 & termios->c_cflag) | tmp;
6103ec56c65c337 Arnd Bergmann 2009-05-13  36  
6103ec56c65c337 Arnd Bergmann 2009-05-13  37  	if (get_user(tmp, &termio->c_lflag) < 0)
6103ec56c65c337 Arnd Bergmann 2009-05-13  38  		goto fault;
6103ec56c65c337 Arnd Bergmann 2009-05-13  39  	termios->c_lflag = (0xffff0000 & termios->c_lflag) | tmp;
6103ec56c65c337 Arnd Bergmann 2009-05-13  40  
6103ec56c65c337 Arnd Bergmann 2009-05-13  41  	if (get_user(termios->c_line, &termio->c_line) < 0)
6103ec56c65c337 Arnd Bergmann 2009-05-13  42  		goto fault;
6103ec56c65c337 Arnd Bergmann 2009-05-13  43  
6103ec56c65c337 Arnd Bergmann 2009-05-13  44  	if (copy_from_user(termios->c_cc, termio->c_cc, NCC) != 0)
6103ec56c65c337 Arnd Bergmann 2009-05-13  45  		goto fault;
6103ec56c65c337 Arnd Bergmann 2009-05-13  46  
6103ec56c65c337 Arnd Bergmann 2009-05-13  47  	return 0;
6103ec56c65c337 Arnd Bergmann 2009-05-13  48  
6103ec56c65c337 Arnd Bergmann 2009-05-13  49   fault:
6103ec56c65c337 Arnd Bergmann 2009-05-13  50  	return -EFAULT;
6103ec56c65c337 Arnd Bergmann 2009-05-13  51  }
6103ec56c65c337 Arnd Bergmann 2009-05-13  52  

:::::: The code at line 25 was first introduced by commit
:::::: 6103ec56c65c33774c7c38652c8204120c3c7519 asm-generic: add generic ABI headers

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@klappe2.(none)>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
