Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A62BEC2B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814112; cv=none; b=ipIUUP9MslzMjrqLowVruf8DMGq80Amnm1mn2pN6RvOfrEKYryyJW3Q4pA+Kse1W8FVoNXloowe36IDCkQVib2sbIeEyNFUEjT+URt27Sc8W8JbmJuiv7j0lyDe8A/RW0/v+muvdB4pE+XHnkoTk5N26nPOn5i/kcbLD5y87vRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814112; c=relaxed/simple;
	bh=W27T5PdUo8NAe3rfcj1N7D8mK/LTuFLlwtiVN3iNTdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tSjFnoBajpIbMPCokx5UxRm9jp3nPm/TcfjNv7IGdgIngtVa/qNu31iVyRx8Ivn95mYWKuVXJOWpCXLm5ArPlmTou2RrDXzu7nLPMbRaK0oSxJwZ6e01CYCqKPKdu0U1Q3DDqQ++JX/ubmpbwb2JVWDodzabJvmf//B3rhZiLTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTfmQQdB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTfmQQdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782814111; x=1814350111;
  h=date:from:to:cc:subject:message-id;
  bh=W27T5PdUo8NAe3rfcj1N7D8mK/LTuFLlwtiVN3iNTdY=;
  b=TTfmQQdBIu1dRo5c5PU9q6C883AuihYRYxMPeI0Av+W3aCpZtkgBt1jK
   I75wCjI+IXh2RqBFj8FRHlJ7erYemFsCweyTbTZbE1T8Kdn82YVx4LXnn
   yoZEACNmRN9a0QpsXYcnQvMPNgf0eExHN1nGQUnXYf5kn9ge8lGrLGyPZ
   3HnisXcGstiWZoTSlTaa20cMdZvmEAjp5pwLiDdvddJX4439IuWut7SGk
   GnauT1AwqxayOxImMrk4KZg57Vbx0/PJlzGTR5Cuh/K6N72eWhNW0JGMH
   pU13chIjUPE6oCeVhfLlnp7hxiw2Jo0nAGxBMdyGIAP1AOrpaasH2qTnS
   Q==;
X-CSE-ConnectionGUID: tUh2yS6qRQahCOSNxeWu3w==
X-CSE-MsgGUID: MxW3zLliSR+M2eIN9kEHrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83580093"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83580093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:08:31 -0700
X-CSE-ConnectionGUID: YLMfNAQNS66T6MHWu9CrmA==
X-CSE-MsgGUID: MMOTumF+RgqOeKfOq+qWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="257135873"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jun 2026 03:08:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weVOE-000000008Et-1OiO;
	Tue, 30 Jun 2026 10:08:26 +0000
Date: Tue, 30 Jun 2026 18:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 885/1356] include/linux/kasan.h:199:43:
 error: use of undeclared identifier '_RET_IP_'
Message-ID: <202606301759.hTqHaPuI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
commit: 9cbc3d9806d31abda2718ceac587ddee3a04849b [885/1356] tracing: Remove trace_printk.h from kernel.h
config: arm64-randconfig-r123-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301759.hTqHaPuI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301759.hTqHaPuI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301759.hTqHaPuI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/scs.c:9:
>> include/linux/kasan.h:199:43: error: use of undeclared identifier '_RET_IP_'
     199 |                 return __kasan_slab_pre_free(s, object, _RET_IP_);
         |                                                         ^~~~~~~~
   include/linux/kasan.h:244:28: error: use of undeclared identifier '_RET_IP_'
     244 |                 __kasan_kfree_large(ptr, _RET_IP_);
         |                                          ^~~~~~~~
   include/linux/kasan.h:309:52: error: use of undeclared identifier '_RET_IP_'
     309 |                 return __kasan_mempool_poison_pages(page, order, _RET_IP_);
         |                                                                  ^~~~~~~~
   include/linux/kasan.h:331:47: error: use of undeclared identifier '_RET_IP_'
     331 |                 __kasan_mempool_unpoison_pages(page, order, _RET_IP_);
         |                                                             ^~~~~~~~
   include/linux/kasan.h:363:45: error: use of undeclared identifier '_RET_IP_'
     363 |                 return __kasan_mempool_poison_object(ptr, _RET_IP_);
         |                                                           ^~~~~~~~
   include/linux/kasan.h:391:46: error: use of undeclared identifier '_RET_IP_'
     391 |                 __kasan_mempool_unpoison_object(ptr, size, _RET_IP_);
         |                                                            ^~~~~~~~
   include/linux/kasan.h:402:35: error: use of undeclared identifier '_RET_IP_'
     402 |                 return __kasan_check_byte(addr, _RET_IP_);
         |                                                 ^~~~~~~~
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^


vim +/_RET_IP_ +199 include/linux/kasan.h

34303244f2615ad Andrey Konovalov 2020-12-22  181  
b3c34245756adad Jann Horn        2024-08-09  182  bool __kasan_slab_pre_free(struct kmem_cache *s, void *object,
b3c34245756adad Jann Horn        2024-08-09  183  			unsigned long ip);
b3c34245756adad Jann Horn        2024-08-09  184  /**
b3c34245756adad Jann Horn        2024-08-09  185   * kasan_slab_pre_free - Check whether freeing a slab object is safe.
b3c34245756adad Jann Horn        2024-08-09  186   * @object: Object to be freed.
b3c34245756adad Jann Horn        2024-08-09  187   *
b3c34245756adad Jann Horn        2024-08-09  188   * This function checks whether freeing the given object is safe. It may
b3c34245756adad Jann Horn        2024-08-09  189   * check for double-free and invalid-free bugs and report them.
b3c34245756adad Jann Horn        2024-08-09  190   *
b3c34245756adad Jann Horn        2024-08-09  191   * This function is intended only for use by the slab allocator.
b3c34245756adad Jann Horn        2024-08-09  192   *
b3c34245756adad Jann Horn        2024-08-09  193   * @Return true if freeing the object is unsafe; false otherwise.
b3c34245756adad Jann Horn        2024-08-09  194   */
b3c34245756adad Jann Horn        2024-08-09  195  static __always_inline bool kasan_slab_pre_free(struct kmem_cache *s,
b3c34245756adad Jann Horn        2024-08-09  196  						void *object)
b3c34245756adad Jann Horn        2024-08-09  197  {
b3c34245756adad Jann Horn        2024-08-09  198  	if (kasan_enabled())
b3c34245756adad Jann Horn        2024-08-09 @199  		return __kasan_slab_pre_free(s, object, _RET_IP_);
b3c34245756adad Jann Horn        2024-08-09  200  	return false;
b3c34245756adad Jann Horn        2024-08-09  201  }
b3c34245756adad Jann Horn        2024-08-09  202  

:::::: The code at line 199 was first introduced by commit
:::::: b3c34245756adada8a50bdaedbb3965b071c7b0a kasan: catch invalid free before SLUB reinitializes the object

:::::: TO: Jann Horn <jannh@google.com>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
