Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503721CA1C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691600863; x=1723136863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0AWIItJoLyUgiKvcxYZMDVBrEWqGsvPGRyPhzYYujY=;
  b=AhmYmC8nPL25CUDoxPF6ryoqYSEndzZVEJ3MjOFbwpvDWp1NYGQ+jxj/
   GtkyFSYSAI9q7vj/Cu7pHFqeuAmbTYlTj8GSB5qI18s91bKRK73biZqzo
   jr3tywMupkJsi9M5fEIwF5wEqWSDwn+l6OCpk6vtPQn/nmkoVEC8aft7/
   +QaqtfVal6OOJFraSDqh5LNtpuqADAr8LgNXaEQ4VE5Txq+4dVwz3XuKD
   rC8kaGgVAtwY9EFBBy58GvxsnUXmNTkcv3tapoEsuTJx6Hvydq0kK7No4
   XcA1bOWFcgRSu3053MhLvvP9Adzc3dY3YwH+UvsIFzWrcYn3y9giCsezW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="457541654"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="457541654"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 10:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="1062552704"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="1062552704"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 10:07:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTmep-0006HM-2K;
	Wed, 09 Aug 2023 17:07:39 +0000
Date: Thu, 10 Aug 2023 01:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Eric Biggers <ebiggers@google.com>
Subject: [stable:linux-4.19.y 3034/6384] drivers/char/random.c:1389: Error:
 unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
Message-ID: <202308100025.1jnShoR7-lkp@intel.com>
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
head:   38e29db7fb46bb69718a989f9fd5fd53040ac88d
commit: 08b7063879abdb928990a0c93135240bca4c932c [3034/6384] random: use hash function for crng_slow_load()
config: riscv-randconfig-r042-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100025.1jnShoR7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100025.1jnShoR7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100025.1jnShoR7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   drivers/char/random.c:1374: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1374: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1380: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/char/random.c:1380: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> drivers/char/random.c:1389: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
>> drivers/char/random.c:1389: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   drivers/char/random.c:1393: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/char/random.c:1393: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required


vim +1389 drivers/char/random.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  1364  
43ae4860ff4a35 Matt Mackall       2008-04-29  1365  static long random_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1366  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1367  	int size, ent_count;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1368  	int __user *p = (int __user *)arg;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1369  	int retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1370  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1371  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1372  	case RNDGETENTCNT:
43ae4860ff4a35 Matt Mackall       2008-04-29  1373  		/* inherently racy, no point locking */
8d968b46e8e1d4 Jason A. Donenfeld 2022-02-03  1374  		if (put_user(input_pool.entropy_count, p))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1375  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1376  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1377  	case RNDADDTOENTCNT:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1378  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1379  			return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1380  		if (get_user(ent_count, p))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1381  			return -EFAULT;
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1382  		if (ent_count < 0)
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1383  			return -EINVAL;
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1384  		credit_entropy_bits(ent_count);
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1385  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1386  	case RNDADDENTROPY:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1387  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1388  			return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16 @1389  		if (get_user(ent_count, p++))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1390  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1391  		if (ent_count < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1392  			return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1393  		if (get_user(size, p++))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1394  			return -EFAULT;
b85a4e0882931f Jason A. Donenfeld 2022-01-12  1395  		retval = write_pool((const char __user *)p, size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1396  		if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1397  			return retval;
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1398  		credit_entropy_bits(ent_count);
cead215ea9fdb5 Jason A. Donenfeld 2022-02-04  1399  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1400  	case RNDZAPENTCNT:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1401  	case RNDCLEARPOOL:
ae9ecd92ddabc2 Theodore Ts'o      2013-11-03  1402  		/*
ae9ecd92ddabc2 Theodore Ts'o      2013-11-03  1403  		 * Clear the entropy pool counters. We no longer clear
ae9ecd92ddabc2 Theodore Ts'o      2013-11-03  1404  		 * the entropy pool, as that's silly.
ae9ecd92ddabc2 Theodore Ts'o      2013-11-03  1405  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1406  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1407  			return -EPERM;
041a5baf457491 Jason A. Donenfeld 2022-02-05  1408  		if (xchg(&input_pool.entropy_count, 0)) {
041a5baf457491 Jason A. Donenfeld 2022-02-05  1409  			wake_up_interruptible(&random_write_wait);
041a5baf457491 Jason A. Donenfeld 2022-02-05  1410  			kill_fasync(&fasync, SIGIO, POLL_OUT);
041a5baf457491 Jason A. Donenfeld 2022-02-05  1411  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1412  		return 0;
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1413  	case RNDRESEEDCRNG:
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1414  		if (!capable(CAP_SYS_ADMIN))
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1415  			return -EPERM;
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1416  		if (crng_init < 2)
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1417  			return -ENODATA;
e2fc165d51e9e3 Jason A. Donenfeld 2022-02-08  1418  		crng_reseed();
d848e5f8e1ebdb Theodore Ts'o      2018-04-11  1419  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1420  	default:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1421  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1422  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1423  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1424  

:::::: The code at line 1389 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
