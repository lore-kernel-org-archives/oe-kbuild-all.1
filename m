Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AEB65B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 07:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695541648; x=1727077648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0ik+YCxlgmP/x/rD6BiR2eW4n/djre+KMygoN39oE14=;
  b=Yg6J4onICj3/tQ7sOlfKHS8XdKMlvonU54ZacxaBam3ED9Cp8LDxMvfZ
   wL1i4/9/K+pQotJbFX6B0X8/3M+cAcY71CE/ZGLc4nPC/ZQZbccd2+480
   /LELcVdDL4NBvftDC3AD+pHRnb7rpfRdnLHjwZS1l3qhL7ib85A9tfDPv
   +z3kRW7uightu8//jdjlfg2OO/jQffD540tLvkQiwNvAry76eAk3N4Pkm
   rhej0mheF97liHbQZXFjCFfCDiP5mNX1whpFepSUI0ObgmuY8CIHY003a
   /yRl3Tj4lJFuCRIgKzTtse3CYTN9NCABHL1sVWWJzvsAfyiheOgeOt/nt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="384913537"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="384913537"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 00:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="697655847"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="697655847"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Sep 2023 00:47:26 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkJpr-0003Lp-2w;
	Sun, 24 Sep 2023 07:47:23 +0000
Date: Sun, 24 Sep 2023 15:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 4/8] bpf: Add new kfuncs support for cgroup
 controller
Message-ID: <202309241550.JnHcYTZh-lkp@intel.com>
References: <20230922112846.4265-5-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922112846.4265-5-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Fix-missed-rcu-read-lock-in-bpf_task_under_cgroup/20230922-193148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230922112846.4265-5-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 4/8] bpf: Add new kfuncs support for cgroup controller
config: i386-randconfig-013-20230924 (https://download.01.org/0day-ci/archive/20230924/202309241550.JnHcYTZh-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241550.JnHcYTZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241550.JnHcYTZh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/helpers.c:1892:19: warning: no previous declaration for 'bpf_obj_new_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__ign)
                      ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1906:19: warning: no previous declaration for 'bpf_percpu_obj_new_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_percpu_obj_new_impl(u64 local_type_id__k, void *meta__ign)
                      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1934:18: warning: no previous declaration for 'bpf_obj_drop_impl' [-Wmissing-declarations]
    __bpf_kfunc void bpf_obj_drop_impl(void *p__alloc, void *meta__ign)
                     ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1942:18: warning: no previous declaration for 'bpf_percpu_obj_drop_impl' [-Wmissing-declarations]
    __bpf_kfunc void bpf_percpu_obj_drop_impl(void *p__alloc, void *meta__ign)
                     ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1948:19: warning: no previous declaration for 'bpf_refcount_acquire_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_refcount_acquire_impl(void *p__refcounted_kptr, void *meta__ign)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1993:17: warning: no previous declaration for 'bpf_list_push_front_impl' [-Wmissing-declarations]
    __bpf_kfunc int bpf_list_push_front_impl(struct bpf_list_head *head,
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2003:17: warning: no previous declaration for 'bpf_list_push_back_impl' [-Wmissing-declarations]
    __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2036:35: warning: no previous declaration for 'bpf_list_pop_front' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head)
                                      ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2041:35: warning: no previous declaration for 'bpf_list_pop_back' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
                                      ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2046:33: warning: no previous declaration for 'bpf_rbtree_remove' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_rb_node *bpf_rbtree_remove(struct bpf_rb_root *root,
                                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2102:17: warning: no previous declaration for 'bpf_rbtree_add_impl' [-Wmissing-declarations]
    __bpf_kfunc int bpf_rbtree_add_impl(struct bpf_rb_root *root, struct bpf_rb_node *node,
                    ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2112:33: warning: no previous declaration for 'bpf_rbtree_first' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_rb_node *bpf_rbtree_first(struct bpf_rb_root *root)
                                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2125:33: warning: no previous declaration for 'bpf_task_acquire' [-Wmissing-declarations]
    __bpf_kfunc struct task_struct *bpf_task_acquire(struct task_struct *p)
                                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2136:18: warning: no previous declaration for 'bpf_task_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_task_release(struct task_struct *p)
                     ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2148:28: warning: no previous declaration for 'bpf_cgroup_acquire' [-Wmissing-declarations]
    __bpf_kfunc struct cgroup *bpf_cgroup_acquire(struct cgroup *cgrp)
                               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2160:18: warning: no previous declaration for 'bpf_cgroup_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_cgroup_release(struct cgroup *cgrp)
                     ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2172:28: warning: no previous declaration for 'bpf_cgroup_ancestor' [-Wmissing-declarations]
    __bpf_kfunc struct cgroup *bpf_cgroup_ancestor(struct cgroup *cgrp, int level)
                               ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2192:28: warning: no previous declaration for 'bpf_cgroup_from_id' [-Wmissing-declarations]
    __bpf_kfunc struct cgroup *bpf_cgroup_from_id(u64 cgid)
                               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2212:18: warning: no previous declaration for 'bpf_task_under_cgroup' [-Wmissing-declarations]
    __bpf_kfunc long bpf_task_under_cgroup(struct task_struct *task,
                     ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:2229:17: warning: no previous declaration for 'bpf_cgroup_id_from_task_within_controller' [-Wmissing-declarations]
    __bpf_kfunc u64 bpf_cgroup_id_from_task_within_controller(struct task_struct *task, int ssid)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:2252:17: warning: no previous declaration for 'bpf_cgroup_ancestor_id_from_task_within_controller' [-Wmissing-declarations]
    __bpf_kfunc u64 bpf_cgroup_ancestor_id_from_task_within_controller(struct task_struct *task,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:2279:28: warning: no previous declaration for 'bpf_cgroup_acquire_from_id_within_controller' [-Wmissing-declarations]
    __bpf_kfunc struct cgroup *bpf_cgroup_acquire_from_id_within_controller(u64 cgid, int ssid)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2297:33: warning: no previous declaration for 'bpf_task_from_pid' [-Wmissing-declarations]
    __bpf_kfunc struct task_struct *bpf_task_from_pid(s32 pid)
                                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2338:19: warning: no previous declaration for 'bpf_dynptr_slice' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr, u32 offset,
                      ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2422:19: warning: no previous declaration for 'bpf_dynptr_slice_rdwr' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern *ptr, u32 offset,
                      ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2453:17: warning: no previous declaration for 'bpf_dynptr_adjust' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_adjust(struct bpf_dynptr_kern *ptr, u32 start, u32 end)
                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2471:18: warning: no previous declaration for 'bpf_dynptr_is_null' [-Wmissing-declarations]
    __bpf_kfunc bool bpf_dynptr_is_null(struct bpf_dynptr_kern *ptr)
                     ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2476:18: warning: no previous declaration for 'bpf_dynptr_is_rdonly' [-Wmissing-declarations]
    __bpf_kfunc bool bpf_dynptr_is_rdonly(struct bpf_dynptr_kern *ptr)
                     ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2484:19: warning: no previous declaration for 'bpf_dynptr_size' [-Wmissing-declarations]
    __bpf_kfunc __u32 bpf_dynptr_size(const struct bpf_dynptr_kern *ptr)
                      ^~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2492:17: warning: no previous declaration for 'bpf_dynptr_clone' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_clone(struct bpf_dynptr_kern *ptr,
                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2505:19: warning: no previous declaration for 'bpf_cast_to_kern_ctx' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_cast_to_kern_ctx(void *obj)
                      ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2510:19: warning: no previous declaration for 'bpf_rdonly_cast' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_rdonly_cast(void *obj__ign, u32 btf_id__k)
                      ^~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2515:18: warning: no previous declaration for 'bpf_rcu_read_lock' [-Wmissing-declarations]
    __bpf_kfunc void bpf_rcu_read_lock(void)
                     ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2520:18: warning: no previous declaration for 'bpf_rcu_read_unlock' [-Wmissing-declarations]
    __bpf_kfunc void bpf_rcu_read_unlock(void)
                     ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2549:18: warning: no previous declaration for 'bpf_throw' [-Wmissing-declarations]
    __bpf_kfunc void bpf_throw(u64 cookie)
                     ^~~~~~~~~


vim +/bpf_cgroup_id_from_task_within_controller +2229 kernel/bpf/helpers.c

  2222	
  2223	/**
  2224	 * bpf_cgroup_id_from_task_within_controller - To get the associated cgroup_id from
  2225	 * a task within a specific cgroup controller.
  2226	 * @task: The target task
  2227	 * @ssid: The id of cgroup controller, e.g. cpu_cgrp_id, memory_cgrp_id and etc.
  2228	 */
> 2229	__bpf_kfunc u64 bpf_cgroup_id_from_task_within_controller(struct task_struct *task, int ssid)
  2230	{
  2231		struct cgroup *cgroup;
  2232		int id = 0;
  2233	
  2234		rcu_read_lock();
  2235		cgroup = task_cgroup(task, ssid);
  2236		if (!cgroup)
  2237			goto out;
  2238		id = cgroup_id(cgroup);
  2239	
  2240	out:
  2241		rcu_read_unlock();
  2242		return id;
  2243	}
  2244	
  2245	/**
  2246	 * bpf_cgroup_id_from_task_within_controller - To get the associated cgroup_id from
  2247	 * a task within a specific cgroup controller.
  2248	 * @task: The target task
  2249	 * @ssid: The id of cgroup subsystem, e.g. cpu_cgrp_id, memory_cgrp_id and etc.
  2250	 * @level: The level of ancestor to look up
  2251	 */
> 2252	__bpf_kfunc u64 bpf_cgroup_ancestor_id_from_task_within_controller(struct task_struct *task,
  2253									   int ssid, int level)
  2254	{
  2255		struct cgroup *cgrp, *ancestor;
  2256		int id = 0;
  2257	
  2258		rcu_read_lock();
  2259		cgrp = task_cgroup(task, ssid);
  2260		if (!cgrp)
  2261			goto out;
  2262		ancestor = cgroup_ancestor(cgrp, level);
  2263		if (ancestor)
  2264			id = cgroup_id(ancestor);
  2265	
  2266	out:
  2267		rcu_read_unlock();
  2268		return id;
  2269	}
  2270	
  2271	/**
  2272	 * bpf_cgroup_acquire_from_id_within_controller - To acquire the cgroup from a
  2273	 * cgroup id within specific cgroup controller. A cgroup acquired by this kfunc
  2274	 * which is not stored in a map as a kptr, must be released by calling
  2275	 * bpf_cgroup_release().
  2276	 * @cgid: cgroup id
  2277	 * @ssid: The id of a cgroup controller, e.g. cpu_cgrp_id, memory_cgrp_id and etc.
  2278	 */
> 2279	__bpf_kfunc struct cgroup *bpf_cgroup_acquire_from_id_within_controller(u64 cgid, int ssid)
  2280	{
  2281		struct cgroup *cgrp;
  2282	
  2283		cgrp = cgroup_get_from_id_within_subsys(cgid, ssid);
  2284		if (IS_ERR(cgrp))
  2285			return NULL;
  2286		return cgrp;
  2287	}
  2288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
