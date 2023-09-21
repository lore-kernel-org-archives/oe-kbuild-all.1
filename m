Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFB6B67E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695305655; x=1726841655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGue40o4U9XLXeZyUUXrSKklR9YX094UPtfH6kQfwIY=;
  b=kcZQQiUbqkjbGSXnZNlc+gnQ4L21mgM1fDApmSx817SeRrny1GYvG1Oq
   FuSYfYTopNV+OAI4bYt6yfYfEgwMylCV6VOcKf5EjkgbXWQCQclVl460l
   psZrX7o1U3+jsjZa8EeutZySa6bYZH+iSykAsQPszEof0bYXJLk+GR4S5
   Lnl1G0F0RqQdRNbL4rElb1PhYaSR3+BIkq69Myb31F6OUZmTZzxvk8oOJ
   Jm0EfVoZno4ERIvkKGPW1ULVSaOIjDx64zCmJ0Kw9kszvTOwRr7cbVULp
   EuOKDwY4K5lWULbO3vobiK4D04sZcKLXwIwGhpwS5I6/BbI+wZfTS2Tna
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383282431"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="383282431"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 07:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="1077900186"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="1077900186"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2023 07:09:18 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjKMm-00001k-1W;
	Thu, 21 Sep 2023 14:09:16 +0000
Date: Thu, 21 Sep 2023 22:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 909/6975] kernel/bpf/helpers.c:1905:19: warning:
 no previous declaration for 'bpf_percpu_obj_new_impl'
Message-ID: <202309212121.cul1pTRa-lkp@intel.com>
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
commit: 36d8bdf75a93190e5669b9d1d95994e13e15ba1d [909/6975] bpf: Add alloc/xchg/direct_access support for local percpu kptr
config: i386-randconfig-006-20230921 (https://download.01.org/0day-ci/archive/20230921/202309212121.cul1pTRa-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309212121.cul1pTRa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309212121.cul1pTRa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/helpers.c:1891:19: warning: no previous declaration for 'bpf_obj_new_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__ign)
                      ^~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:1905:19: warning: no previous declaration for 'bpf_percpu_obj_new_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_percpu_obj_new_impl(u64 local_type_id__k, void *meta__ign)
                      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1933:18: warning: no previous declaration for 'bpf_obj_drop_impl' [-Wmissing-declarations]
    __bpf_kfunc void bpf_obj_drop_impl(void *p__alloc, void *meta__ign)
                     ^~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:1941:18: warning: no previous declaration for 'bpf_percpu_obj_drop_impl' [-Wmissing-declarations]
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


vim +/bpf_percpu_obj_new_impl +1905 kernel/bpf/helpers.c

  1904	
> 1905	__bpf_kfunc void *bpf_percpu_obj_new_impl(u64 local_type_id__k, void *meta__ign)
  1906	{
  1907		u64 size = local_type_id__k;
  1908	
  1909		/* The verifier has ensured that meta__ign must be NULL */
  1910		return bpf_mem_alloc(&bpf_global_percpu_ma, size);
  1911	}
  1912	
  1913	/* Must be called under migrate_disable(), as required by bpf_mem_free */
  1914	void __bpf_obj_drop_impl(void *p, const struct btf_record *rec)
  1915	{
  1916		if (rec && rec->refcount_off >= 0 &&
  1917		    !refcount_dec_and_test((refcount_t *)(p + rec->refcount_off))) {
  1918			/* Object is refcounted and refcount_dec didn't result in 0
  1919			 * refcount. Return without freeing the object
  1920			 */
  1921			return;
  1922		}
  1923	
  1924		if (rec)
  1925			bpf_obj_free_fields(rec, p);
  1926	
  1927		if (rec && rec->refcount_off >= 0)
  1928			bpf_mem_free_rcu(&bpf_global_ma, p);
  1929		else
  1930			bpf_mem_free(&bpf_global_ma, p);
  1931	}
  1932	
  1933	__bpf_kfunc void bpf_obj_drop_impl(void *p__alloc, void *meta__ign)
  1934	{
  1935		struct btf_struct_meta *meta = meta__ign;
  1936		void *p = p__alloc;
  1937	
  1938		__bpf_obj_drop_impl(p, meta ? meta->record : NULL);
  1939	}
  1940	
> 1941	__bpf_kfunc void bpf_percpu_obj_drop_impl(void *p__alloc, void *meta__ign)
  1942	{
  1943		/* The verifier has ensured that meta__ign must be NULL */
  1944		bpf_mem_free_rcu(&bpf_global_percpu_ma, p__alloc);
  1945	}
  1946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
