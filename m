Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0FD339382
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 06:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787035434; cv=none; b=RNeyFosqtR+tIRrcEZnYNkwh3aNOKr3UplnIM/3lI6iytNbjY3mr9758H5B3CjsigVFtyeA5r1sXCUqDIzxS2efNYCRgFq/PX751aRlGTyOJvau8/MX3FMTT/iY5jFtx/GPmniFq3fcoizS9yuLCp+gmzjX1m4EkqyPIhGbqtbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787035434; c=relaxed/simple;
	bh=vWZzy97MXVegGW2wPE5AfrHhFTzYLarbbOMyglaAGhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PJH/sjuSr1OTaaXGHCj54Y9JvpHqOzDD8ahttuQSwYmfmusX9nmIwSTNwy0YRtIEiewzU1gR/BT1S5cTwNueQFftFJQeea2J3C/bc7Sj3rTV8GxBN0vG84mAO4suOTh4oioHyl1K0oCLR9+X6IVsDdpcj9OKpAN41EL+MfUOYDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLO+HnN/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLO+HnN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787035432; x=1818571432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vWZzy97MXVegGW2wPE5AfrHhFTzYLarbbOMyglaAGhY=;
  b=cLO+HnN/8UDTlbQRKSeR2ooA3oGQCZJOCixKdUHfu665GtLkaTz8Qp9b
   Trj5meC7hqNRxIkBd8Y/IS5JSnCNGPdtj+3f9OKTy6EpibmRGjxK7uRCt
   GrwrzaW5mcD/zqJ9LfyS34ALNaJvyPmVAYORhUhdZh5yHBf2yx+NcJ594
   cce9B6xvHhD/sndk6GuKLjMfamO5yt0n4CGYkSMbItPt55KNS8T43zhL3
   UWNYPen8PFGjwTFgoujl9qmkP2jDZ0dVDpTVQ8O6j6cKcbYeAx8kkbpk2
   ilinMIdp1/xXC1AR5LRrTOQLqEPQqy29H3CrqcQyHSFCmqWLQbDwsnXWB
   A==;
X-CSE-ConnectionGUID: rXH/e1RVQyKx8HITeI5uVA==
X-CSE-MsgGUID: uagdN87xTwmXYLZxlc0zYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75049604"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="75049604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 23:43:52 -0700
X-CSE-ConnectionGUID: bpPHgj5hQYmKM22KISgcZA==
X-CSE-MsgGUID: 3CEXhzO+Sj296slDZoOnvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="295062763"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Aug 2026 23:43:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwDY3-00000000eA6-2wq0;
	Tue, 18 Aug 2026 06:43:47 +0000
Date: Tue, 18 Aug 2026 14:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 18/21]
 kernel/locking/lockdep.c:3877:28: error: 'chain_hlocks' undeclared; did you
 mean 'free_chain_hlocks'?
Message-ID: <202608181434.xKxxb71C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v2-lockdep
head:   e77ee8289ea0755b0ee299348504d4568f942d71
commit: 4530a53e6265de5abb7f5566fdb3d4fe0a7199c5 [18/21] locking/lockdep: Migrate chain_hlocks array to 2-level dynamic folio chunks
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608181434.xKxxb71C-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181434.xKxxb71C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181434.xKxxb71C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/locking/lockdep.c:84:
   kernel/locking/lockdep_internals.h: In function 'debug_class_ops_inc':
   kernel/locking/lockdep_internals.h:251:23: error: 'lock_classes' undeclared (first use in this function); did you mean 'lock_class'?
     251 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       lock_class
   kernel/locking/lockdep_internals.h:251:23: note: each undeclared identifier is reported only once for each function it appears in
   kernel/locking/lockdep_internals.h: In function 'debug_class_ops_read':
   kernel/locking/lockdep_internals.h:260:23: error: 'lock_classes' undeclared (first use in this function); did you mean 'lock_class'?
     260 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       lock_class
   kernel/locking/lockdep.c: In function 'print_chain_keys_chain':
>> kernel/locking/lockdep.c:3877:28: error: 'chain_hlocks' undeclared (first use in this function); did you mean 'free_chain_hlocks'?
    3877 |                 hlock_id = chain_hlocks[chain->base + i];
         |                            ^~~~~~~~~~~~
         |                            free_chain_hlocks
   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from arch/powerpc/include/asm/paca.h:16,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/mutex.h:14,
                    from kernel/locking/lockdep.c:30:
   kernel/locking/lockdep.c: In function 'check_no_collision':
   kernel/locking/lockdep.c:3935:41: error: 'chain_hlocks' undeclared (first use in this function); did you mean 'free_chain_hlocks'?
    3935 |                 if (DEBUG_LOCKS_WARN_ON(chain_hlocks[chain->base + j] != id)) {
         |                                         ^~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/locking/lockdep.c:3935:21: note: in expansion of macro 'DEBUG_LOCKS_WARN_ON'
    3935 |                 if (DEBUG_LOCKS_WARN_ON(chain_hlocks[chain->base + j] != id)) {
         |                     ^~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c: At top level:
   kernel/locking/lockdep.c:1189:13: warning: 'in_any_zapped_class_list' defined but not used [-Wunused-function]
    1189 | static bool in_any_zapped_class_list(struct lock_class *class)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +3877 kernel/locking/lockdep.c

39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3868  
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3869  static void print_chain_keys_chain(struct lock_chain *chain)
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3870  {
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3871  	int i;
f6ec8829ac9d59 Yuyang Du                 2019-05-06  3872  	u64 chain_key = INITIAL_CHAIN_KEY;
f611e8cf98ec90 Boqun Feng                2020-08-07  3873  	u16 hlock_id;
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3874  
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3875  	printk("depth: %u\n", chain->depth);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3876  	for (i = 0; i < chain->depth; i++) {
f611e8cf98ec90 Boqun Feng                2020-08-07 @3877  		hlock_id = chain_hlocks[chain->base + i];
f611e8cf98ec90 Boqun Feng                2020-08-07  3878  		chain_key = print_chain_key_iteration(hlock_id, chain_key);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3879  
9e99b37a40c36a Jim Cromie                2026-08-17  3880  		print_lock_name(NULL, idx_to_lock_class(chain_hlock_class_idx(hlock_id)));
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3881  		printk("\n");
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3882  	}
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3883  }
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3884  

:::::: The code at line 3877 was first introduced by commit
:::::: f611e8cf98ec908b9c2c0da6064a660fc6022487 lockdep: Take read/write status in consideration when generate chainkey

:::::: TO: Boqun Feng <boqun.feng@gmail.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
