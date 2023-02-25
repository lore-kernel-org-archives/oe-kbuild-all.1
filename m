Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BB43D7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677356206; x=1708892206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mC8+Ns8a7g/veCgg3FAgAleLQoGMd6MVHefZLLqjtIA=;
  b=kKOMZBi08wfg7e3eC0Cz9nrdiGC2soW312xwMy0tFG0Ek1odIbRf8rpw
   soFzvI0DkaiYDNJeKVH/Dpo7mxVG48fPjRFMOtqPUDdlqZWTb/DNpP/By
   vUlaZ7qQSAY5Tg/F+Z+no3HC0hz4ZNAoNudPfvOczlY/92LhbBo1q6Zce
   UrQakRMpT3a0M1QMjLYvhywzzQRz1ndifP+0iDoN6JugP45YZGQ59/Sfi
   6tDL6PVQvwUpVTk8C3AxUNIO41R6ukSInaLrW4bcg1RmMZ9vXUE/mkUEI
   eVDKhSvTnIuxJgOswMdD+32kxwC6NuMhfB7loLO7IydYfZcLIxdnZy0uY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="333702166"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="333702166"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 12:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="847321647"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="847321647"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Feb 2023 12:16:42 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW0yH-0003Oh-30;
	Sat, 25 Feb 2023 20:16:41 +0000
Date: Sun, 26 Feb 2023 04:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Eric Biggers <ebiggers@google.com>
Subject: [stable:linux-4.19.y 3034/5323] drivers/char/random.c:1389: Error:
 unrecognized opcode `csrs sstatus,s3'
Message-ID: <202302260407.c6gJzbcS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   2e3d9118e4e62b90603d61abd45d8bb29ebe7920
commit: 08b7063879abdb928990a0c93135240bca4c932c [3034/5323] random: use hash function for crng_slow_load()
config: riscv-randconfig-r031-20230222 (https://download.01.org/0day-ci/archive/20230226/202302260407.c6gJzbcS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=08b7063879abdb928990a0c93135240bca4c932c
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 08b7063879abdb928990a0c93135240bca4c932c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/char/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302260407.c6gJzbcS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s3,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s3'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s5,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5'
   drivers/char/random.c:1374: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/char/random.c:1374: Error: unrecognized opcode `csrc sstatus,a3'
   drivers/char/random.c:1380: Error: unrecognized opcode `csrs sstatus,a4'
   drivers/char/random.c:1380: Error: unrecognized opcode `csrc sstatus,a4'
>> drivers/char/random.c:1389: Error: unrecognized opcode `csrs sstatus,s3'
>> drivers/char/random.c:1389: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/char/random.c:1393: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/char/random.c:1393: Error: unrecognized opcode `csrc sstatus,s3'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'


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
https://github.com/intel/lkp-tests
