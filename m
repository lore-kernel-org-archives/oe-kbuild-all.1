Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A266B1860
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690127841; x=1721663841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vP1+6fG7jumMNOG6DPsFIwceS1P37odT062lJJxAhQQ=;
  b=DPla8oQavOXa4xL6chxk4EVyf6MssVPKlj71BtTwaa61KOFjZ8J01cvL
   qPAy1tjY8H+rt8P/wo7lO9NRIdfkmTlKwJfFi65QubkyIhl8VzyjwwLDZ
   THvxQwKTlS4k8KznaaYA6kjz1wx60a0OcgprRRjs2c0jhQSG72Qc0UbtZ
   Yjsw54UTbHgMe4Wsn3+l8PWnIYjRqn5Zxe87VYYn12MWc7CBAzzPd2BU/
   2sHMdBwIrUsMrNcC+qpo8f1ZEzXBgDumf9DdBbbQrSEDwZhX4zDxStxBj
   jpr2qa2Mb4LK1NiquVNhDyl8j8gv/KOnlQEAA0wPoF5+N2H5bd73GF2XY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="364747517"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="364747517"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 08:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="815558861"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="815558861"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2023 08:57:14 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNbS8-00095p-2l;
	Sun, 23 Jul 2023 15:57:08 +0000
Date: Sun, 23 Jul 2023 23:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Eric Biggers <ebiggers@google.com>
Subject: [stable:linux-4.19.y 3039/6356] drivers/char/random.c:1331: Error:
 unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
Message-ID: <202307232352.vnAeWppb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: 16ec11bde38c275f6f40c7dd19f7fcb25e4a8061 [3039/6356] random: remove unused tracepoints
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230723/202307232352.vnAeWppb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307232352.vnAeWppb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307232352.vnAeWppb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/random.c:1654:6: warning: no previous prototype for 'add_hwgenerator_randomness' [-Wmissing-prototypes]
    1654 | void add_hwgenerator_randomness(const void *buffer, size_t count,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s10,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s10', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s6,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s7,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s7', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
>> drivers/char/random.c:1331: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
>> drivers/char/random.c:1331: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1337: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/char/random.c:1337: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   drivers/char/random.c:1346: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/char/random.c:1346: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   drivers/char/random.c:1350: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/char/random.c:1350: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required


vim +1331 drivers/char/random.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  1321  
43ae4860ff4a358 Matt Mackall       2008-04-29  1322  static long random_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
^1da177e4c3f415 Linus Torvalds     2005-04-16  1323  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  1324  	int size, ent_count;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1325  	int __user *p = (int __user *)arg;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1326  	int retval;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1327  
^1da177e4c3f415 Linus Torvalds     2005-04-16  1328  	switch (cmd) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  1329  	case RNDGETENTCNT:
43ae4860ff4a358 Matt Mackall       2008-04-29  1330  		/* inherently racy, no point locking */
8d968b46e8e1d49 Jason A. Donenfeld 2022-02-03 @1331  		if (put_user(input_pool.entropy_count, p))
^1da177e4c3f415 Linus Torvalds     2005-04-16  1332  			return -EFAULT;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1333  		return 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1334  	case RNDADDTOENTCNT:
^1da177e4c3f415 Linus Torvalds     2005-04-16  1335  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f415 Linus Torvalds     2005-04-16  1336  			return -EPERM;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1337  		if (get_user(ent_count, p))
^1da177e4c3f415 Linus Torvalds     2005-04-16  1338  			return -EFAULT;
cead215ea9fdb55 Jason A. Donenfeld 2022-02-04  1339  		if (ent_count < 0)
cead215ea9fdb55 Jason A. Donenfeld 2022-02-04  1340  			return -EINVAL;
cead215ea9fdb55 Jason A. Donenfeld 2022-02-04  1341  		credit_entropy_bits(ent_count);
cead215ea9fdb55 Jason A. Donenfeld 2022-02-04  1342  		return 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1343  	case RNDADDENTROPY:
^1da177e4c3f415 Linus Torvalds     2005-04-16  1344  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f415 Linus Torvalds     2005-04-16  1345  			return -EPERM;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1346  		if (get_user(ent_count, p++))
^1da177e4c3f415 Linus Torvalds     2005-04-16  1347  			return -EFAULT;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1348  		if (ent_count < 0)
^1da177e4c3f415 Linus Torvalds     2005-04-16  1349  			return -EINVAL;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1350  		if (get_user(size, p++))
^1da177e4c3f415 Linus Torvalds     2005-04-16  1351  			return -EFAULT;
b85a4e0882931f8 Jason A. Donenfeld 2022-01-12  1352  		retval = write_pool((const char __user *)p, size);
^1da177e4c3f415 Linus Torvalds     2005-04-16  1353  		if (retval < 0)
^1da177e4c3f415 Linus Torvalds     2005-04-16  1354  			return retval;
cead215ea9fdb55 Jason A. Donenfeld 2022-02-04  1355  		credit_entropy_bits(ent_count);
cead215ea9fdb55 Jason A. Donenfeld 2022-02-04  1356  		return 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1357  	case RNDZAPENTCNT:
^1da177e4c3f415 Linus Torvalds     2005-04-16  1358  	case RNDCLEARPOOL:
ae9ecd92ddabc25 Theodore Ts'o      2013-11-03  1359  		/*
ae9ecd92ddabc25 Theodore Ts'o      2013-11-03  1360  		 * Clear the entropy pool counters. We no longer clear
ae9ecd92ddabc25 Theodore Ts'o      2013-11-03  1361  		 * the entropy pool, as that's silly.
ae9ecd92ddabc25 Theodore Ts'o      2013-11-03  1362  		 */
^1da177e4c3f415 Linus Torvalds     2005-04-16  1363  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f415 Linus Torvalds     2005-04-16  1364  			return -EPERM;
041a5baf457491f Jason A. Donenfeld 2022-02-05  1365  		if (xchg(&input_pool.entropy_count, 0)) {
041a5baf457491f Jason A. Donenfeld 2022-02-05  1366  			wake_up_interruptible(&random_write_wait);
041a5baf457491f Jason A. Donenfeld 2022-02-05  1367  			kill_fasync(&fasync, SIGIO, POLL_OUT);
041a5baf457491f Jason A. Donenfeld 2022-02-05  1368  		}
^1da177e4c3f415 Linus Torvalds     2005-04-16  1369  		return 0;
d848e5f8e1ebdb2 Theodore Ts'o      2018-04-11  1370  	case RNDRESEEDCRNG:
d848e5f8e1ebdb2 Theodore Ts'o      2018-04-11  1371  		if (!capable(CAP_SYS_ADMIN))
d848e5f8e1ebdb2 Theodore Ts'o      2018-04-11  1372  			return -EPERM;
d848e5f8e1ebdb2 Theodore Ts'o      2018-04-11  1373  		if (crng_init < 2)
d848e5f8e1ebdb2 Theodore Ts'o      2018-04-11  1374  			return -ENODATA;
e2fc165d51e9e36 Jason A. Donenfeld 2022-02-08  1375  		crng_reseed();
d848e5f8e1ebdb2 Theodore Ts'o      2018-04-11  1376  		return 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1377  	default:
^1da177e4c3f415 Linus Torvalds     2005-04-16  1378  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds     2005-04-16  1379  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  1380  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  1381  

:::::: The code at line 1331 was first introduced by commit
:::::: 8d968b46e8e1d49d5ab519bf1ba788c32e8d0b1a random: use linear min-entropy accumulation crediting

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
