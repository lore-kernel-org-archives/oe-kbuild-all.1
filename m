Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90C2E1EE0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 04:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037890; cv=none; b=lo51XFk3DEr/gB4PRkJuaSsAf4VVz3EkU1akuxClnhIKDcacaXe6nbVRjBrM+RYlk/jhgExvL3XfmPLMk31aK3uSG9t+/RxFICjtSxVi6hJvh+Bko8D/T9FquwM47gqiE2ioQMfSGr27nBWkVzH+OrZR418NDuQzThmPVLhsxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037890; c=relaxed/simple;
	bh=mCKkbHdbrrx4r2Q/atWT4SD7U31VSu0xBv+5QsbIyQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PDRAy4YPCt1Vfk54/gNKO/NopBGYZHJ2hiuffSUig6cDOCrCIo43QK1D/wgqkVDJClhq/aR3xUXbddlrU7Ly9IB94T0IpdsOw8zBWomVmK3FktfObq4USBaVx+hk2pvzmyGo0FvYTNJSDvtL1xhZfLG8FmMTgGVe+PovUVilhWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/QWr2nM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/QWr2nM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792037889; x=1823573889;
  h=date:from:to:cc:subject:message-id;
  bh=mCKkbHdbrrx4r2Q/atWT4SD7U31VSu0xBv+5QsbIyQA=;
  b=V/QWr2nMsrN6AFO6gT6lXwr9kWVgmIO/ZaEgG6DyZqJJv+yPWZMnqmfx
   mp+NwhdTIXcvw8uPwZjmFQA1FKl3dJzvPqNe+92RHSMGdubapLDXj+SF/
   FklvUupUwMBY8kXmqBE89XhkfLre3KUkPjVn0SnxJQPz0hiD5Wob9PMx6
   B2Clk0x4ktXZt6UFeeGpv1GFG1lryFhpxzS+B5DEAOv4rylyhzEZHMFQO
   vzm49OiSCU0TCS1oepdVJxYA6YuNQqTkQxA0us7VQfK13Njm725HqwOU1
   wFMqgIqcHVrbAT/IQ2A2Lv7Z6Hd26Kmv05Rgl6aSMjs/Zd1YJJlZ6a5cl
   g==;
X-CSE-ConnectionGUID: jFsLZKTGQnWyY5C6axiSRg==
X-CSE-MsgGUID: qlQBVwa1TVWluB5Td4r52Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="680121"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="680121"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 21:18:08 -0700
X-CSE-ConnectionGUID: d/fFYqYpQLa3OZczjOYnxA==
X-CSE-MsgGUID: g2It5+X4QzGOzBP42Nb79Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="3351842"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 14 Oct 2026 21:18:07 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHCuq-00000000BbP-3e2e;
	Thu, 15 Oct 2026 04:18:04 +0000
Date: Thu, 15 Oct 2026 06:17:55 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c:303:12:
 error: call to undeclared function 'eventfd_ctx_fileget'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202610150638.jKucOgAu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yi-De,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   06aabb3c55412104814644e8d1b37df04940d99a
commit: e73a5222e63e1984554773dbc08317f822216f52 [1/1] FROMLIST: virt: geniezone: Add irqfd support
config: arm64-randconfig-r2101-20261015 (https://download.01.org/0day-ci/archive/20261015/202610150638.jKucOgAu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e1354f31346666c78d758cee13692ea3b1fe3ec2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150638.jKucOgAu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150638.jKucOgAu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c:303:12: error: call to undeclared function 'eventfd_ctx_fileget'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     303 |         eventfd = eventfd_ctx_fileget(f.file);
         |                   ^
   arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c:303:12: note: did you mean 'eventfd_ctx_fdget'?
   include/linux/eventfd.h:60:35: note: 'eventfd_ctx_fdget' declared here
      60 | static inline struct eventfd_ctx *eventfd_ctx_fdget(int fd)
         |                                   ^
>> arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c:303:10: error: incompatible integer to pointer conversion assigning to 'struct eventfd_ctx *' from 'int' [-Wint-conversion]
     303 |         eventfd = eventfd_ctx_fileget(f.file);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/eventfd_ctx_fileget +303 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c

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
