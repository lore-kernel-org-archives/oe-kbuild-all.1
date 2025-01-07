Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A980E155335
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736217042; cv=none; b=BNpxY0aCTZqNApkpG2SXgaXNYO7YFLToRaomgLbvo5Bb1JLAfLpyNFZ/SNbailmhzDt7eUjMzNQSZSNWKnjwhPVS7WiPm6xF+IPLO6bb5xKTVO11U++YEbffdXzblkM7orwNIRDHpXK1830wF8MReGddlGXRY7AEBqPYjQnzGww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736217042; c=relaxed/simple;
	bh=c1+xQoiva6gWZETuWXCZj8C0IXhcevK1TcW70gzOI98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/0kEDYsfqTQkFddjxvMm4uGPlTkGsLW9Vt+u/xvjzpCN8n2PX7QGuk4Ok281Wos1DGCJ0nyWBxqKV4ya9UJG10i98cullDv/wzo7atjS1wR67ymtZZK8edmE+RtCRo8jq20udz/8feDPbiFr9n9xE18CAUMVarEGUx/rgKiFF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Io7IMori; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Io7IMori"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736217037; x=1767753037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c1+xQoiva6gWZETuWXCZj8C0IXhcevK1TcW70gzOI98=;
  b=Io7IMorimFX6JVeaEzOPL8AXPzIKjDJtYPmoSCTKfg2tqouCsGPCrIMc
   p1NIJzXJED5IhQjFlQwvT1BO4qoSlUQ/VaaS0kvp7CerR+mwPmZnBl4tV
   VTB4/odaT1Zm6dQQjsaleWSiiQo/ML5c1bv1bCj2gEdNWaAoQs0YHiBDw
   91h7YNuMhRxKBCdKEKEjoRpBvKoqQFS5nNKo6k9SbrKCLtYcEIF5dKoJ5
   O54X0uvn54fAf3L0m9AGsAWah/2ZJo84OvPchOfdkmnFE6PGbE/j1Aseo
   7S/MuLz9g3gqGmMaBs637Ff72YuhmfHOmIqU4fw8jYIat28/LO0D+zpIY
   A==;
X-CSE-ConnectionGUID: h3YgW9/DQMOb7SaARo9dHg==
X-CSE-MsgGUID: SyVsyOkMQkG348V8+LgN2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36262149"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36262149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 18:30:37 -0800
X-CSE-ConnectionGUID: x7emeMxPSZ674Oe3V9NgIw==
X-CSE-MsgGUID: QIUBZrndRU+gi/rWFigJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125906988"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2025 18:30:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUzMX-000E8P-2q;
	Tue, 07 Jan 2025 02:30:33 +0000
Date: Tue, 7 Jan 2025 10:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 6/6] include/linux/migrate.h:163:
 multiple definition of `migrate_misplaced_folio_batch';
 kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
Message-ID: <202501071016.BK8jkQGk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   0b481ba53a1ea6337129cbe63f9234a748df4843
commit: 0b481ba53a1ea6337129cbe63f9234a748df4843 [6/6] migrate,sysfs: add pagecache promotion
config: csky-randconfig-001-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071016.BK8jkQGk-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071016.BK8jkQGk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071016.BK8jkQGk-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: mm/filemap.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/folio-compat.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/swap.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/vmscan.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/shmem.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/compaction.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/debug.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/gup.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/memory.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/mprotect.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/rmap.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/page_alloc.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/swap_state.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/migrate.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/page_owner.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/page_isolation.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: mm/zsmalloc.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: fs/aio.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: fs/iomap/buffered-io.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here
   csky-linux-ld: fs/nfs/write.o: in function `migrate_misplaced_folio_batch':
>> include/linux/migrate.h:163: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:include/linux/migrate.h:163: first defined here


vim +163 include/linux/migrate.h

68f2736a858324 Matthew Wilcox (Oracle  2022-06-07  143) 
7039e1dbec6eea Peter Zijlstra          2012-10-25  144  #ifdef CONFIG_NUMA_BALANCING
ee86814b0562f1 David Hildenbrand       2024-06-20  145  int migrate_misplaced_folio_prepare(struct folio *folio,
ee86814b0562f1 David Hildenbrand       2024-06-20  146  		struct vm_area_struct *vma, int node);
28813e21acee49 Donet Tom               2024-11-26  147  int migrate_misplaced_folio(struct folio *folio, int node);
853ef17ea1577e Gregory Price           2024-12-31  148  int migrate_misplaced_folio_batch(struct list_head *foliolist, int node);
0b481ba53a1ea6 Gregory Price           2024-08-05  149  void promotion_candidate(struct folio *folio);
7039e1dbec6eea Peter Zijlstra          2012-10-25  150  #else
ee86814b0562f1 David Hildenbrand       2024-06-20  151  static inline int migrate_misplaced_folio_prepare(struct folio *folio,
ee86814b0562f1 David Hildenbrand       2024-06-20  152  		struct vm_area_struct *vma, int node)
ee86814b0562f1 David Hildenbrand       2024-06-20  153  {
ee86814b0562f1 David Hildenbrand       2024-06-20  154  	return -EAGAIN; /* can't migrate now */
ee86814b0562f1 David Hildenbrand       2024-06-20  155  }
28813e21acee49 Donet Tom               2024-11-26  156  static inline int migrate_misplaced_folio(struct folio *folio, int node)
7039e1dbec6eea Peter Zijlstra          2012-10-25  157  {
7039e1dbec6eea Peter Zijlstra          2012-10-25  158  	return -EAGAIN; /* can't migrate now */
7039e1dbec6eea Peter Zijlstra          2012-10-25  159  }
853ef17ea1577e Gregory Price           2024-12-31  160  int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
853ef17ea1577e Gregory Price           2024-12-31  161  {
853ef17ea1577e Gregory Price           2024-12-31  162  	return -EAGAIN; /* can't migrate now */
853ef17ea1577e Gregory Price           2024-12-31 @163  }
0b481ba53a1ea6 Gregory Price           2024-08-05  164  static inline void promotion_candidate(struct folio *folio)
0b481ba53a1ea6 Gregory Price           2024-08-05  165  {
0b481ba53a1ea6 Gregory Price           2024-08-05  166  	return;
0b481ba53a1ea6 Gregory Price           2024-08-05  167  }
220018d388b8ab Mel Gorman              2012-12-05  168  #endif /* CONFIG_NUMA_BALANCING */
b32967ff101a75 Mel Gorman              2012-11-19  169  

:::::: The code at line 163 was first introduced by commit
:::::: 853ef17ea1577e0a625e695acd45250f2610f004 migrate: implement migrate_misplaced_folio_batch

:::::: TO: Gregory Price <gourry@gourry.net>
:::::: CC: Gregory Price <gourry@gourry.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
