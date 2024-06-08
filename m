Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F3D4C65
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 04:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717819387; cv=none; b=BMelZAYsMui6sEGydwibLRAI7kOTI7bOAU1U4YY0tOTh6ksjlc2/8ucWd5uNGqthmjQxbyMAGrzD9wExdzRNWRX21AXfvoO45QObHsUduDZiiyJ/cwT4612otZDw7h93GItpBJsw7WNPORrqF9IZHh03rhEzlIs+X7FJuiU/zvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717819387; c=relaxed/simple;
	bh=VmQaU1JKWbyB19wOXNMwnlMWSbU7aTgds1TJXoobKTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cbt5G4L6AV+/p1VDbSN2wSyvs3BwwKNDo8LiOo9Dg1hgarC/jnOQHE7Hh1r70sU+lTELOL4mvvnidvsfqByoDBUV1IHWSzQQd1slKwovvcYEfjqAZ2+Qb/np27JqD2jd+Aa0kClGdsm1j9x5gsMYPCjTb1i5EPKnvKyIfe+US0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTbaipZp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTbaipZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717819386; x=1749355386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmQaU1JKWbyB19wOXNMwnlMWSbU7aTgds1TJXoobKTQ=;
  b=LTbaipZpGhpuiVq4kk/uQ9cE+6ngOxo2yJCYbpQyhUSMnO55KdrhiuT8
   4j5WYjAy14pjqphydDA57CthXcY4Zb+MWeG7sYTcVhh+JTdf20PLp0SWZ
   AsrLdN1ZYBnmiq9eBQMmLNZIdA3lf7S/F7svZ848Nfa2GWzTL6U+r8yGL
   RvQIPRJrbgqOonwsGF2FoNUe2Pf3QPIuVRmtkks+wlXK58mXrpcY/xOD6
   r1/Ol/x+yfcyOd9tSDACvKsZev/saYg9lNRmf30saM/AJUeEtIyQk1SaZ
   33BmegqFw27eBwZ5yB7E+wgky8wnjRiTgpoG8pNOn6mWak0c7+BNgpRiV
   g==;
X-CSE-ConnectionGUID: g8iXW9WiSwGQAccbSjhGgw==
X-CSE-MsgGUID: gNYyrl0QR1ar2EQYJhGo9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14675639"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14675639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 21:03:06 -0700
X-CSE-ConnectionGUID: 1YTdNh1JQmm2xVwyO5UR/w==
X-CSE-MsgGUID: zJauHyNJT3WuQZgg+d4JWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="42956108"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2024 21:03:04 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFnID-0000xG-38;
	Sat, 08 Jun 2024 04:03:01 +0000
Date: Sat, 8 Jun 2024 12:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4041/4582] mm/shmem.c:139:24: warning:
 'huge_anon_shmem_orders_lock' defined but not used
Message-ID: <202406081136.Uh4wFjpL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: f2445d38f2d03a0c27f48b6446eef354f9feb05e [4041/4582] mm: shmem: add multi-size THP sysfs interface for anonymous shmem
config: s390-randconfig-r112-20240228 (https://download.01.org/0day-ci/archive/20240608/202406081136.Uh4wFjpL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081136.Uh4wFjpL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081136.Uh4wFjpL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:89,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from mm/shmem.c:24:
>> mm/shmem.c:139:24: warning: 'huge_anon_shmem_orders_lock' defined but not used [-Wunused-variable]
     139 | static DEFINE_SPINLOCK(huge_anon_shmem_orders_lock);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:43:44: note: in definition of macro 'DEFINE_SPINLOCK'
      43 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   mm/shmem.c:138:22: warning: 'huge_anon_shmem_orders_within_size' defined but not used [-Wunused-variable]
     138 | static unsigned long huge_anon_shmem_orders_within_size __read_mostly;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:136:22: warning: 'huge_anon_shmem_orders_madvise' defined but not used [-Wunused-variable]
     136 | static unsigned long huge_anon_shmem_orders_madvise __read_mostly;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:135:22: warning: 'huge_anon_shmem_orders_always' defined but not used [-Wunused-variable]
     135 | static unsigned long huge_anon_shmem_orders_always __read_mostly;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/huge_anon_shmem_orders_lock +139 mm/shmem.c

   133	
   134	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
   135	static unsigned long huge_anon_shmem_orders_always __read_mostly;
   136	static unsigned long huge_anon_shmem_orders_madvise __read_mostly;
   137	static unsigned long huge_anon_shmem_orders_inherit __read_mostly;
   138	static unsigned long huge_anon_shmem_orders_within_size __read_mostly;
 > 139	static DEFINE_SPINLOCK(huge_anon_shmem_orders_lock);
   140	#endif
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
