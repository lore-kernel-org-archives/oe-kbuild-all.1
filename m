Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B321834D4F9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 05:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917819; cv=none; b=e/qfd501HjolKFiBw2Cy/ybPdoJeFw77ZfkO5XWlRxywlxjEUzy7Br4qmmnwmmMZD1QxxZyRfbg8iHFDrOgQJLcsqEAYbD9gypHF3bEz3tofm4wpPZJ42Q02glU2FNBlYPA+TbYRGWQRSu8UlRNU2U2+eVZH3ECEpm4k+QUA6GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917819; c=relaxed/simple;
	bh=gBUrbxfCkS2/Y5GoOH6hIJLqou9C29PgqmWSWhOtEto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r4ZwP+gOaFc6C0SezNPV/piPXfmknEo4QVwZPPly5J6KY3e4kICRTe4zf/vW9teDUMwtML4RFN6CWZK78NZJCVLUxQBLDPJPKUiJWRoFstLp8/dxjsoVxb6wt22CcOefrWXNVglYyjEpzIQBix4aZq2y24CcZDz5r9nYPWA2+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeryzKNh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeryzKNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790917818; x=1822453818;
  h=date:from:to:cc:subject:message-id;
  bh=gBUrbxfCkS2/Y5GoOH6hIJLqou9C29PgqmWSWhOtEto=;
  b=YeryzKNhZr8jJ8IzSfUCYB5k9LJqruONwmJasLbiHgAm+vYyDr0HulB8
   dmjohFI19zXC74fD5PnF2fWDYhdzc5OBSNynyKSDdhXWQJnpcVLRSS1Qu
   g5Tga0cHDkY8dHRzKgAqYiM7VD+gQ0cNj/Qsozc6xsJ6XAMjHG7lnncNJ
   uGcoGrmLwvkF6Dsj4hy1IY43x6bs8Sal9t8FLcnXPEWGTCvksmpq3cLK8
   w+EGZoRiz3fyyB9zMh19AEffzOA+WmKoVrkXgu5VpztNyj2YtQpznvOfY
   AkmQ0dMUjiE/7VWFds44eGJxY9PFAZ+oZkEjjCmtgaUS48PG2MtCL4DHn
   Q==;
X-CSE-ConnectionGUID: UbczN4SoRgGjMDhrVuXixg==
X-CSE-MsgGUID: syNapJthR7OhuUQdwnMCLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102208122"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102208122"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 22:10:17 -0700
X-CSE-ConnectionGUID: k1j9Y4AMTLuaWuyhRRtI6w==
X-CSE-MsgGUID: eFcx6OAyRduCPtQ9phqKHQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2026 22:10:15 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCVXB-000000000Pv-1TDZ;
	Fri, 02 Oct 2026 05:10:13 +0000
Date: Fri, 02 Oct 2026 07:09:40 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 28/49] kernel/bpf/waitq.c:399:17: error:
 implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'?
Message-ID: <202610020711.pgNOf135-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: d04d9b8149bf42d0f94328586f8e0ee93ed43738 [28/49] bpf: Support cgroup placement for BPF kthreads
config: csky-randconfig-r2107-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020711.pgNOf135-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020711.pgNOf135-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020711.pgNOf135-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/waitq.c: In function 'bpf_kthread_create':
>> kernel/bpf/waitq.c:399:17: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Wimplicit-function-declaration]
     399 |                 cgroup_put(cgrp);
         |                 ^~~~~~~~~~
         |                 cgroup_init


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
