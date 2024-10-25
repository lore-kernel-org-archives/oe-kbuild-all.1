Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61C217F4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729891056; cv=none; b=bnFnxicfesdGXlVhHwNp5ZKd08ZdDlbZcsKxunmSkLWtGAwA4uL5zAiNCE/xjmyrJbiHH8lAqqA2iXg1r62dec+9uWNFBssSIMpUJbrnBwdd1CJj8AWx17Y/1biSmCOl09avR7jxDVLZhkvorlJm4afl4f657R46Sqz1tXyqHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729891056; c=relaxed/simple;
	bh=msSXY5SCSiL+7lfQxJqabWubQzNX00vLh/i386fkc+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nbpef8rGA9H4P02prvxMYEmEYIGPkr+L5g+3DoTanHC4+Sw+A8D1MlN2vekS8IUl40txwZxg+v9rKdg7AvV93RtijIxYF+P6FkTF/ZzABe4NA8XiAjfZQkmxuM1DjSagf+VIvMQyq8jyyDgu//fKx0vHVpTfOvlv1VIpAWbHXI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLvNTD8Q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLvNTD8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729891054; x=1761427054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=msSXY5SCSiL+7lfQxJqabWubQzNX00vLh/i386fkc+g=;
  b=MLvNTD8QxTJZ9gbPWwUiVLflkIimX9JabrlrYwhydl2bxu2SSBaP7t1g
   ZsXFh64vcs1y35KZqkqQv3xJ6vTxAwaDFt7/sVzJFQX2BLnC3jO/IOmLv
   iO400h+Dq0T1MPL2HBY8GgNy7Dwu6SDy6OHLzRnh8Cx6racdR75X80w0q
   At37ym83ExA+DSEIk7NtAhvD4IBS5uT5cH/Kk8RWxL5kE1DZNLm8JuPCh
   QotmmCfYUseJ/yeOiH9lj4h38cgWLdnKG2GWjK/vqugZq/DAQ9mma0STp
   8O9NCA1JhmSoyTecaptffSx5i/iAKNez/cVHjN7ACOt1wtd0heB/R+tz1
   w==;
X-CSE-ConnectionGUID: CC6tIbBAS+KpnxmcTrIisg==
X-CSE-MsgGUID: gdhZrQYOQaOUy2F+kg6Kaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47033660"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47033660"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:17:33 -0700
X-CSE-ConnectionGUID: 4CcOstC3RZC7RWUOTC7ckQ==
X-CSE-MsgGUID: J0orSMLJS0SW08IypNgVtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="80678592"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2024 14:17:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4RgW-000YuL-1O;
	Fri, 25 Oct 2024 21:17:28 +0000
Date: Sat, 26 Oct 2024 05:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/8] include/trace/hooks/mm.h:34:10:
 error: incompatible pointer types passing 'struct cma *' to parameter of
 type 'struct cma *'
Message-ID: <202410260534.CufXHums-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   8c8091668d9d3e8c3d6d3d510a637ccb96fc6ea8
commit: fbcda4a3138517cccc56136ac7d5109f8fea9ee1 [1/8] ANDROID: vendor_hooks: add vendor hook in cma_alloc()
config: x86_64-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241026/202410260534.CufXHums-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260534.CufXHums-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260534.CufXHums-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD 8c8091668d9d3e8c3d6d3d510a637ccb96fc6ea8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/android/vendor_hooks.c:13:
   In file included from include/trace/hooks/cpuidle.h:23:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/android/vendor_hooks.c:40:
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
>> include/trace/hooks/mm.h:34:10: error: incompatible pointer types passing 'struct cma *' to parameter of type 'struct cma *' [-Werror,-Wincompatible-pointer-types]
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |                 ^~~
   include/linux/tracepoint.h:167:26: note: expanded from macro 'TP_ARGS'
     167 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:453:46: note: expanded from macro 'DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                                     ^~~~
   include/linux/tracepoint.h:126:25: note: expanded from macro 'PARAMS'
     126 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:237:33: note: expanded from macro '__DO_TRACE'
     237 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:167:26: note: expanded from macro 'TP_ARGS'
     167 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:192:40: note: expanded from macro '__DO_TRACE_CALL'
     192 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   In file included from drivers/android/vendor_hooks.c:40:
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
>> include/trace/hooks/mm.h:34:10: error: incompatible pointer types passing 'struct cma *' to parameter of type 'struct cma *' [-Werror,-Wincompatible-pointer-types]
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |                 ^~~
   include/linux/tracepoint.h:167:26: note: expanded from macro 'TP_ARGS'
     167 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:453:46: note: expanded from macro 'DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                                     ^~~~
   include/linux/tracepoint.h:126:25: note: expanded from macro 'PARAMS'
     126 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:237:33: note: expanded from macro '__DO_TRACE'
     237 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:167:26: note: expanded from macro 'TP_ARGS'
     167 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:192:40: note: expanded from macro '__DO_TRACE_CALL'
     192 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   In file included from drivers/android/vendor_hooks.c:40:
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
   In file included from drivers/android/vendor_hooks.c:40:
   In file included from include/trace/hooks/mm.h:38:
   In file included from include/trace/define_trace.h:95:
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
>> include/trace/hooks/mm.h:31:1: error: conflicting types for '__traceiter_android_vh_cma_alloc_bypass'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^
   include/trace/hooks/vendor_hooks.h:16:22: note: expanded from macro 'DECLARE_HOOK'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^
   include/trace/define_trace.h:73:2: note: expanded from macro 'DECLARE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:362:2: note: expanded from macro 'DEFINE_TRACE'
     362 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:326:6: note: expanded from macro 'DEFINE_TRACE_FN'
     326 |         int __traceiter_##_name(void *__data, proto);                   \
         |             ^
   <scratch space>:10:1: note: expanded from here
      10 | __traceiter_android_vh_cma_alloc_bypass
         | ^
   include/trace/hooks/mm.h:31:1: note: previous declaration is here
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^
   include/trace/hooks/vendor_hooks.h:16:22: note: expanded from macro 'DECLARE_HOOK'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^
   include/linux/tracepoint.h:453:2: note: expanded from macro 'DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:272:13: note: expanded from macro '__DECLARE_TRACE'
     272 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^
   <scratch space>:69:1: note: expanded from here
      69 | __traceiter_android_vh_cma_alloc_bypass
         | ^
   In file included from drivers/android/vendor_hooks.c:40:
   In file included from include/trace/hooks/mm.h:38:
   In file included from include/trace/define_trace.h:95:
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
>> include/trace/hooks/mm.h:31:1: error: conflicting types for '__traceiter_android_vh_cma_alloc_bypass'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^
   include/trace/hooks/vendor_hooks.h:16:22: note: expanded from macro 'DECLARE_HOOK'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^
   include/trace/define_trace.h:73:2: note: expanded from macro 'DECLARE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:362:2: note: expanded from macro 'DEFINE_TRACE'
     362 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:340:6: note: expanded from macro 'DEFINE_TRACE_FN'
     340 |         int __traceiter_##_name(void *__data, proto)                    \
         |             ^
   <scratch space>:21:1: note: expanded from here
      21 | __traceiter_android_vh_cma_alloc_bypass
         | ^
   include/trace/hooks/mm.h:31:1: note: previous declaration is here
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^
   include/trace/hooks/vendor_hooks.h:16:22: note: expanded from macro 'DECLARE_HOOK'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^
   include/linux/tracepoint.h:453:2: note: expanded from macro 'DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:272:13: note: expanded from macro '__DECLARE_TRACE'
     272 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^
   <scratch space>:69:1: note: expanded from here
      69 | __traceiter_android_vh_cma_alloc_bypass
         | ^
   In file included from drivers/android/vendor_hooks.c:40:
   In file included from include/trace/hooks/mm.h:38:
   In file included from include/trace/define_trace.h:95:
   include/trace/hooks/mm.h:32:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
>> include/trace/hooks/mm.h:31:1: error: conflicting types for '__probestub_android_vh_cma_alloc_bypass'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^
   include/trace/hooks/vendor_hooks.h:16:22: note: expanded from macro 'DECLARE_HOOK'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^
   include/trace/define_trace.h:73:2: note: expanded from macro 'DECLARE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:362:2: note: expanded from macro 'DEFINE_TRACE'
     362 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:356:7: note: expanded from macro 'DEFINE_TRACE_FN'
     356 |         void __probestub_##_name(void *__data, proto)                   \
         |              ^
   <scratch space>:32:1: note: expanded from here
      32 | __probestub_android_vh_cma_alloc_bypass
         | ^
   include/trace/hooks/mm.h:31:1: note: previous declaration is here
   include/trace/hooks/vendor_hooks.h:16:22: note: expanded from macro 'DECLARE_HOOK'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^
   include/trace/define_trace.h:73:2: note: expanded from macro 'DECLARE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:362:2: note: expanded from macro 'DEFINE_TRACE'
     362 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:327:7: note: expanded from macro 'DEFINE_TRACE_FN'
     327 |         void __probestub_##_name(void *__data, proto);                  \
         |              ^
   <scratch space>:11:1: note: expanded from here
      11 | __probestub_android_vh_cma_alloc_bypass
         | ^
   12 warnings and 5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +34 include/trace/hooks/mm.h

    12	
    13	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    14				TP_PROTO(gfp_t *flags),
    15				TP_ARGS(flags), 1);
    16	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    17				TP_PROTO(gfp_t *flags),
    18				TP_ARGS(flags), 1);
    19	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    20				TP_PROTO(gfp_t *flags),
    21				TP_ARGS(flags), 1);
    22	*/
    23	struct mem_cgroup;
    24	DECLARE_HOOK(android_vh_mem_cgroup_alloc,
    25		TP_PROTO(struct mem_cgroup *memcg),
    26		TP_ARGS(memcg));
    27	DECLARE_HOOK(android_vh_mem_cgroup_free,
    28		TP_PROTO(struct mem_cgroup *memcg),
    29		TP_ARGS(memcg));
    30	
  > 31	DECLARE_HOOK(android_vh_cma_alloc_bypass,
    32		TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
    33			gfp_t gfp_mask, struct page **page, bool *bypass),
  > 34		TP_ARGS(cma, count, align, gfp_mask, page, bypass));
    35	#endif /* _TRACE_HOOK_MM_H */
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
