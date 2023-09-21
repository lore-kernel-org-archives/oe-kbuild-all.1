Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5F7199B1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695310400; x=1726846400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLmJaqq50BNr8vEwm9l8LfI2IqYuFYV9qSikPkLfeXg=;
  b=VTlmXxjkJHTvGyVyvOwe4rw85ub0FrnEtNgbQXeI34h149B8G68AU5ui
   96T5MYHj5t4KxEVpZdJwGqRliiZkes6yStXN0hvEVbEGhtQlzzqe53viB
   RiTnG9WdhPtUJ7rNzOLvJJUXszJR+JUL3PEWmKjzwV8zJKPALQCZokLrX
   r0BeaB7cS2dRABJ3+c1kGwV0CjWzimI/qidZ/GdZ+HxdWZUQtFwFkm6hc
   tj64HVaCAhc9jIJAwK8Jf/+NeBT+/NRnlMSaYy01ENwB03EXinsW5xuMY
   L9OUAYVeAvgcUFoxV7vcar5XSnRKiZsEhNgsFug2cWYjWn11zJEqE5cwb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="377849583"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="377849583"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 08:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="890415106"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="890415106"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2023 08:32:13 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjLfr-000069-0f;
	Thu, 21 Sep 2023 15:33:03 +0000
Date: Thu, 21 Sep 2023 23:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 5197/6975] kernel/bpf/helpers.c:2476:18: warning:
 no previous declaration for 'bpf_throw'
Message-ID: <202309212339.hxhBu2F1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: f18b03fabaa9b7c80e80b72a621f481f0d706ae0 [5197/6975] bpf: Implement BPF exceptions
config: i386-randconfig-006-20230921 (https://download.01.org/0day-ci/archive/20230921/202309212339.hxhBu2F1-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309212339.hxhBu2F1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309212339.hxhBu2F1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/helpers.c:1891:19: warning: no previous declaration for 'bpf_obj_new_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__ign)
                      ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1905:19: warning: no previous declaration for 'bpf_percpu_obj_new_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_percpu_obj_new_impl(u64 local_type_id__k, void *meta__ign)
                      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1933:18: warning: no previous declaration for 'bpf_obj_drop_impl' [-Wmissing-declarations]
    __bpf_kfunc void bpf_obj_drop_impl(void *p__alloc, void *meta__ign)
                     ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1941:18: warning: no previous declaration for 'bpf_percpu_obj_drop_impl' [-Wmissing-declarations]
    __bpf_kfunc void bpf_percpu_obj_drop_impl(void *p__alloc, void *meta__ign)
                     ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1947:19: warning: no previous declaration for 'bpf_refcount_acquire_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_refcount_acquire_impl(void *p__refcounted_kptr, void *meta__ign)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1992:17: warning: no previous declaration for 'bpf_list_push_front_impl' [-Wmissing-declarations]
    __bpf_kfunc int bpf_list_push_front_impl(struct bpf_list_head *head,
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2002:17: warning: no previous declaration for 'bpf_list_push_back_impl' [-Wmissing-declarations]
    __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2035:35: warning: no previous declaration for 'bpf_list_pop_front' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head)
                                      ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2040:35: warning: no previous declaration for 'bpf_list_pop_back' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
                                      ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2045:33: warning: no previous declaration for 'bpf_rbtree_remove' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_rb_node *bpf_rbtree_remove(struct bpf_rb_root *root,
                                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2101:17: warning: no previous declaration for 'bpf_rbtree_add_impl' [-Wmissing-declarations]
    __bpf_kfunc int bpf_rbtree_add_impl(struct bpf_rb_root *root, struct bpf_rb_node *node,
                    ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2111:33: warning: no previous declaration for 'bpf_rbtree_first' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_rb_node *bpf_rbtree_first(struct bpf_rb_root *root)
                                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2124:33: warning: no previous declaration for 'bpf_task_acquire' [-Wmissing-declarations]
    __bpf_kfunc struct task_struct *bpf_task_acquire(struct task_struct *p)
                                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2135:18: warning: no previous declaration for 'bpf_task_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_task_release(struct task_struct *p)
                     ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2147:28: warning: no previous declaration for 'bpf_cgroup_acquire' [-Wmissing-declarations]
    __bpf_kfunc struct cgroup *bpf_cgroup_acquire(struct cgroup *cgrp)
                               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2159:18: warning: no previous declaration for 'bpf_cgroup_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_cgroup_release(struct cgroup *cgrp)
                     ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2171:28: warning: no previous declaration for 'bpf_cgroup_ancestor' [-Wmissing-declarations]
    __bpf_kfunc struct cgroup *bpf_cgroup_ancestor(struct cgroup *cgrp, int level)
                               ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2191:28: warning: no previous declaration for 'bpf_cgroup_from_id' [-Wmissing-declarations]
    __bpf_kfunc struct cgroup *bpf_cgroup_from_id(u64 cgid)
                               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2211:18: warning: no previous declaration for 'bpf_task_under_cgroup' [-Wmissing-declarations]
    __bpf_kfunc long bpf_task_under_cgroup(struct task_struct *task,
                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2224:33: warning: no previous declaration for 'bpf_task_from_pid' [-Wmissing-declarations]
    __bpf_kfunc struct task_struct *bpf_task_from_pid(s32 pid)
                                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2265:19: warning: no previous declaration for 'bpf_dynptr_slice' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr, u32 offset,
                      ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2349:19: warning: no previous declaration for 'bpf_dynptr_slice_rdwr' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern *ptr, u32 offset,
                      ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2380:17: warning: no previous declaration for 'bpf_dynptr_adjust' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_adjust(struct bpf_dynptr_kern *ptr, u32 start, u32 end)
                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2398:18: warning: no previous declaration for 'bpf_dynptr_is_null' [-Wmissing-declarations]
    __bpf_kfunc bool bpf_dynptr_is_null(struct bpf_dynptr_kern *ptr)
                     ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2403:18: warning: no previous declaration for 'bpf_dynptr_is_rdonly' [-Wmissing-declarations]
    __bpf_kfunc bool bpf_dynptr_is_rdonly(struct bpf_dynptr_kern *ptr)
                     ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2411:19: warning: no previous declaration for 'bpf_dynptr_size' [-Wmissing-declarations]
    __bpf_kfunc __u32 bpf_dynptr_size(const struct bpf_dynptr_kern *ptr)
                      ^~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2419:17: warning: no previous declaration for 'bpf_dynptr_clone' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_clone(struct bpf_dynptr_kern *ptr,
                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2432:19: warning: no previous declaration for 'bpf_cast_to_kern_ctx' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_cast_to_kern_ctx(void *obj)
                      ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2437:19: warning: no previous declaration for 'bpf_rdonly_cast' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_rdonly_cast(void *obj__ign, u32 btf_id__k)
                      ^~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2442:18: warning: no previous declaration for 'bpf_rcu_read_lock' [-Wmissing-declarations]
    __bpf_kfunc void bpf_rcu_read_lock(void)
                     ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2447:18: warning: no previous declaration for 'bpf_rcu_read_unlock' [-Wmissing-declarations]
    __bpf_kfunc void bpf_rcu_read_unlock(void)
                     ^~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:2476:18: warning: no previous declaration for 'bpf_throw' [-Wmissing-declarations]
    __bpf_kfunc void bpf_throw(u64 cookie)
                     ^~~~~~~~~


vim +/bpf_throw +2476 kernel/bpf/helpers.c

  2475	
> 2476	__bpf_kfunc void bpf_throw(u64 cookie)
  2477	{
  2478		struct bpf_throw_ctx ctx = {};
  2479	
  2480		arch_bpf_stack_walk(bpf_stack_walker, &ctx);
  2481		WARN_ON_ONCE(!ctx.aux);
  2482		if (ctx.aux)
  2483			WARN_ON_ONCE(!ctx.aux->exception_boundary);
  2484		WARN_ON_ONCE(!ctx.bp);
  2485		WARN_ON_ONCE(!ctx.cnt);
  2486		ctx.aux->bpf_exception_cb(cookie, ctx.sp, ctx.bp);
  2487	}
  2488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
