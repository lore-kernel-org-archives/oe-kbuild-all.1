Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F2B20F0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 06:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678083010; x=1709619010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+0JzAS7mmPsgPfbR9f+GKQzjLZucLU1PVYoB2nEzj0=;
  b=GbPXJxnBMQIlDpQ1trYX37dWbAH1UKgH8deeZ938AElLd8zS2tlA+I2C
   wkulfmGcYNR2Vzk1PP1nDIesw5H1PecZ2mZkfmPTGz3BNPqtZGy9MfFRy
   N+oO4y5Zxs8ZNr8ksJTvjTF+dYDwuyybt8QFVGao4DF6wKK843DLCf9fF
   QSsvZxhXqq8d8X0Ord5WHMSIMWlvg8prDqU2Dt1oZEUP1dYdd+nmFkCDY
   MyiBI28pKN6t5TO5AF5ucuHwd3F9zXEcbQcXh23CtDMlqBqOIln9fqpSg
   yfcM9CCt87E1Zpmx2/U/gRcRvMnfGGIeBKJ6E1dvF9ewBhpPkKZarSVt+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="332958295"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="332958295"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 22:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="744931500"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="744931500"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Mar 2023 22:08:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ41h-00005M-1a;
	Mon, 06 Mar 2023 06:08:49 +0000
Date: Mon, 6 Mar 2023 14:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Jason A. Donenfeld" <zx2c4@kernel.org>
Subject: [stable:linux-4.19.y 1327/5333] drivers/char/random.c:2049: Error:
 unrecognized opcode `csrs sstatus,s9'
Message-ID: <202303061427.mnsTqeIp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   5504146b2053f842426834d275002974109f39a6
commit: a6f8ba674655f511bbf0e55d4f16c581f7a8a35a [1327/5333] random: fix data race on crng_node_pool
config: riscv-randconfig-c043-20230305 (https://download.01.org/0day-ci/archive/20230306/202303061427.mnsTqeIp-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a6f8ba674655f511bbf0e55d4f16c581f7a8a35a
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout a6f8ba674655f511bbf0e55d4f16c581f7a8a35a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/char/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061427.mnsTqeIp-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~
   arch/riscv/include/asm/uaccess.h:261:9: note: in expansion of macro 'access_ok'
     261 |         access_ok(VERIFY_READ, __p, sizeof(*__p)) ?             \
         |         ^~~~~~~~~
   drivers/char/random.c:2053:21: note: in expansion of macro 'get_user'
    2053 |                 if (get_user(size, p++))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   drivers/char/random.c:2053:17: note: in expansion of macro 'if'
    2053 |                 if (get_user(size, p++))
         |                 ^~
   drivers/char/random.c: In function '__do_sys_getrandom':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   drivers/char/random.c:2120:9: note: in expansion of macro 'if'
    2120 |         if (!crng_ready()) {
         |         ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   drivers/char/random.c:431:23: note: in expansion of macro 'likely'
     431 | #define crng_ready() (likely(crng_init > 1))
         |                       ^~~~~~
   drivers/char/random.c:2120:14: note: in expansion of macro 'crng_ready'
    2120 |         if (!crng_ready()) {
         |              ^~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   drivers/char/random.c:2120:9: note: in expansion of macro 'if'
    2120 |         if (!crng_ready()) {
         |         ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   drivers/char/random.c:2124:17: note: in expansion of macro 'if'
    2124 |                 if (unlikely(ret))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   drivers/char/random.c:2124:21: note: in expansion of macro 'unlikely'
    2124 |                 if (unlikely(ret))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   drivers/char/random.c:2124:17: note: in expansion of macro 'if'
    2124 |                 if (unlikely(ret))
         |                 ^~
   drivers/char/random.c: In function 'add_hwgenerator_randomness':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   drivers/char/random.c:2406:9: note: in expansion of macro 'if'
    2406 |         if (unlikely(crng_init == 0)) {
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   drivers/char/random.c:2406:13: note: in expansion of macro 'unlikely'
    2406 |         if (unlikely(crng_init == 0)) {
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   drivers/char/random.c:2406:9: note: in expansion of macro 'if'
    2406 |         if (unlikely(crng_init == 0)) {
         |         ^~
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1'
   drivers/char/random.c:2037: Error: unrecognized opcode `csrs sstatus,a4'
   drivers/char/random.c:2037: Error: unrecognized opcode `csrc sstatus,a4'
   drivers/char/random.c:2043: Error: unrecognized opcode `csrs sstatus,a4'
   drivers/char/random.c:2043: Error: unrecognized opcode `csrc sstatus,a4'
>> drivers/char/random.c:2049: Error: unrecognized opcode `csrs sstatus,s9'
>> drivers/char/random.c:2049: Error: unrecognized opcode `csrc sstatus,s9'
   drivers/char/random.c:2053: Error: unrecognized opcode `csrs sstatus,s9'
   drivers/char/random.c:2053: Error: unrecognized opcode `csrc sstatus,s9'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1'


vim +2049 drivers/char/random.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  2026  
43ae4860ff4a35 Matt Mackall   2008-04-29  2027  static long random_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2028  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2029  	int size, ent_count;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2030  	int __user *p = (int __user *)arg;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2031  	int retval;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2032  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2033  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2034  	case RNDGETENTCNT:
43ae4860ff4a35 Matt Mackall   2008-04-29  2035  		/* inherently racy, no point locking */
a283b5c459784f H. Peter Anvin 2013-09-10  2036  		ent_count = ENTROPY_BITS(&input_pool);
a283b5c459784f H. Peter Anvin 2013-09-10  2037  		if (put_user(ent_count, p))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2038  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2039  		return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2040  	case RNDADDTOENTCNT:
^1da177e4c3f41 Linus Torvalds 2005-04-16  2041  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2042  			return -EPERM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2043  		if (get_user(ent_count, p))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2044  			return -EFAULT;
86a574de4590ff Theodore Ts'o  2016-07-03  2045  		return credit_entropy_bits_safe(&input_pool, ent_count);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2046  	case RNDADDENTROPY:
^1da177e4c3f41 Linus Torvalds 2005-04-16  2047  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2048  			return -EPERM;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @2049  		if (get_user(ent_count, p++))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2050  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2051  		if (ent_count < 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2052  			return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2053  		if (get_user(size, p++))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2054  			return -EFAULT;
7f397dcdb78d69 Matt Mackall   2007-05-29  2055  		retval = write_pool(&input_pool, (const char __user *)p,
7f397dcdb78d69 Matt Mackall   2007-05-29  2056  				    size);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2057  		if (retval < 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2058  			return retval;
86a574de4590ff Theodore Ts'o  2016-07-03  2059  		return credit_entropy_bits_safe(&input_pool, ent_count);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2060  	case RNDZAPENTCNT:
^1da177e4c3f41 Linus Torvalds 2005-04-16  2061  	case RNDCLEARPOOL:
ae9ecd92ddabc2 Theodore Ts'o  2013-11-03  2062  		/*
ae9ecd92ddabc2 Theodore Ts'o  2013-11-03  2063  		 * Clear the entropy pool counters. We no longer clear
ae9ecd92ddabc2 Theodore Ts'o  2013-11-03  2064  		 * the entropy pool, as that's silly.
ae9ecd92ddabc2 Theodore Ts'o  2013-11-03  2065  		 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  2066  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2067  			return -EPERM;
ae9ecd92ddabc2 Theodore Ts'o  2013-11-03  2068  		input_pool.entropy_count = 0;
ae9ecd92ddabc2 Theodore Ts'o  2013-11-03  2069  		blocking_pool.entropy_count = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2070  		return 0;
d848e5f8e1ebdb Theodore Ts'o  2018-04-11  2071  	case RNDRESEEDCRNG:
d848e5f8e1ebdb Theodore Ts'o  2018-04-11  2072  		if (!capable(CAP_SYS_ADMIN))
d848e5f8e1ebdb Theodore Ts'o  2018-04-11  2073  			return -EPERM;
d848e5f8e1ebdb Theodore Ts'o  2018-04-11  2074  		if (crng_init < 2)
d848e5f8e1ebdb Theodore Ts'o  2018-04-11  2075  			return -ENODATA;
1fc338cde538bc Eric Biggers   2021-01-12  2076  		crng_reseed(&primary_crng, &input_pool);
d848e5f8e1ebdb Theodore Ts'o  2018-04-11  2077  		crng_global_init_time = jiffies - 1;
d848e5f8e1ebdb Theodore Ts'o  2018-04-11  2078  		return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2079  	default:
^1da177e4c3f41 Linus Torvalds 2005-04-16  2080  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2081  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2082  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2083  

:::::: The code at line 2049 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
