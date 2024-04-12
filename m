Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64370152198
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 22:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712960498; cv=none; b=u4bEOJRJYawnmdRm2kCwokZzhEpgHRybG+qYXKqHT9ugRPbsiGA10p5FZn3QiVK5q2SgNo0uKtThshTDjmqjr3TSy/+jYBvQaHFMJkoxha98HgSRTt50RdGDs6IJULoqk811AJK6X+Iyg9guyzcEflUiItGE+dg9a8EKuWoHuqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712960498; c=relaxed/simple;
	bh=QiaEUQ5wlSnQxLia7xH9ohfhW1HRHwfUzMHrWmfkuvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0RJjYI16KZOmokNYpZqqJ7auXNivPcA/dM0Ovzgz/9j8A0dmwsTRhdQNTQK2723FDE0i0qY5zHQRsvnWIGFIHBvk37Et8L1B9zwKkHDXXZik5Z+0B2aoTyhnarXTUQGzWLDOSqoVO3fR6RFiPaD5jsdGwBCvy4h6iNQ6QLSpps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbkE9Db9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbkE9Db9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712960496; x=1744496496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QiaEUQ5wlSnQxLia7xH9ohfhW1HRHwfUzMHrWmfkuvU=;
  b=AbkE9Db99zDe7speyYoMo+7ihYCVRUtM7Y4mp6u3rbWemn+JvYKnpJ34
   ivGp0gmRtgnJaEpg7TI2dCFNqGb/DGvSd3mTZNlfBGgK14OG6nybLWBKs
   Ifzee8JB9M5/3E95kxk3tBwhrLbpiKE5UoIX9h2511cb8eWlwxPilTUtr
   x6OsiIZBJCvMm+cN9AitillTY0uTLPspCSn1VT6RuQIF6SigzK7csAzKZ
   BphN9b4RnqgzM9HUwGJmESX1u0dE7uFn7mboRSWd+5WFsX5oFA/2MQG3g
   38DudStEWihWrWVyr0EKwNJdsMR8lfnzEf5259UBMwhztuVUs0NL+pvWY
   w==;
X-CSE-ConnectionGUID: mH5niFttTVacGmRw8MX5Ig==
X-CSE-MsgGUID: kMzbaLvXTbOgSMN3CDdX1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8294372"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8294372"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 15:21:35 -0700
X-CSE-ConnectionGUID: DsA/Bz1JTEadibNPpXfAqw==
X-CSE-MsgGUID: L9Kl7rvNTwGMFVC0xdhBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="26146563"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Apr 2024 15:21:35 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvPH1-0000rd-33;
	Fri, 12 Apr 2024 22:21:31 +0000
Date: Sat, 13 Apr 2024 06:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 197/438] drivers/scsi/cxlflash/ocxl_hw.c:1014:
 warning: Function parameter or struct member 'iocb' not described in
 'afu_read'
Message-ID: <202404130624.vkHegAF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   320301899c4ff72871d71dd55bebea97f4a3a63e
commit: 2b4def6e7f6304d899e6880b27d8c3bd37339691 [197/438] scsi: cxlflash: convert to read/write iterators
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240413/202404130624.vkHegAF8-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130624.vkHegAF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404130624.vkHegAF8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/cxlflash/ocxl_hw.c:1014: warning: Function parameter or struct member 'iocb' not described in 'afu_read'
>> drivers/scsi/cxlflash/ocxl_hw.c:1014: warning: Function parameter or struct member 'to' not described in 'afu_read'
>> drivers/scsi/cxlflash/ocxl_hw.c:1014: warning: Excess function parameter 'file' description in 'afu_read'
>> drivers/scsi/cxlflash/ocxl_hw.c:1014: warning: Excess function parameter 'buf' description in 'afu_read'
>> drivers/scsi/cxlflash/ocxl_hw.c:1014: warning: Excess function parameter 'count' description in 'afu_read'
>> drivers/scsi/cxlflash/ocxl_hw.c:1014: warning: Excess function parameter 'off' description in 'afu_read'


vim +1014 drivers/scsi/cxlflash/ocxl_hw.c

56f1db1a2a0c1b Uma Krishnan 2018-03-26  1003  
03aa9c519c1699 Uma Krishnan 2018-03-26  1004  /**
03aa9c519c1699 Uma Krishnan 2018-03-26  1005   * afu_read() - perform a read on the context for any event
03aa9c519c1699 Uma Krishnan 2018-03-26  1006   * @file:	File associated with the adapter context.
03aa9c519c1699 Uma Krishnan 2018-03-26  1007   * @buf:	Buffer to receive the data.
03aa9c519c1699 Uma Krishnan 2018-03-26  1008   * @count:	Size of buffer (maximum bytes that can be read).
03aa9c519c1699 Uma Krishnan 2018-03-26  1009   * @off:	Offset.
03aa9c519c1699 Uma Krishnan 2018-03-26  1010   *
03aa9c519c1699 Uma Krishnan 2018-03-26  1011   * Return: size of the data read on success, -errno on failure
03aa9c519c1699 Uma Krishnan 2018-03-26  1012   */
2b4def6e7f6304 Jens Axboe   2024-04-09  1013  static ssize_t afu_read(struct kiocb *iocb, struct iov_iter *to)
03aa9c519c1699 Uma Krishnan 2018-03-26 @1014  {
2b4def6e7f6304 Jens Axboe   2024-04-09  1015  	struct ocxlflash_context *ctx = iocb->ki_filp->private_data;
03aa9c519c1699 Uma Krishnan 2018-03-26  1016  	struct device *dev = ctx->hw_afu->dev;
03aa9c519c1699 Uma Krishnan 2018-03-26  1017  	struct cxl_event event;
03aa9c519c1699 Uma Krishnan 2018-03-26  1018  	ulong lock_flags;
03aa9c519c1699 Uma Krishnan 2018-03-26  1019  	ssize_t esize;
03aa9c519c1699 Uma Krishnan 2018-03-26  1020  	ssize_t rc;
03aa9c519c1699 Uma Krishnan 2018-03-26  1021  	int bit;
03aa9c519c1699 Uma Krishnan 2018-03-26  1022  	DEFINE_WAIT(event_wait);
03aa9c519c1699 Uma Krishnan 2018-03-26  1023  
2b4def6e7f6304 Jens Axboe   2024-04-09  1024  	if (iocb->ki_pos != 0) {
03aa9c519c1699 Uma Krishnan 2018-03-26  1025  		dev_err(dev, "%s: Non-zero offset not supported, off=%lld\n",
2b4def6e7f6304 Jens Axboe   2024-04-09  1026  			__func__, iocb->ki_pos);
03aa9c519c1699 Uma Krishnan 2018-03-26  1027  		rc = -EINVAL;
03aa9c519c1699 Uma Krishnan 2018-03-26  1028  		goto out;
03aa9c519c1699 Uma Krishnan 2018-03-26  1029  	}
03aa9c519c1699 Uma Krishnan 2018-03-26  1030  
03aa9c519c1699 Uma Krishnan 2018-03-26  1031  	spin_lock_irqsave(&ctx->slock, lock_flags);
03aa9c519c1699 Uma Krishnan 2018-03-26  1032  
03aa9c519c1699 Uma Krishnan 2018-03-26  1033  	for (;;) {
03aa9c519c1699 Uma Krishnan 2018-03-26  1034  		prepare_to_wait(&ctx->wq, &event_wait, TASK_INTERRUPTIBLE);
03aa9c519c1699 Uma Krishnan 2018-03-26  1035  
f81face7256339 Uma Krishnan 2018-03-26  1036  		if (ctx_event_pending(ctx) || (ctx->state == CLOSED))
03aa9c519c1699 Uma Krishnan 2018-03-26  1037  			break;
03aa9c519c1699 Uma Krishnan 2018-03-26  1038  
2b4def6e7f6304 Jens Axboe   2024-04-09  1039  		if (iocb->ki_filp->f_flags & O_NONBLOCK) {
03aa9c519c1699 Uma Krishnan 2018-03-26  1040  			dev_err(dev, "%s: File cannot be blocked on I/O\n",
03aa9c519c1699 Uma Krishnan 2018-03-26  1041  				__func__);
03aa9c519c1699 Uma Krishnan 2018-03-26  1042  			rc = -EAGAIN;
03aa9c519c1699 Uma Krishnan 2018-03-26  1043  			goto err;
03aa9c519c1699 Uma Krishnan 2018-03-26  1044  		}
03aa9c519c1699 Uma Krishnan 2018-03-26  1045  
03aa9c519c1699 Uma Krishnan 2018-03-26  1046  		if (signal_pending(current)) {
03aa9c519c1699 Uma Krishnan 2018-03-26  1047  			dev_err(dev, "%s: Signal pending on the process\n",
03aa9c519c1699 Uma Krishnan 2018-03-26  1048  				__func__);
03aa9c519c1699 Uma Krishnan 2018-03-26  1049  			rc = -ERESTARTSYS;
03aa9c519c1699 Uma Krishnan 2018-03-26  1050  			goto err;
03aa9c519c1699 Uma Krishnan 2018-03-26  1051  		}
03aa9c519c1699 Uma Krishnan 2018-03-26  1052  
03aa9c519c1699 Uma Krishnan 2018-03-26  1053  		spin_unlock_irqrestore(&ctx->slock, lock_flags);
03aa9c519c1699 Uma Krishnan 2018-03-26  1054  		schedule();
03aa9c519c1699 Uma Krishnan 2018-03-26  1055  		spin_lock_irqsave(&ctx->slock, lock_flags);
03aa9c519c1699 Uma Krishnan 2018-03-26  1056  	}
03aa9c519c1699 Uma Krishnan 2018-03-26  1057  
03aa9c519c1699 Uma Krishnan 2018-03-26  1058  	finish_wait(&ctx->wq, &event_wait);
03aa9c519c1699 Uma Krishnan 2018-03-26  1059  
03aa9c519c1699 Uma Krishnan 2018-03-26  1060  	memset(&event, 0, sizeof(event));
03aa9c519c1699 Uma Krishnan 2018-03-26  1061  	event.header.process_element = ctx->pe;
03aa9c519c1699 Uma Krishnan 2018-03-26  1062  	event.header.size = sizeof(struct cxl_event_header);
03aa9c519c1699 Uma Krishnan 2018-03-26  1063  	if (ctx->pending_irq) {
03aa9c519c1699 Uma Krishnan 2018-03-26  1064  		esize = sizeof(struct cxl_event_afu_interrupt);
03aa9c519c1699 Uma Krishnan 2018-03-26  1065  		event.header.size += esize;
03aa9c519c1699 Uma Krishnan 2018-03-26  1066  		event.header.type = CXL_EVENT_AFU_INTERRUPT;
03aa9c519c1699 Uma Krishnan 2018-03-26  1067  
03aa9c519c1699 Uma Krishnan 2018-03-26  1068  		bit = find_first_bit(&ctx->irq_bitmap, ctx->num_irqs);
03aa9c519c1699 Uma Krishnan 2018-03-26  1069  		clear_bit(bit, &ctx->irq_bitmap);
03aa9c519c1699 Uma Krishnan 2018-03-26  1070  		event.irq.irq = bit + 1;
03aa9c519c1699 Uma Krishnan 2018-03-26  1071  		if (bitmap_empty(&ctx->irq_bitmap, ctx->num_irqs))
03aa9c519c1699 Uma Krishnan 2018-03-26  1072  			ctx->pending_irq = false;
66ae644b922abc Uma Krishnan 2018-03-26  1073  	} else if (ctx->pending_fault) {
66ae644b922abc Uma Krishnan 2018-03-26  1074  		event.header.size += sizeof(struct cxl_event_data_storage);
66ae644b922abc Uma Krishnan 2018-03-26  1075  		event.header.type = CXL_EVENT_DATA_STORAGE;
66ae644b922abc Uma Krishnan 2018-03-26  1076  		event.fault.addr = ctx->fault_addr;
66ae644b922abc Uma Krishnan 2018-03-26  1077  		event.fault.dsisr = ctx->fault_dsisr;
66ae644b922abc Uma Krishnan 2018-03-26  1078  		ctx->pending_fault = false;
03aa9c519c1699 Uma Krishnan 2018-03-26  1079  	}
03aa9c519c1699 Uma Krishnan 2018-03-26  1080  
03aa9c519c1699 Uma Krishnan 2018-03-26  1081  	spin_unlock_irqrestore(&ctx->slock, lock_flags);
03aa9c519c1699 Uma Krishnan 2018-03-26  1082  
2b4def6e7f6304 Jens Axboe   2024-04-09  1083  	if (!copy_to_iter_full(&event, event.header.size, to)) {
03aa9c519c1699 Uma Krishnan 2018-03-26  1084  		dev_err(dev, "%s: copy_to_user failed\n", __func__);
03aa9c519c1699 Uma Krishnan 2018-03-26  1085  		rc = -EFAULT;
03aa9c519c1699 Uma Krishnan 2018-03-26  1086  		goto out;
03aa9c519c1699 Uma Krishnan 2018-03-26  1087  	}
03aa9c519c1699 Uma Krishnan 2018-03-26  1088  
03aa9c519c1699 Uma Krishnan 2018-03-26  1089  	rc = event.header.size;
03aa9c519c1699 Uma Krishnan 2018-03-26  1090  out:
03aa9c519c1699 Uma Krishnan 2018-03-26  1091  	return rc;
03aa9c519c1699 Uma Krishnan 2018-03-26  1092  err:
03aa9c519c1699 Uma Krishnan 2018-03-26  1093  	finish_wait(&ctx->wq, &event_wait);
03aa9c519c1699 Uma Krishnan 2018-03-26  1094  	spin_unlock_irqrestore(&ctx->slock, lock_flags);
03aa9c519c1699 Uma Krishnan 2018-03-26  1095  	goto out;
03aa9c519c1699 Uma Krishnan 2018-03-26  1096  }
03aa9c519c1699 Uma Krishnan 2018-03-26  1097  

:::::: The code at line 1014 was first introduced by commit
:::::: 03aa9c519c1699e027bfa6ce76b999025d05f2c3 scsi: cxlflash: Support adapter context reading

:::::: TO: Uma Krishnan <ukrishn@linux.vnet.ibm.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
