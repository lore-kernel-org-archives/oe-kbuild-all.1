Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57493AD51F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 20:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786308950; cv=none; b=KjpLbPmcdrDxWPPkKEC3emCX1f4VBoT+NCWlUAQtr99wcWiQ2RU4lVTCpeLsHM5pT55szOXOFSl4bONxx9CT1nXERkvhHPaO+ihdqiyV3wNCnmnhrnDS7H4tfI5c/FZfwIRT88w0+5fhNAP9e0WFPiblS92YHgdzPPFyOAhQCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786308950; c=relaxed/simple;
	bh=YtrgPWoD0uN7sWbp0mYz0bGfCBFfYcwiaTjBdTAIRBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mks2+LSksVKiJiIodlA0Zm0T3VDjJ1ARvhhmekHryYdCN9UfGZK8FFr5aHyUAPPADqjcWGQ0fpJ+ynv9ZS1VwbBLcdTDrQMI0OuEbZkbVrhmzt1noQSfvEkZ6RXbDPaMQgAUXzx56Ynv8zPjyifIgXIljdERleAjOZCGXVDIWpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPZZVAev; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPZZVAev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786308948; x=1817844948;
  h=date:from:to:cc:subject:message-id;
  bh=YtrgPWoD0uN7sWbp0mYz0bGfCBFfYcwiaTjBdTAIRBY=;
  b=QPZZVAevflWJapEb+XrgZXMlGqJeToc1xYTpQCeR3sCOKheJQDV7J5Ee
   rnCz5sFjOJ6sxsDKLK3gNo6QI30uRYWL2lTUqD1I5/x0SWk34XIAZcms/
   Px8NjtzykqmGUYhcb5srIc9CcVKdxMsVX3qAOfZ7cNeW8mZi/MpkJ7OI+
   LVgGtdZ6tyS4xGtmVfyY98rQiDX2ItEpN9GTOL12xjRmMNuqcy8R5uTN7
   zcN680uqU7Y8XNiFlfhdXLckmN9jhUcjD3iSlM2lB1Sc2zYc8O6qIv19b
   7mNtTsA2FF+pQgQw48HvvvlaUiude+Zmk2Ltr5F70YsAe/xPXQj4k35ix
   Q==;
X-CSE-ConnectionGUID: RFmsWWO2TE+1GoifJyHk6Q==
X-CSE-MsgGUID: MSb0TJrKSkWJj5pX5M5rBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86902000"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="86902000"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 13:55:46 -0700
X-CSE-ConnectionGUID: VTiDdnq3QZ+rXbwjW6R7Uw==
X-CSE-MsgGUID: 9uIgtd0PSC6Cj5YN9ekZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="261125270"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2026 13:55:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtAYY-00000000MN5-10mD;
	Sun, 09 Aug 2026 20:55:42 +0000
Date: Mon, 10 Aug 2026 04:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:bpf-waitq-kthread-reclaim-v1 4/9]
 kernel/bpf/waitq.c:399:3: error: implicit declaration of function
 'cgroup_put'; did you mean 'cgroup_init'?
Message-ID: <202608100339.vLRNRUj6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux bpf-waitq-kthread-reclaim-v1
head:   02201107f4d68e8f9f6b61079f487b1ebf636128
commit: 29b9ec72533a0ecadf4dc6d032b0cffe529bc32c [4/9] bpf: Support cgroup placement for BPF kthreads
config: arm-randconfig-001-20260809 (https://download.01.org/0day-ci/archive/20260810/202608100339.vLRNRUj6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100339.vLRNRUj6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100339.vLRNRUj6-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/waitq.c: In function 'bpf_kthread_create':
>> kernel/bpf/waitq.c:399:3: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
      cgroup_put(cgrp);
      ^~~~~~~~~~
      cgroup_init
   cc1: some warnings being treated as errors


vim +399 kernel/bpf/waitq.c

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
