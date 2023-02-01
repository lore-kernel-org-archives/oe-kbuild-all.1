Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05012F2E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675263512; x=1706799512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vfh2P525Cr1LT6D9QjpwZ5OOosa/26ksvn7VZdm+nDQ=;
  b=jMnmUciaJM6fCwiHfx3Yv2hZxTNBEBAH4yA4wfC7fpqiFtHzC1dLXPY6
   Ly99kq9VwaBjc0tnyVS37H+ySwXTepImUf+VkIJNgcIyU+44DEuv1d/f4
   qYpMPZ/RUzj9Ec/48DKMrWT2vRr/TZktI8JmbbI0y/kQ9xZV/bNBJx/EK
   7ZX9QdXq0SvbO0N4wCuHWY32/nlNv0uRcXGT6FYMMK8A2e2+trT4KSDz1
   Bm0rWSMYyRXaX5bW/8Y7AzBzU2/aCI3RYmJOjYR2EOhroPVsuKCtl8Zzy
   g78j4LInDoABUQRiWUBmLXO3kp6LUSD5eefzsV9zpTg9baHvepWLuq/lL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308502797"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="308502797"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 06:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="910343873"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="910343873"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2023 06:58:30 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNEZB-0005Vu-2U;
	Wed, 01 Feb 2023 14:58:29 +0000
Date: Wed, 1 Feb 2023 22:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
Message-ID: <202302012258.B0cc3Uv8-lkp@intel.com>
References: <20230201084832.1708866-1-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201084832.1708866-1-boris.brezillon@collabora.com>

Hi Boris,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc6 next-20230201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-pancsf-Add-a-new-driver-for-Mali-CSF-based-GPUs/20230201-172815
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230201084832.1708866-1-boris.brezillon%40collabora.com
patch subject: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302012258.B0cc3Uv8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/794ce1c0209242bf1496fc4195ca707d45b37e73
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Boris-Brezillon/drm-pancsf-Add-a-new-driver-for-Mali-CSF-based-GPUs/20230201-172815
        git checkout 794ce1c0209242bf1496fc4195ca707d45b37e73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/pancsf/pancsf_drv.c:65:5: warning: no previous prototype for 'pancsf_ioctl_vm_create' [-Wmissing-prototypes]
      65 | int pancsf_ioctl_vm_create(struct drm_device *ddev, void *data,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/pancsf/pancsf_drv.c:84:5: warning: no previous prototype for 'pancsf_ioctl_vm_destroy' [-Wmissing-prototypes]
      84 | int pancsf_ioctl_vm_destroy(struct drm_device *ddev, void *data,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/pancsf/pancsf_drv.c:258:1: warning: no previous prototype for 'pancsf_free_sync_signal_array' [-Wmissing-prototypes]
     258 | pancsf_free_sync_signal_array(struct pancsf_sync_signal_array *array)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/pancsf/pancsf_drv.c:273:1: warning: no previous prototype for 'pancsf_collect_sync_signal_array' [-Wmissing-prototypes]
     273 | pancsf_collect_sync_signal_array(struct drm_file *file,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_drv.c: In function 'pancsf_collect_sync_signal_array':
>> drivers/gpu/drm/pancsf/pancsf_drv.c:290:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     290 |                 int ret;
         |                     ^~~
--
   drivers/gpu/drm/pancsf/pancsf_gem.c: In function 'pancsf_gem_prime_import_sg_table':
>> drivers/gpu/drm/pancsf/pancsf_gem.c:153:35: warning: variable 'bo' set but not used [-Wunused-but-set-variable]
     153 |         struct pancsf_gem_object *bo;
         |                                   ^~
--
>> drivers/gpu/drm/pancsf/pancsf_mcu.c:248:1: warning: no previous prototype for 'pancsf_fw_mem_alloc' [-Wmissing-prototypes]
     248 | pancsf_fw_mem_alloc(struct pancsf_device *pfdev,
         | ^~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/pancsf/pancsf_mmu.c:394:5: warning: no previous prototype for 'pancsf_vm_unmap_pages' [-Wmissing-prototypes]
     394 | int pancsf_vm_unmap_pages(struct pancsf_vm *vm, u64 iova, size_t size)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_mmu.c: In function 'pancsf_vm_unmap_pages':
>> drivers/gpu/drm/pancsf/pancsf_mmu.c:399:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     399 |         int ret;
         |             ^~~
--
   drivers/gpu/drm/pancsf/pancsf_sched.c: In function 'pancsf_prog_csg_slot_locked':
>> drivers/gpu/drm/pancsf/pancsf_sched.c:608:46: warning: variable 'glb_iface' set but not used [-Wunused-but-set-variable]
     608 |         const struct pancsf_fw_global_iface *glb_iface;
         |                                              ^~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_sched.c: In function 'pancsf_handle_cs_fatal':
>> drivers/gpu/drm/pancsf/pancsf_sched.c:667:42: warning: variable 'csg_iface' set but not used [-Wunused-but-set-variable]
     667 |         const struct pancsf_fw_cs_iface *csg_iface;
         |                                          ^~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_sched.c: In function 'pancsf_handle_tiler_oom':
>> drivers/gpu/drm/pancsf/pancsf_sched.c:725:13: warning: variable 'info' set but not used [-Wunused-but-set-variable]
     725 |         u64 info, heap_address, new_chunk_va;
         |             ^~~~
>> drivers/gpu/drm/pancsf/pancsf_sched.c:723:13: warning: variable 'fault' set but not used [-Wunused-but-set-variable]
     723 |         u32 fault, vt_start, vt_end, frag_end;
         |             ^~~~~
>> drivers/gpu/drm/pancsf/pancsf_sched.c:722:30: warning: variable 'stream' set but not used [-Wunused-but-set-variable]
     722 |         struct pancsf_queue *stream;
         |                              ^~~~~~
   drivers/gpu/drm/pancsf/pancsf_sched.c: In function 'tick_ctx_init':
   drivers/gpu/drm/pancsf/pancsf_sched.c:1478:40: warning: variable 'glb_iface' set but not used [-Wunused-but-set-variable]
    1478 |         struct pancsf_fw_global_iface *glb_iface;
         |                                        ^~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_sched.c: In function 'tick_ctx_apply':
   drivers/gpu/drm/pancsf/pancsf_sched.c:1651:59: warning: variable 'csg_iface' set but not used [-Wunused-but-set-variable]
    1651 |                         const struct pancsf_fw_csg_iface *csg_iface;
         |                                                           ^~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_sched.c:1638:40: warning: variable 'glb_iface' set but not used [-Wunused-but-set-variable]
    1638 |         struct pancsf_fw_global_iface *glb_iface;
         |                                        ^~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_sched.c: In function 'pancsf_sched_pre_reset':
>> drivers/gpu/drm/pancsf/pancsf_sched.c:2153:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2153 |         int ret;
         |             ^~~
   drivers/gpu/drm/pancsf/pancsf_sched.c: In function 'pancsf_group_sync_upd_work':
>> drivers/gpu/drm/pancsf/pancsf_sched.c:2316:52: warning: variable 'fence' set but not used [-Wunused-but-set-variable]
    2316 |                         struct pancsf_queue_fence *fence;
         |                                                    ^~~~~


vim +/pancsf_ioctl_vm_create +65 drivers/gpu/drm/pancsf/pancsf_drv.c

    64	
  > 65	int pancsf_ioctl_vm_create(struct drm_device *ddev, void *data,
    66				   struct drm_file *file)
    67	{
    68		struct pancsf_device *pfdev = ddev->dev_private;
    69		struct pancsf_file *pfile = file->driver_priv;
    70		struct drm_pancsf_vm_create *args = data;
    71		int ret;
    72	
    73		if (args->flags & ~PANCSF_VM_CREATE_FLAGS)
    74			return -EINVAL;
    75	
    76		ret = pancsf_vm_pool_create_vm(pfdev, pfile->vms);
    77		if (ret < 0)
    78			return ret;
    79	
    80		args->id = ret;
    81		return 0;
    82	}
    83	
  > 84	int pancsf_ioctl_vm_destroy(struct drm_device *ddev, void *data,
    85				    struct drm_file *file)
    86	{
    87		struct pancsf_file *pfile = file->driver_priv;
    88		struct drm_pancsf_vm_destroy *args = data;
    89	
    90		pancsf_vm_pool_destroy_vm(pfile->vms, args->id);
    91		return 0;
    92	}
    93	
    94	#define PANCSF_BO_FLAGS		0
    95	
    96	static int pancsf_ioctl_bo_create(struct drm_device *ddev, void *data,
    97					  struct drm_file *file)
    98	{
    99		struct pancsf_gem_object *bo;
   100		struct drm_pancsf_bo_create *args = data;
   101	
   102		if (!args->size || args->pad ||
   103		    (args->flags & ~PANCSF_BO_FLAGS))
   104			return -EINVAL;
   105	
   106		bo = pancsf_gem_create_with_handle(file, ddev, args->size, args->flags,
   107						   &args->handle);
   108		if (IS_ERR(bo))
   109			return PTR_ERR(bo);
   110	
   111		return 0;
   112	}
   113	
   114	#define PANCSF_VMA_MAP_FLAGS (PANCSF_VMA_MAP_READONLY | \
   115				      PANCSF_VMA_MAP_NOEXEC | \
   116				      PANCSF_VMA_MAP_UNCACHED | \
   117				      PANCSF_VMA_MAP_FRAG_SHADER | \
   118				      PANCSF_VMA_MAP_ON_FAULT | \
   119				      PANCSF_VMA_MAP_AUTO_VA)
   120	
   121	static int pancsf_ioctl_vm_map(struct drm_device *ddev, void *data,
   122				       struct drm_file *file)
   123	{
   124		struct pancsf_file *pfile = file->driver_priv;
   125		struct drm_pancsf_vm_map *args = data;
   126		struct drm_gem_object *gem;
   127		struct pancsf_vm *vm;
   128		int ret;
   129	
   130		if (args->flags & ~PANCSF_VMA_MAP_FLAGS)
   131			return -EINVAL;
   132	
   133		gem = drm_gem_object_lookup(file, args->bo_handle);
   134		if (!gem)
   135			return -EINVAL;
   136	
   137		vm = pancsf_vm_pool_get_vm(pfile->vms, args->vm_id);
   138		if (vm) {
   139			ret = pancsf_vm_map_bo_range(vm, to_pancsf_bo(gem), args->bo_offset,
   140						     args->size, &args->va, args->flags);
   141		} else {
   142			ret = -EINVAL;
   143		}
   144	
   145		pancsf_vm_put(vm);
   146		drm_gem_object_put(gem);
   147		return ret;
   148	}
   149	
   150	#define PANCSF_VMA_UNMAP_FLAGS 0
   151	
   152	static int pancsf_ioctl_vm_unmap(struct drm_device *ddev, void *data,
   153					 struct drm_file *file)
   154	{
   155		struct pancsf_file *pfile = file->driver_priv;
   156		struct drm_pancsf_vm_unmap *args = data;
   157		struct pancsf_vm *vm;
   158		int ret;
   159	
   160		if (args->flags & ~PANCSF_VMA_UNMAP_FLAGS)
   161			return -EINVAL;
   162	
   163		vm = pancsf_vm_pool_get_vm(pfile->vms, args->vm_id);
   164		if (vm)
   165			ret = pancsf_vm_unmap_range(vm, args->va, args->size);
   166		else
   167			ret = -EINVAL;
   168	
   169		pancsf_vm_put(vm);
   170		return ret;
   171	}
   172	
   173	static void *pancsf_get_obj_array(struct drm_pancsf_obj_array *in, u32 min_stride)
   174	{
   175		u32 elem_size = min_t(u32, in->stride, min_stride);
   176		int ret = 0;
   177		void *out;
   178	
   179		if (in->stride < min_stride)
   180			return ERR_PTR(-EINVAL);
   181	
   182		out = kvmalloc_array(in->count, elem_size, GFP_KERNEL);
   183		if (!out)
   184			return ERR_PTR(-ENOMEM);
   185	
   186		if (elem_size == in->stride) {
   187			if (copy_from_user(out, u64_to_user_ptr(in->array), elem_size * in->count))
   188				ret = -EFAULT;
   189		} else {
   190			void __user *in_ptr = u64_to_user_ptr(in->array);
   191			void *out_ptr = out;
   192			u32 i;
   193	
   194			for (i = 0; i < in->count; i++) {
   195				if (copy_from_user(out_ptr, in_ptr, elem_size)) {
   196					ret = -EFAULT;
   197					break;
   198				}
   199			}
   200		}
   201	
   202		if (ret) {
   203			kvfree(out);
   204			return ERR_PTR(ret);
   205		}
   206	
   207		return out;
   208	}
   209	
   210	static int pancsf_add_job_deps(struct drm_file *file, struct pancsf_job *job,
   211				       struct drm_pancsf_sync_op *sync_ops, u32 sync_op_count)
   212	{
   213		u32 i;
   214	
   215		for (i = 0; i < sync_op_count; i++) {
   216			struct dma_fence *fence;
   217			int ret;
   218	
   219			if (sync_ops[i].op_type != DRM_PANCSF_SYNC_OP_WAIT)
   220				continue;
   221	
   222			switch (sync_ops[i].handle_type) {
   223			case DRM_PANCSF_SYNC_HANDLE_TYPE_SYNCOBJ:
   224			case DRM_PANCSF_SYNC_HANDLE_TYPE_TIMELINE_SYNCOBJ:
   225				ret = drm_syncobj_find_fence(file, sync_ops[i].handle,
   226							     sync_ops[i].timeline_value,
   227							     0, &fence);
   228				if (ret)
   229					return ret;
   230	
   231				ret = pancsf_add_job_dep(job, fence);
   232				if (ret) {
   233					dma_fence_put(fence);
   234					return ret;
   235				}
   236				break;
   237	
   238			default:
   239				return -EINVAL;
   240			}
   241		}
   242	
   243		return 0;
   244	}
   245	
   246	struct pancsf_sync_signal {
   247		struct drm_syncobj *syncobj;
   248		struct dma_fence_chain *chain;
   249		u64 point;
   250	};
   251	
   252	struct pancsf_sync_signal_array {
   253		struct pancsf_sync_signal *signals;
   254		u32 count;
   255	};
   256	
   257	void
 > 258	pancsf_free_sync_signal_array(struct pancsf_sync_signal_array *array)
   259	{
   260		u32 i;
   261	
   262		for (i = 0; i < array->count; i++) {
   263			drm_syncobj_put(array->signals[i].syncobj);
   264			dma_fence_chain_free(array->signals[i].chain);
   265		}
   266	
   267		kvfree(array->signals);
   268		array->signals = NULL;
   269		array->count = 0;
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
