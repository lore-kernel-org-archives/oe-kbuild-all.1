Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8934220B23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683723033; x=1715259033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5eZMr9lQLZQWAjWQ708Ov/72fKfzT7sLeeL5AQuCCs=;
  b=Z0VKkQBU9UZKFKuIOSSud2b2QXzClowYX0XT3TJLDG/PUQPwnavCmvvb
   w6aSpfws7ljI5LLVGNxWKva8wYzCptr6Pid44m9R7klO5ebywIMTqD8MK
   SaipMoDsi2+QtFgVLG18UQc1NAHvqe/MK2DnvSaNjP672pXBraNNYNenS
   H7B2jAt0SCejfKtM1uF/HGjaowAjDJ6sL5VK7HCJ8uIvS4F4mMX0XH/Wm
   MOWxhaZdIQru+8R95ETZDxZvarEMv9O++8sJJHqlX3DtlkBXbn5b5AAqZ
   pvLKQjs6iT6fKY0NjBIltMt7zCpUwepH6FurMWk78z3oDaTT1Nq/HpEYD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350238334"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="350238334"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 05:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="676836983"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="676836983"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 May 2023 05:50:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwjH4-0003IG-2F;
	Wed, 10 May 2023 12:50:30 +0000
Date: Wed, 10 May 2023 20:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [mlankhorst:dumpcg 16583/16889]
 include/trace/../../drivers/gpu/drm/xe/xe_trace.h:35:42: warning: cast from
 pointer to integer of different size
Message-ID: <202305102021.ulUJaPvn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~mlankhorst/linux dumpcg
head:   169b450351c6705039540a916fccb470d26ec34c
commit: e5f8e18d13b6e9822833da4683b8d9327884ad61 [16583/16889] drm/xe: Introduce a new DRM driver for Intel GPUs
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305102021.ulUJaPvn-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add mlankhorst git://people.freedesktop.org/~mlankhorst/linux
        git fetch --no-tags mlankhorst dumpcg
        git checkout e5f8e18d13b6e9822833da4683b8d9327884ad61
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102021.ulUJaPvn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_lrc.c:89: warning: "END" redefined
      89 | #define END 0
         | 
   In file included from arch/mips/include/asm/bitops.h:19,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from arch/mips/include/asm/io.h:18,
                    from include/linux/io.h:13,
                    from include/linux/iosys-map.h:10,
                    from drivers/gpu/drm/xe/xe_hw_fence_types.h:9,
                    from drivers/gpu/drm/xe/xe_lrc_types.h:9,
                    from drivers/gpu/drm/xe/xe_lrc.h:8,
                    from drivers/gpu/drm/xe/xe_lrc.c:6:
   arch/mips/include/asm/asm.h:69: note: this is the location of the previous definition
      69 | #define END(function)                                   \
         | 
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
   In file included from include/trace/define_trace.h:103:
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'perf_trace_xe_bo':
>> include/trace/../../drivers/gpu/drm/xe/xe_trace.h:35:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      35 |                            __entry->vm = (u64)bo->vm;
         |                                          ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:32:21: note: in expansion of macro 'TP_fast_assign'
      32 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'perf_trace_xe_sched_job':
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:188:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     188 |                            __entry->fence = (u64)job->fence;
         |                                             ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:181:21: note: in expansion of macro 'TP_fast_assign'
     181 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'perf_trace_xe_hw_fence':
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:275:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     275 |                            __entry->fence = (u64)fence;
         |                                             ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:272:21: note: in expansion of macro 'TP_fast_assign'
     272 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'perf_trace_xe_vma':
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:315:43: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     315 |                            __entry->vma = (u64)vma;
         |                                           ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:314:21: note: in expansion of macro 'TP_fast_assign'
     314 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h: In function 'perf_trace_xe_vm':
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:412:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     412 |                            __entry->vm = (u64)vm;
         |                                          ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/../../drivers/gpu/drm/xe/xe_trace.h:411:21: note: in expansion of macro 'TP_fast_assign'
     411 |                     TP_fast_assign(
         |                     ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


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
https://github.com/intel/lkp-tests
