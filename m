Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E5F2D3A9E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 22:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765407185; cv=none; b=LilMQlL+ZAk6AW5axfA/galkVVzZZYcBisl6FSU5FDWfsUhX5Yl/tbEh8tS0g+6SKRWT0F3RHjsdbH/6vVJR0ytppNvUUauBWJZ4GMi9ZTtx+GQM7D7iyihqi1UHtz97hpjg9oAulMDSFEsA5DzQA5RrD9M2md+U1l8nX9v6dXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765407185; c=relaxed/simple;
	bh=6GWsfpZ8+7ksxMamrpekZ1VJj9wFn7OKQ4/5sX8wvck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjyGH0NayPXIpigjg/niJ9JaDXSii/tZUcyk+j3eSSohR2N1cYb/bLXQgihRMUTHcB3vssn53i/rYaawbCNXsNTwEeIU4LPKrlZw8cRJmK5BKY9NbQgQ6R9tjMg0e6T/dFQafmdscqn9O8+a6a74jzC4wEo5VRCu5pmwZnUxz2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNYODpzH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNYODpzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765407183; x=1796943183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6GWsfpZ8+7ksxMamrpekZ1VJj9wFn7OKQ4/5sX8wvck=;
  b=LNYODpzHpAokmeP36l2V8gySoN4FVH8ofG/FPUs3WKvwwmNF64Ros8Lq
   Mrv1ujpGxMYVdaNjtjD9E3tpfwtzZE3so9FjTG2+xvUNGG9W6wT6frm1s
   IhSMr8MxUuicuQPfDo6gbvbnsssayLwqo5IfLMbLMOEriCkzV5gbg5lXV
   at1TovQUiOUhLDJPVV/BQSd5Kd/92KbyrtQB/jimpPyRkpMPEMhUPi2Pf
   i9M8/tFGHYxbiCy22Qm8dxgZLSXoU5aWQANqlRqydqC1gxoxB9LlY0EGp
   VuIvjIh/FCGzQw6TQG2JX6hoQTu+9xQTjVMpRiZl+l6iYVKtLsuPmje/0
   Q==;
X-CSE-ConnectionGUID: gGYPtdCcRkGhEKVpJBeT1Q==
X-CSE-MsgGUID: IUryK8RYQFeQ9N13HN7dQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84992632"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84992632"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 14:53:02 -0800
X-CSE-ConnectionGUID: JzUbi9BvSJS9sE34S8LP1g==
X-CSE-MsgGUID: goUU2hznQtyjZ54UTCffkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201728450"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 14:53:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTT3L-000000003qj-0slp;
	Wed, 10 Dec 2025 22:52:59 +0000
Date: Thu, 11 Dec 2025 06:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-03 0/1] fs/userfaultfd.c:771:45:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202512110617.dBZREvHQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-03
head:   47909498d6058ee12b13bdfee22c80b73a979254
commit: 9b613572d6246da9b616f34e4a0e0b5ac74b2dd0 [0/1] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: x86_64-randconfig-123-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110617.dBZREvHQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110617.dBZREvHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110617.dBZREvHQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/userfaultfd.c:757:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct userfaultfd_ctx [noderef] __rcu *ctx @@     got struct userfaultfd_ctx *[assigned] ctx @@
   fs/userfaultfd.c:757:29: sparse:     expected struct userfaultfd_ctx [noderef] __rcu *ctx
   fs/userfaultfd.c:757:29: sparse:     got struct userfaultfd_ctx *[assigned] ctx
>> fs/userfaultfd.c:771:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct userfaultfd_ctx *ctx @@     got struct userfaultfd_ctx [noderef] __rcu *ctx @@
   fs/userfaultfd.c:771:45: sparse:     expected struct userfaultfd_ctx *ctx
   fs/userfaultfd.c:771:45: sparse:     got struct userfaultfd_ctx [noderef] __rcu *ctx
>> fs/userfaultfd.c:1483:64: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct userfaultfd_ctx [noderef] __rcu *ctx @@     got struct userfaultfd_ctx *ctx @@
   fs/userfaultfd.c:1483:64: sparse:     expected struct userfaultfd_ctx [noderef] __rcu *ctx
   fs/userfaultfd.c:1483:64: sparse:     got struct userfaultfd_ctx *ctx

vim +771 fs/userfaultfd.c

893e26e61d04ea Pavel Emelyanov  2017-02-22  744  
72f87654c69690 Pavel Emelyanov  2017-02-22  745  void mremap_userfaultfd_prep(struct vm_area_struct *vma,
72f87654c69690 Pavel Emelyanov  2017-02-22  746  			     struct vm_userfaultfd_ctx *vm_ctx)
72f87654c69690 Pavel Emelyanov  2017-02-22  747  {
72f87654c69690 Pavel Emelyanov  2017-02-22  748  	struct userfaultfd_ctx *ctx;
72f87654c69690 Pavel Emelyanov  2017-02-22  749  
9b613572d6246d Lokesh Gidra     2024-01-16  750  	ctx = rcu_dereference_protected(vma->vm_userfaultfd_ctx.ctx,
9b613572d6246d Lokesh Gidra     2024-01-16  751  					lockdep_is_held(&vma->vm_mm->mmap_lock));
3cfd22be0ad663 Peter Xu         2018-12-28  752  
3cfd22be0ad663 Peter Xu         2018-12-28  753  	if (!ctx)
3cfd22be0ad663 Peter Xu         2018-12-28  754  		return;
3cfd22be0ad663 Peter Xu         2018-12-28  755  
3cfd22be0ad663 Peter Xu         2018-12-28  756  	if (ctx->features & UFFD_FEATURE_EVENT_REMAP) {
72f87654c69690 Pavel Emelyanov  2017-02-22 @757  		vm_ctx->ctx = ctx;
72f87654c69690 Pavel Emelyanov  2017-02-22  758  		userfaultfd_ctx_get(ctx);
a759a909d42d72 Nadav Amit       2021-09-02  759  		atomic_inc(&ctx->mmap_changing);
3cfd22be0ad663 Peter Xu         2018-12-28  760  	} else {
3cfd22be0ad663 Peter Xu         2018-12-28  761  		/* Drop uffd context if remap feature not enabled */
9b613572d6246d Lokesh Gidra     2024-01-16  762  		rcu_assign_pointer(vma->vm_userfaultfd_ctx.ctx, NULL);
7677f7fd8be766 Axel Rasmussen   2021-05-04  763  		vma->vm_flags &= ~__VM_UFFD_FLAGS;
72f87654c69690 Pavel Emelyanov  2017-02-22  764  	}
72f87654c69690 Pavel Emelyanov  2017-02-22  765  }
72f87654c69690 Pavel Emelyanov  2017-02-22  766  
90794bf19dc196 Andrea Arcangeli 2017-02-22  767  void mremap_userfaultfd_complete(struct vm_userfaultfd_ctx *vm_ctx,
72f87654c69690 Pavel Emelyanov  2017-02-22  768  				 unsigned long from, unsigned long to,
72f87654c69690 Pavel Emelyanov  2017-02-22  769  				 unsigned long len)
72f87654c69690 Pavel Emelyanov  2017-02-22  770  {
90794bf19dc196 Andrea Arcangeli 2017-02-22 @771  	struct userfaultfd_ctx *ctx = vm_ctx->ctx;
72f87654c69690 Pavel Emelyanov  2017-02-22  772  	struct userfaultfd_wait_queue ewq;
72f87654c69690 Pavel Emelyanov  2017-02-22  773  
72f87654c69690 Pavel Emelyanov  2017-02-22  774  	if (!ctx)
72f87654c69690 Pavel Emelyanov  2017-02-22  775  		return;
72f87654c69690 Pavel Emelyanov  2017-02-22  776  
72f87654c69690 Pavel Emelyanov  2017-02-22  777  	if (to & ~PAGE_MASK) {
72f87654c69690 Pavel Emelyanov  2017-02-22  778  		userfaultfd_ctx_put(ctx);
72f87654c69690 Pavel Emelyanov  2017-02-22  779  		return;
72f87654c69690 Pavel Emelyanov  2017-02-22  780  	}
72f87654c69690 Pavel Emelyanov  2017-02-22  781  
72f87654c69690 Pavel Emelyanov  2017-02-22  782  	msg_init(&ewq.msg);
72f87654c69690 Pavel Emelyanov  2017-02-22  783  
72f87654c69690 Pavel Emelyanov  2017-02-22  784  	ewq.msg.event = UFFD_EVENT_REMAP;
72f87654c69690 Pavel Emelyanov  2017-02-22  785  	ewq.msg.arg.remap.from = from;
72f87654c69690 Pavel Emelyanov  2017-02-22  786  	ewq.msg.arg.remap.to = to;
72f87654c69690 Pavel Emelyanov  2017-02-22  787  	ewq.msg.arg.remap.len = len;
72f87654c69690 Pavel Emelyanov  2017-02-22  788  
72f87654c69690 Pavel Emelyanov  2017-02-22  789  	userfaultfd_event_wait_completion(ctx, &ewq);
72f87654c69690 Pavel Emelyanov  2017-02-22  790  }
72f87654c69690 Pavel Emelyanov  2017-02-22  791  

:::::: The code at line 771 was first introduced by commit
:::::: 90794bf19dc19691a16b71bcd75c04094d9e392d userfaultfd: non-cooperative: optimize mremap_userfaultfd_complete()

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
