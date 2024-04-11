Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3661EA7D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 12:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839114; cv=none; b=s3GQgHCUWyYYIcgrSfmFQubvOuoD4ArLcj8KisE1tAedqCYbMnuaycCSSUibkdyPhLA1bdGYRsvzZkUPcSFD12B8rf83qxXn5BXCUHkwdKiytXIeeueEJjaeq5/4vpQNpWJjM7KgueEyZvWjOfNWxDCnHS+4T2ELmPMtiQZJ+Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839114; c=relaxed/simple;
	bh=12dfACj77iZUvM5Lrnk6ADNauj0ltIqtw/NdG0vfa64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6QMbpSp8rYxTYv3yA0C03ZMcvOHl9RnFJMCKROIB306NKW7KM6kPSTG6iFst2BiobLmW6jx1p1VCzcUgbUPIlCLEuTKw/TrhnoqXCnmVhTt/akc0+i0aTNRy9WKJX60O9rK5PUlOmPUKNX2ocKmcF08OdMX56W9JDyvY9d1kac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFt00sx/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFt00sx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712839113; x=1744375113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=12dfACj77iZUvM5Lrnk6ADNauj0ltIqtw/NdG0vfa64=;
  b=oFt00sx/OVP2y6gu9LkS5y5m+1ijcqkXCWnX5WE20XgD/VefTtBjizdB
   aJSvRLvF4CXfBJi571FBy171dPTc3aOAAnYDHq6lgtw6aIDtLrJzmm9v7
   XEnnZRuKVGhtvfsfeioDwsntv1LIzSOD194J0gGJ0Ir9opzokxpeyG2t+
   RbQA3GCBoTbdP4QgrfQt1q/9B0lOxl5s8e0jp2HvrQELeWSKrD/+CJ81s
   AZ5WePdrNG+EuBYGpGjLmGNI6MA6BAX5T+ixTBP0naQRrjlIL/xeod5zp
   yIjdzi9L9zT89W/7IxHc08NGRGSCIpGh29Qz54T8Z9jIW258BeOt1224L
   g==;
X-CSE-ConnectionGUID: Ghh1nwOuQ8aOKcg7PXik1A==
X-CSE-MsgGUID: vhe9DfCmRGyzBdefgbBhFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19636277"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="19636277"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 05:38:32 -0700
X-CSE-ConnectionGUID: FjVLj2zpT6usUAfZl20wag==
X-CSE-MsgGUID: mkicnaE5RcSfbKnlzggiVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21385954"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2024 05:38:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruthD-0008bp-3D;
	Thu, 11 Apr 2024 12:38:27 +0000
Date: Thu, 11 Apr 2024 20:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 205/415] drivers/misc/cxl/file.c:422:9: error:
 conflicting types for 'afu_read'; have 'ssize_t(struct kiocb *, struct
 iov_iter *)' {aka 'long int(struct kiocb *, struct iov_iter *)'}
Message-ID: <202404112036.511LQJSL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2cdbd541e4481cb9cbd08913e0586dc8a2570aec
commit: 2ff4bdb9c46f5a8cb1b473cd9fa7ca74a1c675d4 [205/415] misc: cxl: convert to read/write iterators
config: powerpc64-randconfig-002-20240411 (https://download.01.org/0day-ci/archive/20240411/202404112036.511LQJSL-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112036.511LQJSL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112036.511LQJSL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/cxl/file.c:422:9: error: conflicting types for 'afu_read'; have 'ssize_t(struct kiocb *, struct iov_iter *)' {aka 'long int(struct kiocb *, struct iov_iter *)'}
     422 | ssize_t afu_read(struct kiocb *iocb, struct iov_iter *to)
         |         ^~~~~~~~
   In file included from drivers/misc/cxl/file.c:23:
   drivers/misc/cxl/cxl.h:1048:9: note: previous declaration of 'afu_read' with type 'ssize_t(struct file *, char *, size_t,  loff_t *)' {aka 'long int(struct file *, char *, long unsigned int,  long long int *)'}
    1048 | ssize_t afu_read(struct file *file, char __user *buf, size_t count, loff_t *off);
         |         ^~~~~~~~
   drivers/misc/cxl/file.c: In function 'afu_read':
>> drivers/misc/cxl/file.c:508:51: error: 'buf' undeclared (first use in this function)
     508 |                 return afu_driver_event_copy(ctx, buf, &event, pl);
         |                                                   ^~~
   drivers/misc/cxl/file.c:508:51: note: each undeclared identifier is reported only once for each function it appears in


vim +422 drivers/misc/cxl/file.c

   421	
 > 422	ssize_t afu_read(struct kiocb *iocb, struct iov_iter *to)
   423	{
   424		struct cxl_context *ctx = iocb->ki_filp->private_data;
   425		struct cxl_event_afu_driver_reserved *pl = NULL;
   426		size_t count = iov_iter_count(to);
   427		struct cxl_event event;
   428		unsigned long flags;
   429		int rc;
   430		DEFINE_WAIT(wait);
   431	
   432		if (!cxl_ops->link_ok(ctx->afu->adapter, ctx->afu))
   433			return -EIO;
   434	
   435		if (count < CXL_READ_MIN_SIZE)
   436			return -EINVAL;
   437	
   438		spin_lock_irqsave(&ctx->lock, flags);
   439	
   440		for (;;) {
   441			prepare_to_wait(&ctx->wq, &wait, TASK_INTERRUPTIBLE);
   442			if (ctx_event_pending(ctx) || (ctx->status == CLOSED))
   443				break;
   444	
   445			if (!cxl_ops->link_ok(ctx->afu->adapter, ctx->afu)) {
   446				rc = -EIO;
   447				goto out;
   448			}
   449	
   450			if (iocb->ki_filp->f_flags & O_NONBLOCK) {
   451				rc = -EAGAIN;
   452				goto out;
   453			}
   454	
   455			if (signal_pending(current)) {
   456				rc = -ERESTARTSYS;
   457				goto out;
   458			}
   459	
   460			spin_unlock_irqrestore(&ctx->lock, flags);
   461			pr_devel("afu_read going to sleep...\n");
   462			schedule();
   463			pr_devel("afu_read woken up\n");
   464			spin_lock_irqsave(&ctx->lock, flags);
   465		}
   466	
   467		finish_wait(&ctx->wq, &wait);
   468	
   469		memset(&event, 0, sizeof(event));
   470		event.header.process_element = ctx->pe;
   471		event.header.size = sizeof(struct cxl_event_header);
   472		if (ctx->afu_driver_ops && atomic_read(&ctx->afu_driver_events)) {
   473			pr_devel("afu_read delivering AFU driver specific event\n");
   474			pl = ctx->afu_driver_ops->fetch_event(ctx);
   475			atomic_dec(&ctx->afu_driver_events);
   476			event.header.type = CXL_EVENT_AFU_DRIVER;
   477		} else if (ctx->pending_irq) {
   478			pr_devel("afu_read delivering AFU interrupt\n");
   479			event.header.size += sizeof(struct cxl_event_afu_interrupt);
   480			event.header.type = CXL_EVENT_AFU_INTERRUPT;
   481			event.irq.irq = find_first_bit(ctx->irq_bitmap, ctx->irq_count) + 1;
   482			clear_bit(event.irq.irq - 1, ctx->irq_bitmap);
   483			if (bitmap_empty(ctx->irq_bitmap, ctx->irq_count))
   484				ctx->pending_irq = false;
   485		} else if (ctx->pending_fault) {
   486			pr_devel("afu_read delivering data storage fault\n");
   487			event.header.size += sizeof(struct cxl_event_data_storage);
   488			event.header.type = CXL_EVENT_DATA_STORAGE;
   489			event.fault.addr = ctx->fault_addr;
   490			event.fault.dsisr = ctx->fault_dsisr;
   491			ctx->pending_fault = false;
   492		} else if (ctx->pending_afu_err) {
   493			pr_devel("afu_read delivering afu error\n");
   494			event.header.size += sizeof(struct cxl_event_afu_error);
   495			event.header.type = CXL_EVENT_AFU_ERROR;
   496			event.afu_error.error = ctx->afu_err;
   497			ctx->pending_afu_err = false;
   498		} else if (ctx->status == CLOSED) {
   499			pr_devel("afu_read fatal error\n");
   500			spin_unlock_irqrestore(&ctx->lock, flags);
   501			return -EIO;
   502		} else
   503			WARN(1, "afu_read must be buggy\n");
   504	
   505		spin_unlock_irqrestore(&ctx->lock, flags);
   506	
   507		if (event.header.type == CXL_EVENT_AFU_DRIVER)
 > 508			return afu_driver_event_copy(ctx, buf, &event, pl);
   509	
   510		if (!copy_to_iter_full(&event, event.header.size, to))
   511			return -EFAULT;
   512		return event.header.size;
   513	
   514	out:
   515		finish_wait(&ctx->wq, &wait);
   516		spin_unlock_irqrestore(&ctx->lock, flags);
   517		return rc;
   518	}
   519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
