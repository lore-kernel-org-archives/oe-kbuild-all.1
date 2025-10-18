Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD36CA52
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760803620; cv=none; b=kA7gs2fjfVIE2859s/k+y0dYBliUFNgAneM0fVz2sajD91GoJPS+WaYqAWNQMcTt5V9FR6fEhthUeR+1Me6SSZ3mQkvrxQgdeEYJ5g9lewdpyLQ7/dbvYtfrGESWk4Aqcw400oidR/VCR4iyEaNMmjyGNsEXDG3oKVlxPppaC3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760803620; c=relaxed/simple;
	bh=T5pVb4efS9YeLL5J8KR7nvvVA9Yi1LV/1pCOO0RNGkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eOWJ5CdF7kyJx4vFUjua8OzdxgXggR4zfu+pzRpuPCnaMQYH65orzcdTEnUw372fnar3yDgQCNruSQGvUSXDZxGrq4+sqGq9OGo2vGBsu0NRYBYE4oYoS0Wx+wQKaTiJ5AozJPiaaOVDwXWfRF1O8hnYwLLPFGHzCXYvap8ymqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlLTTcrQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlLTTcrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760803619; x=1792339619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5pVb4efS9YeLL5J8KR7nvvVA9Yi1LV/1pCOO0RNGkw=;
  b=TlLTTcrQkFl+iWP7rBOIpcXA5lrMMUbE9nxD3byhhr5xT5fN4rlff9i1
   ZWJ9bZubw4i/LOF879lRXuDMUaFHbSJnXI9+mYdenRmQf3Ghr2Zr/6IG/
   rs69dlACOKT9FdNts1AisejiEkRMIUz0JHDRl0jDrceTL5Yi0YF8G2ynW
   pLATVKggTtUChDJt9VsEsiIHsP4fSN79NJQsHckClvuG1A/cctneoRO/i
   O4/kbn9HfLKtS+a/+cRx+DoKF2sgSJzrH6TUfF6sxa757ila0DyNH+TlU
   kQXOMkQ4xdLSn4ePEtKH/j1LIRxsvcRA4tI6l0L4+79f4gkm2B3n1UWDo
   g==;
X-CSE-ConnectionGUID: GarzRgd+QiiaHvTpv6gbNw==
X-CSE-MsgGUID: cp5qdpnIQEqufd6bQj22jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63035630"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="63035630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 09:06:58 -0700
X-CSE-ConnectionGUID: 8bW5VzmGSBGD//9G1MgS+g==
X-CSE-MsgGUID: sUrmDik8RM21bjZ0ktOoyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="188062764"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Oct 2025 09:06:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA9SI-0008OD-29;
	Sat, 18 Oct 2025 16:06:54 +0000
Date: Sun, 19 Oct 2025 00:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice-v2 64/74] kernel/rseq.c:453:3: error: cannot
 jump from this asm goto statement to one of its possible targets
Message-ID: <202510182338.HdMkelsT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice-v2
head:   f4c041bf2cba96b2c1b76073cf7f3c97f7d50a79
commit: 9c384f8d51345aded026335237e7698df6c42997 [64/74] rseq: Add fields and constants for time slice extension
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251018/202510182338.HdMkelsT-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510182338.HdMkelsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510182338.HdMkelsT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rseq.c:453:3: error: cannot jump from this asm goto statement to one of its possible targets
                   unsafe_put_user(0UL, &rseq->rseq_cs, efault);
                   ^
   include/linux/uaccess.h:616:2: note: expanded from macro 'unsafe_put_user'
           arch_unsafe_put_user(x, ptr, local_label);      \
           ^
   arch/riscv/include/asm/uaccess.h:464:2: note: expanded from macro 'arch_unsafe_put_user'
           __put_user_nocheck(x, (ptr), label)
           ^
   arch/riscv/include/asm/uaccess.h:321:3: note: expanded from macro '__put_user_nocheck'
                   __put_user_asm("sb", (x), __gu_ptr, label);     \
                   ^
   arch/riscv/include/asm/uaccess.h:282:2: note: expanded from macro '__put_user_asm'
           asm goto(                                               \
           ^
   kernel/rseq.c:465:6: note: possible target of asm goto statement
           if (put_user_masked(rseqfl, &rseq->flags))
               ^
   include/linux/uaccess.h:868:3: note: expanded from macro 'put_user_masked'
                   unsafe_put_user(_val, _tmpdst, efault);         \
                   ^
   include/linux/uaccess.h:618:2: note: expanded from macro 'unsafe_put_user'
           local_label:                                    \
           ^
   kernel/rseq.c:445:2: note: jump exits scope of variable with __attribute__((cleanup))
           scoped_masked_user_write_access(rseq, efault) {
           ^
   include/linux/uaccess.h:807:2: note: expanded from macro 'scoped_masked_user_write_access'
           scoped_masked_user_write_access_size((_udst), sizeof(*(_udst)), _elbl)
           ^
   include/linux/uaccess.h:795:2: note: expanded from macro 'scoped_masked_user_write_access_size'
           __scoped_masked_user_access(write, (_udst),  (_size), _elbl)
           ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
                   for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
                                                            ^
   kernel/rseq.c:465:6: note: jump bypasses initialization of variable with __attribute__((cleanup))
           if (put_user_masked(rseqfl, &rseq->flags))
               ^
   include/linux/uaccess.h:867:2: note: expanded from macro 'put_user_masked'
           scoped_masked_user_write_access(_tmpdst, efault)        \
           ^
   include/linux/uaccess.h:807:2: note: expanded from macro 'scoped_masked_user_write_access'
           scoped_masked_user_write_access_size((_udst), sizeof(*(_udst)), _elbl)
           ^
   include/linux/uaccess.h:795:2: note: expanded from macro 'scoped_masked_user_write_access_size'
           __scoped_masked_user_access(write, (_udst),  (_size), _elbl)
           ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
                   for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
                                                            ^
   kernel/rseq.c:465:6: error: cannot jump from this asm goto statement to one of its possible targets
           if (put_user_masked(rseqfl, &rseq->flags))
               ^
   include/linux/uaccess.h:868:3: note: expanded from macro 'put_user_masked'
                   unsafe_put_user(_val, _tmpdst, efault);         \
                   ^
   include/linux/uaccess.h:616:2: note: expanded from macro 'unsafe_put_user'
           arch_unsafe_put_user(x, ptr, local_label);      \
           ^
   arch/riscv/include/asm/uaccess.h:464:2: note: expanded from macro 'arch_unsafe_put_user'
           __put_user_nocheck(x, (ptr), label)
           ^
   arch/riscv/include/asm/uaccess.h:321:3: note: expanded from macro '__put_user_nocheck'
                   __put_user_asm("sb", (x), __gu_ptr, label);     \
                   ^
   arch/riscv/include/asm/uaccess.h:282:2: note: expanded from macro '__put_user_asm'
           asm goto(                                               \
           ^
   kernel/rseq.c:453:3: note: possible target of asm goto statement
                   unsafe_put_user(0UL, &rseq->rseq_cs, efault);
                   ^
   include/linux/uaccess.h:618:2: note: expanded from macro 'unsafe_put_user'
           local_label:                                    \
           ^
   kernel/rseq.c:465:6: note: jump exits scope of variable with __attribute__((cleanup))
           if (put_user_masked(rseqfl, &rseq->flags))
               ^
   include/linux/uaccess.h:867:2: note: expanded from macro 'put_user_masked'
           scoped_masked_user_write_access(_tmpdst, efault)        \
           ^
   include/linux/uaccess.h:807:2: note: expanded from macro 'scoped_masked_user_write_access'
           scoped_masked_user_write_access_size((_udst), sizeof(*(_udst)), _elbl)
           ^
   include/linux/uaccess.h:795:2: note: expanded from macro 'scoped_masked_user_write_access_size'
           __scoped_masked_user_access(write, (_udst),  (_size), _elbl)
           ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
                   for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
                                                            ^
   kernel/rseq.c:445:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
           scoped_masked_user_write_access(rseq, efault) {
           ^
   include/linux/uaccess.h:807:2: note: expanded from macro 'scoped_masked_user_write_access'
           scoped_masked_user_write_access_size((_udst), sizeof(*(_udst)), _elbl)
           ^
   include/linux/uaccess.h:795:2: note: expanded from macro 'scoped_masked_user_write_access_size'
           __scoped_masked_user_access(write, (_udst),  (_size), _elbl)
           ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
                   for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \


vim +453 kernel/rseq.c

e9c9a765b8fb0a Thomas Gleixner   2025-09-08  386  
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  387  /*
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  388   * sys_rseq - setup restartable sequences for caller thread.
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  389   */
6f095d60071f3d Thomas Gleixner   2025-09-08  390  SYSCALL_DEFINE4(rseq, struct rseq __user *, rseq, u32, rseq_len, int, flags, u32, sig)
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  391  {
9c384f8d51345a Thomas Gleixner   2025-08-09  392  	u32 rseqfl = 0;
9c384f8d51345a Thomas Gleixner   2025-08-09  393  
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  394  	if (flags & RSEQ_FLAG_UNREGISTER) {
66528a4575eee9 Mathieu Desnoyers 2019-12-11  395  		if (flags & ~RSEQ_FLAG_UNREGISTER)
66528a4575eee9 Mathieu Desnoyers 2019-12-11  396  			return -EINVAL;
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  397  		/* Unregister rseq for current thread. */
4f9a6b0406dd22 Thomas Gleixner   2025-09-08  398  		if (current->rseq.usrptr != rseq || !current->rseq.usrptr)
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  399  			return -EINVAL;
4f9a6b0406dd22 Thomas Gleixner   2025-09-08  400  		if (rseq_len != current->rseq.len)
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  401  			return -EINVAL;
4f9a6b0406dd22 Thomas Gleixner   2025-09-08  402  		if (current->rseq.sig != sig)
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  403  			return -EPERM;
e9c9a765b8fb0a Thomas Gleixner   2025-09-08  404  		if (!rseq_reset_ids())
e9c9a765b8fb0a Thomas Gleixner   2025-09-08  405  			return -EFAULT;
4f9a6b0406dd22 Thomas Gleixner   2025-09-08  406  		rseq_reset(current);
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  407  		return 0;
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  408  	}
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  409  
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  410  	if (unlikely(flags))
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  411  		return -EINVAL;
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  412  
4f9a6b0406dd22 Thomas Gleixner   2025-09-08  413  	if (current->rseq.usrptr) {
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  414  		/*
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  415  		 * If rseq is already registered, check whether
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  416  		 * the provided address differs from the prior
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  417  		 * one.
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  418  		 */
4f9a6b0406dd22 Thomas Gleixner   2025-09-08  419  		if (current->rseq.usrptr != rseq || rseq_len != current->rseq.len)
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  420  			return -EINVAL;
4f9a6b0406dd22 Thomas Gleixner   2025-09-08  421  		if (current->rseq.sig != sig)
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  422  			return -EPERM;
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  423  		/* Already registered. */
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  424  		return -EBUSY;
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  425  	}
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  426  
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  427  	/*
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  428  	 * If there was no rseq previously registered, ensure the provided rseq
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  429  	 * is properly aligned, as communcated to user-space through the ELF
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  430  	 * auxiliary vector AT_RSEQ_ALIGN. If rseq_len is the original rseq
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  431  	 * size, the required alignment is the original struct rseq alignment.
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  432  	 *
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  433  	 * In order to be valid, rseq_len is either the original rseq size, or
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  434  	 * large enough to contain all supported fields, as communicated to
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  435  	 * user-space through the ELF auxiliary vector AT_RSEQ_FEATURE_SIZE.
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  436  	 */
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  437  	if (rseq_len < ORIG_RSEQ_SIZE ||
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  438  	    (rseq_len == ORIG_RSEQ_SIZE && !IS_ALIGNED((unsigned long)rseq, ORIG_RSEQ_SIZE)) ||
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  439  	    (rseq_len != ORIG_RSEQ_SIZE && (!IS_ALIGNED((unsigned long)rseq, __alignof__(*rseq)) ||
ee3e3ac05c2631 Mathieu Desnoyers 2022-11-22  440  					    rseq_len < offsetof(struct rseq, end))))
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  441  		return -EINVAL;
96d4f267e40f95 Linus Torvalds    2019-01-03  442  	if (!access_ok(rseq, rseq_len))
d7822b1e24f2df Mathieu Desnoyers 2018-06-02  443  		return -EFAULT;
fd881d0a085fc5 Michael Jeanson   2025-03-06  444  
e9c9a765b8fb0a Thomas Gleixner   2025-09-08  445  	scoped_masked_user_write_access(rseq, efault) {
fd881d0a085fc5 Michael Jeanson   2025-03-06  446  		/*
fd881d0a085fc5 Michael Jeanson   2025-03-06  447  		 * If the rseq_cs pointer is non-NULL on registration, clear it to
fd881d0a085fc5 Michael Jeanson   2025-03-06  448  		 * avoid a potential segfault on return to user-space. The proper thing
fd881d0a085fc5 Michael Jeanson   2025-03-06  449  		 * to do would have been to fail the registration but this would break
fd881d0a085fc5 Michael Jeanson   2025-03-06  450  		 * older libcs that reuse the rseq area for new threads without
6f095d60071f3d Thomas Gleixner   2025-09-08  451  		 * clearing the fields. Don't bother reading it, just reset it.
fd881d0a085fc5 Michael Jeanson   2025-03-06  452  		 */
e9c9a765b8fb0a Thomas Gleixner   2025-09-08 @453  		unsafe_put_user(0UL, &rseq->rseq_cs, efault);

:::::: The code at line 453 was first introduced by commit
:::::: e9c9a765b8fb0aef6b350a2103c9fa3c144fe399 rseq: Provide and use rseq_set_ids()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
