Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D663D74E09
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 00:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744418558; cv=none; b=nc0cGOLaLG06AeHfR5pPf9d7SmmV3jzsOBh9QMCuOWf0brwrYvqyBrEOTrm42fn0rvT1n2yDKnrBg6ZntWWSHwkkYaqfWAIeefn+mCPJep1de/34tFNvaETQ76V1hnwtfd9E1h8BVehS/klV5wJNyO/ww4Hb/mJE+xWR4PXB7Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744418558; c=relaxed/simple;
	bh=clE7tfJnOsuGRcGxBQ6UC5rYbH3WhSBNaV8khQ1Nx18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T06Lmzvor3GXv5vAKT0H9vSv2R/2tbZAktuDnmD/BZWCAS4VcTlUuWwzHiSXewS1Usb7PXk7leqYlBO5jw3ISWTr/PdlM73vhBAX028zqdHMLc7XuwPCiLMVP9CjIvV17SilnYQfM/WXK6IG0DijOWQsmvmu/0b+J4BZsvydNLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mj38IwUA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mj38IwUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744418556; x=1775954556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=clE7tfJnOsuGRcGxBQ6UC5rYbH3WhSBNaV8khQ1Nx18=;
  b=Mj38IwUABbQ7piqzvmWDYkDZnWdOfuDD27TOvQ7cShcmtMxACbemhIYH
   zd1NDL0dV0J+7A63sttxqYrZsYp7F9mVSa8+pMqNP3Jbr8pAKna7MlcaU
   3qeoERj325Fvf0oPSd6cEzr64v3XV1u9dIziFyvXmzWt5M6bbzMHKc8+b
   VE2tnQh/1IoJd1TGqi8mhH5FOxxFKbG8kjh1GL6HYfM+6flc+lNsGEOkV
   CPCZVzuQb8RyM09Ax0+A6DvajxOw9EG5F+rtBnFNASH440Nbpa4Ia4TRC
   wF+7gKNKYXZNoydrLIDgoN3vlbSqah3GAdseaRmPOuvC+bRRW4ha3JHFb
   w==;
X-CSE-ConnectionGUID: tfw9iXEKRKmKGYEH00l2ZQ==
X-CSE-MsgGUID: MkQ0E7fERDOKUJsgC3Y5CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="68468231"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="68468231"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 17:42:12 -0700
X-CSE-ConnectionGUID: b4xdveIjSFm1WdnIxgsJ+A==
X-CSE-MsgGUID: AOVtdZX+RImGmpZ7sAy2fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129094266"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2025 17:42:11 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Owi-000BT4-2N;
	Sat, 12 Apr 2025 00:42:08 +0000
Date: Sat, 12 Apr 2025 08:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/4] cgroup: Add bpf prog revisions to
 struct cgroup_bpf
Message-ID: <202504120853.I4bFTHhG-lkp@intel.com>
References: <20250411011528.1839359-1-yonghong.song@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411011528.1839359-1-yonghong.song@linux.dev>

Hi Yonghong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/cgroup-Add-bpf-prog-revisions-to-struct-cgroup_bpf/20250411-091743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250411011528.1839359-1-yonghong.song%40linux.dev
patch subject: [RFC PATCH bpf-next 1/4] cgroup: Add bpf prog revisions to struct cgroup_bpf
config: x86_64-buildonly-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120853.I4bFTHhG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120853.I4bFTHhG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120853.I4bFTHhG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:16,
                    from include/linux/cpumask.h:11,
                    from arch/x86/include/asm/tlbbatch.h:5,
                    from include/linux/mm_types_task.h:17,
                    from include/linux/sched.h:38,
                    from include/linux/cgroup.h:12,
                    from kernel/cgroup/cgroup-internal.h:5,
                    from kernel/cgroup/cgroup.c:31:
   kernel/cgroup/cgroup.c: In function 'init_cgroup_housekeeping':
>> kernel/cgroup/cgroup.c:2074:45: error: 'struct cgroup_bpf' has no member named 'revisions'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                                             ^
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
>> kernel/cgroup/cgroup.c:2074:45: error: 'struct cgroup_bpf' has no member named 'revisions'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                                             ^
   include/linux/array_size.h:11:48: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                ^~~
   In file included from include/linux/build_bug.h:5,
                    from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12:
>> kernel/cgroup/cgroup.c:2074:45: error: 'struct cgroup_bpf' has no member named 'revisions'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                                             ^
   include/linux/compiler.h:197:79: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                               ^
   include/linux/compiler.h:201:35: note: in expansion of macro '__same_type'
     201 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                   ^~~~~~~~~~~
   include/linux/compiler.h:202:58: note: in expansion of macro '__is_array'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                                          ^~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   kernel/cgroup/cgroup.c:2074:25: note: in expansion of macro 'ARRAY_SIZE'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                         ^~~~~~~~~~
>> kernel/cgroup/cgroup.c:2074:45: error: 'struct cgroup_bpf' has no member named 'revisions'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                                             ^
   include/linux/compiler.h:197:79: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                               ^
   include/linux/compiler.h:201:35: note: in expansion of macro '__same_type'
     201 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                   ^~~~~~~~~~~
   include/linux/compiler.h:202:58: note: in expansion of macro '__is_array'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                                          ^~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   kernel/cgroup/cgroup.c:2074:25: note: in expansion of macro 'ARRAY_SIZE'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                         ^~~~~~~~~~
   include/linux/compiler.h:197:77: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   kernel/cgroup/cgroup.c:2074:25: note: in expansion of macro 'ARRAY_SIZE'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                         ^~~~~~~~~~
   kernel/cgroup/cgroup.c:2075:40: error: 'struct cgroup_bpf' has no member named 'revisions'
    2075 |                 atomic64_set(&cgrp->bpf.revisions[i], 1);
         |                                        ^


vim +2074 kernel/cgroup/cgroup.c

  2052	
  2053	static void init_cgroup_housekeeping(struct cgroup *cgrp)
  2054	{
  2055		struct cgroup_subsys *ss;
  2056		int i, ssid;
  2057	
  2058		INIT_LIST_HEAD(&cgrp->self.sibling);
  2059		INIT_LIST_HEAD(&cgrp->self.children);
  2060		INIT_LIST_HEAD(&cgrp->cset_links);
  2061		INIT_LIST_HEAD(&cgrp->pidlists);
  2062		mutex_init(&cgrp->pidlist_mutex);
  2063		cgrp->self.cgroup = cgrp;
  2064		cgrp->self.flags |= CSS_ONLINE;
  2065		cgrp->dom_cgrp = cgrp;
  2066		cgrp->max_descendants = INT_MAX;
  2067		cgrp->max_depth = INT_MAX;
  2068		INIT_LIST_HEAD(&cgrp->rstat_css_list);
  2069		prev_cputime_init(&cgrp->prev_cputime);
  2070	
  2071		for_each_subsys(ss, ssid)
  2072			INIT_LIST_HEAD(&cgrp->e_csets[ssid]);
  2073	
> 2074		for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
  2075			atomic64_set(&cgrp->bpf.revisions[i], 1);
  2076	
  2077		init_waitqueue_head(&cgrp->offline_waitq);
  2078		INIT_WORK(&cgrp->release_agent_work, cgroup1_release_agent);
  2079	}
  2080	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
