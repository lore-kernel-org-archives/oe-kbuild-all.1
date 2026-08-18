Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3405D3C65E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 11:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052677; cv=none; b=EKqbFWsFgdVgvuYrZ9FaPOeeyvZXXiAYl+o7z80ul17KGSXwMalzwa44qxkIxQ90ZpxnAJD+jMol4GdCzL5vNYF8H7HEOcdd5BabgnGzX8pO3/CNQwdS0WRzneGCpt4FuN1w2LdsUEVb5kqKrpXfSNfj6kbdEpk+JJ0g/Kz+XQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052677; c=relaxed/simple;
	bh=MSF/aL55Kxn6LZ1KbAvmshulJIny6OOYYBlRSIeiyqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CqkEn/ll0i69qXh33V/35MzcLGtF0zvQUYZ2YswQ4yImbcdVwgCyQVeucSGzsGzKaqOpNLuJK68cGtEqOnUZ2xS28F/Sh2F+8fByfwBr/CWGogIyhJJMlzz+o7gy48kJoBYBEKLFIJQtfjmqT6JdjBrP+VFw8LsESpQsCEJbuik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuBqXt8d; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuBqXt8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787052675; x=1818588675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSF/aL55Kxn6LZ1KbAvmshulJIny6OOYYBlRSIeiyqk=;
  b=AuBqXt8dR/TPn/DAQzNoXu2HO6XzmSTMAEge5y3avnQc4mdmU/dutFE6
   PxvtJJ7Z3dj05T1gFyjVPhYwHGguPSV4Tu257Pk4CmwHFFIT0u4dij4fu
   2FDeJPy+o89GDL98ve8upN/souYndSL3NKO16xyhfLyyj00mbo1iBTtks
   KKONgK4pYxoaOAefgajiYgnFLqHGe4/10xCPSFf5+gKabR4t7xDLOBlxT
   MExVXYdeGPe/syC6EJ75ymXwZDRY6+1ZVHjK3NINARlE9kph4lmp10Z7O
   MMFEzVDoCNNb6LwTR7ffL6tSZNc8OnF6z04ui/UiEkLa2MIDQVbPFhBr3
   g==;
X-CSE-ConnectionGUID: UwGNtZXuSw23ioBogFIZNQ==
X-CSE-MsgGUID: Vk8whoFcSQSKohetAX7XzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98132667"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98132667"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:31:15 -0700
X-CSE-ConnectionGUID: LYFTcJlzSDutr2gx6RiAtw==
X-CSE-MsgGUID: mHdqeHmxT/6qRKN2/Z6zdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261457777"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2026 04:31:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwI2A-00000000eIM-3Q0r;
	Tue, 18 Aug 2026 11:31:10 +0000
Date: Tue, 18 Aug 2026 19:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 21/21]
 kernel/locking/lockdep_proc.c:300:8: warning: format specifies type 'size_t'
 (aka 'unsigned int') but the argument has type 'unsigned long'
Message-ID: <202608181933.mGdZOb3H-lkp@intel.com>
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
config: i386-randconfig-141-20260818 (https://download.01.org/0day-ci/archive/20260818/202608181933.mGdZOb3H-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181933.mGdZOb3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181933.mGdZOb3H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/lockdep_proc.c:300:8: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     298 |                         seq_printf(m, " lock-classes:                  %11lu [bootstrap: %lu/%lu, %zu kB]\n",
         |                                                                                                   ~~~
         |                                                                                                   %lu
     299 |                                    nr_lock_classes, nr_lock_classes, BOOTSTRAP_LOCK_CLASSES_CAP,
     300 |                                    (BOOTSTRAP_LOCK_CLASSES_CAP * sizeof(struct lock_class)) / 1024);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep_proc.c:317:8: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     315 |                         seq_printf(m, " direct dependencies:           %11lu [bootstrap: %lu/%lu, %zu kB]\n",
         |                                                                                                   ~~~
         |                                                                                                   %lu
     316 |                                    nr_list_entries, nr_list_entries, BOOTSTRAP_LOCKDEP_ENTRIES_CAP,
     317 |                                    (BOOTSTRAP_LOCKDEP_ENTRIES_CAP * sizeof(struct lock_list)) / 1024);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep_proc.c:347:8: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     345 |                         seq_printf(m, " dependency chains:             %11lu [bootstrap: %lu/%lu, %zu kB]\n",
         |                                                                                                   ~~~
         |                                                                                                   %lu
     346 |                                    lock_chain_count(), lock_chain_count(), BOOTSTRAP_LOCK_CHAINS_CAP,
     347 |                                    (BOOTSTRAP_LOCK_CHAINS_CAP * sizeof(struct lock_chain)) / 1024);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep_proc.c:362:8: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     360 |                         seq_printf(m, " dependency chain hlocks used:  %11u [bootstrap: %u/%lu, %zu kB]\n",
         |                                                                                                 ~~~
         |                                                                                                 %lu
     361 |                                    chain_hlocks_used(), chain_hlocks_used(), BOOTSTRAP_CHAIN_HLOCKS_CAP,
     362 |                                    (BOOTSTRAP_CHAIN_HLOCKS_CAP * sizeof(u16)) / 1024);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep_proc.c:389:8: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     387 |                         seq_printf(m, " stack-trace entries:           %11lu [bootstrap: %lu/%lu, %zu kB]\n",
         |                                                                                                   ~~~
         |                                                                                                   %lu
     388 |                                    nr_stack_trace_entries, nr_stack_trace_entries, BOOTSTRAP_STACK_TRACE_CAP,
     389 |                                    (BOOTSTRAP_STACK_TRACE_CAP * sizeof(unsigned long)) / 1024);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +300 kernel/locking/lockdep_proc.c

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
   298				seq_printf(m, " lock-classes:                  %11lu [bootstrap: %lu/%lu, %zu kB]\n",
   299					   nr_lock_classes, nr_lock_classes, BOOTSTRAP_LOCK_CLASSES_CAP,
 > 300					   (BOOTSTRAP_LOCK_CLASSES_CAP * sizeof(struct lock_class)) / 1024);
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
