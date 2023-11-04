Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F77472
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elriksPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699086575; x=1730622575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iqzMjYTfNO/7da1AF7iwQ8RszAn8WkP5i+dBqn153yI=;
  b=elriksPv4vVQDqRIfP+G2cR3NzQrNAqzdOwTu/FTBA81kf9B9USG2cvl
   VoBdBXWL424bJ0kxuw+XEwkPn/UXcJx4Vxh+2yJ1XbzdQVekPZngFDa01
   r8+HRQdBLZKNXPiCaz+fURivYM9ScEw/9aPPoS9h5nSGn3MMdQYd0e9OK
   MnTEq0dvtFl0C+AQcPTU4XKmM5Q8QX6ubJ1AwuC0ZqwNZOLVadPyfXrb4
   LRv0N9V5ZksZNmU6WHpDQqlno1qoJ0CVomGMtct8IHGzvk5d+g6+aKTVc
   EH3JT2SN6beAUAqE/lacceQE8+/R3nnOmJf4FPEgo7DA2Knr9aJk3MNQS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="379462723"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="379462723"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 01:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="755383645"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="755383645"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Nov 2023 01:29:32 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzC26-0003g8-23;
	Sat, 04 Nov 2023 08:29:30 +0000
Date: Sat, 4 Nov 2023 16:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next 1015/1905]
 include/trace/../../drivers/gpu/drm/xe/xe_trace.h:35:42: warning: cast from
 pointer to integer of different size
Message-ID: <202311041602.YYfF0B6U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   bfa43da8e1f181fe2f8b84b39cb8a86e54f43731
commit: ea1dfd1fe8933f85ee3a2b3d6ad6b378d5b1a468 [1015/1905] drm/xe: Introduce a new DRM driver for Intel GPUs
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041602.YYfF0B6U-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041602.YYfF0B6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041602.YYfF0B6U-lkp@intel.com/

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
