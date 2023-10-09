Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B730347D0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 17:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvCtZyIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696872949; x=1728408949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZiAT15WEaLrOWcNCkW90U9bW7yk1LL1XE/0g9Rl6Foo=;
  b=dvCtZyIw9vQ2GutdU8gK/fNtt7IKCy+yFkQA8Q1D4/DMEBzR1UrwOhut
   L9JS4oF+LcqgwgshJ4OhuFMUGr82kCVZWzN5Bt0IlGlBMs07rK/yHTlDu
   gF+0i2EQCO9OJTO3kGJQVsYLr0h/VFDRL/bpBr6IsTYadLH0rfnCI2dza
   y6v1nPuc9eSe0E61CG2aqjY5en0JCl+GMSje3tVOntxO6qs4Eql8fhXnJ
   MGdxA4Rydd5HBXOrREv+dLw02a3kOixcQsdMqQcMqd3cIdaA5nbx6Rflo
   18Da/4N3B5raInVOOzEF1NzdOYihC6/ek5K09xV9rH0eHVoun8qySfASe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="5754866"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="5754866"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 10:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="729755857"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="729755857"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Oct 2023 10:35:46 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpuAQ-0000Rb-2P;
	Mon, 09 Oct 2023 17:35:43 +0000
Date: Tue, 10 Oct 2023 01:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slab-remove-slab-v1r0 19/22] mm/memcontrol.c:2888:5:
 warning: no previous prototype for 'memcg_alloc_slab_cgroups'
Message-ID: <202310100116.cPbzobgb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slab-remove-slab-v1r0
head:   7a5cf1bc55d1877eb85656dd530301fd55599feb
commit: 69d9aaa43fff253c195b3f53537855bcfa14939a [19/22] mm/slab: move memcg related functions from slab.h to slub.c
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231010/202310100116.cPbzobgb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100116.cPbzobgb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100116.cPbzobgb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:2888:5: warning: no previous prototype for 'memcg_alloc_slab_cgroups' [-Wmissing-prototypes]
    2888 | int memcg_alloc_slab_cgroups(struct slab *slab, struct kmem_cache *s,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:3163:6: warning: no previous prototype for 'mod_objcg_state' [-Wmissing-prototypes]
    3163 | void mod_objcg_state(struct obj_cgroup *objcg, struct pglist_data *pgdat,
         |      ^~~~~~~~~~~~~~~


vim +/memcg_alloc_slab_cgroups +2888 mm/memcontrol.c

a7ebf564de325e Waiman Long     2021-12-10  2887  
4b5f8d9a895ada Vlastimil Babka 2021-11-02 @2888  int memcg_alloc_slab_cgroups(struct slab *slab, struct kmem_cache *s,
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2889  				 gfp_t gfp, bool new_slab)
10befea91b61c4 Roman Gushchin  2020-08-06  2890  {
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2891  	unsigned int objects = objs_per_slab(s, slab);
2e9bd483159939 Roman Gushchin  2021-02-24  2892  	unsigned long memcg_data;
10befea91b61c4 Roman Gushchin  2020-08-06  2893  	void *vec;
10befea91b61c4 Roman Gushchin  2020-08-06  2894  
41eb5df1cbc9b3 Waiman Long     2021-06-28  2895  	gfp &= ~OBJCGS_CLEAR_MASK;
10befea91b61c4 Roman Gushchin  2020-08-06  2896  	vec = kcalloc_node(objects, sizeof(struct obj_cgroup *), gfp,
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2897  			   slab_nid(slab));
10befea91b61c4 Roman Gushchin  2020-08-06  2898  	if (!vec)
10befea91b61c4 Roman Gushchin  2020-08-06  2899  		return -ENOMEM;
10befea91b61c4 Roman Gushchin  2020-08-06  2900  
2e9bd483159939 Roman Gushchin  2021-02-24  2901  	memcg_data = (unsigned long) vec | MEMCG_DATA_OBJCGS;
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2902  	if (new_slab) {
2e9bd483159939 Roman Gushchin  2021-02-24  2903  		/*
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2904  		 * If the slab is brand new and nobody can yet access its
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2905  		 * memcg_data, no synchronization is required and memcg_data can
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2906  		 * be simply assigned.
2e9bd483159939 Roman Gushchin  2021-02-24  2907  		 */
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2908  		slab->memcg_data = memcg_data;
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2909  	} else if (cmpxchg(&slab->memcg_data, 0, memcg_data)) {
2e9bd483159939 Roman Gushchin  2021-02-24  2910  		/*
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2911  		 * If the slab is already in use, somebody can allocate and
4b5f8d9a895ada Vlastimil Babka 2021-11-02  2912  		 * assign obj_cgroups in parallel. In this case the existing
2e9bd483159939 Roman Gushchin  2021-02-24  2913  		 * objcg vector should be reused.
2e9bd483159939 Roman Gushchin  2021-02-24  2914  		 */
10befea91b61c4 Roman Gushchin  2020-08-06  2915  		kfree(vec);
2e9bd483159939 Roman Gushchin  2021-02-24  2916  		return 0;
2e9bd483159939 Roman Gushchin  2021-02-24  2917  	}
10befea91b61c4 Roman Gushchin  2020-08-06  2918  
2e9bd483159939 Roman Gushchin  2021-02-24  2919  	kmemleak_not_leak(vec);
10befea91b61c4 Roman Gushchin  2020-08-06  2920  	return 0;
10befea91b61c4 Roman Gushchin  2020-08-06  2921  }
10befea91b61c4 Roman Gushchin  2020-08-06  2922  

:::::: The code at line 2888 was first introduced by commit
:::::: 4b5f8d9a895ada8e0abb58ccd35d9fe229e3a595 mm/memcg: Convert slab objcgs from struct page to struct slab

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
