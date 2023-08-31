Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A062D620
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 00:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693442501; x=1724978501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E0Kpa3glzmhOit+Gfb9EdvlhhILV82Bjg5COBTCvIV4=;
  b=Uyl1LU7TEk8BgN3lD2BRRl1nOR8Y8l3hUEetaIMm54j6KcLRv65tOYdl
   0CjT9l6Ifj9jTRVals1NzhRV7b/ps9Lss49AWkRESN7IFZBTFdrptXofP
   s+JIzDsFc/OnCPBQBRo8CEUAl4J1Yqt68k37SFGOsCSO9OvT9oIRC2OKE
   50oRpvUFRCRdQk6i+onkgTLIMxMvhftIc8TnJd3DuTTV5ZRB5NL479Nq5
   NcSeQjDWJJhqE8Z+vEYwkM1pbEUR0/MsOcGFz89Mi5dsSGLid0oVaBVPq
   tlQ12YPhFYk9gx77VXqRRBHXHDmvVptYh96vQNbDJ2MBLjYEFlbZg+H6m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="462160108"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="462160108"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 17:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774290764"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="774290764"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 17:41:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbVkd-000APv-0I;
	Thu, 31 Aug 2023 00:41:35 +0000
Date: Thu, 31 Aug 2023 08:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Ivan Babrou <ivan@cloudflare.com>, Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v3 4/4] mm: memcg: use non-unified stats flushing for
 userspace reads
Message-ID: <202308310858.19VshX68-lkp@intel.com>
References: <20230830175335.1536008-5-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830175335.1536008-5-yosryahmed@google.com>

Hi Yosry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20230830]
[cannot apply to v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/mm-memcg-properly-name-and-document-unified-stats-flushing/20230831-015518
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230830175335.1536008-5-yosryahmed%40google.com
patch subject: [PATCH v3 4/4] mm: memcg: use non-unified stats flushing for userspace reads
config: m68k-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310858.19VshX68-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310858.19VshX68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310858.19VshX68-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:667:6: warning: no previous prototype for 'mem_cgroup_user_flush_stats' [-Wmissing-prototypes]
     667 | void mem_cgroup_user_flush_stats(struct mem_cgroup *memcg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_user_flush_stats +667 mm/memcontrol.c

   658	
   659	/*
   660	 * mem_cgroup_user_flush_stats - do a stats flush for a user read
   661	 * @memcg: memory cgroup to flush
   662	 *
   663	 * Flush the subtree of @memcg. A mutex is used for userspace readers to gate
   664	 * the global rstat spinlock. This protects in-kernel flushers from userspace
   665	 * readers hogging the lock.
   666	 */
 > 667	void mem_cgroup_user_flush_stats(struct mem_cgroup *memcg)
   668	{
   669		mutex_lock(&stats_user_flush_mutex);
   670		do_stats_flush(memcg);
   671		mutex_unlock(&stats_user_flush_mutex);
   672	}
   673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
