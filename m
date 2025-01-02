Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D9419993D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735810516; cv=none; b=FrKYYG96E3uwevTxwQ02yGLZUdfX7vCVCT1Ezhp9pcNuKLHe5guPm+9GvxnnBzJFMpTpifQFXnTVCA728+Oacmk145ccjjZ5xLNiO2pmWRXaCJAX/sR8tOCQKgRlyTK/Ns8l27GWwilqjHhIG33Ps47YpvdS8xNYNSg18RckZ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735810516; c=relaxed/simple;
	bh=nuY0XAvEpNskLxfuKqTPfiaYhlbDMCpPo/PuNhROQLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVQ1y8QqfAtxAK+w5GQt/+PBbIH+ngeYbvypj2boowLLd9rh2CMkZwzCoQ8VR2J3SeWNNAhbdUieU4JOIFTFkW+VTJrB1ZtqDIWZXatYLvapYIpfm0b3IL/SbKhFdmAOh3ktSP0ZDC6jSuJJDXL9esd8nkPBglNsquaGDZFjzYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fckVwVxt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fckVwVxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735810514; x=1767346514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nuY0XAvEpNskLxfuKqTPfiaYhlbDMCpPo/PuNhROQLg=;
  b=fckVwVxtlW+6NrcJtytHZ7uwxRarQ7zqRAlGtqzM/dPcSo56g+nc24gf
   kCb8138kPyo3N1GFBS+FRKe7MpPwMBaewtLvczi2FtMASeTVjqGYtyRlk
   dTSNONsGpqn8Qq74J1aAb3jvEtxc0mSaVYq+Z0171iax22No/Lo26/wbe
   Far/WfMOB1U2U4yA9KV1kPq+HJpbnK1gQNjANeriUXnPBxDVcOh7rYluU
   8wOlze0pd/lZlkQrYvw/tuYWkcL/JyyVA/88x8VUM2t8yW/hyT2cVkZh+
   yfjayKqBXDk/a/4YMKcIEdKC2CU9a10PRCFUgbaJzfyKEsmASVRdARKUC
   g==;
X-CSE-ConnectionGUID: BtMOGRrTQuGofTqElk3hEg==
X-CSE-MsgGUID: TjK4fVXjS5uiSXjiqajIuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61416464"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="61416464"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 01:35:13 -0800
X-CSE-ConnectionGUID: WnQ53JI/QZCJih7b4JD8HA==
X-CSE-MsgGUID: CEOGGgnXTQ6sSnH1z0ps1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106509072"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jan 2025 01:35:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTHbi-0008MV-1b;
	Thu, 02 Jan 2025 09:35:10 +0000
Date: Thu, 2 Jan 2025 17:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/prjc-revert-active-balance 9/12]
 kernel/sched/alt_core.c:2234:7: error: call to undeclared function
 '__task_access_lock'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202501021738.akyK92cw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/prjc-revert-active-balance
head:   4a42958cae493501eea276a2926f0d3727193c66
commit: 82b2d2f22a043f81bad8f1738e4ff8b20bdedb0e [9/12] Revert "sched/alt: Introduce alt_topology.c/.h files"
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250102/202501021738.akyK92cw-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021738.akyK92cw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021738.akyK92cw-lkp@intel.com/

All errors (new ones prefixed by >>):

    1787 |         if (ctx->flags & SCA_USER)
         |             ~~~^
   kernel/sched/alt_core.c:1779:55: note: forward declaration of 'struct affinity_context'
    1779 | set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
         |                                                       ^
   kernel/sched/alt_core.c:1788:29: error: incomplete definition of type 'struct affinity_context'
    1788 |                 swap(p->user_cpus_ptr, ctx->user_mask);
         |                                        ~~~^
   include/linux/minmax.h:323:37: note: expanded from macro 'swap'
     323 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                            ^
   kernel/sched/alt_core.c:1779:55: note: forward declaration of 'struct affinity_context'
    1779 | set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
         |                                                       ^
   kernel/sched/alt_core.c:1788:29: error: incomplete definition of type 'struct affinity_context'
    1788 |                 swap(p->user_cpus_ptr, ctx->user_mask);
         |                                        ~~~^
   include/linux/minmax.h:323:42: note: expanded from macro 'swap'
     323 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                 ^
   kernel/sched/alt_core.c:1779:55: note: forward declaration of 'struct affinity_context'
    1779 | set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
         |                                                       ^
   kernel/sched/alt_core.c:1792:53: warning: declaration of 'struct affinity_context' will not be visible outside of this function [-Wvisibility]
    1792 | __do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx)
         |                                                     ^
   kernel/sched/alt_core.c:1795:29: error: incompatible pointer types passing 'struct affinity_context *' to parameter of type 'struct affinity_context *' [-Werror,-Wincompatible-pointer-types]
    1795 |         set_cpus_allowed_common(p, ctx);
         |                                    ^~~
   kernel/sched/alt_core.c:1779:73: note: passing argument to parameter 'ctx' here
    1779 | set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
         |                                                                         ^
   kernel/sched/alt_core.c:1804:26: error: variable has incomplete type 'struct affinity_context'
    1804 |         struct affinity_context ac = {
         |                                 ^
   kernel/sched/alt_core.c:1804:9: note: forward declaration of 'struct affinity_context'
    1804 |         struct affinity_context ac = {
         |                ^
   kernel/sched/alt_core.c:1847:14: error: call to undeclared function 'alloc_user_cpus_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1847 |         user_mask = alloc_user_cpus_ptr(node);
         |                     ^
   kernel/sched/alt_core.c:1847:14: note: did you mean 'dup_user_cpus_ptr'?
   kernel/sched/alt_core.c:1827:5: note: 'dup_user_cpus_ptr' declared here
    1827 | int dup_user_cpus_ptr(struct task_struct *dst, struct task_struct *src,
         |     ^
   kernel/sched/alt_core.c:1847:12: error: incompatible integer to pointer conversion assigning to 'cpumask_t *' (aka 'struct cpumask *') from 'int' [-Wint-conversion]
    1847 |         user_mask = alloc_user_cpus_ptr(node);
         |                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2138:4: error: call to undeclared function '__task_access_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2138 |                         __task_access_unlock(p, lock);
         |                         ^
   kernel/sched/alt_core.c:2138:4: note: did you mean '__task_rq_unlock'?
   kernel/sched/alt_sched.h:413:20: note: '__task_rq_unlock' declared here
     413 | static inline void __task_rq_unlock(struct rq *rq, struct rq_flags *rf)
         |                    ^
   kernel/sched/alt_core.c:2153:2: error: call to undeclared function '__task_access_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2153 |         __task_access_unlock(p, lock);
         |         ^
   kernel/sched/alt_core.c:2159:14: warning: declaration of 'struct affinity_context' will not be visible outside of this function [-Wvisibility]
    2159 |                                          struct affinity_context *ctx,
         |                                                 ^
   kernel/sched/alt_core.c:2184:37: error: incomplete definition of type 'struct affinity_context'
    2184 |         if (!kthread && !cpumask_subset(ctx->new_mask, cpu_allowed_mask)) {
         |                                         ~~~^
   kernel/sched/alt_core.c:2159:14: note: forward declaration of 'struct affinity_context'
    2159 |                                          struct affinity_context *ctx,
         |                                                 ^
   kernel/sched/alt_core.c:2193:10: error: incomplete definition of type 'struct affinity_context'
    2193 |         if ((ctx->flags & SCA_CHECK) && (p->flags & PF_NO_SETAFFINITY)) {
         |              ~~~^
   kernel/sched/alt_core.c:2159:14: note: forward declaration of 'struct affinity_context'
    2159 |                                          struct affinity_context *ctx,
         |                                                 ^
   kernel/sched/alt_core.c:2198:38: error: incomplete definition of type 'struct affinity_context'
    2198 |         if (cpumask_equal(&p->cpus_mask, ctx->new_mask))
         |                                          ~~~^
   kernel/sched/alt_core.c:2159:14: note: forward declaration of 'struct affinity_context'
    2159 |                                          struct affinity_context *ctx,
         |                                                 ^
   kernel/sched/alt_core.c:2201:48: error: incomplete definition of type 'struct affinity_context'
    2201 |         dest_cpu = cpumask_any_and(cpu_valid_mask, ctx->new_mask);
         |                                                    ~~~^
   include/linux/cpumask.h:857:67: note: expanded from macro 'cpumask_any_and'
     857 | #define cpumask_any_and(mask1, mask2) cpumask_first_and((mask1), (mask2))
         |                                                                   ^~~~~
   kernel/sched/alt_core.c:2159:14: note: forward declaration of 'struct affinity_context'
    2159 |                                          struct affinity_context *ctx,
         |                                                 ^
   kernel/sched/alt_core.c:2207:27: error: incompatible pointer types passing 'struct affinity_context *' to parameter of type 'struct affinity_context *' [-Werror,-Wincompatible-pointer-types]
    2207 |         __do_set_cpus_allowed(p, ctx);
         |                                  ^~~
   kernel/sched/alt_core.c:1792:71: note: passing argument to parameter 'ctx' here
    1792 | __do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx)
         |                                                                       ^
   kernel/sched/alt_core.c:2212:2: error: call to undeclared function '__task_access_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2212 |         __task_access_unlock(p, lock);
         |         ^
   kernel/sched/alt_core.c:2227:14: warning: declaration of 'struct affinity_context' will not be visible outside of this function [-Wvisibility]
    2227 |                            struct affinity_context *ctx)
         |                                   ^
>> kernel/sched/alt_core.c:2234:7: error: call to undeclared function '__task_access_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2234 |         rq = __task_access_lock(p, &lock);
         |              ^
   kernel/sched/alt_core.c:2234:7: note: did you mean '__task_rq_lock'?
   kernel/sched/alt_core.c:436:12: note: '__task_rq_lock' declared here
     436 | struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
         |            ^
>> kernel/sched/alt_core.c:2234:5: error: incompatible integer to pointer conversion assigning to 'struct rq *' from 'int' [-Wint-conversion]
    2234 |         rq = __task_access_lock(p, &lock);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   21 warnings and 20 errors generated.


vim +/__task_access_lock +2234 kernel/sched/alt_core.c

42c33da136a07a Alfred Chen 2021-11-02  2217  
54431cbdff3201 Alfred Chen 2019-08-19  2218  /*
42c33da136a07a Alfred Chen 2021-11-02  2219   * Change a given task's CPU affinity. Migrate the thread to a
42c33da136a07a Alfred Chen 2021-11-02  2220   * is removed from the allowed bitmask.
42c33da136a07a Alfred Chen 2021-11-02  2221   *
42c33da136a07a Alfred Chen 2021-11-02  2222   * NOTE: the caller must have a valid reference to the task, the
42c33da136a07a Alfred Chen 2021-11-02  2223   * task must not exit() & deallocate itself prematurely. The
42c33da136a07a Alfred Chen 2021-11-02  2224   * call is not atomic; no spinlocks may be held.
54431cbdff3201 Alfred Chen 2019-08-19  2225   */
fa7474292ee36c Alfred Chen 2024-09-13  2226  int __set_cpus_allowed_ptr(struct task_struct *p,
e1d031511268c3 Alfred Chen 2023-02-04  2227  			   struct affinity_context *ctx)
42c33da136a07a Alfred Chen 2021-11-02  2228  {
42c33da136a07a Alfred Chen 2021-11-02  2229  	unsigned long irq_flags;
42c33da136a07a Alfred Chen 2021-11-02  2230  	struct rq *rq;
42c33da136a07a Alfred Chen 2021-11-02  2231  	raw_spinlock_t *lock;
54431cbdff3201 Alfred Chen 2019-08-19  2232  
42c33da136a07a Alfred Chen 2021-11-02  2233  	raw_spin_lock_irqsave(&p->pi_lock, irq_flags);
42c33da136a07a Alfred Chen 2021-11-02 @2234  	rq = __task_access_lock(p, &lock);
e1af0a21430c91 Alfred Chen 2023-02-04  2235  	/*
e1af0a21430c91 Alfred Chen 2023-02-04  2236  	 * Masking should be skipped if SCA_USER or any of the SCA_MIGRATE_*
e1af0a21430c91 Alfred Chen 2023-02-04  2237  	 * flags are set.
e1af0a21430c91 Alfred Chen 2023-02-04  2238  	 */
e1af0a21430c91 Alfred Chen 2023-02-04  2239  	if (p->user_cpus_ptr &&
e1af0a21430c91 Alfred Chen 2023-02-04  2240  	    !(ctx->flags & SCA_USER) &&
e1af0a21430c91 Alfred Chen 2023-02-04  2241  	    cpumask_and(rq->scratch_mask, ctx->new_mask, p->user_cpus_ptr))
e1af0a21430c91 Alfred Chen 2023-02-04  2242  		ctx->new_mask = rq->scratch_mask;
e1af0a21430c91 Alfred Chen 2023-02-04  2243  
54431cbdff3201 Alfred Chen 2019-08-19  2244  
e1d031511268c3 Alfred Chen 2023-02-04  2245  	return __set_cpus_allowed_ptr_locked(p, ctx, rq, lock, irq_flags);
54431cbdff3201 Alfred Chen 2019-08-19  2246  }
54431cbdff3201 Alfred Chen 2019-08-19  2247  

:::::: The code at line 2234 was first introduced by commit
:::::: 42c33da136a07afee7b556d64565cc3e2c364d76 sched/alt: [Sync] 07ec77a1d4e8 sched: Allow task CPU affinity to be restricted on asymmetric systems

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
