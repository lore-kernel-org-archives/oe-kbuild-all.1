Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6B24635E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609356; cv=none; b=BBiegN5Y2UnxxuLBoIU2h+tUH5JE6qxhIgsXgPTBGZNq327W2BWlfGqsBZom7Ea/2RFWqLtg2WKHG1JZ63CR+pJcS5s2HnCFPFmIOSZ6C+lEwJZ2qYtj+4u7fRtiUqEbc/b12gnACglEqrLP7ypcpY0bJJZXFdpQ7yqp1R4uUYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609356; c=relaxed/simple;
	bh=TrYgKPzBrViWz8kE6APjKzCr6pn4oQZCtzDkQIZl5H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/VmrdAcwe6yfSiORc0ImzD8VEEKjNCOnE93CgXF9qvii/orxLHip4PaAM/V1quatw2axjEPRR8HyQpXxIoFU85SKfp5JfblOtFy9H6WoSFACxpuu3yi+7RrNwB/namZSd7XlFKnCAu05m7NGTxCc/NIbV5Lkc+uJb5ArTfPT6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAK6BpW2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAK6BpW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746609355; x=1778145355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TrYgKPzBrViWz8kE6APjKzCr6pn4oQZCtzDkQIZl5H0=;
  b=VAK6BpW2ElnmC335fwHU0lCE/xIskUk7uoHq3S6p0ihKyfrV8PLsh4yY
   69FaxK35C5Em/28zX0Jv38cFDcVZOd630J/hfUtzBoaZZYnZEMsOOAlsn
   FSLZv92hxPiGZuqZRjR778zxgYHrrb72M33DNYaPaHEpr14R8h2C7uFh+
   eiC3BKVdYNuGAJPnH5kdPeubM3NHw7C2KA90n8PQApwifTL9kCtakWFc9
   aoUv+BOpOl/gifZfKXNaXaUHfw6KDO6KDFY2gEl4TsPG6rMhxq5SPBc/b
   v5MwC90Kq2GVxiczpa/byNGFMi1OF6+Rfojhfd6MMsmHXSJMzQBz+K39L
   A==;
X-CSE-ConnectionGUID: +hvNYuzdSfuMevpfrXPQWg==
X-CSE-MsgGUID: JA4lKlZvREGqEnA5M9SYwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47426877"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="47426877"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:15:52 -0700
X-CSE-ConnectionGUID: Jmyu8IZ2S/qpWT/lEQvj7A==
X-CSE-MsgGUID: PXjkTUHATpq2/RWdWP9QxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140739203"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2025 02:15:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCasX-0007U3-0N;
	Wed, 07 May 2025 09:15:49 +0000
Date: Wed, 7 May 2025 17:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:futex_local_v12 14/21]
 include/linux/rcupdate.h:555:36: error: dereferencing pointer to incomplete
 type 'struct futex_private_hash'
Message-ID: <202505071703.082qq5RF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v12
head:   81ec9cc1b38f44c4364df62c7b8985c90a983904
commit: 0753221e1dc684b7178a80ed444f9d1b9e79515e [14/21] futex: Allow to resize the private local hash
config: sparc64-randconfig-r051-20250428 (https://download.01.org/0day-ci/archive/20250507/202505071703.082qq5RF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071703.082qq5RF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071703.082qq5RF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/sparc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:16,
                    from kernel/fork.c:16:
   include/linux/futex.h: In function 'futex_mm_init':
>> include/linux/rcupdate.h:555:36: error: dereferencing pointer to incomplete type 'struct futex_private_hash'
    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                       ^~~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                                    ^~~
   arch/sparc/include/asm/barrier_64.h:45:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:596:3: note: in expansion of macro 'smp_store_release'
      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:596:25: note: in expansion of macro 'RCU_INITIALIZER'
      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
                            ^~~~~~~~~~~~~~~
   include/linux/futex.h:88:2: note: in expansion of macro 'rcu_assign_pointer'
     rcu_assign_pointer(mm->futex_phash, NULL);
     ^~~~~~~~~~~~~~~~~~
   kernel/fork.c: In function '__do_sys_clone3':
   kernel/fork.c:3159:2: warning: #warning clone3() entry point is missing, please fix [-Wcpp]
    #warning clone3() entry point is missing, please fix
     ^~~~~~~
--
   In file included from ./arch/sparc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from arch/sparc/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from kernel/exit.c:8:
   include/linux/futex.h: In function 'futex_mm_init':
>> include/linux/rcupdate.h:555:36: error: dereferencing pointer to incomplete type 'struct futex_private_hash'
    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                       ^~~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                                    ^~~
   arch/sparc/include/asm/barrier_64.h:45:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:596:3: note: in expansion of macro 'smp_store_release'
      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:596:25: note: in expansion of macro 'RCU_INITIALIZER'
      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
                            ^~~~~~~~~~~~~~~
   include/linux/futex.h:88:2: note: in expansion of macro 'rcu_assign_pointer'
     rcu_assign_pointer(mm->futex_phash, NULL);
     ^~~~~~~~~~~~~~~~~~


vim +555 include/linux/rcupdate.h

ca5ecddfa8fcbd Paul E. McKenney 2010-04-28  550  
462225ae47d717 Paul E. McKenney 2013-11-11  551  /**
462225ae47d717 Paul E. McKenney 2013-11-11  552   * RCU_INITIALIZER() - statically initialize an RCU-protected global variable
462225ae47d717 Paul E. McKenney 2013-11-11  553   * @v: The value to statically initialize with.
462225ae47d717 Paul E. McKenney 2013-11-11  554   */
462225ae47d717 Paul E. McKenney 2013-11-11 @555  #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
462225ae47d717 Paul E. McKenney 2013-11-11  556  

:::::: The code at line 555 was first introduced by commit
:::::: 462225ae47d7175f886281d8a91708550cd5178c rcu: Add an RCU_INITIALIZER for global RCU-protected pointers

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
