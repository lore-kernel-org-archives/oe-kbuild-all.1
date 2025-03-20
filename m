Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA415A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742501884; cv=none; b=laAGMkg//kDtHxi2iBHw3Ctju+5l0Oflb8CcPAijFmjIJJXvmCJ+onw6Kfbsx4kYG6AC27s3QJZjWwORPdM9CN7Pixe/ivUqtiy/CA9fEKya9uN9KYwJVxA3N8Ar0Kii1uYEffefO96NXZmvBz7SBMYESeHdIe2Nh2lM3PI/bpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742501884; c=relaxed/simple;
	bh=UVjM8zcKv5IoRW6pxuNzsWKqkU48PCdUCDeGWhaFVCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fx5+OYFFOfAwvOdYKB0hQsiXku5U/NBua7M2M28vSg8l4pVL452J/TwZxtzl9/k27qLImCSTTbvgK3oelFlsxfqgVlafSAg7b9YMeRvO1j8CR7uTczmxOQRiZrxJmbu56/zsOtMHa5hmEpE4n7Xsc8NHNiB72PtmnJEmLQF3xyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdQNo2Ro; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdQNo2Ro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742501882; x=1774037882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UVjM8zcKv5IoRW6pxuNzsWKqkU48PCdUCDeGWhaFVCg=;
  b=HdQNo2RoZVZ7tpFar+BUtypKbDQ5fLZQYAenRTLpglKvq++qx/akqgmC
   PBy28hxPlpKB01NM0uS4o4qEnv/tw06I6pJAeyOhmkcyl2W3hEPDiK8oJ
   ErP3Rtq3RMH58WvnAynogxJ4X4MHGnkajPyPtUqbkHAkiUwUVt0vOji1C
   99UJPCCNtTyGO+KWwhWZV1d66enKvFrhZwU/JSZXXcixxoniAmOd3xsMz
   Z7cLMbuK0s6ePv6QSOmFtnMKsYEGeuSm9gcdltnbmR92nkgqlZe8pCasC
   yFQrCd3Ey6SiCeVe3WGIQE5xHowXD0vzVTlngOpk/O+hc74RzUs8f2ESo
   A==;
X-CSE-ConnectionGUID: H3Y/IP+gRBWea/aMx4qe/A==
X-CSE-MsgGUID: r2ox8e8MTgi7BQPn27s3FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47531304"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="47531304"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 13:18:02 -0700
X-CSE-ConnectionGUID: BvRUvGj0SLSA+4IM+osAIQ==
X-CSE-MsgGUID: kvmR6c1MQ/OljvCJtmaZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="127355403"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Mar 2025 13:17:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvMKz-0000kJ-1a;
	Thu, 20 Mar 2025 20:17:57 +0000
Date: Fri, 21 Mar 2025 04:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
	Jinank Jain <jinankjain@microsoft.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Muminul Islam <muislam@microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>
Subject: [linux-next:master 12013/12769] drivers/hv/mshv_eventfd.c:399:19:
 error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean
 'eventfd_ctx_fdget'?
Message-ID: <202503210422.6u1LLUSg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73b8c1dbc2508188e383023080ce6a582ff5f279
commit: f5288d14069b6580405b6f0d1c4ccd45c7ac97bf [12013/12769] Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
config: x86_64-randconfig-076-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210422.6u1LLUSg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210422.6u1LLUSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210422.6u1LLUSg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/hv/mshv_eventfd.c: In function 'mshv_irqfd_assign':
>> drivers/hv/mshv_eventfd.c:399:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
     399 |         eventfd = eventfd_ctx_fileget(fd_file(f));
         |                   ^~~~~~~~~~~~~~~~~~~
         |                   eventfd_ctx_fdget
>> drivers/hv/mshv_eventfd.c:399:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     399 |         eventfd = eventfd_ctx_fileget(fd_file(f));
         |                 ^
   cc1: some warnings being treated as errors


vim +399 drivers/hv/mshv_eventfd.c

   373	
   374	static int mshv_irqfd_assign(struct mshv_partition *pt,
   375				     struct mshv_user_irqfd *args)
   376	{
   377		struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
   378		struct mshv_irqfd *irqfd, *tmp;
   379		unsigned int events;
   380		struct fd f;
   381		int ret;
   382		int idx;
   383	
   384		irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL);
   385		if (!irqfd)
   386			return -ENOMEM;
   387	
   388		irqfd->irqfd_partn = pt;
   389		irqfd->irqfd_irqnum = args->gsi;
   390		INIT_WORK(&irqfd->irqfd_shutdown, mshv_irqfd_shutdown);
   391		seqcount_spinlock_init(&irqfd->irqfd_irqe_sc, &pt->pt_irqfds_lock);
   392	
   393		f = fdget(args->fd);
   394		if (!fd_file(f)) {
   395			ret = -EBADF;
   396			goto out;
   397		}
   398	
 > 399		eventfd = eventfd_ctx_fileget(fd_file(f));
   400		if (IS_ERR(eventfd)) {
   401			ret = PTR_ERR(eventfd);
   402			goto fail;
   403		}
   404	
   405		irqfd->irqfd_eventfd_ctx = eventfd;
   406	
   407		if (args->flags & BIT(MSHV_IRQFD_BIT_RESAMPLE)) {
   408			struct mshv_irqfd_resampler *rp;
   409	
   410			resamplefd = eventfd_ctx_fdget(args->resamplefd);
   411			if (IS_ERR(resamplefd)) {
   412				ret = PTR_ERR(resamplefd);
   413				goto fail;
   414			}
   415	
   416			irqfd->irqfd_resamplefd = resamplefd;
   417	
   418			mutex_lock(&pt->irqfds_resampler_lock);
   419	
   420			hlist_for_each_entry(rp, &pt->irqfds_resampler_list,
   421					     rsmplr_hnode) {
   422				if (rp->rsmplr_notifier.irq_ack_gsi ==
   423								 irqfd->irqfd_irqnum) {
   424					irqfd->irqfd_resampler = rp;
   425					break;
   426				}
   427			}
   428	
   429			if (!irqfd->irqfd_resampler) {
   430				rp = kzalloc(sizeof(*rp), GFP_KERNEL_ACCOUNT);
   431				if (!rp) {
   432					ret = -ENOMEM;
   433					mutex_unlock(&pt->irqfds_resampler_lock);
   434					goto fail;
   435				}
   436	
   437				rp->rsmplr_partn = pt;
   438				INIT_HLIST_HEAD(&rp->rsmplr_irqfd_list);
   439				rp->rsmplr_notifier.irq_ack_gsi = irqfd->irqfd_irqnum;
   440				rp->rsmplr_notifier.irq_acked =
   441							      mshv_irqfd_resampler_ack;
   442	
   443				hlist_add_head(&rp->rsmplr_hnode,
   444					       &pt->irqfds_resampler_list);
   445				mshv_register_irq_ack_notifier(pt,
   446							       &rp->rsmplr_notifier);
   447				irqfd->irqfd_resampler = rp;
   448			}
   449	
   450			hlist_add_head_rcu(&irqfd->irqfd_resampler_hnode,
   451					   &irqfd->irqfd_resampler->rsmplr_irqfd_list);
   452	
   453			mutex_unlock(&pt->irqfds_resampler_lock);
   454		}
   455	
   456		/*
   457		 * Install our own custom wake-up handling so we are notified via
   458		 * a callback whenever someone signals the underlying eventfd
   459		 */
   460		init_waitqueue_func_entry(&irqfd->irqfd_wait, mshv_irqfd_wakeup);
   461		init_poll_funcptr(&irqfd->irqfd_polltbl, mshv_irqfd_queue_proc);
   462	
   463		spin_lock_irq(&pt->pt_irqfds_lock);
   464		if (args->flags & BIT(MSHV_IRQFD_BIT_RESAMPLE) &&
   465		    !irqfd->irqfd_lapic_irq.lapic_control.level_triggered) {
   466			/*
   467			 * Resample Fd must be for level triggered interrupt
   468			 * Otherwise return with failure
   469			 */
   470			spin_unlock_irq(&pt->pt_irqfds_lock);
   471			ret = -EINVAL;
   472			goto fail;
   473		}
   474		ret = 0;
   475		hlist_for_each_entry(tmp, &pt->pt_irqfds_list, irqfd_hnode) {
   476			if (irqfd->irqfd_eventfd_ctx != tmp->irqfd_eventfd_ctx)
   477				continue;
   478			/* This fd is used for another irq already. */
   479			ret = -EBUSY;
   480			spin_unlock_irq(&pt->pt_irqfds_lock);
   481			goto fail;
   482		}
   483	
   484		idx = srcu_read_lock(&pt->pt_irq_srcu);
   485		mshv_irqfd_update(pt, irqfd);
   486		hlist_add_head(&irqfd->irqfd_hnode, &pt->pt_irqfds_list);
   487		spin_unlock_irq(&pt->pt_irqfds_lock);
   488	
   489		/*
   490		 * Check if there was an event already pending on the eventfd
   491		 * before we registered, and trigger it as if we didn't miss it.
   492		 */
   493		events = vfs_poll(fd_file(f), &irqfd->irqfd_polltbl);
   494	
   495		if (events & POLLIN)
   496			mshv_assert_irq_slow(irqfd);
   497	
   498		srcu_read_unlock(&pt->pt_irq_srcu, idx);
   499		/*
   500		 * do not drop the file until the irqfd is fully initialized, otherwise
   501		 * we might race against the POLLHUP
   502		 */
   503		fdput(f);
   504	
   505		return 0;
   506	
   507	fail:
   508		if (irqfd->irqfd_resampler)
   509			mshv_irqfd_resampler_shutdown(irqfd);
   510	
   511		if (resamplefd && !IS_ERR(resamplefd))
   512			eventfd_ctx_put(resamplefd);
   513	
   514		if (eventfd && !IS_ERR(eventfd))
   515			eventfd_ctx_put(eventfd);
   516	
   517		fdput(f);
   518	
   519	out:
   520		kfree(irqfd);
   521		return ret;
   522	}
   523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
