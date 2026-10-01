Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4D47D951
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 21:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888762; cv=none; b=q2/EGtTxyLKA8PWc5b5tKZGDxEqi+KviTjIIxPYWRfAPTXQcg4aX3auBCOaEZ6GYrgMyq3cGeYJW06dZa4GIaPymXBiFtLYl0rZAnY+tsjihpv6CM0L7P7FRV0+bZN/qAo9XsWM4gNmZCKJm75zRhh3ySjHD3ealF7/tmLFIs+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888762; c=relaxed/simple;
	bh=0iraKcI64pMjBc5nWVPA/YxHJBeHkr5RZ8Mr60j21Nw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LPeuLPdO+udZWNsWI+JnryL+/+rGNF6cs4rbT9GV1UXuCmFdKyFc/x8nqpSC6azUrUKoa4UipgBeeYNodV1VV0N/+kqRf+e6nR3kR6Gv5yp47w1Y3U+/2MnYEADxyueSx59RBUIRhB0c6W5vQU9O5855nwgtQh7Gau/m6ogqTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbwdGKLo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbwdGKLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790888760; x=1822424760;
  h=date:from:to:cc:subject:message-id;
  bh=0iraKcI64pMjBc5nWVPA/YxHJBeHkr5RZ8Mr60j21Nw=;
  b=jbwdGKLosT32y7W6CcaWp7DFBVwhRQ4aPwUwRFrhUhXJc8vs9Uepg7wn
   DsRM4gWDoSMc/9wxORy2EJYdUKdJItz/xkUQ1I+4+1LENW9HzR76W2khU
   J8EwLax3/Yyl9oqxK+6n1IN4Ka/yuq3tn9ETLcsiNrWDBv/5WeIyg9t7h
   /WiCClOAlM5/V6g8/qwQOXobvpHD2QAFYPs56Mg7sy/UM8/SxZ5YcctyS
   7F/lgX3DniahOVbTj9PshvMayRSL1XX3kEnYN+l7+EZTLKDPhMYcHsaal
   U+UtVi2rOP4fWiJtsEyS0giM41NwGVS6/399Th6wai9MsK/wjSjTc1kmb
   A==;
X-CSE-ConnectionGUID: VhJp0w4KSsCRQZfbqIt/KA==
X-CSE-MsgGUID: R4uYT82pREaWgtPiuLG4lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90717820"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90717820"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 14:05:59 -0700
X-CSE-ConnectionGUID: 1y6438r0SoWAODeXHAmmUw==
X-CSE-MsgGUID: DstRgxUhQs6FdCYahTxGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="171933"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 01 Oct 2026 14:05:58 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCNyU-000000000DL-45rC;
	Thu, 01 Oct 2026 21:05:54 +0000
Date: Thu, 01 Oct 2026 23:05:39 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 28/49] kernel/bpf/waitq.c:399:3: error:
 call to undeclared function 'cgroup_put'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202610012324.dzLv0eC7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: d04d9b8149bf42d0f94328586f8e0ee93ed43738 [28/49] bpf: Support cgroup placement for BPF kthreads
config: sparc64-randconfig-2000-20261001 (https://download.01.org/0day-ci/archive/20261001/202610012324.dzLv0eC7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610012324.dzLv0eC7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610012324.dzLv0eC7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/waitq.c:399:3: error: call to undeclared function 'cgroup_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     399 |                 cgroup_put(cgrp);
         |                 ^
   kernel/bpf/waitq.c:399:3: note: did you mean 'cgroup_init'?
   include/linux/cgroup.h:820:19: note: 'cgroup_init' declared here
     820 | static inline int cgroup_init(void) { return 0; }
         |                   ^
   1 error generated.


vim +/cgroup_put +399 kernel/bpf/waitq.c

   311	
   312	__bpf_kfunc int bpf_kthread_create(struct bpf_kthread *kthread, void *p__const_map,
   313					   u64 cgroup_id,
   314					   int (callback_fn)(void *map, int *key, void *value),
   315					   struct bpf_prog_aux *aux)
   316	{
   317		struct bpf_kthread_opaque *opaque = (struct bpf_kthread_opaque *)kthread;
   318		struct bpf_map *map = p__const_map;
   319		struct bpf_kthread_kern *new_kthread;
   320		struct bpf_prog *prog;
   321		struct task_struct *task;
   322		struct cgroup *cgrp = NULL;
   323		int err;
   324	
   325		BUILD_BUG_ON(sizeof(struct bpf_kthread_opaque) > sizeof(struct bpf_kthread));
   326		BUILD_BUG_ON(__alignof__(struct bpf_kthread_opaque) != __alignof__(struct bpf_kthread));
   327	
   328		if (READ_ONCE(opaque->kthread))
   329			return -EBUSY;
   330	
   331		prog = bpf_prog_inc_not_zero(aux->prog);
   332		if (IS_ERR(prog))
   333			return PTR_ERR(prog);
   334	
   335		new_kthread = bpf_map_kzalloc(map, sizeof(*new_kthread), GFP_KERNEL | __GFP_NOWARN);
   336		if (!new_kthread) {
   337			bpf_prog_put(prog);
   338			return -ENOMEM;
   339		}
   340	
   341		new_kthread->map = map;
   342		new_kthread->prog = prog;
   343		new_kthread->callback_fn = callback_fn;
   344		new_kthread->value = (void *)opaque - map->record->kthread_off;
   345		init_completion(&new_kthread->initialized);
   346		spin_lock_init(&new_kthread->lock);
   347		INIT_WORK(&new_kthread->stop_work, bpf_kthread_stop_work);
   348	
   349		if (cgroup_id) {
   350	#ifdef CONFIG_CGROUPS
   351			cgrp = cgroup_get_from_id(cgroup_id);
   352			if (IS_ERR(cgrp)) {
   353				err = PTR_ERR(cgrp);
   354				goto free_kthread;
   355			}
   356			new_kthread->cgrp = cgrp;
   357	#else
   358			err = -EOPNOTSUPP;
   359			goto free_kthread;
   360	#endif
   361		}
   362	
   363		task = kthread_create(bpf_kthread_run, new_kthread, "bpf_kthread/%u", map->id);
   364		if (IS_ERR(task)) {
   365			err = PTR_ERR(task);
   366			goto put_cgroup;
   367		}
   368		get_task_struct(task);
   369		new_kthread->task = task;
   370		if (cgrp) {
   371			wake_up_process(task);
   372			wait_for_completion(&new_kthread->initialized);
   373			err = cgroup_kthread_attach(cgrp, task);
   374			if (err)
   375				goto stop_task;
   376		}
   377	
   378		if (cmpxchg(&opaque->kthread, NULL, new_kthread)) {
   379			err = -EBUSY;
   380			goto stop_task;
   381		}
   382	
   383		/*
   384		 * Order publication against the final map user-reference release. Either
   385		 * release observes the kthread or this side observes a zero user count.
   386		 */
   387		smp_mb();
   388		if (!atomic64_read(&map->usercnt)) {
   389			bpf_kthread_cancel_and_free(opaque);
   390			return -EPERM;
   391		}
   392	
   393		return 0;
   394	
   395	stop_task:
   396		kthread_stop_put(task);
   397	put_cgroup:
   398		if (cgrp)
 > 399			cgroup_put(cgrp);
   400	free_kthread:
   401		bpf_prog_put(prog);
   402		kfree(new_kthread);
   403		return err;
   404	}
   405	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
