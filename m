Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90802DE702
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375591; cv=none; b=XTVCHrWTWROEXLckCKHhmiCeLMOOv9gDJM5/JUexopNGc8JF0OHHvN7TtQRueEUmCb8MVzvavvdFNJcLRzVnaGsvyAJrwibRhoVHuPLCf0KvExiW265NaX7xE+kVBk+YFPtOf9Kz93X8jWv5BiaEIlWRlRJqkIcUNf7VqK1tOAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375591; c=relaxed/simple;
	bh=U8CqdZ9cLq4GUXMKo6pcwF3HGr/kZOI26jzV18p0vz0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B3z2Qs1gMjTSxtJIll9mf8w+QUlMwLl2b1wImvec42heAs24/2AMNwYHN+QQU8v6AeQl4hN1xK0l/uJRFY4fzZX2JjCHQCEstvtJ+xpBhR04DOQKknz3I27NeCH5rnV4WXHYTa8/oeZPfup0daW33eePSdiKyUqbsxH5NNeVQoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g69YxfqD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g69YxfqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779375589; x=1810911589;
  h=date:from:to:cc:subject:message-id;
  bh=U8CqdZ9cLq4GUXMKo6pcwF3HGr/kZOI26jzV18p0vz0=;
  b=g69YxfqD7XGveYnObX+KMTR6clVGJ0ef7Npzl14zrzWIXEL06jR+OjUM
   MdssNHw6DBO8k46WCPvtgWoqk1KZjLjJkvM4VsE/wvToMcsGIZyqKFlhh
   4L4UQgYK0au12EkPhsJrpYarVzhJl3EMtab/J54FdPSKT5ImKfdaH7YWs
   0d8DMz3+ImU+gqvk7z7JfMIv3vcg5A2wmFqe8rbyo+LuLA5WUHFmASMu2
   sfD/5M+tawMW4sCx0xa45eDSmNdYYwHNcn0sBMfQ+63XjJ1r/PdX710KV
   9MrzejjcSzyQCYGHCnxfGlDxJTG+cAhpeusJCiaIW3P88BZ/2LOcCC00E
   w==;
X-CSE-ConnectionGUID: XgMohbyCSD6em+Ow0LsIug==
X-CSE-MsgGUID: fMOk9xVBSNWNNt3JZ7l0YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90590307"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90590307"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 07:59:48 -0700
X-CSE-ConnectionGUID: Nxsa5PxVQteCPml8cm+oMw==
X-CSE-MsgGUID: Kj8VeElFSvmOS4RCZVXVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="239535038"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2026 07:59:47 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ4sC-000000000bV-1Vqh;
	Thu, 21 May 2026 14:59:44 +0000
Date: Thu, 21 May 2026 22:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_ops 3/8] include/linux/memcontrol.h:1944:16:
 error: implicit declaration of function 'cgroup_e_css'; did you mean
 'cgroup_lock'?
Message-ID: <202605212218.Ah1VjjHT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_ops
head:   d964de3065ae3aa792fe6b812681b106abb18d17
commit: 4eae673faa096749302cf82fbb5d55632b340754 [3/8] mm: memcontrol: factor out a folio_memcg_css helper
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605212218.Ah1VjjHT-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212218.Ah1VjjHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212218.Ah1VjjHT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:47,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/memcontrol.h: In function 'folio_memcg_css':
>> include/linux/memcontrol.h:1944:16: error: implicit declaration of function 'cgroup_e_css'; did you mean 'cgroup_lock'? [-Werror=implicit-function-declaration]
    1944 |         return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
         |                ^~~~~~~~~~~~
         |                cgroup_lock
>> include/linux/memcontrol.h:1944:47: error: invalid use of undefined type 'struct mem_cgroup'
    1944 |         return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
         |                                               ^~
>> include/linux/memcontrol.h:1944:62: error: 'io_cgrp_subsys' undeclared (first use in this function)
    1944 |         return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
         |                                                              ^~~~~~~~~~~~~~
   include/linux/memcontrol.h:1944:62: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1375: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1944 include/linux/memcontrol.h

  1941	
  1942	static inline struct cgroup_subsys_state *folio_memcg_css(struct folio *folio)
  1943	{
> 1944		return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
  1945	}
  1946	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
