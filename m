Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324BA2D2488
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 03:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790479835; cv=none; b=qQT9KEK7Q502/pv3CpCfSg5BxvWpOXqc33xLgNgPPnyc4uQnhUSW6vglCgdCY+ouceIz/TcFi9DUVtiqnc6G38pxCh+jv3TCaay4n8xYX6IgPHosy/IFU5ddrB/7YYxC9N7L2cho5en5Ool1Ltnhr12qS9kqGX8MISNo/yRMStM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790479835; c=relaxed/simple;
	bh=y35JcPp0cx2yukb6388kRl5U6r7uhFWfVSz3CNllOyw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fFW8fL4VOT6MKBidQLj7jlVPI6oErETYBuihRa4jF8B9DDK0rHRIdvbkfJpOmHFmAz6Z22ltQUfiWjlJ4wQ7VpW/WZ8idDuZf8jHnBaqXj4FfmmZuEERCk0i+RnhQgvwDf+Bd479ekTIIrV3/6E6gimz8NS73+X1D4kCeMtMaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZ+ggVfk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZ+ggVfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790479833; x=1822015833;
  h=date:from:to:cc:subject:message-id;
  bh=y35JcPp0cx2yukb6388kRl5U6r7uhFWfVSz3CNllOyw=;
  b=gZ+ggVfkXpX1M11fZnOxQp38K+/EiXSeZdbDfGSLIeqQHFZUukaY+t2K
   JLqJMnnQ7Iw55om5HjmyEXVFXVVHcMV82OLg/SyBpm97R7yk1G+FNYVhi
   7LzRUahZtbc7H6bRGA5T5gTf7I2dNFAqN79c8GqwtAObiRcyGbx5fqFEf
   m9Ol+JBa63dkGQ8SGOtNzoaFPWHQVFD52CoH+9AB34APBNE9a/Aii0tOq
   rtNP1qxO3qSQiNn1QuCEJmykAq+UXqIvDAXO1OjqSprRu5yBTahKW2tyR
   7sZl+QUbBniyaAOn5ihUyyTpABDjWJkxHNIqQnlpiDUKH44y7AGCrxyZq
   A==;
X-CSE-ConnectionGUID: S5aVC3TpTai7bR6+8XP7hg==
X-CSE-MsgGUID: MMZY62t2T4O5E5UmR6VYiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="93930258"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="93930258"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 20:30:32 -0700
X-CSE-ConnectionGUID: L2dFHObUQrm+VvspxWj5fA==
X-CSE-MsgGUID: cLAmdB3bTFG2uBmq+heqJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274242482"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Sep 2026 20:30:31 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAfav-000000000PL-0amX;
	Sun, 27 Sep 2026 03:30:29 +0000
Date: Sun, 27 Sep 2026 05:30:19 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] fs/fuse/dev.c:458:55:
 warning: suggest parentheses around arithmetic in operand of '|'
Message-ID: <202609270535.yD2hHJ16-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5169763275538844ab830145369bb81f14d261d3
commit: aff1917ea969915365f9595cdffba56f1c7ee9c3 [1/1] ANDROID: fuse: Use freezable wait in request_wait_answer to avoid suspend deadlock
config: x86_64-randconfig-2200-20260927 (https://download.01.org/0day-ci/archive/20260927/202609270535.yD2hHJ16-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270535.yD2hHJ16-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270535.yD2hHJ16-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swait.h:8,
                    from include/linux/completion.h:12,
                    from include/linux/mm_types.h:14,
                    from include/linux/bpf.h:16,
                    from include/linux/filter.h:9,
                    from fs/fuse/fuse_i.h:17,
                    from fs/fuse/dev.c:9:
   fs/fuse/dev.c: In function 'request_wait_answer':
>> fs/fuse/dev.c:458:55: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     458 |                                         TASK_KILLABLE | TASK_FREEZABLE);
         |                                                       ^
   include/linux/wait.h:284:11: note: in definition of macro '___wait_is_interruptible'
     284 |          (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
         |           ^~~~~
   include/linux/wait.h:936:9: note: in expansion of macro '___wait_event'
     936 |         ___wait_event(wq, condition, state, 0, 0, schedule())
         |         ^~~~~~~~~~~~~
   include/linux/wait.h:959:25: note: in expansion of macro '__wait_event_state'
     959 |                 __ret = __wait_event_state(wq_head, condition, state);          \
         |                         ^~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:456:23: note: in expansion of macro 'wait_event_state'
     456 |                 err = wait_event_state(req->waitq,
         |                       ^~~~~~~~~~~~~~~~
   fs/fuse/dev.c:482:47: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     482 |                          TASK_UNINTERRUPTIBLE | TASK_FREEZABLE);
         |                                               ^
   include/linux/wait.h:284:11: note: in definition of macro '___wait_is_interruptible'
     284 |          (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
         |           ^~~~~
   include/linux/wait.h:936:9: note: in expansion of macro '___wait_event'
     936 |         ___wait_event(wq, condition, state, 0, 0, schedule())
         |         ^~~~~~~~~~~~~
   include/linux/wait.h:959:25: note: in expansion of macro '__wait_event_state'
     959 |                 __ret = __wait_event_state(wq_head, condition, state);          \
         |                         ^~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:480:9: note: in expansion of macro 'wait_event_state'
     480 |         wait_event_state(req->waitq,
         |         ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_HDA_ALIGNED_MMIO
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +458 fs/fuse/dev.c

   433	
   434	static void request_wait_answer(struct fuse_req *req)
   435	{
   436		struct fuse_conn *fc = req->fm->fc;
   437		struct fuse_iqueue *fiq = &fc->iq;
   438		int err;
   439	
   440		if (!fc->no_interrupt) {
   441			/* Any signal may interrupt this */
   442			err = wait_event_freezable(req->waitq,
   443						test_bit(FR_FINISHED, &req->flags));
   444			if (!err)
   445				return;
   446	
   447			set_bit(FR_INTERRUPTED, &req->flags);
   448			/* matches barrier in fuse_dev_do_read() */
   449			smp_mb__after_atomic();
   450			if (test_bit(FR_SENT, &req->flags))
   451				queue_interrupt(req);
   452		}
   453	
   454		if (!test_bit(FR_FORCE, &req->flags)) {
   455			/* Only fatal signals may interrupt this */
   456			err = wait_event_state(req->waitq,
   457						test_bit(FR_FINISHED, &req->flags),
 > 458						TASK_KILLABLE | TASK_FREEZABLE);
   459			if (!err)
   460				return;
   461	
   462			spin_lock(&fiq->lock);
   463			/* Request is not yet in userspace, bail out */
   464			if (test_bit(FR_PENDING, &req->flags)) {
   465				list_del(&req->list);
   466				spin_unlock(&fiq->lock);
   467				__fuse_put_request(req);
   468				req->out.h.error = -EINTR;
   469				return;
   470			}
   471			spin_unlock(&fiq->lock);
   472		}
   473	
   474		/*
   475		 * Either request is already in userspace, or it was forced.
   476		 * Wait it out using an uninterruptible freezable sleep so system suspend
   477		 * does not deadlock if FuseDaemon is already frozen, while ignoring
   478		 * non-fatal signals.
   479		 */
   480		wait_event_state(req->waitq,
   481				 test_bit(FR_FINISHED, &req->flags),
   482				 TASK_UNINTERRUPTIBLE | TASK_FREEZABLE);
   483	}
   484	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
