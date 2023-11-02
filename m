Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3330520F9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFKwRl+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698914616; x=1730450616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0zXP3MG1ZlKyeU8SgqJgM6hm/lfNhFbzbZ2ypMpAh9Y=;
  b=jFKwRl+csegJH39y6Te79NtRj69mAUQNuDKlxakr2FXs5y/yfiEar+pt
   58QwVJ1PvCBVy2EIIhIAuAyhMVZQikki+/VGwSUrmMcEOr0VcvhL8wsOQ
   1QZfIdS5xV1TiGrveH/Nu3B1DSywVkFLZfr6xXXNIPjZoEEIva3NSe8+t
   I81jIb7Wv9Lh52ap2iiqqzchUX9W5N441dNY+0wkizNdqBKAmB9c/VUQa
   OLZLBSNn7jvmgRN35XaM/9/+ijZPJhO12/9LVg0bvsvP+5ErfLzkapn2u
   A8aH6e4raXco3migY+M+jrrgxldJ/aIQIjEhOcsxYQXHqg4TOuts0jmB+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="388483982"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="388483982"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 01:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="711071716"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="711071716"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 01:43:29 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyTIV-0001Hd-0C;
	Thu, 02 Nov 2023 08:43:27 +0000
Date: Thu, 2 Nov 2023 16:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/helpers.c:1905:19: warning: no previous declaration for
 'bpf_percpu_obj_new_impl'
Message-ID: <202311021613.I5dZri9c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yonghong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
commit: 36d8bdf75a93190e5669b9d1d95994e13e15ba1d bpf: Add alloc/xchg/direct_access support for local percpu kptr
date:   8 weeks ago
config: x86_64-buildonly-randconfig-006-20231102 (https://download.01.org/0day-ci/archive/20231102/202311021613.I5dZri9c-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021613.I5dZri9c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021613.I5dZri9c-lkp@intel.com/

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
