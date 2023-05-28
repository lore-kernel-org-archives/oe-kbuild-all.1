Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271727C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 08:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685262242; x=1716798242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4X5Pxes6rCLeJv6kI7klyPxFXPIoEQenK9qRlQzxwL4=;
  b=l3LRBPKD6KlSwt4GjMvTpD/U9IW9gUlMYI1W/FD4NaPqq9U5SuwTVbRP
   /PlifNkL1j4TiKobr7dqk2CTq5HMUXkAZeZuKzyeGE1m/lob+qQzdvGdt
   BVaLN95hZ7JBBzyRj9kAqBu7gjm198G7eBBGRB9s+QXOrEvRNbsqmTYHe
   e30JCJwE9WRK2tKJG92IQXeaUn+Uf6cFrMhtNi9HiX+eyf3noLpGUB+LB
   JoARXb8hRSYXAudZPRC2eFDfeG4RmFm1DK1duF/2iYvE7rrJL+60KBung
   Xyhs/+0XzVvlBj60rVojBLT5YaMMQe7ebBwWKIcM4R1UTdCVEku2tXexv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="343997181"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="343997181"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 01:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="952369592"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="952369592"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 May 2023 01:24:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Bh1-000KUk-0u;
	Sun, 28 May 2023 08:23:59 +0000
Date: Sun, 28 May 2023 16:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/include/asm/atomic.h:339 arch_atomic64_dec_if_positive()
 warn: inconsistent indenting
Message-ID: <202305281649.3367YTx7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   416839029e3858f61dc7dd346559c03e74ed8380
commit: 1d7f6932c522ea95668e14265175ce3d753d0c24 riscv: atomic: Optimize dec_if_positive functions
date:   1 year ago
config: riscv-randconfig-m031-20230526 (https://download.01.org/0day-ci/archive/20230528/202305281649.3367YTx7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281649.3367YTx7-lkp@intel.com/

smatch warnings:
arch/riscv/include/asm/atomic.h:339 arch_atomic64_dec_if_positive() warn: inconsistent indenting

vim +339 arch/riscv/include/asm/atomic.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  332  
fab957c11efe2f Palmer Dabbelt 2017-07-10  333  #ifndef CONFIG_GENERIC_ATOMIC64
1d7f6932c522ea Guo Ren        2022-05-05  334  static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
fab957c11efe2f Palmer Dabbelt 2017-07-10  335  {
0754211847d7a2 Mark Rutland   2019-05-22  336         s64 prev;
0754211847d7a2 Mark Rutland   2019-05-22  337         long rc;
fab957c11efe2f Palmer Dabbelt 2017-07-10  338  
fab957c11efe2f Palmer Dabbelt 2017-07-10 @339  	__asm__ __volatile__ (
5ce6c1f3535fa8 Andrea Parri   2018-03-09  340  		"0:	lr.d     %[p],  %[c]\n"
1d7f6932c522ea Guo Ren        2022-05-05  341  		"	addi      %[rc], %[p], -1\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  342  		"	bltz     %[rc], 1f\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  343  		"	sc.d.rl  %[rc], %[rc], %[c]\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  344  		"	bnez     %[rc], 0b\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  345  		"	fence    rw, rw\n"
5ce6c1f3535fa8 Andrea Parri   2018-03-09  346  		"1:\n"
fab957c11efe2f Palmer Dabbelt 2017-07-10  347  		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
1d7f6932c522ea Guo Ren        2022-05-05  348  		:
fab957c11efe2f Palmer Dabbelt 2017-07-10  349  		: "memory");
1d7f6932c522ea Guo Ren        2022-05-05  350  	return prev - 1;
fab957c11efe2f Palmer Dabbelt 2017-07-10  351  }
fab957c11efe2f Palmer Dabbelt 2017-07-10  352  

:::::: The code at line 339 was first introduced by commit
:::::: fab957c11efe2f405e08b9f0d080524bc2631428 RISC-V: Atomic and Locking Code

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
