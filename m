Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6409339B54
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622400; cv=none; b=HAXD+fL4ltg8DMhvol7VI2GiiyGJu+YrC5KPUS+TePTzLSANomt+aOLAvJgdOHjrrlDZn6yppSF53RRd07AcuMrqJ7OkXzQqrjA3IR0FubVMIDfXWGynh2m6iNz6ltr18q0Kb3+TEDlbMyYu94xvKvyRxWfjO6ypJKOmcdGCNrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622400; c=relaxed/simple;
	bh=9cyTE/DdUuC1WhRlcVincx0tsMFnOMA3IflKP97k/Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GvR2MPcrdA8A5i3r+KEea2TTrWxM1DpcO52lhOzXbFXjaAkFWaktjO3/Nq1m5uLpc1BW1+M3q2ybetRosZJUQO00eZvzLWcLQL4t+FbsfkTuyfEtA+vS4+Iy20fj7tgPGa7o0uXCK2eHfkHfDn3XCCP/xOFt3W/V36zD3Ch004g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJqr5vbp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJqr5vbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760622399; x=1792158399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9cyTE/DdUuC1WhRlcVincx0tsMFnOMA3IflKP97k/Y4=;
  b=WJqr5vbpOzq9wbMggTfzOYYGu6QhvXdhz3cXZ6Wa7/BhfnRuo6+e0D4m
   sE3KGgOL46ZmhyzOyjJaY8k4i4Q0tWvIy9NTghgyLc7QURChjxbQ7mop2
   VvlLxRdLVzNSrwUShQM/y5Hs7wdTAlx1BP/TBdM3Jy2Hnzy+bsUfExvn0
   VQrcN+8+5s3n5ZEbqi5oDNOhvMRjqt7tjeBEBm6W/ffLyJux7nyq3GX4Q
   I7TijuEmDnfCZxkUX7OSd++S6DzlNMnXZCJbIJhZNZINSAn+CyieEPy66
   uSvHUScmnch+zS0qGiVN/rHfWbheFHJyd0639VbEvkLeoxMfc+8cGUg4G
   g==;
X-CSE-ConnectionGUID: vFs6vS3LQIi+xpwPqF1q0A==
X-CSE-MsgGUID: mMEFq/j1TWeqPRqPRM5wow==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="50380872"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="50380872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 06:46:36 -0700
X-CSE-ConnectionGUID: 52d5UNu/RnihNuisafAnYg==
X-CSE-MsgGUID: iJbGvvpLQRiwe6+TxlpVEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182252110"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Oct 2025 06:46:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9OJM-0004rn-1J;
	Thu, 16 Oct 2025 13:46:32 +0000
Date: Thu, 16 Oct 2025 21:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 1/1] include/linux/sockptr.h:126:12: error: use
 of unknown builtin '__builtin_infer_alloc_token'
Message-ID: <202510162119.FxGs5yZ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   55f740b0375cb6949a8f62630d173abcef9c3683
commit: 55f740b0375cb6949a8f62630d173abcef9c3683 [1/1] slab: support for compiler-assisted type-based slab cache partitioning
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251016/202510162119.FxGs5yZ3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510162119.FxGs5yZ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510162119.FxGs5yZ3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/asm-offsets.c:12:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/loongarch/include/asm/kvm_host.h:15:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:34:
>> include/linux/sockptr.h:126:12: error: use of unknown builtin '__builtin_infer_alloc_token' [-Wimplicit-function-declaration]
     126 |         void *p = kmalloc_track_caller_noprof(len, GFP_USER | __GFP_NOWARN);
         |                   ^
   include/linux/slab.h:1025:3: note: expanded from macro 'kmalloc_track_caller_noprof'
    1025 |                 kmalloc_node_track_caller_noprof(__VA_ARGS__, NUMA_NO_NODE, _RET_IP_)
         |                 ^
   include/linux/slab.h:1010:90: note: expanded from macro 'kmalloc_node_track_caller_noprof'
    1010 |         __kmalloc_node_track_caller_noprof(PASS_BUCKET_PARAMS(size, NULL), flags, node, caller, __kmalloc_token(size))
         |                                                                                                 ^
   include/linux/slab.h:642:55: note: expanded from macro '__kmalloc_token'
     642 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
         |                                                       ^
   In file included from arch/loongarch/kernel/asm-offsets.c:12:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/loongarch/include/asm/kvm_host.h:15:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:34:
   include/linux/sockptr.h:140:12: error: use of unknown builtin '__builtin_infer_alloc_token' [-Wimplicit-function-declaration]
     140 |         char *p = kmalloc_track_caller_noprof(len + 1, GFP_KERNEL);
         |                   ^
   include/linux/slab.h:1025:3: note: expanded from macro 'kmalloc_track_caller_noprof'
    1025 |                 kmalloc_node_track_caller_noprof(__VA_ARGS__, NUMA_NO_NODE, _RET_IP_)
         |                 ^
   include/linux/slab.h:1010:90: note: expanded from macro 'kmalloc_node_track_caller_noprof'
    1010 |         __kmalloc_node_track_caller_noprof(PASS_BUCKET_PARAMS(size, NULL), flags, node, caller, __kmalloc_token(size))
         |                                                                                                 ^
   include/linux/slab.h:642:55: note: expanded from macro '__kmalloc_token'
     642 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
         |                                                       ^
   In file included from arch/loongarch/kernel/asm-offsets.c:12:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/loongarch/include/asm/kvm_host.h:15:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:27:
>> include/linux/bpfptr.h:70:12: error: use of unknown builtin '__builtin_infer_alloc_token' [-Wimplicit-function-declaration]
      70 |         void *p = kvmalloc_noprof(len, GFP_USER | __GFP_NOWARN);
         |                   ^
   include/linux/slab.h:1068:41: note: expanded from macro 'kvmalloc_noprof'
    1068 | #define kvmalloc_noprof(_size, _flags)          kvmalloc_node_noprof(_size, _flags, NUMA_NO_NODE)
         |                                                 ^
   include/linux/slab.h:1064:70: note: expanded from macro 'kvmalloc_node_noprof'
    1064 |         __kvmalloc_node_noprof(PASS_BUCKET_PARAMS(size, NULL), flags, node, __kmalloc_token(size))
         |                                                                             ^
   include/linux/slab.h:642:55: note: expanded from macro '__kmalloc_token'
     642 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
         |                                                       ^
   In file included from arch/loongarch/kernel/asm-offsets.c:12:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/loongarch/include/asm/kvm_host.h:15:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
>> include/linux/bpf.h:2123:9: error: use of unknown builtin '__builtin_infer_alloc_token' [-Wimplicit-function-declaration]
    2123 |         return kzalloc(sizeof(*map->owner), GFP_ATOMIC);
         |                ^
   include/linux/slab.h:1059:37: note: expanded from macro 'kzalloc'
    1059 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1058:60: note: expanded from macro 'kzalloc_noprof'
    1058 | #define kzalloc_noprof(...)                     _kzalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                              ^
   include/linux/slab.h:642:55: note: expanded from macro '__kmalloc_token'
     642 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
         |                                                       ^
   In file included from arch/loongarch/kernel/asm-offsets.c:12:
>> include/linux/kvm_host.h:1640:9: error: use of unknown builtin '__builtin_infer_alloc_token' [-Wimplicit-function-declaration]
    1640 |         return kzalloc(sizeof(struct kvm), GFP_KERNEL_ACCOUNT);
         |                ^
   include/linux/slab.h:1059:37: note: expanded from macro 'kzalloc'
    1059 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1058:60: note: expanded from macro 'kzalloc_noprof'
    1058 | #define kzalloc_noprof(...)                     _kzalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                              ^
   include/linux/slab.h:642:55: note: expanded from macro '__kmalloc_token'
     642 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
         |                                                       ^
   5 errors generated.
   make[3]: *** [scripts/Makefile.build:182: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/__builtin_infer_alloc_token +126 include/linux/sockptr.h

4ff09db1b79b98 Martin KaFai Lau   2022-09-01  123  
2c321f3f70bc28 Suren Baghdasaryan 2024-04-14  124  static inline void *memdup_sockptr_noprof(sockptr_t src, size_t len)
ba423fdaa589d9 Christoph Hellwig  2020-07-23  125  {
2c321f3f70bc28 Suren Baghdasaryan 2024-04-14 @126  	void *p = kmalloc_track_caller_noprof(len, GFP_USER | __GFP_NOWARN);
ba423fdaa589d9 Christoph Hellwig  2020-07-23  127  
ba423fdaa589d9 Christoph Hellwig  2020-07-23  128  	if (!p)
ba423fdaa589d9 Christoph Hellwig  2020-07-23  129  		return ERR_PTR(-ENOMEM);
ba423fdaa589d9 Christoph Hellwig  2020-07-23  130  	if (copy_from_sockptr(p, src, len)) {
ba423fdaa589d9 Christoph Hellwig  2020-07-23  131  		kfree(p);
ba423fdaa589d9 Christoph Hellwig  2020-07-23  132  		return ERR_PTR(-EFAULT);
ba423fdaa589d9 Christoph Hellwig  2020-07-23  133  	}
ba423fdaa589d9 Christoph Hellwig  2020-07-23  134  	return p;
ba423fdaa589d9 Christoph Hellwig  2020-07-23  135  }
2c321f3f70bc28 Suren Baghdasaryan 2024-04-14  136  #define memdup_sockptr(...)	alloc_hooks(memdup_sockptr_noprof(__VA_ARGS__))
ba423fdaa589d9 Christoph Hellwig  2020-07-23  137  

:::::: The code at line 126 was first introduced by commit
:::::: 2c321f3f70bc284510598f712b702ce8d60c4d14 mm: change inlined allocation helpers to account at the call site

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
