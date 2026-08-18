Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F93612CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787020216; cv=none; b=arcR/Rl9Xvs+/X6HFT64P8f7AR6eQQxe6uevCebsc5bDonTt0jTOMQoumokbUhcisJ9/s18huMu5HU5sr7O4xCWzSMekCYUd6R+b/IyQ3aCA70wzPIXRlkDM/RLqI085/K2OcAqNM67sNbQzKP41xtODx66p7Pi2MJdCg/eeYzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787020216; c=relaxed/simple;
	bh=etDYmePTx8RsI9eQgjAh+bXTL0CeBKI6sUXhcn0A3IU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mkMm2yryTc1hKbCto1xH87vEtFfi1hEiWUDMA4pghbeh4zscDn8Qckmredssj0F8GXygykutfhhQVBa92oqStbY+nz9wNpYebjMaSiSpAIuMNc5BAMT6v5tEpj2/0De61AabND5sAv7RyZnbCVWTUQp2mzhNrss/lQvj6gQN0FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHhDc1Yg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHhDc1Yg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787020212; x=1818556212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=etDYmePTx8RsI9eQgjAh+bXTL0CeBKI6sUXhcn0A3IU=;
  b=aHhDc1Yg7svB3P0sSbdSVkc/quiTHHtCCTz1WeIhud6kS/QoTGvDn9wt
   lvXOO53rqSCYo2bPKwXyNM1wgrJ4VFxOhmLhqI6GWNxbmhskLorMB2sQ1
   lq7YG5UkaDFJbRcEsBnV/UabaafOMI4SeGfmcyeXf2d7sVuq6l9qOx2bq
   LwYGVU1HKw6gCW9ZLm/R5ZX+lZZkz/fO01ysDrLpaBwUCt939uFwvS7p0
   01K41yPfNoxelzoqqsUhuyDjwK9OCvXy51G/2XrHaaphUjwLgGvTrxCsM
   INf/6a7PIDhzySmhhvoE7z75IGJlOmVv9Mpv+76g2NXhijmQqo08X2nAE
   w==;
X-CSE-ConnectionGUID: Vl6PJ5FxThusxsHwOnXgxA==
X-CSE-MsgGUID: 2NL5tZS6RXW/8oiOhZVK8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98168251"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98168251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 19:30:09 -0700
X-CSE-ConnectionGUID: K6xDVYPyQdCAogC3SFlSjw==
X-CSE-MsgGUID: lN/r/DFXRl+1X6VtwlU/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="260865196"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Aug 2026 19:30:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww9aX-00000000e3C-2Xm5;
	Tue, 18 Aug 2026 02:30:05 +0000
Date: Tue, 18 Aug 2026 10:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 21/21]
 kernel/locking/lockdep_proc.c:298:101: warning: format '%zu' expects argument
 of type 'size_t', but argument 6 has type 'long unsigned int'
Message-ID: <202608181008.P4BhSktT-lkp@intel.com>
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
commit: e77ee8289ea0755b0ee299348504d4568f942d71 [21/21] locking/lockdep: Report bootstrap usage, capacity, and size in /proc/lockdep_stats
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260818/202608181008.P4BhSktT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181008.P4BhSktT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181008.P4BhSktT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/locking/lockdep_proc.c:25:
   kernel/locking/lockdep_internals.h: In function 'debug_class_ops_inc':
   kernel/locking/lockdep_internals.h:257:23: error: 'lock_classes' undeclared (first use in this function); did you mean 'lock_class'?
     257 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       lock_class
   kernel/locking/lockdep_internals.h:257:23: note: each undeclared identifier is reported only once for each function it appears in
   kernel/locking/lockdep_internals.h: In function 'debug_class_ops_read':
   kernel/locking/lockdep_internals.h:266:23: error: 'lock_classes' undeclared (first use in this function); did you mean 'lock_class'?
     266 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       lock_class
   kernel/locking/lockdep_proc.c: In function 'lockdep_stats_show':
>> kernel/locking/lockdep_proc.c:298:101: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
     298 |                         seq_printf(m, " lock-classes:                  %11lu [bootstrap: %lu/%lu, %zu kB]\n",
         |                                                                                                   ~~^
         |                                                                                                     |
         |                                                                                                     unsigned int
         |                                                                                                   %lu
     299 |                                    nr_lock_classes, nr_lock_classes, BOOTSTRAP_LOCK_CLASSES_CAP,
     300 |                                    (BOOTSTRAP_LOCK_CLASSES_CAP * sizeof(struct lock_class)) / 1024);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
         |                                    |
         |                                    long unsigned int
   kernel/locking/lockdep_proc.c:315:101: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
     315 |                         seq_printf(m, " direct dependencies:           %11lu [bootstrap: %lu/%lu, %zu kB]\n",
         |                                                                                                   ~~^
         |                                                                                                     |
         |                                                                                                     unsigned int
         |                                                                                                   %lu
     316 |                                    nr_list_entries, nr_list_entries, BOOTSTRAP_LOCKDEP_ENTRIES_CAP,
     317 |                                    (BOOTSTRAP_LOCKDEP_ENTRIES_CAP * sizeof(struct lock_list)) / 1024);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
         |                                    |
         |                                    long unsigned int
   kernel/locking/lockdep_proc.c:345:101: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
     345 |                         seq_printf(m, " dependency chains:             %11lu [bootstrap: %lu/%lu, %zu kB]\n",
         |                                                                                                   ~~^
         |                                                                                                     |
         |                                                                                                     unsigned int
         |                                                                                                   %lu
     346 |                                    lock_chain_count(), lock_chain_count(), BOOTSTRAP_LOCK_CHAINS_CAP,
     347 |                                    (BOOTSTRAP_LOCK_CHAINS_CAP * sizeof(struct lock_chain)) / 1024);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
         |                                    |
         |                                    long unsigned int
   kernel/locking/lockdep_proc.c:360:99: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
     360 |                         seq_printf(m, " dependency chain hlocks used:  %11u [bootstrap: %u/%lu, %zu kB]\n",
         |                                                                                                 ~~^
         |                                                                                                   |
         |                                                                                                   unsigned int
         |                                                                                                 %lu
     361 |                                    chain_hlocks_used(), chain_hlocks_used(), BOOTSTRAP_CHAIN_HLOCKS_CAP,
     362 |                                    (BOOTSTRAP_CHAIN_HLOCKS_CAP * sizeof(u16)) / 1024);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~               
         |                                    |
         |                                    long unsigned int
   kernel/locking/lockdep_proc.c:387:101: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
     387 |                         seq_printf(m, " stack-trace entries:           %11lu [bootstrap: %lu/%lu, %zu kB]\n",
         |                                                                                                   ~~^
         |                                                                                                     |
         |                                                                                                     unsigned int
         |                                                                                                   %lu
     388 |                                    nr_stack_trace_entries, nr_stack_trace_entries, BOOTSTRAP_STACK_TRACE_CAP,
     389 |                                    (BOOTSTRAP_STACK_TRACE_CAP * sizeof(unsigned long)) / 1024);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~        
         |                                    |
         |                                    long unsigned int


vim +298 kernel/locking/lockdep_proc.c

   287	
   288		{
   289			unsigned int lc_chunks = 0;
   290			size_t lc_chunk_sz = 0, lc_tail_used = 0;
   291	
   292			lockdep_class_stats(&lc_chunks, &lc_chunk_sz, &lc_tail_used);
   293			if (lc_chunks) {
   294				seq_printf(m, " lock-classes:                  %11lu [dynamic: %u x %zu kB, tail: %zu kB/%zu kB]\n",
   295					   nr_lock_classes, lc_chunks, lc_chunk_sz / 1024,
   296					   lc_tail_used / 1024, lc_chunk_sz / 1024);
   297			} else {
 > 298				seq_printf(m, " lock-classes:                  %11lu [bootstrap: %lu/%lu, %zu kB]\n",
   299					   nr_lock_classes, nr_lock_classes, BOOTSTRAP_LOCK_CLASSES_CAP,
   300					   (BOOTSTRAP_LOCK_CLASSES_CAP * sizeof(struct lock_class)) / 1024);
   301			}
   302		}
   303		seq_printf(m, " dynamic-keys:                  %11lu\n",
   304				nr_dynamic_keys);
   305		{
   306			unsigned int fp_chunks = 0;
   307			size_t fp_chunk_sz = 0, fp_tail_used = 0;
   308	
   309			lockdep_pool_stats(&fp_chunks, &fp_chunk_sz, &fp_tail_used);
   310			if (fp_chunks) {
   311				seq_printf(m, " direct dependencies:           %11lu [dynamic: %u x %zu kB, tail: %zu kB/%zu kB]\n",
   312					   nr_list_entries, fp_chunks, fp_chunk_sz / 1024,
   313					   fp_tail_used / 1024, fp_chunk_sz / 1024);
   314			} else {
   315				seq_printf(m, " direct dependencies:           %11lu [bootstrap: %lu/%lu, %zu kB]\n",
   316					   nr_list_entries, nr_list_entries, BOOTSTRAP_LOCKDEP_ENTRIES_CAP,
   317					   (BOOTSTRAP_LOCKDEP_ENTRIES_CAP * sizeof(struct lock_list)) / 1024);
   318			}
   319		}
   320		seq_printf(m, " indirect dependencies:         %11lu\n",
   321				sum_forward_deps);
   322	
   323		/*
   324		 * Total number of dependencies:
   325		 *
   326		 * All irq-safe locks may nest inside irq-unsafe locks,
   327		 * plus all the other known dependencies:
   328		 */
   329		seq_printf(m, " all direct dependencies:       %11lu\n",
   330				nr_irq_unsafe * nr_irq_safe +
   331				nr_hardirq_unsafe * nr_hardirq_safe +
   332				nr_list_entries);
   333	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
