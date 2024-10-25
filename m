Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698F8217F23
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729892918; cv=none; b=UMsQJ57CYbqQq9o9uHyKvOa1pWfx9O1rvfth/PDF9hEf7bYDzb3WX4HWjjz1AoRAlv+FM3cZ42XZCDyJ3ZVphNuUYp5zkf5Tgy7mqWa9lbp5/ek6TLaqhI3vbG0+0QWL96MgTG3UnDaB0z8Upn3mXMCYNzE3/sYU6QJqoAJxZto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729892918; c=relaxed/simple;
	bh=v6I/jk4/KNSNnNUsprhbe6NUUQAa22zXddQbvFnchXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O74namtWKVWkP0Q/BlDDrSMBP5+UfCtoZexQBk7+5xC8wSplc68iIkTvh6wWxp9QztXJc9U7UM5hWtU6vcXCGsQ2zxRkcOrYm4UO0dfEPXC3gy6OhJQzad+GvNwPvh/TrSg2EgKYa3OISVe3SmFF9Esu24FRzP1sEN2gNgWgsik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=df0H6e+C; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="df0H6e+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729892913; x=1761428913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6I/jk4/KNSNnNUsprhbe6NUUQAa22zXddQbvFnchXY=;
  b=df0H6e+CffnszJPRmgFBJSLtBlb9i+mrc3X+hshoBla3oDFNXQYG9HpB
   BvsHeO/qu4LZyC96pEn0QQBX+yPPkKUG1kRuZw7z44yen7Sw8mMWl7vQf
   KOhmOBLmHAiJ5E6BIttcyOWihYQou0F3Xf/QZno7Ohxr+XhcKWVDjb6x6
   gqXXn+4N5BtWhX+/CLCEnWVMxbac4lJj47Q4u5IqggAApkrAhShB7nPi9
   n1cgpq5zHicyylkFjge3UIXDqzGT8bmA4SkFtw51zDdDGEByOPoLT9oti
   moHe0AWdXgJOdkvEsbSJHKjWOWg9we/cqoCHrr4r171gMeLu1qZDgYkMe
   A==;
X-CSE-ConnectionGUID: 2mvdSv3lRpKn/c8sXhJ9yw==
X-CSE-MsgGUID: b40JaNLLTKGH78TMPG0HbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29690782"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="29690782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:48:33 -0700
X-CSE-ConnectionGUID: NJm38gyHTuyG+w56ABxLrg==
X-CSE-MsgGUID: KTLWMW6CRIWfJE5o61A9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="80945887"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 14:48:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4SAW-000YvA-3A;
	Fri, 25 Oct 2024 21:48:28 +0000
Date: Sat, 26 Oct 2024 05:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/8] include/trace/hooks/mm.h:34:17:
 error: passing argument 2 of '(({...}))' from incompatible pointer type
Message-ID: <202410260518.jBJ6b6jw-lkp@intel.com>
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
config: x86_64-randconfig-011-20241025 (https://download.01.org/0day-ci/archive/20241026/202410260518.jBJ6b6jw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260518.jBJ6b6jw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260518.jBJ6b6jw-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD 8c8091668d9d3e8c3d6d3d510a637ccb96fc6ea8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/trace/hooks/vendor_hooks.h:11,
                    from include/trace/hooks/mm.h:10,
                    from drivers/android/vendor_hooks.c:40:
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:272:39: note: in definition of macro '__DECLARE_TRACE'
     272 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:455:25: note: in expansion of macro 'PARAMS'
     455 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:275:41: note: in definition of macro '__DECLARE_TRACE'
     275 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:453:31: note: in expansion of macro 'PARAMS'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: In function 'trace_android_vh_cma_alloc_bypass':
>> include/trace/hooks/mm.h:34:17: error: passing argument 2 of '(({...}))' from incompatible pointer type [-Werror=incompatible-pointer-types]
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |                 ^~~
         |                 |
         |                 struct cma *
   include/linux/tracepoint.h:192:61: note: in definition of macro '__DO_TRACE_CALL'
     192 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:237:39: note: in expansion of macro 'TP_ARGS'
     237 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:278:25: note: in expansion of macro '__DO_TRACE'
     278 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:279:33: note: in expansion of macro 'TP_ARGS'
     279 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:453:9: note: in expansion of macro '__DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:453:46: note: in expansion of macro 'PARAMS'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:34:9: note: in expansion of macro 'TP_ARGS'
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h:34:17: note: expected 'struct cma *' but argument is of type 'struct cma *'
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |                 ^~~
   include/linux/tracepoint.h:192:61: note: in definition of macro '__DO_TRACE_CALL'
     192 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:237:39: note: in expansion of macro 'TP_ARGS'
     237 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:278:25: note: in expansion of macro '__DO_TRACE'
     278 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:279:33: note: in expansion of macro 'TP_ARGS'
     279 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:453:9: note: in expansion of macro '__DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:453:46: note: in expansion of macro 'PARAMS'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:34:9: note: in expansion of macro 'TP_ARGS'
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h: At top level:
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:249:51: note: in definition of macro '__DECLARE_TRACE_RCU'
     249 |         static inline void trace_##name##_rcuidle(proto)                \
         |                                                   ^~~~~
   include/linux/tracepoint.h:286:35: note: in expansion of macro 'PARAMS'
     286 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                   ^~~~~~
   include/linux/tracepoint.h:453:9: note: in expansion of macro '__DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:453:31: note: in expansion of macro 'PARAMS'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: In function 'trace_android_vh_cma_alloc_bypass_rcuidle':
>> include/trace/hooks/mm.h:34:17: error: passing argument 2 of '(({...}))' from incompatible pointer type [-Werror=incompatible-pointer-types]
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |                 ^~~
         |                 |
         |                 struct cma *
   include/linux/tracepoint.h:192:61: note: in definition of macro '__DO_TRACE_CALL'
     192 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:237:39: note: in expansion of macro 'TP_ARGS'
     237 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:252:25: note: in expansion of macro '__DO_TRACE'
     252 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:253:33: note: in expansion of macro 'TP_ARGS'
     253 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:286:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     286 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:286:50: note: in expansion of macro 'PARAMS'
     286 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                                  ^~~~~~
   include/linux/tracepoint.h:453:9: note: in expansion of macro '__DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:453:46: note: in expansion of macro 'PARAMS'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:34:9: note: in expansion of macro 'TP_ARGS'
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h:34:17: note: expected 'struct cma *' but argument is of type 'struct cma *'
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |                 ^~~
   include/linux/tracepoint.h:192:61: note: in definition of macro '__DO_TRACE_CALL'
     192 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:237:39: note: in expansion of macro 'TP_ARGS'
     237 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:252:25: note: in expansion of macro '__DO_TRACE'
     252 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:253:33: note: in expansion of macro 'TP_ARGS'
     253 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:286:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     286 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:286:50: note: in expansion of macro 'PARAMS'
     286 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                                  ^~~~~~
   include/linux/tracepoint.h:453:9: note: in expansion of macro '__DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:453:46: note: in expansion of macro 'PARAMS'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:34:9: note: in expansion of macro 'TP_ARGS'
      34 |         TP_ARGS(cma, count, align, gfp_mask, page, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h: At top level:
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:289:45: note: in definition of macro '__DECLARE_TRACE'
     289 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:455:25: note: in expansion of macro 'PARAMS'
     455 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:295:50: note: in definition of macro '__DECLARE_TRACE'
     295 |         register_trace_prio_##name(void (*probe)(data_proto), void *data,\
         |                                                  ^~~~~~~~~~
   include/linux/tracepoint.h:455:25: note: in expansion of macro 'PARAMS'
     455 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:302:47: note: in definition of macro '__DECLARE_TRACE'
     302 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:455:25: note: in expansion of macro 'PARAMS'
     455 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:308:53: note: in definition of macro '__DECLARE_TRACE'
     308 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                     ^~~~~~~~~~
   include/linux/tracepoint.h:455:25: note: in expansion of macro 'PARAMS'
     455 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:326:47: note: in definition of macro 'DEFINE_TRACE_FN'
     326 |         int __traceiter_##_name(void *__data, proto);                   \
         |                                               ^~~~~
   include/linux/tracepoint.h:362:43: note: in expansion of macro 'PARAMS'
     362 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                           ^~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:73:28: note: in expansion of macro 'PARAMS'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
>> include/linux/tracepoint.h:326:13: error: conflicting types for '__traceiter_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
     326 |         int __traceiter_##_name(void *__data, proto);                   \
         |             ^~~~~~~~~~~~
   include/linux/tracepoint.h:326:13: note: in definition of macro 'DEFINE_TRACE_FN'
     326 |         int __traceiter_##_name(void *__data, proto);                   \
         |             ^~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:272:20: note: previous declaration of '__traceiter_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
     272 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:272:20: note: in definition of macro '__DECLARE_TRACE'
     272 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:327:48: note: in definition of macro 'DEFINE_TRACE_FN'
     327 |         void __probestub_##_name(void *__data, proto);                  \
         |                                                ^~~~~
   include/linux/tracepoint.h:362:43: note: in expansion of macro 'PARAMS'
     362 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                           ^~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:73:28: note: in expansion of macro 'PARAMS'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:340:47: note: in definition of macro 'DEFINE_TRACE_FN'
     340 |         int __traceiter_##_name(void *__data, proto)                    \
         |                                               ^~~~~
   include/linux/tracepoint.h:362:43: note: in expansion of macro 'PARAMS'
     362 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                           ^~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:73:28: note: in expansion of macro 'PARAMS'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/linux/tracepoint.h:340:13: error: conflicting types for '__traceiter_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
     340 |         int __traceiter_##_name(void *__data, proto)                    \
         |             ^~~~~~~~~~~~
   include/linux/tracepoint.h:340:13: note: in definition of macro 'DEFINE_TRACE_FN'
     340 |         int __traceiter_##_name(void *__data, proto)                    \
         |             ^~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:272:20: note: previous declaration of '__traceiter_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
     272 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:272:20: note: in definition of macro '__DECLARE_TRACE'
     272 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/trace/hooks/mm.h:32:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:356:48: note: in definition of macro 'DEFINE_TRACE_FN'
     356 |         void __probestub_##_name(void *__data, proto)                   \
         |                                                ^~~~~
   include/linux/tracepoint.h:362:43: note: in expansion of macro 'PARAMS'
     362 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                           ^~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:73:28: note: in expansion of macro 'PARAMS'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:32:9: note: in expansion of macro 'TP_PROTO'
      32 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
>> include/linux/tracepoint.h:356:14: error: conflicting types for '__probestub_android_vh_cma_alloc_bypass'; have 'void(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'void(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
     356 |         void __probestub_##_name(void *__data, proto)                   \
         |              ^~~~~~~~~~~~
   include/linux/tracepoint.h:356:14: note: in definition of macro 'DEFINE_TRACE_FN'
     356 |         void __probestub_##_name(void *__data, proto)                   \
         |              ^~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:327:14: note: previous declaration of '__probestub_android_vh_cma_alloc_bypass' with type 'void(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'void(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
     327 |         void __probestub_##_name(void *__data, proto);                  \
         |              ^~~~~~~~~~~~
   include/linux/tracepoint.h:327:14: note: in definition of macro 'DEFINE_TRACE_FN'
     327 |         void __probestub_##_name(void *__data, proto);                  \
         |              ^~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:186:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     186 |         DECLARE_STATIC_CALL(name, _func);                               \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:359:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     359 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:362:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     362 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:273:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     273 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:453:9: note: in expansion of macro '__DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/tracepoint.h:15,
                    from include/trace/hooks/vendor_hooks.h:11,
                    from drivers/android/vendor_hooks.c:10:
   include/linux/tracepoint.h:366:27: error: conflicting types for '__traceiter_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
     366 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:366:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     366 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:105:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     105 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_cma_alloc_bypass);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:272:20: note: previous declaration of '__traceiter_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
     272 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:272:20: note: in definition of macro '__DECLARE_TRACE'
     272 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:216:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     216 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:216:27: note: in expansion of macro 'STATIC_CALL_TRAMP'
     216 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:367:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     367 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:105:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     105 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_cma_alloc_bypass);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  gfp_t,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  unsigned int,  struct page **, _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:273:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     273 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:453:9: note: in expansion of macro '__DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:31:1: note: in expansion of macro 'DECLARE_HOOK'
      31 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/mm.h:38:
   include/trace/stages/init.h:2:23: warning: 'str__mm__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/ftrace_dump.h:18,
                    from drivers/android/vendor_hooks.c:39:
   include/trace/stages/init.h:2:23: warning: 'str__ftrace_dump__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/dtask.h:18,
                    from drivers/android/vendor_hooks.c:38:
   include/trace/stages/init.h:2:23: warning: 'str__dtask__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


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
    31	DECLARE_HOOK(android_vh_cma_alloc_bypass,
    32		TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
    33			gfp_t gfp_mask, struct page **page, bool *bypass),
  > 34		TP_ARGS(cma, count, align, gfp_mask, page, bypass));
    35	#endif /* _TRACE_HOOK_MM_H */
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
