Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4944C70
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 00:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723335918; cv=none; b=HRWA+2Sd+PpHj5730U7FRY5Ruft+4tOcXuL/nFyw/Br7acCyTn/ttXgph+RlS7r2AVJtw32a6By5qLzBmsgTh1wzAHTpFYky5mNIogU88t8TBiyfieSfAfjCTm0MuAZYm/df2wjmYRUtBQvW4iGu/neva1eOnRVFh0+Yj3W6kTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723335918; c=relaxed/simple;
	bh=o7RmPNx3Bf0Kwewtid7bEfBIrffa3nM4BHtIS0CXDjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4lJ5PyNoOOjM0nJFLygAZyHq8vZHGxpyOBP8Kz8vu9+PA5a2XxNtBt9wRRq9Zs3V+o+lQdnJwmdugpODMbonE038vlpTwCe/y3vhUfSmVELotvU646hEeDB8+sc0qrzH5/+SPIZLYqZ1GQ8+TbJANfqJWYZKydJybepTGV9Nu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgzQR5H+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgzQR5H+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723335916; x=1754871916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o7RmPNx3Bf0Kwewtid7bEfBIrffa3nM4BHtIS0CXDjE=;
  b=VgzQR5H+HaXdqYp5sZpIZJSG/mrkr+LPZ1xPIKnMZytPnoL9V8+6GQAq
   yYSwnzYO+e0INn7zhbVEsQxJRznXxiLjMlFFBkP3RXJqa8gibGUkr4ZJi
   vP1/o/b2v0iayQA7nl0p9aZx25u/L3TRZD4mxqXixPvRcQVtPA3DPf5UP
   DePiAdkqXd2Ekz7qFxucQShEGepEw3bibXYgNCDWOE2jmB7/gldCPJFrf
   NfHtwfwrM7IWDSDND1jIgFCZ++DVr+P8oLlchTVPLo+W3IHipOinQF26B
   87P1norpvex7UlGwiGccPph2WNZYdE36Osz6qMPfWTeIYs5YwsjpleOvG
   Q==;
X-CSE-ConnectionGUID: 8qjImE1oSUW/P88AhmSuSg==
X-CSE-MsgGUID: +sGKP1nvSkK6JCOqxUUmeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21138218"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21138218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 17:25:14 -0700
X-CSE-ConnectionGUID: AfPSwT8JSjaRwfHDOjhwog==
X-CSE-MsgGUID: 2F+0FdTHTnuBbOci4nll5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="58610148"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Aug 2024 17:25:13 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scwOU-000AQK-25;
	Sun, 11 Aug 2024 00:25:10 +0000
Date: Sun, 11 Aug 2024 08:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kaiyang Zhao <kaiyang2@cs.cmu.edu>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 216/222] mm/memcontrol.c:993: warning: Function
 parameter or struct member 'folio' not described in
 'get_mem_cgroup_from_folio'
Message-ID: <202408110848.pqaWv5zD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   7d7894afcca68b40bfca49f4d1303167d224919e
commit: 24f8717a5d0bedc9664cf242b14a31c18f9351a6 [216/222] mm,memcg: provide per-cgroup counters for NUMA balancing operations
config: arc-randconfig-002-20240811 (https://download.01.org/0day-ci/archive/20240811/202408110848.pqaWv5zD-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110848.pqaWv5zD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110848.pqaWv5zD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:993: warning: Function parameter or struct member 'folio' not described in 'get_mem_cgroup_from_folio'


vim +993 mm/memcontrol.c

   988	
   989	/**
   990	 * get_mem_cgroup_from_folio - Obtain a reference on a given folio's memcg.
   991	 */
   992	struct mem_cgroup *get_mem_cgroup_from_folio(struct folio *folio)
 > 993	{
   994		struct mem_cgroup *memcg = folio_memcg(folio);
   995	
   996		if (mem_cgroup_disabled())
   997			return NULL;
   998	
   999		rcu_read_lock();
  1000		if (!memcg || WARN_ON_ONCE(!css_tryget(&memcg->css)))
  1001			memcg = root_mem_cgroup;
  1002		rcu_read_unlock();
  1003		return memcg;
  1004	}
  1005	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
