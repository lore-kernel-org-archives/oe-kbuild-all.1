Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70FF6AC2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 07:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689319554; x=1720855554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NlHqoR5LTG2NM5zBqZAwpYjYVslNmvQ1/edZeaJMohg=;
  b=Uc8KD5IfB0LPRMQXkAQPIJbVlasXOxyI4UkbI6ZNqZ52e2zRUavrZsBR
   Re2C5pq+bP83r2BXKp6ERguP1/s1DdHF/mDETo6ZW+J2FbMqAgNfe5Xyq
   3bPRHqgqIVSK8+v36Z7V8LXS2AYCX4fj3bbYsqUaOHk4sogyFaSQDkmMX
   4/seuUZ64UTp4dhyrM3MdG7F/kkVc+/5OM3eKIXX/2TuLgjWMrle1nvRu
   TW7zqlRQvRDnGM1z24IXP2dpyFp93v2NkALgF4rs6Fq3NVZiepfgABqfj
   OfWwbvO8MdEzPOFp+RoKigjZF5bQVKKYr7B5FB2k6VSRhxthJwCXE51dW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368963611"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="368963611"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 00:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792349333"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="792349333"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2023 00:25:26 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKDB7-0007Hf-2r;
	Fri, 14 Jul 2023 07:25:25 +0000
Date: Fri, 14 Jul 2023 15:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Jason A. Donenfeld" <zx2c4@kernel.org>
Subject: [stable:linux-4.19.y 3113/6356] drivers/char/random.c:1336: Error:
 unrecognized opcode `csrs sstatus,s5', extension `zicsr' required
Message-ID: <202307141522.Vn8Od6Bz-lkp@intel.com>
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
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: 1923d9a8a08684c063da049fa9d5d8139edbbcbb [3113/6356] random: convert to using fops->write_iter()
config: riscv-randconfig-r024-20230712 (https://download.01.org/0day-ci/archive/20230714/202307141522.Vn8Od6Bz-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141522.Vn8Od6Bz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141522.Vn8Od6Bz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s7,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s7', extension `zicsr' required
   drivers/char/random.c:1316: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1316: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1322: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/char/random.c:1322: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> drivers/char/random.c:1336: Error: unrecognized opcode `csrs sstatus,s5', extension `zicsr' required
>> drivers/char/random.c:1336: Error: unrecognized opcode `csrc sstatus,s5', extension `zicsr' required
   drivers/char/random.c:1340: Error: unrecognized opcode `csrs sstatus,s5', extension `zicsr' required
   drivers/char/random.c:1340: Error: unrecognized opcode `csrc sstatus,s5', extension `zicsr' required
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
