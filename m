Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3725B284B29
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375593; cv=none; b=TGpu7RypbF3YIwaggtWvJWyPqdqPdwSi97tQv6ZfUhy8gGI5x4Bews9XlTl3xe53OaTA4qEh2A1Z4muYboKyRjl4uprHgPB/CgDrFo3DOTPbbp63C+8PLzVv339Oqqfs3mT/6j4lUXt3+qPEunIoDABlvkXTuLyA1iLs2NMiNQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375593; c=relaxed/simple;
	bh=GoWX7YHsp5WEexfhUIyTYmK0Pus0qthsgLK9H3HMDHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hXbRLjzOXsF8EH0KvCNGtfi2i6NzrQ+yeUPsLZ2JUJjFDnFIO0PyNJkiGvAIj8Py02QDnNC982+Ufs8Fb2Zxf6k/vonw63c5MvT7KMHLx7FlmAb3PrraalWgyS2vXxEw1Cz5vnqWQg4VDolJEO1s3TeFESkVC38unxYzVMR6Hck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3wHkuYT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3wHkuYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779375592; x=1810911592;
  h=date:from:to:cc:subject:message-id;
  bh=GoWX7YHsp5WEexfhUIyTYmK0Pus0qthsgLK9H3HMDHk=;
  b=c3wHkuYTkg8vDxTT7xpyauQuMNeqshz6rCudnIs3voH8eCSduDDftqQb
   V+t4byNqG5CZLMOxV7U7vjQwlVCNJrKrgsrKq/HsyJzZOWCPPU2rVW4Cm
   r1+3lchM/ZfsCxUQsdIm+s2+L06g9PuIdEOcCdglk4vgej8qnM3sVruJt
   hClrxAMH8K/aaVdzGcKUVpfdCWj5gsIr+zYZ219aNOXAtnUbWvZ1bE3j+
   jgrY7MRAU4ZqXybHLE89KzhNu+ITW9f+tOd9YqDZvDml3GDjzfM7Enhmh
   YY36qv3MF775ldFmibXF6lDNw86LS7AJ1g93Sf1cldlrPhWUY1BJ+rKkz
   g==;
X-CSE-ConnectionGUID: SXE8TfPvQcGbLTmM1NNCeg==
X-CSE-MsgGUID: uCytllvoQZq1NWmC5JyMdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90590309"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90590309"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 07:59:49 -0700
X-CSE-ConnectionGUID: 9S619rApQXeXrnjR8AATsg==
X-CSE-MsgGUID: ERx+uk5pQYKKqJ4B0oCZQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="239535040"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2026 07:59:47 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ4sC-000000000bX-1etD;
	Thu, 21 May 2026 14:59:44 +0000
Date: Thu, 21 May 2026 22:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_ops 3/8] include/linux/memcontrol.h:1944:9:
 error: call to undeclared function 'cgroup_e_css'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202605212202.qGoVvRxT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_ops
head:   d964de3065ae3aa792fe6b812681b106abb18d17
commit: 4eae673faa096749302cf82fbb5d55632b340754 [3/8] mm: memcontrol: factor out a folio_memcg_css helper
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605212202.qGoVvRxT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212202.qGoVvRxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212202.qGoVvRxT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:47:
>> include/linux/memcontrol.h:1944:9: error: call to undeclared function 'cgroup_e_css'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1944 |         return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
         |                ^
   include/linux/memcontrol.h:1944:9: note: did you mean 'cgroup_lock'?
   include/linux/cgroup.h:732:20: note: 'cgroup_lock' declared here
     732 | static inline void cgroup_lock(void) {}
         |                    ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:47:
>> include/linux/memcontrol.h:1944:40: error: incomplete definition of type 'struct mem_cgroup'
    1944 |         return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
         |                             ~~~~~~~~~~~~~~~~~~^
   include/linux/mm_types.h:36:8: note: forward declaration of 'struct mem_cgroup'
      36 | struct mem_cgroup;
         |        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:47:
>> include/linux/memcontrol.h:1944:55: error: use of undeclared identifier 'io_cgrp_subsys'
    1944 |         return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
         |                                                              ^~~~~~~~~~~~~~
   3 errors generated.
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1375: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/cgroup_e_css +1944 include/linux/memcontrol.h

  1941	
  1942	static inline struct cgroup_subsys_state *folio_memcg_css(struct folio *folio)
  1943	{
> 1944		return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
  1945	}
  1946	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
