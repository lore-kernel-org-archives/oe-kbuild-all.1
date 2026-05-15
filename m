Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAD03CAA48
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 04:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778819411; cv=none; b=eU1kyi5HL5qv9zf6abgb8Q7td1qzEZYirI9eW9vq0Ccu0tJFYhVLeh4UColzxMHHYz67TDIzDIPN4xnakAgStCwHILEcb/CHqU5VTuYGUap2vpdI/CLAt+tSxKyn/HHsn/8DoA50c61BkejugbPMqyRRSzr5yUSSnLe9Xl7nWy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778819411; c=relaxed/simple;
	bh=eUd3DU7rZ2AzB1GtNRnrIleczROw0Kje9c/AlEq2Dk0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W8+oRBGKl61pARme55AO3KqYhhrWLwSVlnRec1JcHwZbAvgMHjNIloA+fbSt1ZPu9PkSJ+JjykC5qetugao6EN0qgyukwdO+z3+W30JyqAgxnRUnn3riEFfWswjQ1jD8RvtLLkZrLUHPFhSg1qKYCvSfqM7wDoBdOvGsUU0R0pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLhnItDS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLhnItDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778819409; x=1810355409;
  h=date:from:to:cc:subject:message-id;
  bh=eUd3DU7rZ2AzB1GtNRnrIleczROw0Kje9c/AlEq2Dk0=;
  b=VLhnItDSbVfAfST0jsaqfOHHiBF2ZTDlGyKP4DJKgJoEEusQjNeAuMSV
   ebLGFhqd+wpotVRheh3Se5kOtlFjATQJAugJfJPmBJgYTRtD6x+8ls/EE
   K+OOatI7Fw8mk2CrAvItdcZvjtMPNW65jyDDw0zirtH1h2GGQQL6KsXKj
   9r8cXlkEYcVuLBGJTySP6Y2wFGW6Oj00zaos6tt5W0Xn48LB+ouyeZhmH
   lHHU6OTMYaVc+/xI8JWdwizelcEMbuZFq+32DidLIadfBh7/3LssTnhZg
   SVcSGuj4mImEh3JPLcfCtyMS4vu7cZiVVDY8ovHNX60pBC6YzkNdELfDV
   w==;
X-CSE-ConnectionGUID: tO6cl3EeRpi/u8p8Bc0Xsw==
X-CSE-MsgGUID: 4l5w092iRQKx/S2Mkg9QaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78796278"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78796278"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 21:29:41 -0700
X-CSE-ConnectionGUID: +xEosv/qSQG49Mz2WYr/VA==
X-CSE-MsgGUID: LA90ngNbRoaZUGSvra9yUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242923337"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 May 2026 21:29:40 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNkAV-000000000oh-0zCb;
	Fri, 15 May 2026 04:29:10 +0000
Date: Fri, 15 May 2026 12:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 3/3]
 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c:303:19:
 error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean
 'eventfd_ctx_fdget'?
Message-ID: <202605151227.lnwvpRPP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   d6f18f121b7c664094629f6af4d9f43acb7185cc
commit: e73a5222e63e1984554773dbc08317f822216f52 [3/3] FROMLIST: virt: geniezone: Add irqfd support
config: arm64-randconfig-004-20260515 (https://download.01.org/0day-ci/archive/20260515/202605151227.lnwvpRPP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151227.lnwvpRPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151227.lnwvpRPP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c: In function 'gzvm_irqfd_assign':
>> arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c:303:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
     303 |         eventfd = eventfd_ctx_fileget(f.file);
         |                   ^~~~~~~~~~~~~~~~~~~
         |                   eventfd_ctx_fdget
>> arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c:303:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     303 |         eventfd = eventfd_ctx_fileget(f.file);
         |                 ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +303 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c

   276	
   277	static int gzvm_irqfd_assign(struct gzvm *gzvm, struct gzvm_irqfd *args)
   278	{
   279		struct gzvm_kernel_irqfd *irqfd, *tmp;
   280		struct fd f;
   281		struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
   282		int ret;
   283		__poll_t events;
   284		int idx;
   285	
   286		irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL_ACCOUNT);
   287		if (!irqfd)
   288			return -ENOMEM;
   289	
   290		irqfd->gzvm = gzvm;
   291		irqfd->gsi = args->gsi;
   292		irqfd->resampler = NULL;
   293	
   294		INIT_LIST_HEAD(&irqfd->list);
   295		INIT_WORK(&irqfd->shutdown, irqfd_shutdown);
   296	
   297		f = fdget(args->fd);
   298		if (!f.file) {
   299			ret = -EBADF;
   300			goto out;
   301		}
   302	
 > 303		eventfd = eventfd_ctx_fileget(f.file);
   304		if (IS_ERR(eventfd)) {
   305			ret = PTR_ERR(eventfd);
   306			goto fail;
   307		}
   308	
   309		irqfd->eventfd = eventfd;
   310	
   311		if (args->flags & GZVM_IRQFD_FLAG_RESAMPLE) {
   312			struct gzvm_kernel_irqfd_resampler *resampler;
   313	
   314			resamplefd = eventfd_ctx_fdget(args->resamplefd);
   315			if (IS_ERR(resamplefd)) {
   316				ret = PTR_ERR(resamplefd);
   317				goto fail;
   318			}
   319	
   320			irqfd->resamplefd = resamplefd;
   321			INIT_LIST_HEAD(&irqfd->resampler_link);
   322	
   323			mutex_lock(&gzvm->irqfds.resampler_lock);
   324	
   325			list_for_each_entry(resampler,
   326					    &gzvm->irqfds.resampler_list, link) {
   327				if (resampler->notifier.gsi == irqfd->gsi) {
   328					irqfd->resampler = resampler;
   329					break;
   330				}
   331			}
   332	
   333			if (!irqfd->resampler) {
   334				resampler = kzalloc(sizeof(*resampler),
   335						    GFP_KERNEL_ACCOUNT);
   336				if (!resampler) {
   337					ret = -ENOMEM;
   338					mutex_unlock(&gzvm->irqfds.resampler_lock);
   339					goto fail;
   340				}
   341	
   342				resampler->gzvm = gzvm;
   343				INIT_LIST_HEAD(&resampler->list);
   344				resampler->notifier.gsi = irqfd->gsi;
   345				resampler->notifier.irq_acked = irqfd_resampler_ack;
   346				INIT_LIST_HEAD(&resampler->link);
   347	
   348				list_add(&resampler->link, &gzvm->irqfds.resampler_list);
   349				gzvm_register_irq_ack_notifier(gzvm,
   350							       &resampler->notifier);
   351				irqfd->resampler = resampler;
   352			}
   353	
   354			list_add_rcu(&irqfd->resampler_link, &irqfd->resampler->list);
   355			synchronize_srcu(&gzvm->irq_srcu);
   356	
   357			mutex_unlock(&gzvm->irqfds.resampler_lock);
   358		}
   359	
   360		/*
   361		 * Install our own custom wake-up handling so we are notified via
   362		 * a callback whenever someone signals the underlying eventfd
   363		 */
   364		init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
   365		init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
   366	
   367		spin_lock_irq(&gzvm->irqfds.lock);
   368	
   369		ret = 0;
   370		list_for_each_entry(tmp, &gzvm->irqfds.items, list) {
   371			if (irqfd->eventfd != tmp->eventfd)
   372				continue;
   373			/* This fd is used for another irq already. */
   374			pr_err("already used: gsi=%d fd=%d\n", args->gsi, args->fd);
   375			ret = -EBUSY;
   376			spin_unlock_irq(&gzvm->irqfds.lock);
   377			goto fail;
   378		}
   379	
   380		idx = srcu_read_lock(&gzvm->irq_srcu);
   381	
   382		list_add_tail(&irqfd->list, &gzvm->irqfds.items);
   383	
   384		spin_unlock_irq(&gzvm->irqfds.lock);
   385	
   386		/*
   387		 * Check if there was an event already pending on the eventfd
   388		 * before we registered, and trigger it as if we didn't miss it.
   389		 */
   390		events = vfs_poll(f.file, &irqfd->pt);
   391	
   392		/* In case there is already a pending event */
   393		if (events & EPOLLIN)
   394			irqfd_set_spi(gzvm, GZVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID,
   395				      irqfd->gsi, 1, false);
   396	
   397		srcu_read_unlock(&gzvm->irq_srcu, idx);
   398	
   399		/*
   400		 * do not drop the file until the irqfd is fully initialized, otherwise
   401		 * we might race against the EPOLLHUP
   402		 */
   403		fdput(f);
   404		return 0;
   405	
   406	fail:
   407		if (irqfd->resampler)
   408			irqfd_resampler_shutdown(irqfd);
   409	
   410		if (resamplefd && !IS_ERR(resamplefd))
   411			eventfd_ctx_put(resamplefd);
   412	
   413		if (eventfd && !IS_ERR(eventfd))
   414			eventfd_ctx_put(eventfd);
   415	
   416		fdput(f);
   417	
   418	out:
   419		kfree(irqfd);
   420		return ret;
   421	}
   422	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
