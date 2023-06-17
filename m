Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADFB10EF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 21:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687038595; x=1718574595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WaPV7ZbsPIguC5Jg2gDaTYFdj1ACEMUo5LelACSmGlE=;
  b=OP+K1F3PvrBqC24P7zkdHLsPRfv3FTkTEYMlk2vZ4lGtLoD10t8OUuhh
   +qafm3n7wHj2OvL2IyMA+woNCPsqa5CJnhKKITEaDqSwM2CvQ89IQnWna
   C/bhj1xho9UNu5IFfKIRXk1Mz4gPda5o/N8DHEQdjP5fI0dWzqZwUC3AZ
   l3eWZPeLjkU27SDBvziAdJKVUU/9Fur+sfbyaJ63qVSi80m10daLoGosl
   rZj16mW+41/K53pyZLS26tRZVvmcCgI3qpCAyKmfCIdWO2myANk7kcm86
   2UV+fwdEHCSEFRBdpXsNYP46Kk5fpLhilRzswSwYTgpV+U3dg6K6JbitD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="423085392"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="423085392"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 14:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="803198763"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="803198763"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2023 14:49:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAdnr-00038a-1F;
	Sat, 17 Jun 2023 21:49:51 +0000
Date: Sun, 18 Jun 2023 05:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Jason A. Donenfeld" <zx2c4@kernel.org>
Subject: [stable:linux-4.19.y 3113/6264] drivers/char/random.c:1336: Error:
 unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
Message-ID: <202306180515.FoamKc6X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   c111487599ab513f5a7ae4bb6fedaa077b022ecb
commit: 1923d9a8a08684c063da049fa9d5d8139edbbcbb [3113/6264] random: convert to using fops->write_iter()
config: riscv-randconfig-r014-20230614 (https://download.01.org/0day-ci/archive/20230618/202306180515.FoamKc6X-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180515.FoamKc6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180515.FoamKc6X-lkp@intel.com/

All errors (new ones prefixed by >>):

     418 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                         ^~~~~~
   drivers/char/random.c:83:23: note: in expansion of macro 'static_branch_likely'
      83 | #define crng_ready() (static_branch_likely(&crng_is_ready) || crng_init >= CRNG_READY)
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:1363:22: note: in expansion of macro 'crng_ready'
    1363 |                 if (!crng_ready())
         |                      ^~~~~~~~~~
   include/linux/compiler.h:61:31: warning: ignoring attribute 'section ("_ftrace_branch")' because it conflicts with previous 'section ("_ftrace_annotated_branch")' [-Wattributes]
      61 |                 static struct ftrace_branch_data                        \
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:49: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                                 ^~~~
   drivers/char/random.c:1363:17: note: in expansion of macro 'if'
    1363 |                 if (!crng_ready())
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:418:41: note: in expansion of macro 'likely'
     418 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                         ^~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/jump_label.h:327:9: note: in expansion of macro 'if'
     327 |         if (!__builtin_types_compatible_p(typeof(*x), struct static_key) &&     \
         |         ^~
   include/linux/jump_label.h:418:48: note: in expansion of macro 'static_key_enabled'
     418 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                                ^~~~~~~~~~~~~~~~~~
   drivers/char/random.c:83:23: note: in expansion of macro 'static_branch_likely'
      83 | #define crng_ready() (static_branch_likely(&crng_is_ready) || crng_init >= CRNG_READY)
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:1363:22: note: in expansion of macro 'crng_ready'
    1363 |                 if (!crng_ready())
         |                      ^~~~~~~~~~
   include/linux/compiler.h:28:33: note: previous declaration here
      28 |                                 ______f = {                             \
         |                                 ^~~~~~~
   include/linux/compiler.h:58:49: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                                 ^~~~
   drivers/char/random.c:1363:17: note: in expansion of macro 'if'
    1363 |                 if (!crng_ready())
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:418:41: note: in expansion of macro 'likely'
     418 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                         ^~~~~~
   drivers/char/random.c:83:23: note: in expansion of macro 'static_branch_likely'
      83 | #define crng_ready() (static_branch_likely(&crng_is_ready) || crng_init >= CRNG_READY)
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:1363:22: note: in expansion of macro 'crng_ready'
    1363 |                 if (!crng_ready())
         |                      ^~~~~~~~~~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   drivers/char/random.c:1363:17: note: in expansion of macro 'if'
    1363 |                 if (!crng_ready())
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:418:41: note: in expansion of macro 'likely'
     418 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                         ^~~~~~
   drivers/char/random.c:83:23: note: in expansion of macro 'static_branch_likely'
      83 | #define crng_ready() (static_branch_likely(&crng_is_ready) || crng_init >= CRNG_READY)
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:1363:22: note: in expansion of macro 'crng_ready'
    1363 |                 if (!crng_ready())
         |                      ^~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   drivers/char/random.c:1363:17: note: in expansion of macro 'if'
    1363 |                 if (!crng_ready())
         |                 ^~
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s6,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   drivers/char/random.c:1316: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1316: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1322: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/char/random.c:1322: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> drivers/char/random.c:1336: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
>> drivers/char/random.c:1336: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   drivers/char/random.c:1340: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   drivers/char/random.c:1340: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required


vim +1336 drivers/char/random.c

0d35cc7b3fec62 Jason A. Donenfeld 2022-02-11  1307  
43ae4860ff4a35 Matt Mackall       2008-04-29  1308  static long random_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1309  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1310  	int __user *p = (int __user *)arg;
1923d9a8a08684 Jens Axboe         2022-05-19  1311  	int ent_count;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1312  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1313  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1314  	case RNDGETENTCNT:
0d35cc7b3fec62 Jason A. Donenfeld 2022-02-11  1315  		/* Inherently racy, no point locking. */
85b46e0c80a637 Jason A. Donenfeld 2022-04-30  1316  		if (put_user(input_pool.init_bits, p))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1317  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1318  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1319  	case RNDADDTOENTCNT:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1320  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1321  			return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1322  		if (get_user(ent_count, p))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1323  			return -EFAULT;
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1324  		if (ent_count < 0)
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1325  			return -EINVAL;
85b46e0c80a637 Jason A. Donenfeld 2022-04-30  1326  		credit_init_bits(ent_count);
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1327  		return 0;
1923d9a8a08684 Jens Axboe         2022-05-19  1328  	case RNDADDENTROPY: {
1923d9a8a08684 Jens Axboe         2022-05-19  1329  		struct iov_iter iter;
1923d9a8a08684 Jens Axboe         2022-05-19  1330  		struct iovec iov;
1923d9a8a08684 Jens Axboe         2022-05-19  1331  		ssize_t ret;
1923d9a8a08684 Jens Axboe         2022-05-19  1332  		int len;
1923d9a8a08684 Jens Axboe         2022-05-19  1333  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1334  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1335  			return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16 @1336  		if (get_user(ent_count, p++))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1337  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1338  		if (ent_count < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1339  			return -EINVAL;
1923d9a8a08684 Jens Axboe         2022-05-19  1340  		if (get_user(len, p++))
1923d9a8a08684 Jens Axboe         2022-05-19  1341  			return -EFAULT;
1923d9a8a08684 Jens Axboe         2022-05-19  1342  		ret = import_single_range(WRITE, p, len, &iov, &iter);
1923d9a8a08684 Jens Axboe         2022-05-19  1343  		if (unlikely(ret))
1923d9a8a08684 Jens Axboe         2022-05-19  1344  			return ret;
1923d9a8a08684 Jens Axboe         2022-05-19  1345  		ret = write_pool(&iter);
1923d9a8a08684 Jens Axboe         2022-05-19  1346  		if (unlikely(ret < 0))
1923d9a8a08684 Jens Axboe         2022-05-19  1347  			return ret;
1923d9a8a08684 Jens Axboe         2022-05-19  1348  		/* Since we're crediting, enforce that it was all written into the pool. */
1923d9a8a08684 Jens Axboe         2022-05-19  1349  		if (unlikely(ret != len))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1350  			return -EFAULT;
85b46e0c80a637 Jason A. Donenfeld 2022-04-30  1351  		credit_init_bits(ent_count);
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1352  		return 0;
1923d9a8a08684 Jens Axboe         2022-05-19  1353  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1354  	case RNDZAPENTCNT:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1355  	case RNDCLEARPOOL:
85b46e0c80a637 Jason A. Donenfeld 2022-04-30  1356  		/* No longer has any effect. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1357  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1358  			return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1359  		return 0;
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1360  	case RNDRESEEDCRNG:
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1361  		if (!capable(CAP_SYS_ADMIN))
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1362  			return -EPERM;
13ffd431ae1032 Jason A. Donenfeld 2022-03-08  1363  		if (!crng_ready())
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1364  			return -ENODATA;
e2fc165d51e9e3 Jason A. Donenfeld 2022-02-08  1365  		crng_reseed();
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1366  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1367  	default:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1368  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1369  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1370  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1371  

:::::: The code at line 1336 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
