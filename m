Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43202D374A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761419818; cv=none; b=futHj4nekMeyiWFUq1vAry5OgUFVuRbnYD15lncerPBLDD4M7du9/ox3YUkkZvkNSPJOe1sPEXiQAuIRcY14McHIZHO4jyxpfjtZaAt5X1isTzvtikgBLLgX3NaNh3OGFQRgZXpKuKpeKiybqOufFkcdbzjuE2NlcgAP6K4elXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761419818; c=relaxed/simple;
	bh=vDdEF4HzYAJ4DpPaew8ydz/RvqQXB+Sk0SW+sfj8rvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RegKDnkjaKx2MM1AoMokwqEXmvJhs5kfgtDVBEHqM9CvddkLmqdXqmJlkwZglh5Myl1tg0Yr1tOBZrekESNzwRfxPPVWCOBXjWsnLhwGDnXesqe16WsxUbkqvWCix94j3EfuBznn3FKvMMYATicfHEeR6qOqSMO1FMzdLnSdXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0sT0QVZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0sT0QVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761419816; x=1792955816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vDdEF4HzYAJ4DpPaew8ydz/RvqQXB+Sk0SW+sfj8rvo=;
  b=E0sT0QVZu07M2tIIcIGCxMg9H+kdpUFZjAOxSpJd99NYjm0y+NgGiFG/
   W3SrKOxnmBFXrmEJyN093muPLdGJUIQwvL3epeehPkW7rkq/xX9LFkPnT
   qfhhndIyj7v0bY7ujuOYy9BqErrWPkDWvMesdPEKbGYsRhNDSrZd0nGlm
   Jf3Bjg8sQlegmd59MwpTus+NxqmKjPW8AMiRkIhq12jHMRKQjYD3783lk
   sIiXzveZds/scGiCFKVUdfDXb1bskF1p38JmkWmO4qlfDxjhSTMhZHrSZ
   XqMUoF4YJoD8OunCTJxqE+0lpnzcgF4fi6oFlHoYPKKl552r9lXRG3cob
   w==;
X-CSE-ConnectionGUID: v+UxHufYQD6OORMV4kYeOg==
X-CSE-MsgGUID: OTJmbjtiTcC69utsOIGUwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63598301"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63598301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 12:16:56 -0700
X-CSE-ConnectionGUID: rghPvOdQSfqaYba/2AOvcQ==
X-CSE-MsgGUID: t/g5/SH9SPK1rg9kDW/tHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="208331480"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Oct 2025 12:16:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCjkb-000FXJ-1D;
	Sat, 25 Oct 2025 19:16:45 +0000
Date: Sun, 26 Oct 2025 03:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2 7/23] mm/bpf_oom.c:49:15: error: assigning to
 'struct bpf_oom_ops *' from incompatible type 'void'
Message-ID: <202510260339.gPY0IgKN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2
head:   194ef7577149bb29fcf3275cc48daca598608313
commit: e70cb51b60e62a94b18bfc7fa711f3f3afd0a7c0 [7/23] mm: introduce BPF struct ops for OOM handling
config: hexagon-randconfig-r064-20251026 (https://download.01.org/0day-ci/archive/20251026/202510260339.gPY0IgKN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260339.gPY0IgKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260339.gPY0IgKN-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                 ^
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:559:38: note: expanded from macro '__native_word'
     559 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:547:13: note: expanded from macro '__unqual_scalar_typeof'
     547 |                 _Generic((x),                                           \
         |                           ^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:554:15: note: expanded from macro '__unqual_scalar_typeof'
     554 |                          default: (x)))
         |                                    ^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
>> mm/bpf_oom.c:49:15: error: assigning to 'struct bpf_oom_ops *' from incompatible type 'void'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:120:27: error: incomplete definition of type 'struct mem_cgroup'
     120 |                 bpf_oom_ops_ptr = &memcg->bpf_oom;
         |                                    ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:151:27: error: incomplete definition of type 'struct mem_cgroup'
     151 |                 bpf_oom_ops_ptr = &memcg->bpf_oom;
         |                                    ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:558:10: note: expanded from macro '__native_word'
     558 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:558:39: note: expanded from macro '__native_word'
     558 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:559:10: note: expanded from macro '__native_word'
     559 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:559:38: note: expanded from macro '__native_word'
     559 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)


vim +49 mm/bpf_oom.c

    37	
    38	bool bpf_handle_oom(struct oom_control *oc)
    39	{
    40		struct bpf_oom_ops *bpf_oom_ops = NULL;
    41		struct mem_cgroup *memcg;
    42		int idx, ret = 0;
    43	
    44		/* All bpf_oom_ops structures are protected using bpf_oom_srcu */
    45		idx = srcu_read_lock(&bpf_oom_srcu);
    46	
    47		/* Find the nearest bpf_oom_ops traversing the cgroup tree upwards */
    48		for (memcg = oc->memcg; memcg; memcg = parent_mem_cgroup(memcg)) {
  > 49			bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
    50			if (!bpf_oom_ops)
    51				continue;
    52	
    53			/* Call BPF OOM handler */
    54			ret = bpf_ops_handle_oom(bpf_oom_ops, memcg, oc);
    55			if (ret && oc->bpf_memory_freed)
    56				goto exit;
    57		}
    58		/*
    59		 * System-wide OOM or per-memcg BPF OOM handler wasn't successful?
    60		 * Try system_bpf_oom.
    61		 */
    62		bpf_oom_ops = READ_ONCE(system_bpf_oom);
    63		if (!bpf_oom_ops)
    64			goto exit;
    65	
    66		/* Call BPF OOM handler */
    67		ret = bpf_ops_handle_oom(bpf_oom_ops, NULL, oc);
    68	exit:
    69		srcu_read_unlock(&bpf_oom_srcu, idx);
    70		return ret && oc->bpf_memory_freed;
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
