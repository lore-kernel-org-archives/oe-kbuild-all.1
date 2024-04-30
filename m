Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE39523A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 01:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714441262; cv=none; b=ShFC1WWZucyhsyjNl1y7zzEAsCOfNTVXk7ooWNIJ3cJkKux892u38kVWDeeEnP+37XJppgJ41HqjPub78HtzDbJ3HsAWuE3aa1B3NH+EA1q5p0anwXCEwUYef59AJsijL+iAmG7Zwm048is/jt6GM6yPdw4cfQmcSfJGW3bP88Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714441262; c=relaxed/simple;
	bh=6IhX8j55N1ZdHwebZDJq4mj1vDlDSNifeGdUqXvyoPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sk6U9fFhg/eV2RNvLZ+RfeXBqX0W9BDqgAc8KcuFA3B0OK2DMJY7Tt71xXb21b1v++ot7JJfRbFWBa2lL580QJQVB85qJ/MD0zg09hdm8cQblvwdlip+BKPhxUOrNCwOQAQftWpsNSdkzFGIgC6Xj2yvGSX1frWj5Rh2KtigxIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMNptWdI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMNptWdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714441260; x=1745977260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6IhX8j55N1ZdHwebZDJq4mj1vDlDSNifeGdUqXvyoPg=;
  b=gMNptWdIBVO8zgXwB0wP2cfX+WNF0Iu8BWvald96KMKlJwfLBYw3vGQa
   jFgnWHr54qXX/3pL4Cek04PtxpflGcyzIfwd5l/tuTIp9mg58vGR2FsFd
   w6Gb9gxwGCuiqAtx707ymNvLqPVCi2P1+LQq9+DFJ72zUN9V1ccnYCL6j
   AF2lER/2JPRhnC+PvgRpJxr9WbSeIe3N3BYbXJo6fTPM0O0LsoqQ43srY
   ARbfgqW2yXXQzeFc8gnZmiTtYG1mRgK9hr0fEk5Mh92STfHo2Yg4oRgxY
   8OK0itCms08maHmc9z28qzLBFkPq0v2wD8Pg/JSC+WRTvl1lrb1GCXTm2
   g==;
X-CSE-ConnectionGUID: cfmooA+pRo6j6djQHTFJFw==
X-CSE-MsgGUID: sAueaFhZSZe3kiPrgbHGug==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="27573523"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="27573523"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 18:40:59 -0700
X-CSE-ConnectionGUID: w9uR4jKrQRCrPe12wdqXmA==
X-CSE-MsgGUID: YI8CafGzQu+38Boo5LdJ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26913840"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2024 18:40:58 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1cUJ-0007bg-1W;
	Tue, 30 Apr 2024 01:40:55 +0000
Date: Tue, 30 Apr 2024 09:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15647/22256]
 kernel/sched/sparsemask.h:98:17: warning: array subscript 0 is outside array
 bounds of 'const struct sparsemask_chunk[0]'
Message-ID: <202404300955.dFOHBkZ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3c3550371ac3e9d3326c8263a6eb52d3bb0b43a8
commit: bccfa644c1b98b9d6fa102a39a10a1c52811fd0c [15647/22256] sched/fair: Steal work from an overloaded CPU when CPU goes idle
config: x86_64-randconfig-003-20240430 (https://download.01.org/0day-ci/archive/20240430/202404300955.dFOHBkZ8-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300955.dFOHBkZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300955.dFOHBkZ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:2548:6: warning: no previous prototype for 'task_numa_work' [-Wmissing-prototypes]
    2548 | void task_numa_work(struct callback_head *work)
         |      ^~~~~~~~~~~~~~
   kernel/sched/fair.c:2694:6: warning: no previous prototype for 'task_tick_numa' [-Wmissing-prototypes]
    2694 | void task_tick_numa(struct rq *rq, struct task_struct *curr)
         |      ^~~~~~~~~~~~~~
   kernel/sched/fair.c:3658:6: warning: no previous prototype for 'sync_entity_load_avg' [-Wmissing-prototypes]
    3658 | void sync_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3671:6: warning: no previous prototype for 'remove_entity_load_avg' [-Wmissing-prototypes]
    3671 | void remove_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'update_blocked_averages':
   kernel/sched/fair.c:7626:14: warning: variable 'done' set but not used [-Wunused-but-set-variable]
    7626 |         bool done = true;
         |              ^~~~
   In function 'group_faults_priv',
       inlined from 'task_scan_max' at kernel/sched/fair.c:1175:27:
   kernel/sched/fair.c:1307:37: warning: array subscript <unknown> is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    1307 |                 faults += ng->faults[task_faults_idx(NUMA_MEM, node, 1)];
         |                           ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'task_scan_max':
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   In function 'group_faults_shared',
       inlined from 'task_scan_max' at kernel/sched/fair.c:1174:26:
   kernel/sched/fair.c:1319:37: warning: array subscript <unknown> is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    1319 |                 faults += ng->faults[task_faults_idx(NUMA_MEM, node, 0)];
         |                           ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'task_scan_max':
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   In function 'group_faults_priv',
       inlined from 'task_scan_start' at kernel/sched/fair.c:1151:27:
   kernel/sched/fair.c:1307:37: warning: array subscript <unknown> is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    1307 |                 faults += ng->faults[task_faults_idx(NUMA_MEM, node, 1)];
         |                           ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'task_scan_start':
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   In function 'group_faults_shared',
       inlined from 'task_scan_start' at kernel/sched/fair.c:1150:26:
   kernel/sched/fair.c:1319:37: warning: array subscript <unknown> is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    1319 |                 faults += ng->faults[task_faults_idx(NUMA_MEM, node, 0)];
         |                           ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'task_scan_start':
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   In file included from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from arch/x86/include/asm/percpu.h:45,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
   In function 'sparsemask_test_elem',
       inlined from 'try_steal' at kernel/sched/fair.c:10007:8:
   kernel/sched/sparsemask.h:53:10: warning: array subscript <unknown> is outside array bounds of 'const struct sparsemask_chunk[0]' [-Warray-bounds=]
      53 |         (&(mask)->chunks[SMASK_INDEX((mask), (elem))].word)
   arch/x86/include/asm/bitops.h:341:37: note: in definition of macro 'test_bit'
     341 |          : variable_test_bit((nr), (addr)))
         |                                     ^~~~
   kernel/sched/sparsemask.h:191:48: note: in expansion of macro 'SMASK_WORD'
     191 |         return test_bit(SMASK_BIT(mask, elem), SMASK_WORD(mask, elem));
         |                                                ^~~~~~~~~~
   In file included from kernel/sched/fair.c:24:
   kernel/sched/sparsemask.h: In function 'try_steal':
   kernel/sched/sparsemask.h:45:33: note: while referencing 'chunks'
      45 |         struct sparsemask_chunk chunks[0];  /* embedded array of chunks */
         |                                 ^~~~~~
   In function 'sparsemask_next',
       inlined from 'try_steal' at kernel/sched/fair.c:10018:2:
   kernel/sched/sparsemask.h:98:17: warning: array subscript <unknown> is outside array bounds of 'const struct sparsemask_chunk[0]' [-Warray-bounds=]
      98 |         chunk = &mask->chunks[_SMASK_INDEX(density, next)];
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sparsemask.h: In function 'try_steal':
   kernel/sched/sparsemask.h:45:33: note: while referencing 'chunks'
      45 |         struct sparsemask_chunk chunks[0];  /* embedded array of chunks */
         |                                 ^~~~~~
   In function 'sparsemask_next',
       inlined from 'try_steal' at kernel/sched/fair.c:10018:2:
>> kernel/sched/sparsemask.h:98:17: warning: array subscript 0 is outside array bounds of 'const struct sparsemask_chunk[0]' [-Warray-bounds=]
      98 |         chunk = &mask->chunks[_SMASK_INDEX(density, next)];
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sparsemask.h: In function 'try_steal':
   kernel/sched/sparsemask.h:45:33: note: while referencing 'chunks'
      45 |         struct sparsemask_chunk chunks[0];  /* embedded array of chunks */
         |                                 ^~~~~~
   In function 'sparsemask_next',
       inlined from 'try_steal' at kernel/sched/fair.c:10018:2:
   kernel/sched/sparsemask.h:98:30: warning: array subscript <unknown> is outside array bounds of 'const struct sparsemask_chunk[0]' [-Warray-bounds=]
      98 |         chunk = &mask->chunks[_SMASK_INDEX(density, next)];
         |                  ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sparsemask.h: In function 'try_steal':
   kernel/sched/sparsemask.h:45:33: note: while referencing 'chunks'
      45 |         struct sparsemask_chunk chunks[0];  /* embedded array of chunks */
         |                                 ^~~~~~
   kernel/sched/fair.c: In function 'task_numa_group':
   kernel/sched/fair.c:2335:36: warning: array subscript i is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    2335 |                         grp->faults[i] = p->numa_faults[i];
         |                         ~~~~~~~~~~~^~~
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   kernel/sched/fair.c:2393:31: warning: array subscript i is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    2393 |                 my_grp->faults[i] -= p->numa_faults[i];
         |                 ~~~~~~~~~~~~~~^~~
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   kernel/sched/fair.c:2393:31: warning: array subscript i is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    2393 |                 my_grp->faults[i] -= p->numa_faults[i];
         |                 ~~~~~~~~~~~~~~^~~
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   kernel/sched/fair.c:2394:28: warning: array subscript i is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    2394 |                 grp->faults[i] += p->numa_faults[i];
         |                 ~~~~~~~~~~~^~~
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   kernel/sched/fair.c:2394:28: warning: array subscript i is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    2394 |                 grp->faults[i] += p->numa_faults[i];
         |                 ~~~~~~~~~~~^~~
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   In function 'sparsemask_clear_elem',
       inlined from 'overload_clear.part.0' at kernel/sched/fair.c:3834:3:
   kernel/sched/sparsemask.h:53:10: warning: array subscript <unknown> is outside array bounds of 'struct sparsemask_chunk[0]' [-Warray-bounds=]
      53 |         (&(mask)->chunks[SMASK_INDEX((mask), (elem))].word)
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sparsemask.h:186:41: note: in expansion of macro 'SMASK_WORD'
     186 |         clear_bit(SMASK_BIT(dst, elem), SMASK_WORD(dst, elem));
         |                                         ^~~~~~~~~~
   kernel/sched/sparsemask.h: In function 'overload_clear.part.0':
   kernel/sched/sparsemask.h:45:33: note: while referencing 'chunks'
      45 |         struct sparsemask_chunk chunks[0];  /* embedded array of chunks */
         |                                 ^~~~~~
   In function 'group_faults',
       inlined from 'score_nearby_nodes.part.0' at kernel/sched/fair.c:1381:13:
   kernel/sched/fair.c:1291:26: warning: array subscript <unknown> is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    1291 |         return ng->faults[task_faults_idx(NUMA_MEM, nid, 0)] +
         |                ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'score_nearby_nodes.part.0':
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   In function 'group_faults',
       inlined from 'score_nearby_nodes.part.0' at kernel/sched/fair.c:1381:13:
   kernel/sched/fair.c:1292:27: warning: array subscript <unknown> is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    1292 |                 ng->faults[task_faults_idx(NUMA_MEM, nid, 1)];
         |                 ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'score_nearby_nodes.part.0':
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   In function 'group_faults',
       inlined from 'preferred_group_nid' at kernel/sched/fair.c:2161:16:
   kernel/sched/fair.c:1291:26: warning: array subscript <unknown> is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    1291 |         return ng->faults[task_faults_idx(NUMA_MEM, nid, 0)] +
         |                ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'preferred_group_nid':
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   In function 'group_faults',
       inlined from 'preferred_group_nid' at kernel/sched/fair.c:2161:16:
   kernel/sched/fair.c:1292:27: warning: array subscript <unknown> is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    1292 |                 ng->faults[task_faults_idx(NUMA_MEM, nid, 1)];
         |                 ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'preferred_group_nid':
   kernel/sched/fair.c:1083:23: note: while referencing 'faults'
    1083 |         unsigned long faults[0];
         |                       ^~~~~~
   In function 'group_faults',
       inlined from 'group_weight' at kernel/sched/fair.c:1441:11,
       inlined from 'preferred_group_nid' at kernel/sched/fair.c:2125:12:
   kernel/sched/fair.c:1291:26: warning: array subscript <unknown> is outside array bounds of 'long unsigned int[0]' [-Warray-bounds=]
    1291 |         return ng->faults[task_faults_idx(NUMA_MEM, nid, 0)] +
         |                ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +98 kernel/sched/sparsemask.h

6866be5a3aff4b Steve Sistare 2021-04-14   47  
6866be5a3aff4b Steve Sistare 2021-04-14   48  #define _SMASK_INDEX(density, elem)	((elem) >> (density))
6866be5a3aff4b Steve Sistare 2021-04-14   49  #define _SMASK_BIT(density, elem)	((elem) & ((1U << (density)) - 1U))
6866be5a3aff4b Steve Sistare 2021-04-14   50  #define SMASK_INDEX(mask, elem)		_SMASK_INDEX((mask)->density, elem)
6866be5a3aff4b Steve Sistare 2021-04-14   51  #define SMASK_BIT(mask, elem)		_SMASK_BIT((mask)->density, elem)
6866be5a3aff4b Steve Sistare 2021-04-14   52  #define SMASK_WORD(mask, elem)		\
6866be5a3aff4b Steve Sistare 2021-04-14   53  	(&(mask)->chunks[SMASK_INDEX((mask), (elem))].word)
6866be5a3aff4b Steve Sistare 2021-04-14   54  
6866be5a3aff4b Steve Sistare 2021-04-14   55  /*
6866be5a3aff4b Steve Sistare 2021-04-14   56   * sparsemask_next() - Return the next one bit in a bitmap, starting at a
6866be5a3aff4b Steve Sistare 2021-04-14   57   * specified position and wrapping from the last bit to the first, up to but
6866be5a3aff4b Steve Sistare 2021-04-14   58   * not including a specified origin.  This is a helper, so do not call it
6866be5a3aff4b Steve Sistare 2021-04-14   59   * directly.
6866be5a3aff4b Steve Sistare 2021-04-14   60   *
6866be5a3aff4b Steve Sistare 2021-04-14   61   * @mask: Bitmap to search.
6866be5a3aff4b Steve Sistare 2021-04-14   62   * @origin: Origin.
6866be5a3aff4b Steve Sistare 2021-04-14   63   * @prev: Previous bit. Start search after this bit number.
6866be5a3aff4b Steve Sistare 2021-04-14   64   *	  If -1, start search at @origin.
6866be5a3aff4b Steve Sistare 2021-04-14   65   *
6866be5a3aff4b Steve Sistare 2021-04-14   66   * Return: the bit number, else mask->nelems if no bits are set in the range.
6866be5a3aff4b Steve Sistare 2021-04-14   67   */
6866be5a3aff4b Steve Sistare 2021-04-14   68  static inline int
6866be5a3aff4b Steve Sistare 2021-04-14   69  sparsemask_next(const struct sparsemask *mask, int origin, int prev)
6866be5a3aff4b Steve Sistare 2021-04-14   70  {
6866be5a3aff4b Steve Sistare 2021-04-14   71  	int density = mask->density;
6866be5a3aff4b Steve Sistare 2021-04-14   72  	int bits_per_word = 1U << density;
6866be5a3aff4b Steve Sistare 2021-04-14   73  	const struct sparsemask_chunk *chunk;
6866be5a3aff4b Steve Sistare 2021-04-14   74  	int nelems = mask->nelems;
6866be5a3aff4b Steve Sistare 2021-04-14   75  	int next, bit, nbits;
6866be5a3aff4b Steve Sistare 2021-04-14   76  	unsigned long word;
6866be5a3aff4b Steve Sistare 2021-04-14   77  
6866be5a3aff4b Steve Sistare 2021-04-14   78  	/* Calculate number of bits to be searched. */
6866be5a3aff4b Steve Sistare 2021-04-14   79  	if (prev == -1) {
6866be5a3aff4b Steve Sistare 2021-04-14   80  		nbits = nelems;
6866be5a3aff4b Steve Sistare 2021-04-14   81  		next = origin;
6866be5a3aff4b Steve Sistare 2021-04-14   82  	} else if (prev < origin) {
6866be5a3aff4b Steve Sistare 2021-04-14   83  		nbits = origin - prev;
6866be5a3aff4b Steve Sistare 2021-04-14   84  		next = prev + 1;
6866be5a3aff4b Steve Sistare 2021-04-14   85  	} else {
6866be5a3aff4b Steve Sistare 2021-04-14   86  		nbits = nelems - prev + origin - 1;
6866be5a3aff4b Steve Sistare 2021-04-14   87  		next = prev + 1;
6866be5a3aff4b Steve Sistare 2021-04-14   88  	}
6866be5a3aff4b Steve Sistare 2021-04-14   89  
6866be5a3aff4b Steve Sistare 2021-04-14   90  	if (unlikely(next >= nelems))
6866be5a3aff4b Steve Sistare 2021-04-14   91  		return nelems;
6866be5a3aff4b Steve Sistare 2021-04-14   92  
6866be5a3aff4b Steve Sistare 2021-04-14   93  	/*
6866be5a3aff4b Steve Sistare 2021-04-14   94  	 * Fetch and adjust first word.  Clear word bits below @next, and round
6866be5a3aff4b Steve Sistare 2021-04-14   95  	 * @next down to @bits_per_word boundary because later ffs will add
6866be5a3aff4b Steve Sistare 2021-04-14   96  	 * those bits back.
6866be5a3aff4b Steve Sistare 2021-04-14   97  	 */
6866be5a3aff4b Steve Sistare 2021-04-14  @98  	chunk = &mask->chunks[_SMASK_INDEX(density, next)];
6866be5a3aff4b Steve Sistare 2021-04-14   99  	bit = _SMASK_BIT(density, next);
6866be5a3aff4b Steve Sistare 2021-04-14  100  	word = chunk->word & (~0UL << bit);
6866be5a3aff4b Steve Sistare 2021-04-14  101  	next -= bit;
6866be5a3aff4b Steve Sistare 2021-04-14  102  	nbits += bit;
6866be5a3aff4b Steve Sistare 2021-04-14  103  
6866be5a3aff4b Steve Sistare 2021-04-14  104  	while (!word) {
6866be5a3aff4b Steve Sistare 2021-04-14  105  		next += bits_per_word;
6866be5a3aff4b Steve Sistare 2021-04-14  106  		nbits -= bits_per_word;
6866be5a3aff4b Steve Sistare 2021-04-14  107  		if (nbits <= 0)
6866be5a3aff4b Steve Sistare 2021-04-14  108  			return nelems;
6866be5a3aff4b Steve Sistare 2021-04-14  109  
6866be5a3aff4b Steve Sistare 2021-04-14  110  		if (next >= nelems) {
6866be5a3aff4b Steve Sistare 2021-04-14  111  			chunk = mask->chunks;
6866be5a3aff4b Steve Sistare 2021-04-14  112  			nbits -= (next - nelems);
6866be5a3aff4b Steve Sistare 2021-04-14  113  			next = 0;
6866be5a3aff4b Steve Sistare 2021-04-14  114  		} else {
6866be5a3aff4b Steve Sistare 2021-04-14  115  			chunk++;
6866be5a3aff4b Steve Sistare 2021-04-14  116  		}
6866be5a3aff4b Steve Sistare 2021-04-14  117  		word = chunk->word;
6866be5a3aff4b Steve Sistare 2021-04-14  118  	}
6866be5a3aff4b Steve Sistare 2021-04-14  119  
6866be5a3aff4b Steve Sistare 2021-04-14  120  	next += __ffs(word);
6866be5a3aff4b Steve Sistare 2021-04-14  121  	if (next >= origin && prev != -1)
6866be5a3aff4b Steve Sistare 2021-04-14  122  		return nelems;
6866be5a3aff4b Steve Sistare 2021-04-14  123  	return next;
6866be5a3aff4b Steve Sistare 2021-04-14  124  }
6866be5a3aff4b Steve Sistare 2021-04-14  125  

:::::: The code at line 98 was first introduced by commit
:::::: 6866be5a3aff4bbd949059927d8f8790be53e3dd sched: Provide sparsemask, a reduced contention bitmap

:::::: TO: Steve Sistare <steven.sistare@oracle.com>
:::::: CC: Cheng Jian <cj.chengjian@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
