Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2C61EE00C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 23:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743549797; cv=none; b=FU8ySWM0vJUCri4snXQ0689x3l4u59++9PWJ0eeZ8vcUzt6TYdcGtvqhWf8sus2ahyBLGK9jIcvuJYMqU4yzPQ8/tR7g+k0YRFEe4OqhE1187PliXmN/+59raQmawaQznuduRXDtREYhDXIfnpZtzqSuPiV5aUMSNhgkxNEhY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743549797; c=relaxed/simple;
	bh=1C4/flTgm4yhbZchW88GM9l3BMY5jb7cC0Fh/PG49oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZiZs2H+4SVqcftEXyZ59vN+1nz8Ky9ZLqMFvJa7j1OD9+sYFb3SEEE9Sdozq0HEfCiJnFfRlaEzUyG0T/Ntxpr5+1gUJN9mK8Hzjpqvjq8zF8uFug5r8Eoefd1kyEBgYG1AgQTtBSpavNCPUh1O0q8yQA6jNqqGkayVE1p2eRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asDdGwIh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asDdGwIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743549795; x=1775085795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1C4/flTgm4yhbZchW88GM9l3BMY5jb7cC0Fh/PG49oo=;
  b=asDdGwIhOTI2kdAudsbRqcVFqZcZyA5C6r3ijfyP7/98aZNU8iTCwHbv
   L9cu0Yqe5b8BGmbAUuk24NjAiFfzuyc/HYL+6oxQ9Xx0NJFLApkrxscGD
   528t7NrQnPYPV8yVbxVtg99DmoJ9LmX52r643bMzt9MDtG/4s2Ea3LWIM
   rM5aYHIFr7kBaI7BPHSXMm172TcXka+EJ6bbG8IS6k+9SOMKsAHMXejn+
   09mjbzV0E6no58t2IgYxaG4lEEeUSXAhQnSlJ+N86efV5xGmqjb21MCC7
   Pvkxnri1Lfq1N0aulAxgHgm8MT1mHTlaxE0CrrQEkJ8oN8WD1orXabo9J
   Q==;
X-CSE-ConnectionGUID: MLzh1/NkRc2/G1Ehloq/sg==
X-CSE-MsgGUID: 62jOdGbyRWiTshuXCqGHFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45040939"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="45040939"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 16:23:15 -0700
X-CSE-ConnectionGUID: L/c1/m4FTryXfaa1bKfyTw==
X-CSE-MsgGUID: OZjm3H1HS8OFz0QxYvXT4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131667325"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2025 16:23:13 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzkwp-000AFU-1L;
	Tue, 01 Apr 2025 23:23:11 +0000
Date: Wed, 2 Apr 2025 07:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:futex_local_v11-rc4 14/16]
 include/linux/rcupdate.h:561:36: error: dereferencing pointer to incomplete
 type 'struct futex_private_hash'
Message-ID: <202504020737.vw7EqGiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v11-rc4
head:   158467dbbaf35716220d878f2604361e7af4926b
commit: 7b5ed8f7a614e50d923249374cd9d25c773070a3 [14/16] futex: Allow to re-allocate the private local hash.
config: riscv-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020737.vw7EqGiC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020737.vw7EqGiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020737.vw7EqGiC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/riscv/include/generated/asm/rwonce.h:1:0,
                    from include/linux/compiler.h:354,
                    from arch/riscv/include/asm/bug.h:9,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from kernel/exit.c:8:
   include/linux/futex.h: In function 'futex_mm_init':
>> include/linux/rcupdate.h:561:36: error: dereferencing pointer to incomplete type 'struct futex_private_hash'
    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                       ^~~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                                    ^~~
   arch/riscv/include/asm/barrier.h:63:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:602:3: note: in expansion of macro 'smp_store_release'
      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:602:25: note: in expansion of macro 'RCU_INITIALIZER'
      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
                            ^~~~~~~~~~~~~~~
   include/linux/futex.h:88:2: note: in expansion of macro 'rcu_assign_pointer'
     rcu_assign_pointer(mm->futex_phash, NULL);
     ^~~~~~~~~~~~~~~~~~


vim +561 include/linux/rcupdate.h

ca5ecddfa8fcbd Paul E. McKenney 2010-04-28  556  
462225ae47d717 Paul E. McKenney 2013-11-11  557  /**
462225ae47d717 Paul E. McKenney 2013-11-11  558   * RCU_INITIALIZER() - statically initialize an RCU-protected global variable
462225ae47d717 Paul E. McKenney 2013-11-11  559   * @v: The value to statically initialize with.
462225ae47d717 Paul E. McKenney 2013-11-11  560   */
462225ae47d717 Paul E. McKenney 2013-11-11 @561  #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
462225ae47d717 Paul E. McKenney 2013-11-11  562  

:::::: The code at line 561 was first introduced by commit
:::::: 462225ae47d7175f886281d8a91708550cd5178c rcu: Add an RCU_INITIALIZER for global RCU-protected pointers

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
