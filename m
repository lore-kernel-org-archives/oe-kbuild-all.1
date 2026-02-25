Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19573D3D07
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772030766; cv=none; b=Jt0QLmiucm9tsTsPa7rPyhqLoKhnhmCgApUCNjvDP3EX5x9piQ5M1WFqAYwW5Pli3h/JFh6uFtIUAuwFT6nfYwMCJaVa3uB9QLaU4jAhb06IlT4K/v57GPM4Yxc/Inw8mWIxY75gxXYu4iuNz6XnUxbd0GmOvq9IgTkPNdXUA2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772030766; c=relaxed/simple;
	bh=Bxoqxl7+Tm83dtEOcuy09uox9vOLP6nS04ljaMJHDkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hvJnU/SCKZF+wN9KNfpTOPQ2nKf/UAsKH2Obtrs4Tz5PLGYK373TLx9FkIh2SKohi9LBsbCEJfT1Yc4iLKHcHR9/hZHhFmTvxw+/RWHj1h4zKFKnbxsg7zeXmBwwT55yudS7VBwAwW8G6DcIUWFJNRdEXus7BxRpPzKeeJngjoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWGh9ANo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWGh9ANo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772030761; x=1803566761;
  h=date:from:to:cc:subject:message-id;
  bh=Bxoqxl7+Tm83dtEOcuy09uox9vOLP6nS04ljaMJHDkQ=;
  b=hWGh9ANo/dMrvPrFRmUqlsmRaWa/AjjbBDY8y7cU0yVftwiOS8wq3I27
   PE3V6ix2fj3PN6gBpMu1unrZePoDCvBOyH/9UCVDPaL6DLQVH3N/SPW08
   +bgO+KnKg+u1/ebGYlGhhYo+HmBvesl8wInzHs+1Fg33qeRCiClvjbo2P
   E28wFdbHKEQUBHGzNr0FQnPQJS56SbmoVlvq/KdI7qgiTLvmSdrke4bb3
   8hrEbrrUL6l3lyKtNl8B/dt8onJAtmutm3Wdjsq/f9inlpRrzYTRL8WLF
   u7He27X0EwUHNJ+WTI66EiWbrm37ZMto6KoWqCycCtxFDge+7ICGYhvCX
   Q==;
X-CSE-ConnectionGUID: Bovdrb2RToKatOA7fgRrrQ==
X-CSE-MsgGUID: 2LzqSItDSr6MWE701tXjXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76903554"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="76903554"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 06:46:01 -0800
X-CSE-ConnectionGUID: k7F2IP57RPGFcsvz76z3pQ==
X-CSE-MsgGUID: bfOilvLURH6g6hskfnRsCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="221251142"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 25 Feb 2026 06:46:00 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvG9F-0000000062v-2Mll;
	Wed, 25 Feb 2026 14:45:57 +0000
Date: Wed, 25 Feb 2026 22:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 0/2]
 drivers/hv/mshv_eventfd.c:509:13: sparse: sparse: restricted __poll_t
 degrades to integer
Message-ID: <202602252215.PUwvNExE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Michael,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   beda5c6eaca4bfa4205f225b28c9d6235cc4fb5d
commit: e020f604abaa6da9b7d579d9d73ffaf37072f520 [0/2] mshv: Store the result of vfs_poll in a variable of type __poll_t
config: x86_64-randconfig-121-20260225 (https://download.01.org/0day-ci/archive/20260225/202602252215.PUwvNExE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602252215.PUwvNExE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602252215.PUwvNExE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hv/mshv_eventfd.c:509:13: sparse: sparse: restricted __poll_t degrades to integer

vim +509 drivers/hv/mshv_eventfd.c

621191d709b148 Nuno Das Neves 2025-03-14  385  
621191d709b148 Nuno Das Neves 2025-03-14  386  static int mshv_irqfd_assign(struct mshv_partition *pt,
621191d709b148 Nuno Das Neves 2025-03-14  387  			     struct mshv_user_irqfd *args)
621191d709b148 Nuno Das Neves 2025-03-14  388  {
621191d709b148 Nuno Das Neves 2025-03-14  389  	struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
621191d709b148 Nuno Das Neves 2025-03-14  390  	struct mshv_irqfd *irqfd, *tmp;
e020f604abaa6d Michael Kelley 2026-01-14  391  	__poll_t events;
621191d709b148 Nuno Das Neves 2025-03-14  392  	int ret;
621191d709b148 Nuno Das Neves 2025-03-14  393  	int idx;
621191d709b148 Nuno Das Neves 2025-03-14  394  
ce23f29e7dfb53 Al Viro        2025-07-12  395  	CLASS(fd, f)(args->fd);
ce23f29e7dfb53 Al Viro        2025-07-12  396  
621191d709b148 Nuno Das Neves 2025-03-14  397  	irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL);
621191d709b148 Nuno Das Neves 2025-03-14  398  	if (!irqfd)
621191d709b148 Nuno Das Neves 2025-03-14  399  		return -ENOMEM;
621191d709b148 Nuno Das Neves 2025-03-14  400  
621191d709b148 Nuno Das Neves 2025-03-14  401  	irqfd->irqfd_partn = pt;
621191d709b148 Nuno Das Neves 2025-03-14  402  	irqfd->irqfd_irqnum = args->gsi;
621191d709b148 Nuno Das Neves 2025-03-14  403  	INIT_WORK(&irqfd->irqfd_shutdown, mshv_irqfd_shutdown);
621191d709b148 Nuno Das Neves 2025-03-14  404  	seqcount_spinlock_init(&irqfd->irqfd_irqe_sc, &pt->pt_irqfds_lock);
621191d709b148 Nuno Das Neves 2025-03-14  405  
ce23f29e7dfb53 Al Viro        2025-07-12  406  	if (fd_empty(f)) {
621191d709b148 Nuno Das Neves 2025-03-14  407  		ret = -EBADF;
621191d709b148 Nuno Das Neves 2025-03-14  408  		goto out;
621191d709b148 Nuno Das Neves 2025-03-14  409  	}
621191d709b148 Nuno Das Neves 2025-03-14  410  
621191d709b148 Nuno Das Neves 2025-03-14  411  	eventfd = eventfd_ctx_fileget(fd_file(f));
621191d709b148 Nuno Das Neves 2025-03-14  412  	if (IS_ERR(eventfd)) {
621191d709b148 Nuno Das Neves 2025-03-14  413  		ret = PTR_ERR(eventfd);
621191d709b148 Nuno Das Neves 2025-03-14  414  		goto fail;
621191d709b148 Nuno Das Neves 2025-03-14  415  	}
621191d709b148 Nuno Das Neves 2025-03-14  416  
621191d709b148 Nuno Das Neves 2025-03-14  417  	irqfd->irqfd_eventfd_ctx = eventfd;
621191d709b148 Nuno Das Neves 2025-03-14  418  
621191d709b148 Nuno Das Neves 2025-03-14  419  	if (args->flags & BIT(MSHV_IRQFD_BIT_RESAMPLE)) {
621191d709b148 Nuno Das Neves 2025-03-14  420  		struct mshv_irqfd_resampler *rp;
621191d709b148 Nuno Das Neves 2025-03-14  421  
621191d709b148 Nuno Das Neves 2025-03-14  422  		resamplefd = eventfd_ctx_fdget(args->resamplefd);
621191d709b148 Nuno Das Neves 2025-03-14  423  		if (IS_ERR(resamplefd)) {
621191d709b148 Nuno Das Neves 2025-03-14  424  			ret = PTR_ERR(resamplefd);
621191d709b148 Nuno Das Neves 2025-03-14  425  			goto fail;
621191d709b148 Nuno Das Neves 2025-03-14  426  		}
621191d709b148 Nuno Das Neves 2025-03-14  427  
621191d709b148 Nuno Das Neves 2025-03-14  428  		irqfd->irqfd_resamplefd = resamplefd;
621191d709b148 Nuno Das Neves 2025-03-14  429  
621191d709b148 Nuno Das Neves 2025-03-14  430  		mutex_lock(&pt->irqfds_resampler_lock);
621191d709b148 Nuno Das Neves 2025-03-14  431  
621191d709b148 Nuno Das Neves 2025-03-14  432  		hlist_for_each_entry(rp, &pt->irqfds_resampler_list,
621191d709b148 Nuno Das Neves 2025-03-14  433  				     rsmplr_hnode) {
621191d709b148 Nuno Das Neves 2025-03-14  434  			if (rp->rsmplr_notifier.irq_ack_gsi ==
621191d709b148 Nuno Das Neves 2025-03-14  435  							 irqfd->irqfd_irqnum) {
621191d709b148 Nuno Das Neves 2025-03-14  436  				irqfd->irqfd_resampler = rp;
621191d709b148 Nuno Das Neves 2025-03-14  437  				break;
621191d709b148 Nuno Das Neves 2025-03-14  438  			}
621191d709b148 Nuno Das Neves 2025-03-14  439  		}
621191d709b148 Nuno Das Neves 2025-03-14  440  
621191d709b148 Nuno Das Neves 2025-03-14  441  		if (!irqfd->irqfd_resampler) {
621191d709b148 Nuno Das Neves 2025-03-14  442  			rp = kzalloc(sizeof(*rp), GFP_KERNEL_ACCOUNT);
621191d709b148 Nuno Das Neves 2025-03-14  443  			if (!rp) {
621191d709b148 Nuno Das Neves 2025-03-14  444  				ret = -ENOMEM;
621191d709b148 Nuno Das Neves 2025-03-14  445  				mutex_unlock(&pt->irqfds_resampler_lock);
621191d709b148 Nuno Das Neves 2025-03-14  446  				goto fail;
621191d709b148 Nuno Das Neves 2025-03-14  447  			}
621191d709b148 Nuno Das Neves 2025-03-14  448  
621191d709b148 Nuno Das Neves 2025-03-14  449  			rp->rsmplr_partn = pt;
621191d709b148 Nuno Das Neves 2025-03-14  450  			INIT_HLIST_HEAD(&rp->rsmplr_irqfd_list);
621191d709b148 Nuno Das Neves 2025-03-14  451  			rp->rsmplr_notifier.irq_ack_gsi = irqfd->irqfd_irqnum;
621191d709b148 Nuno Das Neves 2025-03-14  452  			rp->rsmplr_notifier.irq_acked =
621191d709b148 Nuno Das Neves 2025-03-14  453  						      mshv_irqfd_resampler_ack;
621191d709b148 Nuno Das Neves 2025-03-14  454  
621191d709b148 Nuno Das Neves 2025-03-14  455  			hlist_add_head(&rp->rsmplr_hnode,
621191d709b148 Nuno Das Neves 2025-03-14  456  				       &pt->irqfds_resampler_list);
621191d709b148 Nuno Das Neves 2025-03-14  457  			mshv_register_irq_ack_notifier(pt,
621191d709b148 Nuno Das Neves 2025-03-14  458  						       &rp->rsmplr_notifier);
621191d709b148 Nuno Das Neves 2025-03-14  459  			irqfd->irqfd_resampler = rp;
621191d709b148 Nuno Das Neves 2025-03-14  460  		}
621191d709b148 Nuno Das Neves 2025-03-14  461  
621191d709b148 Nuno Das Neves 2025-03-14  462  		hlist_add_head_rcu(&irqfd->irqfd_resampler_hnode,
621191d709b148 Nuno Das Neves 2025-03-14  463  				   &irqfd->irqfd_resampler->rsmplr_irqfd_list);
621191d709b148 Nuno Das Neves 2025-03-14  464  
621191d709b148 Nuno Das Neves 2025-03-14  465  		mutex_unlock(&pt->irqfds_resampler_lock);
621191d709b148 Nuno Das Neves 2025-03-14  466  	}
621191d709b148 Nuno Das Neves 2025-03-14  467  
621191d709b148 Nuno Das Neves 2025-03-14  468  	/*
621191d709b148 Nuno Das Neves 2025-03-14  469  	 * Install our own custom wake-up handling so we are notified via
621191d709b148 Nuno Das Neves 2025-03-14  470  	 * a callback whenever someone signals the underlying eventfd
621191d709b148 Nuno Das Neves 2025-03-14  471  	 */
621191d709b148 Nuno Das Neves 2025-03-14  472  	init_waitqueue_func_entry(&irqfd->irqfd_wait, mshv_irqfd_wakeup);
621191d709b148 Nuno Das Neves 2025-03-14  473  	init_poll_funcptr(&irqfd->irqfd_polltbl, mshv_irqfd_queue_proc);
621191d709b148 Nuno Das Neves 2025-03-14  474  
621191d709b148 Nuno Das Neves 2025-03-14  475  	spin_lock_irq(&pt->pt_irqfds_lock);
9d70ef7a18e0ec Jinank Jain    2025-11-24  476  #if IS_ENABLED(CONFIG_X86)
621191d709b148 Nuno Das Neves 2025-03-14  477  	if (args->flags & BIT(MSHV_IRQFD_BIT_RESAMPLE) &&
621191d709b148 Nuno Das Neves 2025-03-14  478  	    !irqfd->irqfd_lapic_irq.lapic_control.level_triggered) {
621191d709b148 Nuno Das Neves 2025-03-14  479  		/*
621191d709b148 Nuno Das Neves 2025-03-14  480  		 * Resample Fd must be for level triggered interrupt
621191d709b148 Nuno Das Neves 2025-03-14  481  		 * Otherwise return with failure
621191d709b148 Nuno Das Neves 2025-03-14  482  		 */
621191d709b148 Nuno Das Neves 2025-03-14  483  		spin_unlock_irq(&pt->pt_irqfds_lock);
621191d709b148 Nuno Das Neves 2025-03-14  484  		ret = -EINVAL;
621191d709b148 Nuno Das Neves 2025-03-14  485  		goto fail;
621191d709b148 Nuno Das Neves 2025-03-14  486  	}
9d70ef7a18e0ec Jinank Jain    2025-11-24  487  #endif
621191d709b148 Nuno Das Neves 2025-03-14  488  	ret = 0;
621191d709b148 Nuno Das Neves 2025-03-14  489  	hlist_for_each_entry(tmp, &pt->pt_irqfds_list, irqfd_hnode) {
621191d709b148 Nuno Das Neves 2025-03-14  490  		if (irqfd->irqfd_eventfd_ctx != tmp->irqfd_eventfd_ctx)
621191d709b148 Nuno Das Neves 2025-03-14  491  			continue;
621191d709b148 Nuno Das Neves 2025-03-14  492  		/* This fd is used for another irq already. */
621191d709b148 Nuno Das Neves 2025-03-14  493  		ret = -EBUSY;
621191d709b148 Nuno Das Neves 2025-03-14  494  		spin_unlock_irq(&pt->pt_irqfds_lock);
621191d709b148 Nuno Das Neves 2025-03-14  495  		goto fail;
621191d709b148 Nuno Das Neves 2025-03-14  496  	}
621191d709b148 Nuno Das Neves 2025-03-14  497  
621191d709b148 Nuno Das Neves 2025-03-14  498  	idx = srcu_read_lock(&pt->pt_irq_srcu);
621191d709b148 Nuno Das Neves 2025-03-14  499  	mshv_irqfd_update(pt, irqfd);
621191d709b148 Nuno Das Neves 2025-03-14  500  	hlist_add_head(&irqfd->irqfd_hnode, &pt->pt_irqfds_list);
621191d709b148 Nuno Das Neves 2025-03-14  501  	spin_unlock_irq(&pt->pt_irqfds_lock);
621191d709b148 Nuno Das Neves 2025-03-14  502  
621191d709b148 Nuno Das Neves 2025-03-14  503  	/*
621191d709b148 Nuno Das Neves 2025-03-14  504  	 * Check if there was an event already pending on the eventfd
621191d709b148 Nuno Das Neves 2025-03-14  505  	 * before we registered, and trigger it as if we didn't miss it.
621191d709b148 Nuno Das Neves 2025-03-14  506  	 */
621191d709b148 Nuno Das Neves 2025-03-14  507  	events = vfs_poll(fd_file(f), &irqfd->irqfd_polltbl);
621191d709b148 Nuno Das Neves 2025-03-14  508  
621191d709b148 Nuno Das Neves 2025-03-14 @509  	if (events & POLLIN)
621191d709b148 Nuno Das Neves 2025-03-14  510  		mshv_assert_irq_slow(irqfd);
621191d709b148 Nuno Das Neves 2025-03-14  511  
621191d709b148 Nuno Das Neves 2025-03-14  512  	srcu_read_unlock(&pt->pt_irq_srcu, idx);
621191d709b148 Nuno Das Neves 2025-03-14  513  	return 0;
621191d709b148 Nuno Das Neves 2025-03-14  514  
621191d709b148 Nuno Das Neves 2025-03-14  515  fail:
621191d709b148 Nuno Das Neves 2025-03-14  516  	if (irqfd->irqfd_resampler)
621191d709b148 Nuno Das Neves 2025-03-14  517  		mshv_irqfd_resampler_shutdown(irqfd);
621191d709b148 Nuno Das Neves 2025-03-14  518  
621191d709b148 Nuno Das Neves 2025-03-14  519  	if (resamplefd && !IS_ERR(resamplefd))
621191d709b148 Nuno Das Neves 2025-03-14  520  		eventfd_ctx_put(resamplefd);
621191d709b148 Nuno Das Neves 2025-03-14  521  
621191d709b148 Nuno Das Neves 2025-03-14  522  	if (eventfd && !IS_ERR(eventfd))
621191d709b148 Nuno Das Neves 2025-03-14  523  		eventfd_ctx_put(eventfd);
621191d709b148 Nuno Das Neves 2025-03-14  524  
621191d709b148 Nuno Das Neves 2025-03-14  525  out:
621191d709b148 Nuno Das Neves 2025-03-14  526  	kfree(irqfd);
621191d709b148 Nuno Das Neves 2025-03-14  527  	return ret;
621191d709b148 Nuno Das Neves 2025-03-14  528  }
621191d709b148 Nuno Das Neves 2025-03-14  529  

:::::: The code at line 509 was first introduced by commit
:::::: 621191d709b14882270dfd8ea5d7d6cdfebe2c35 Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs

:::::: TO: Nuno Das Neves <nunodasneves@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
