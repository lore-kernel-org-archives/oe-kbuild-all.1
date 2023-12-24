Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C799EBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 04:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/XdyUeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703392591; x=1734928591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A1WNGswRC8pSs8gACX4U78wmyY9ALn3nSkeNWNrPn+A=;
  b=I/XdyUeWr0uA1hVBYZ2e/qypwFcmLXm0mpgZbV5KQLY+VA4hOS/xFbD7
   UmWmlpNoSa3AuZdgmGGpXemfOR9AmMdrNgqCQznR7FnIN8DD/ec8KyvfX
   y7vMWa16j+jSmbdZ/2IIfWlZJC68A+yXaZ3LlVQHxchrbdjxS3DAKNnqd
   W3K3miH+VZtLYgGaWoRoc0ZZfzXn/7+bdvNnNX1mg2YQrN7oo66o2QZjA
   2T3aKp+Gb2s2aVCSgNhqdKaEZju66Uc5M2fJQO6g3FQIMRQx4MAzsA12m
   scPpYNSnDxMHJxmPjTYfkIkUrTTSkZkbAVSRt94Nqad+6nzHSLybJ0r34
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="395112767"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="395112767"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2023 20:36:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="950709647"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="950709647"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 23 Dec 2023 20:36:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHGDN-000BqX-0U;
	Sun, 24 Dec 2023 04:36:06 +0000
Date: Sun, 24 Dec 2023 12:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: include/trace/../../drivers/gpu/drm/xe/xe_trace.h:35:42: warning:
 cast from pointer to integer of different size
Message-ID: <202312241228.8NJFlChe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git new
head:   f30cae3de3b138849010f4e54d8800eb1cc080b9
commit: ea1dfd1fe8933f85ee3a2b3d6ad6b378d5b1a468 drm/xe: Introduce a new DRM driver for Intel GPUs
date:   10 weeks ago
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231224/202312241228.8NJFlChe-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312241228.8NJFlChe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312241228.8NJFlChe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_mmio.c:6:
   drivers/gpu/drm/xe/xe_mmio.h: In function 'xe_mmio_write64':
   drivers/gpu/drm/xe/xe_mmio.h:69:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
      69 |         writeq(val, gt->mmio.regs + reg);
         |         ^~~~~~
         |         writel
   drivers/gpu/drm/xe/xe_mmio.h: In function 'xe_mmio_read64':
   drivers/gpu/drm/xe/xe_mmio.h:77:16: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
      77 |         return readq(gt->mmio.regs + reg);
         |                ^~~~~
         |                readl
   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:32,
                    from include/drm/drm_mm.h:51,
                    from include/drm/drm_suballoc.h:9,
                    from drivers/gpu/drm/xe/xe_sa_types.h:8,
                    from drivers/gpu/drm/xe/xe_gt_types.h:13,
                    from drivers/gpu/drm/xe/xe_mmio.h:11:
   drivers/gpu/drm/xe/xe_mmio.c: In function 'xe_mmio_probe_vram':
>> include/drm/drm_print.h:456:39: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |                                       ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_warn'
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:466:9: note: in expansion of macro '__drm_printk'
     466 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_mmio.c:226:17: note: in expansion of macro 'drm_warn'
     226 |                 drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
         |                 ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/trace/define_trace.h:102,
                    from drivers/gpu/drm/xe/xe_trace.h:512,
                    from drivers/gpu/drm/xe/xe_trace.c:8:
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'trace_raw_output_xe_bo':
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:38:31: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      38 |                     TP_printk("size=%ld, flags=0x%02x, vm=0x%016llx",
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:38:21: note: in expansion of macro 'TP_printk'
      38 |                     TP_printk("size=%ld, flags=0x%02x, vm=0x%016llx",
         |                     ^~~~~~~~~
   In file included from include/trace/trace_events.h:237:
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:38:39: note: format string is defined here
      38 |                     TP_printk("size=%ld, flags=0x%02x, vm=0x%016llx",
         |                                     ~~^
         |                                       |
         |                                       long int
         |                                     %d
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'trace_event_raw_event_xe_bo':
>> include/trace/../../drivers/gpu/drm/xe/xe_trace.h:35:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      35 |                            __entry->vm = (u64)bo->vm;
         |                                          ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:32:21: note: in expansion of macro 'TP_fast_assign'
      32 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'trace_event_raw_event_xe_sched_job':
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:188:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     188 |                            __entry->fence = (u64)job->fence;
         |                                             ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:181:21: note: in expansion of macro 'TP_fast_assign'
     181 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'trace_event_raw_event_xe_hw_fence':
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:275:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     275 |                            __entry->fence = (u64)fence;
         |                                             ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:272:21: note: in expansion of macro 'TP_fast_assign'
     272 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'trace_event_raw_event_xe_vma':
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:315:43: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     315 |                            __entry->vma = (u64)vma;
         |                                           ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:314:21: note: in expansion of macro 'TP_fast_assign'
     314 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'trace_event_raw_event_xe_vm':
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:412:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     412 |                            __entry->vm = (u64)vm;
         |                                          ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:411:21: note: in expansion of macro 'TP_fast_assign'
     411 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~


vim +35 include/trace/../../drivers/gpu/drm/xe/xe_trace.h

    21	
    22	DECLARE_EVENT_CLASS(xe_bo,
    23			    TP_PROTO(struct xe_bo *bo),
    24			    TP_ARGS(bo),
    25	
    26			    TP_STRUCT__entry(
    27				     __field(size_t, size)
    28				     __field(u32, flags)
    29				     __field(u64, vm)
    30				     ),
    31	
    32			    TP_fast_assign(
    33				   __entry->size = bo->size;
    34				   __entry->flags = bo->flags;
  > 35				   __entry->vm = (u64)bo->vm;
    36				   ),
    37	
    38			    TP_printk("size=%ld, flags=0x%02x, vm=0x%016llx",
    39				      __entry->size, __entry->flags, __entry->vm)
    40	);
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
