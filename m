Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AC3C1994
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 19:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008773; cv=none; b=j+c60VUVb48BCUkAstEd382Kq3NoMBxSQGxB3yyQ/wKewUcfIVGjHfFG89om+iuAcewMJvGNNjrzwwZn/fnyO9SWbkmd1NDanweQjpsaXid6ht/ZydrpUlWo8A3Lg4nItfMpyJ5ioPr7kyr7WihCbAIDheRWvdGrYLGzCZqloK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008773; c=relaxed/simple;
	bh=bgDymmDmGFPoKLSt7JyQjX8eczYBTWXkvN416l0wZc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rrxvy617NGhW6ZgY9YhTi0bmuvGNsirlIxFP90uz8zJIoRSvZO9yQgGugXeOatOCjqTj6ao5cnWoq5pZHm0zXYSPcjqrMmqErj4EOaZ/fSEb6V68HTsYHabLj0/IpVbAnGxejlVP4geYqcYlAWjLx0RmYlxHiXgxQq+d+EBL9/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2jr4I/G; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2jr4I/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778008771; x=1809544771;
  h=date:from:to:cc:subject:message-id;
  bh=bgDymmDmGFPoKLSt7JyQjX8eczYBTWXkvN416l0wZc8=;
  b=d2jr4I/GvbST20EgUXucY97crcxVzYIRQiA735wx4/FGLNBZuVLajb0f
   +fSzn3yhlth927Ls7PeOIFkHImYBhklOlIeKu+DZm6Q7mBZaAkbADE1vI
   U0n0xJtHXXb+9Cn+/TvwbYAlyLeXtvddKIhE4owYezeU+EtZ78bgF/Ozx
   c2IXJS6E6dKqpMjcy6ODfeY2VypSUP5E2MqbE6bi6l0GNgRjtcMBiwQMP
   OnEeW9gLL1uF5NXNuCJTzpMsjavXw1gU6GliGYx0wxZ1jzLP5XPaFrlbt
   AbNriAhM1UOWfnffROfcqoYVl0wybgGxZEiXFh7944HRtiwk2Iu2nhmJL
   g==;
X-CSE-ConnectionGUID: 0DpPe0sbSYWwQFD+dwmkMw==
X-CSE-MsgGUID: GI6Dn312Q1Stchaw/+yYeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66418803"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="66418803"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 12:19:30 -0700
X-CSE-ConnectionGUID: RZPt/rTFQWe3Ivz6h6oIrQ==
X-CSE-MsgGUID: uCCURrEUReuWR3T2LGLqMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="232776603"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 May 2026 12:19:28 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKLIk-000000000Of-13mt;
	Tue, 05 May 2026 19:19:26 +0000
Date: Wed, 06 May 2026 03:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 2/3]
 drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect
 goto statement to one of its possible targets
Message-ID: <202605060303.QucmoLl9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   a242ca2a86d31e281042b6d394cd434a2381f9a9
commit: d228104290ad6a6f5f66c8ee5aa9a81e3c99615c [2/3] slab: support for compiler-assisted type-based slab cache partitioning
config: i386-buildonly-randconfig-004-20260505 (https://download.01.org/0day-ci/archive/20260506/202605060303.QucmoLl9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060303.QucmoLl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060303.QucmoLl9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect goto statement to one of its possible targets
     272 |                         drm_exec_retry_on_contention(&exec);
         |                         ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: possible target of indirect goto statement
     304 |                 state->bos = kcalloc(submit->nr_bos,
         |                              ^
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro 'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)               _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                                    ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro 'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)               _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                                    ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:30: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:267:2: note: expanded from macro 'alloc_hooks'
     267 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |         ^
   include/linux/alloc_tag.h:251:45: note: expanded from macro 'alloc_hooks_tag'
     251 | #define alloc_hooks_tag(_tag, _do_alloc)                                \
         |                                                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:30: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:264:37: note: expanded from macro 'alloc_hooks'
     264 | #define alloc_hooks(_do_alloc)                                          \
         |                                                                         ^
>> drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect goto statement to one of its possible targets
     272 |                         drm_exec_retry_on_contention(&exec);
         |                         ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/msm/msm_gpu.c:288:16: note: possible target of indirect goto statement
     288 |                 state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
         |                              ^
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro 'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)               _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                                    ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:288:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro 'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)               _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                                    ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
   drivers/gpu/drm/msm/msm_gpu.c:288:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:30: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:267:2: note: expanded from macro 'alloc_hooks'
     267 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |         ^
   include/linux/alloc_tag.h:251:45: note: expanded from macro 'alloc_hooks_tag'
     251 | #define alloc_hooks_tag(_tag, _do_alloc)                                \
         |                                                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:288:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:30: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:264:37: note: expanded from macro 'alloc_hooks'
     264 | #define alloc_hooks(_do_alloc)                                          \
         |                                                                         ^
>> drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect goto statement to one of its possible targets
     272 |                         drm_exec_retry_on_contention(&exec);
         |                         ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/msm/msm_gpu.c:288:16: note: possible target of indirect goto statement
     288 |                 state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
         |                              ^
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro 'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)               _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                                    ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:288:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro 'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)               _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                                    ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
   drivers/gpu/drm/msm/msm_gpu.c:288:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:30: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:267:2: note: expanded from macro 'alloc_hooks'
     267 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |         ^
   include/linux/alloc_tag.h:251:45: note: expanded from macro 'alloc_hooks_tag'
     251 | #define alloc_hooks_tag(_tag, _do_alloc)                                \
         |                                                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:288:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:30: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:264:37: note: expanded from macro 'alloc_hooks'
     264 | #define alloc_hooks(_do_alloc)                                          \
         |                                                                         ^
>> drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect goto statement to one of its possible targets
     272 |                         drm_exec_retry_on_contention(&exec);
         |                         ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: possible target of indirect goto statement
     304 |                 state->bos = kcalloc(submit->nr_bos,
         |                              ^
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro 'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)               _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                                    ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro 'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)               _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                                    ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:30: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:267:2: note: expanded from macro 'alloc_hooks'
     267 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |         ^
   include/linux/alloc_tag.h:251:45: note: expanded from macro 'alloc_hooks_tag'
     251 | #define alloc_hooks_tag(_tag, _do_alloc)                                \
         |                                                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement expression
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:30: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^
   include/linux/alloc_tag.h:264:37: note: expanded from macro 'alloc_hooks'
     264 | #define alloc_hooks(_do_alloc)                                          \
         |                                                                         ^
   4 errors generated.


vim +272 drivers/gpu/drm/msm/msm_gpu.c

cdb95931dea329 Jordan Crouse  2018-07-24  257  
af9aa6f316b3da Rob Clark      2025-06-29  258  static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submit *submit)
af9aa6f316b3da Rob Clark      2025-06-29  259  {
af9aa6f316b3da Rob Clark      2025-06-29  260  	extern bool rd_full;
af9aa6f316b3da Rob Clark      2025-06-29  261  
af9aa6f316b3da Rob Clark      2025-06-29  262  	if (msm_context_is_vmbind(submit->queue->ctx)) {
af9aa6f316b3da Rob Clark      2025-06-29  263  		struct drm_exec exec;
af9aa6f316b3da Rob Clark      2025-06-29  264  		struct drm_gpuva *vma;
af9aa6f316b3da Rob Clark      2025-06-29  265  		unsigned cnt = 0;
af9aa6f316b3da Rob Clark      2025-06-29  266  
af9aa6f316b3da Rob Clark      2025-06-29  267  		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
af9aa6f316b3da Rob Clark      2025-06-29  268  		drm_exec_until_all_locked(&exec) {
af9aa6f316b3da Rob Clark      2025-06-29  269  			cnt = 0;
af9aa6f316b3da Rob Clark      2025-06-29  270  
af9aa6f316b3da Rob Clark      2025-06-29  271  			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(submit->vm));
af9aa6f316b3da Rob Clark      2025-06-29 @272  			drm_exec_retry_on_contention(&exec);
af9aa6f316b3da Rob Clark      2025-06-29  273  
af9aa6f316b3da Rob Clark      2025-06-29  274  			drm_gpuvm_for_each_va (vma, submit->vm) {
af9aa6f316b3da Rob Clark      2025-06-29  275  				if (!vma->gem.obj)
af9aa6f316b3da Rob Clark      2025-06-29  276  					continue;
af9aa6f316b3da Rob Clark      2025-06-29  277  
af9aa6f316b3da Rob Clark      2025-06-29  278  				cnt++;
af9aa6f316b3da Rob Clark      2025-06-29  279  				drm_exec_lock_obj(&exec, vma->gem.obj);
af9aa6f316b3da Rob Clark      2025-06-29  280  				drm_exec_retry_on_contention(&exec);
af9aa6f316b3da Rob Clark      2025-06-29  281  			}
af9aa6f316b3da Rob Clark      2025-06-29  282  
af9aa6f316b3da Rob Clark      2025-06-29  283  		}
af9aa6f316b3da Rob Clark      2025-06-29  284  
af9aa6f316b3da Rob Clark      2025-06-29  285  		drm_gpuvm_for_each_va (vma, submit->vm)
af9aa6f316b3da Rob Clark      2025-06-29  286  			cnt++;
af9aa6f316b3da Rob Clark      2025-06-29  287  
af9aa6f316b3da Rob Clark      2025-06-29  288  		state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
af9aa6f316b3da Rob Clark      2025-06-29  289  
3065e6a4d3594b Huiwen He      2025-11-13  290  		if (state->bos)
af9aa6f316b3da Rob Clark      2025-06-29  291  			drm_gpuvm_for_each_va(vma, submit->vm) {
af9aa6f316b3da Rob Clark      2025-06-29  292  				bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
af9aa6f316b3da Rob Clark      2025-06-29  293  
af9aa6f316b3da Rob Clark      2025-06-29  294  				/* Skip MAP_NULL/PRR VMAs: */
af9aa6f316b3da Rob Clark      2025-06-29  295  				if (!vma->gem.obj)
af9aa6f316b3da Rob Clark      2025-06-29  296  					continue;
af9aa6f316b3da Rob Clark      2025-06-29  297  
af9aa6f316b3da Rob Clark      2025-06-29  298  				msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
af9aa6f316b3da Rob Clark      2025-06-29  299  							  dump, vma->gem.offset, vma->va.range);
af9aa6f316b3da Rob Clark      2025-06-29  300  			}
af9aa6f316b3da Rob Clark      2025-06-29  301  
af9aa6f316b3da Rob Clark      2025-06-29  302  		drm_exec_fini(&exec);
af9aa6f316b3da Rob Clark      2025-06-29  303  	} else {
af9aa6f316b3da Rob Clark      2025-06-29  304  		state->bos = kcalloc(submit->nr_bos,
af9aa6f316b3da Rob Clark      2025-06-29  305  			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
af9aa6f316b3da Rob Clark      2025-06-29  306  
af9aa6f316b3da Rob Clark      2025-06-29  307  		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
12c3c6c44d1b0f Colin Ian King 2025-07-18  308  			struct drm_gem_object *obj = submit->bos[i].obj;
af9aa6f316b3da Rob Clark      2025-06-29  309  			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
af9aa6f316b3da Rob Clark      2025-06-29  310  
af9aa6f316b3da Rob Clark      2025-06-29  311  			msm_gem_lock(obj);
af9aa6f316b3da Rob Clark      2025-06-29  312  			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
af9aa6f316b3da Rob Clark      2025-06-29  313  						  dump, 0, obj->size);
af9aa6f316b3da Rob Clark      2025-06-29  314  			msm_gem_unlock(obj);
af9aa6f316b3da Rob Clark      2025-06-29  315  		}
af9aa6f316b3da Rob Clark      2025-06-29  316  	}
af9aa6f316b3da Rob Clark      2025-06-29  317  }
af9aa6f316b3da Rob Clark      2025-06-29  318  

:::::: The code at line 272 was first introduced by commit
:::::: af9aa6f316b3dae53318a044e975dae979cc022b drm/msm: Crashdump support for sparse

:::::: TO: Rob Clark <robdclark@chromium.org>
:::::: CC: Rob Clark <robin.clark@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
