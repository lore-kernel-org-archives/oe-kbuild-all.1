Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B0B2EF67A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 20:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786308948; cv=none; b=Q6sVrZD5jicUlV6sfxBLNJp/3C37nM8YL9jn5oZMosh+5+CmpqLHWkuyjzUizM3fvPlm9BkI6aHMR5A08JXFTlUFC+U+ZLn9miBVgAIqqZKKUXfac8HYMsFIXSL51iHLu18SJs4Vcr9gFFO7s1PG9tQFU0ONAGzjmVYbesyuW+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786308948; c=relaxed/simple;
	bh=ZOhAQtvgsP+VSMdFSapy67wfItiFDTvTf9zEHEQK7wI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ft19XGS8XsVnLJ4fOQ90sh1aCv7nRETmQk5Ka6dlNlVlLL1GHSPgz/2zfJShlbnJysO/tRnvkAnfHRJe1tXgz2FqYWhSCdK45nYcINLq3LDmRgMQliRsVWu8CWnLFD4YIiizyyLfa+w34+DxbbwIKqtHKHOXTePPMIrwDdrveaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDgGqmNh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDgGqmNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786308947; x=1817844947;
  h=date:from:to:cc:subject:message-id;
  bh=ZOhAQtvgsP+VSMdFSapy67wfItiFDTvTf9zEHEQK7wI=;
  b=oDgGqmNhhQa72n0iSYOBFpgZR8rFX0tfxbqiL9ItLo+ouN6qY4bylCjf
   GxZfstnbxjjCAN9oljvdrt03Hd4GlCoyJdRloVAWmh118pJ7KkJHB1N6R
   UpMRs0JIclhEz9ruNZW32AYzbnxsHVRA7fkG5MwfSByEF/Xszsg1ok20E
   5n6ZnIY86rcQKDlmcsMS4hU1BcHIPwcKu1a/aLKTFJDmAx4YSoLkO7xC3
   6RUeWxdfxkkkRkOv1R4ja4KSJp/4LWKE40WQdJ9gNQfWwRMcc114KCu7h
   NV7Iap3179qBdW4YLsu2K1iqjbT1roK4E4ECiFXo0DxaNDolGJ2vl9alu
   Q==;
X-CSE-ConnectionGUID: m3iFDkoHRSSaLxHTfkMNUg==
X-CSE-MsgGUID: BnEPyD1RQTOUQnTUhcu8hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="85796445"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="85796445"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 13:55:46 -0700
X-CSE-ConnectionGUID: OF4anx+uQ/er7v67ENE2TA==
X-CSE-MsgGUID: xoTlttKcQG2kPoOwKepktw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="266720533"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Aug 2026 13:55:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtAYY-00000000MN2-0Pxx;
	Sun, 09 Aug 2026 20:55:42 +0000
Date: Mon, 10 Aug 2026 04:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:bpf-waitq-kthread-reclaim-v1 4/9]
 kernel/bpf/waitq.c:399:3: error: call to undeclared function 'cgroup_put';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202608100344.3gdmsnuK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux bpf-waitq-kthread-reclaim-v1
head:   02201107f4d68e8f9f6b61079f487b1ebf636128
commit: 29b9ec72533a0ecadf4dc6d032b0cffe529bc32c [4/9] bpf: Support cgroup placement for BPF kthreads
config: powerpc64-randconfig-001-20260809 (https://download.01.org/0day-ci/archive/20260810/202608100344.3gdmsnuK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100344.3gdmsnuK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100344.3gdmsnuK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/waitq.c:399:3: error: call to undeclared function 'cgroup_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     399 |                 cgroup_put(cgrp);
         |                 ^
   kernel/bpf/waitq.c:399:3: note: did you mean 'cgroup_init'?
   include/linux/cgroup.h:773:19: note: 'cgroup_init' declared here
     773 | static inline int cgroup_init(void) { return 0; }
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
