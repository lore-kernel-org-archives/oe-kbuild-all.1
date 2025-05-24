Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F42DCC0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748074298; cv=none; b=EZDA07s1S/eJSUDEDXxNGz5epg19gWCvIysOFtrj0WcQI2hMHZzn5AFDt0EqQdD0BkpZfxGEqXLrpe5VGmJhrSltB2m2ohVuSM6jKOdLMIXdvbSr0LsCpHL+BfgJQ4f1DS5N3J5JsKfBAWSyw4hUoieWiUpNMjOER02acwuFJVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748074298; c=relaxed/simple;
	bh=cF5W/wuudPJOLCmwg3acUYMvtph2jSiIIh9WYjoTLcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LIjQvRaEDKpaa7CqpkeBFTjv141kGjJ4Azq0GLZkUD4nhCXrHd0+X29lcDUfYRRC5GWcaZrOzZGwuUsVTHsfqp9wZHeS3TgSOVZVke9AwM7WKDfu4hV8+N+HNlvwH7+qa5jEUkW3CB5qMR/GIokSSXDTjbVLCG1SvVHISOwbwcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoDlCsNr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoDlCsNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748074295; x=1779610295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cF5W/wuudPJOLCmwg3acUYMvtph2jSiIIh9WYjoTLcc=;
  b=FoDlCsNrGj3SikK/41VetateKhBwuESHbMtA8McwKPyn7RwXYc8zIm9g
   Ri90Fahrmyj9T0bej+Z56zjHfk/GOcoKw8tWQftPPlskws3BCadAj67uI
   3sutt49pie73eJv2kHIOUr2cmJHP+fDvknScI87rcG5s+sdMBL+ecruDA
   aDoF2ci4SAEx6JqkGaJDEFn94rXN8HvJNZ5W3xzoVgHjrK6N5Vdc16Ijy
   IS4jJAC+w72Q9CVs5vaSEqoZ2ew/KM8Y5T4JXW5HuuyTQNIfL1K40uwyW
   +y9EvWTHKbqbQa99iWxwSrsb8rSICy7izrwZ3gXFDlBaJrUycRoRK0Vvb
   w==;
X-CSE-ConnectionGUID: Rtws7rNeTi+fXx1z5hAiTg==
X-CSE-MsgGUID: 77WOOQv1Rbu2lr87GOO+Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50005054"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50005054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 01:11:34 -0700
X-CSE-ConnectionGUID: ZGk5CyblQ1uu949NQ+ohsQ==
X-CSE-MsgGUID: dA0MKkZoQomA3GOlyA7c9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142424375"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 May 2025 01:11:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIjyd-000R2y-0j;
	Sat, 24 May 2025 08:11:31 +0000
Date: Sat, 24 May 2025 16:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Anthony Yznaga <anthony.yznaga@oracle.com>
Subject: [jlayton:uek-localio 2093/2262] kernel/padata.c:586: warning:
 Function parameter or struct member 'key' not described in
 '__padata_do_multithreaded'
Message-ID: <202505241637.u6SaSz8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 1559dccd6e0120f6955950e5af55cf40317834fa [2093/2262] vfio/type1: parallelize vfio_pin_map_dma()
config: x86_64-buildonly-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241637.u6SaSz8X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241637.u6SaSz8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241637.u6SaSz8X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/padata.c:586: warning: Function parameter or struct member 'key' not described in '__padata_do_multithreaded'
>> kernel/padata.c:586: warning: Function parameter or struct member 'map_name' not described in '__padata_do_multithreaded'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PADATA
   Depends on [n]: SMP [=n]
   Selected by [y]:
   - VFIO_IOMMU_TYPE1 [=y] && VFIO [=y] && VFIO_CONTAINER [=y]


vim +586 kernel/padata.c

4fed4673cdab8af Daniel Jordan                              2020-05-26  574  
004ed42638f4428 Daniel Jordan                              2020-06-03  575  /**
66082b964b79e0e Daniel Jordan                              2020-05-26  576   * __padata_do_multithreaded - run a multithreaded job
004ed42638f4428 Daniel Jordan                              2020-06-03  577   * @job: Description of the job.
004ed42638f4428 Daniel Jordan                              2020-06-03  578   *
004ed42638f4428 Daniel Jordan                              2020-06-03  579   * See the definition of struct padata_mt_job for more details.
b10c8ee9594b63f Daniel Jordan                              2020-05-26  580   *
b10c8ee9594b63f Daniel Jordan                              2020-05-26  581   * Return: 0 for success or a client-specific nonzero error code.
004ed42638f4428 Daniel Jordan                              2020-06-03  582   */
66082b964b79e0e Daniel Jordan                              2020-05-26  583  int __padata_do_multithreaded(struct padata_mt_job *job,
66082b964b79e0e Daniel Jordan                              2020-05-26  584  			      struct lock_class_key *key,
66082b964b79e0e Daniel Jordan                              2020-05-26  585  			      const char *map_name)
004ed42638f4428 Daniel Jordan                              2020-06-03 @586  {
004ed42638f4428 Daniel Jordan                              2020-06-03  587  	/* In case threads finish at different times. */
004ed42638f4428 Daniel Jordan                              2020-06-03  588  	static const unsigned long load_balance_factor = 4;
004ed42638f4428 Daniel Jordan                              2020-06-03  589  	struct padata_work my_work, *pw;
004ed42638f4428 Daniel Jordan                              2020-06-03  590  	struct padata_mt_job_state ps;
004ed42638f4428 Daniel Jordan                              2020-06-03  591  	LIST_HEAD(works);
b10c8ee9594b63f Daniel Jordan                              2020-05-26  592  	int nworks, nid, ret;
95a5dd954cc60cd Daniel Jordan                              2020-05-26  593  	static atomic_t last_used_nid;
004ed42638f4428 Daniel Jordan                              2020-06-03  594  
004ed42638f4428 Daniel Jordan                              2020-06-03  595  	if (job->size == 0)
b10c8ee9594b63f Daniel Jordan                              2020-05-26  596  		return 0;
004ed42638f4428 Daniel Jordan                              2020-06-03  597  
004ed42638f4428 Daniel Jordan                              2020-06-03  598  	/* Ensure at least one thread when size < min_chunk. */
f84155ca851849e Anthony Yznaga                             2023-02-22  599  	nworks = max(job->size / max(job->min_chunk, job->align), 1ul);
004ed42638f4428 Daniel Jordan                              2020-06-03  600  	nworks = min(nworks, job->max_threads);
004ed42638f4428 Daniel Jordan                              2020-06-03  601  
004ed42638f4428 Daniel Jordan                              2020-06-03  602  	if (nworks == 1) {
004ed42638f4428 Daniel Jordan                              2020-06-03  603  		/* Single thread, no coordination needed, cut to the chase. */
b10c8ee9594b63f Daniel Jordan                              2020-05-26  604  		ret = job->thread_fn(job->start, job->start + job->size,
b10c8ee9594b63f Daniel Jordan                              2020-05-26  605  				     job->fn_arg);
b10c8ee9594b63f Daniel Jordan                              2020-05-26  606  		return ret;
004ed42638f4428 Daniel Jordan                              2020-06-03  607  	}
004ed42638f4428 Daniel Jordan                              2020-06-03  608  
004ed42638f4428 Daniel Jordan                              2020-06-03  609  	spin_lock_init(&ps.lock);
004ed42638f4428 Daniel Jordan                              2020-06-03  610  	init_completion(&ps.completion);
4fed4673cdab8af Daniel Jordan                              2020-05-26  611  	INIT_LIST_HEAD(&ps.failed_works);
66082b964b79e0e Daniel Jordan                              2020-05-26  612  	lockdep_init_map(&ps.lockdep_map, map_name, key, 0);
004ed42638f4428 Daniel Jordan                              2020-06-03  613  	ps.job		  = job;
004ed42638f4428 Daniel Jordan                              2020-06-03  614  	ps.nworks	  = padata_work_alloc_mt(nworks, &ps, &works);
004ed42638f4428 Daniel Jordan                              2020-06-03  615  	ps.nworks_fini	  = 0;
b10c8ee9594b63f Daniel Jordan                              2020-05-26  616  	ps.error	  = 0;
4fed4673cdab8af Daniel Jordan                              2020-05-26  617  	ps.position	  = job->start;
4fed4673cdab8af Daniel Jordan                              2020-05-26  618  	ps.remaining_size = job->size;
004ed42638f4428 Daniel Jordan                              2020-06-03  619  
004ed42638f4428 Daniel Jordan                              2020-06-03  620  	/*
004ed42638f4428 Daniel Jordan                              2020-06-03  621  	 * Chunk size is the amount of work a helper does per call to the
004ed42638f4428 Daniel Jordan                              2020-06-03  622  	 * thread function.  Load balance large jobs between threads by
004ed42638f4428 Daniel Jordan                              2020-06-03  623  	 * increasing the number of chunks, guarantee at least the minimum
004ed42638f4428 Daniel Jordan                              2020-06-03  624  	 * chunk size from the caller, and honor the caller's alignment.
24cc57d8faaa406 Kamlesh Gurudasani                         2024-08-22  625  	 * Ensure chunk_size is at least 1 to prevent divide-by-0
24cc57d8faaa406 Kamlesh Gurudasani                         2024-08-22  626  	 * panic in padata_mt_helper().
004ed42638f4428 Daniel Jordan                              2020-06-03  627  	 */
004ed42638f4428 Daniel Jordan                              2020-06-03  628  	ps.chunk_size = job->size / (ps.nworks * load_balance_factor);
004ed42638f4428 Daniel Jordan                              2020-06-03  629  	ps.chunk_size = max(ps.chunk_size, job->min_chunk);
24cc57d8faaa406 Kamlesh Gurudasani                         2024-08-22  630  	ps.chunk_size = max(ps.chunk_size, 1ul);
004ed42638f4428 Daniel Jordan                              2020-06-03  631  	ps.chunk_size = roundup(ps.chunk_size, job->align);
004ed42638f4428 Daniel Jordan                              2020-06-03  632  
66082b964b79e0e Daniel Jordan                              2020-05-26  633  	lock_map_acquire(&ps.lockdep_map);
66082b964b79e0e Daniel Jordan                              2020-05-26  634  	lock_map_release(&ps.lockdep_map);
66082b964b79e0e Daniel Jordan                              2020-05-26  635  
004ed42638f4428 Daniel Jordan                              2020-06-03  636  	list_for_each_entry(pw, &works, pw_list)
eb52286634f0424 Gang Li Subject: padata: dispatch works on 2024-03-06  637  		if (job->numa_aware) {
eb52286634f0424 Gang Li Subject: padata: dispatch works on 2024-03-06  638  			int old_node = atomic_read(&last_used_nid);
eb52286634f0424 Gang Li Subject: padata: dispatch works on 2024-03-06  639  
eb52286634f0424 Gang Li Subject: padata: dispatch works on 2024-03-06  640  			do {
eb52286634f0424 Gang Li Subject: padata: dispatch works on 2024-03-06  641  				nid = next_node_in(old_node, node_states[N_CPU]);
eb52286634f0424 Gang Li Subject: padata: dispatch works on 2024-03-06  642  			} while (!atomic_try_cmpxchg(&last_used_nid, &old_node, nid));
eb52286634f0424 Gang Li Subject: padata: dispatch works on 2024-03-06  643  			queue_work_node(nid, system_unbound_wq, &pw->pw_work);
eb52286634f0424 Gang Li Subject: padata: dispatch works on 2024-03-06  644  		} else {
004ed42638f4428 Daniel Jordan                              2020-06-03  645  			queue_work(system_unbound_wq, &pw->pw_work);
eb52286634f0424 Gang Li Subject: padata: dispatch works on 2024-03-06  646  		}
004ed42638f4428 Daniel Jordan                              2020-06-03  647  
004ed42638f4428 Daniel Jordan                              2020-06-03  648  	/* Use the current thread, which saves starting a workqueue worker. */
004ed42638f4428 Daniel Jordan                              2020-06-03  649  	padata_work_init(&my_work, padata_mt_helper, &ps, PADATA_WORK_ONSTACK);
4fed4673cdab8af Daniel Jordan                              2020-05-26  650  	INIT_LIST_HEAD(&my_work.pw_list);
004ed42638f4428 Daniel Jordan                              2020-06-03  651  	padata_mt_helper(&my_work.pw_work);
004ed42638f4428 Daniel Jordan                              2020-06-03  652  
004ed42638f4428 Daniel Jordan                              2020-06-03  653  	/* Wait for all the helpers to finish. */
004ed42638f4428 Daniel Jordan                              2020-06-03  654  	wait_for_completion(&ps.completion);
004ed42638f4428 Daniel Jordan                              2020-06-03  655  
4fed4673cdab8af Daniel Jordan                              2020-05-26  656  	if (ps.error && job->undo_fn)
4fed4673cdab8af Daniel Jordan                              2020-05-26  657  		padata_undo(&ps, &works, &my_work);
4fed4673cdab8af Daniel Jordan                              2020-05-26  658  
004ed42638f4428 Daniel Jordan                              2020-06-03  659  	destroy_work_on_stack(&my_work.pw_work);
004ed42638f4428 Daniel Jordan                              2020-06-03  660  	padata_works_free(&works);
b10c8ee9594b63f Daniel Jordan                              2020-05-26  661  	return ps.error;
004ed42638f4428 Daniel Jordan                              2020-06-03  662  }
004ed42638f4428 Daniel Jordan                              2020-06-03  663  

:::::: The code at line 586 was first introduced by commit
:::::: 004ed42638f4428e70ead59d170f3d17ff761a0f padata: add basic support for multithreaded jobs

:::::: TO: Daniel Jordan <daniel.m.jordan@oracle.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
