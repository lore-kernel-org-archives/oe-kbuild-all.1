Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D352F3ED107
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778085381; cv=none; b=J2VXJVqa5+JNy7KXi/LeCFpdMm0xOpue3zAUqo0feKaXa4MWyNDvMm2/qixH++cvcB9HUvOM8a6s5dVALN47z7RrROZrH9KXMZoj5XZZvGn/drdSPnJ0v0KaiQ+WAyZ0cP06ZGGItM7riNVldhvFn3M+99Hrxzq0ZwY5Qy39SD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778085381; c=relaxed/simple;
	bh=cv0h7cvnjW+czO0vB4tnqEeG6ytESn0xmfF49WdnCH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VNKsrqXfMTcVxTLf5raTz9o3DynI19G/T81i+wQcl8Ea1Ctjy/zEd9rdZFsn4keHfWQo6RCFRzolomAZstd0pQQybgHn4m3xwu2knKTu0CGyQp/aXdGsMLlPJbLu51WM8w6OXqN8ortF/rTyLe5ZRM1ibMtTWG4xMXEPHc3Hluc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVDofN73; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVDofN73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778085380; x=1809621380;
  h=date:from:to:cc:subject:message-id;
  bh=cv0h7cvnjW+czO0vB4tnqEeG6ytESn0xmfF49WdnCH0=;
  b=fVDofN73RWRUPn+Yk0ngt/k2brCUmuPYUQzvTDKeprWdsUdGWJo7SSMF
   zxq9PASc6YBNfNOabXIm1dgh7zTZOpeUvjtoud/ZuCgVCuPZsC40frGiH
   wX/PDP4eKCtbEw/WLnW+txChJVfe/buH9ao14rvt/YTaWJEioYoOD5/4L
   SkzIp98iCKwgEI/DJeEf3c9dHnnZNIOw8//hQMWyYgAffXCE5Q/ErKSP+
   oWJzHJa3FHIsEeSL+w2IcMy/rPJG0ocH10ZuS5Ym4qsxziEVuqjoM7R4i
   iAYJ1koHEk9f3sQI+YmqY2KOLlV9wfKmgrsOsUl1tBbVTUjmZ6jTVGaxk
   Q==;
X-CSE-ConnectionGUID: QvwsaghLSkSQoSNgFllI8Q==
X-CSE-MsgGUID: QnP2A0ixSzm/22J37wRutQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78742670"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78742670"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 09:36:19 -0700
X-CSE-ConnectionGUID: bjv7yCNaQTG6f8GkERvE1A==
X-CSE-MsgGUID: CPx4it/7R1y0bittv+5kXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="233091636"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2026 09:36:17 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKfEN-0000000014H-17uI;
	Wed, 06 May 2026 16:36:15 +0000
Date: Thu, 07 May 2026 00:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: Anuj Gupta <anuj20.g@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Kanchan Joshi <joshi.k@samsung.com>
Subject: [axboe:nvme-raw-queues 5/16]
 drivers/nvme/host/core.c:3900:30: error: 'const struct blk_mq_ops' has no
 member named 'register_queue'; did you mean 'exit_request'?
Message-ID: <202605070037.KyotJYjK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: e85c56d3378904ba7950d8880e93df4f219b058f [5/16] nvme: wire-up register/unregister queue f_op callback
config: powerpc-randconfig-002-20260506 (https://download.01.org/0day-ci/archive/20260507/202605070037.KyotJYjK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070037.KyotJYjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070037.KyotJYjK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c:3893:5: warning: no previous prototype for 'nvme_register_queue' [-Wmissing-prototypes]
    int nvme_register_queue(struct file *file)
        ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c: In function 'nvme_register_queue':
>> drivers/nvme/host/core.c:3900:30: error: 'const struct blk_mq_ops' has no member named 'register_queue'; did you mean 'exit_request'?
     if (q->mq_ops && q->mq_ops->register_queue)
                                 ^~~~~~~~~~~~~~
                                 exit_request
   drivers/nvme/host/core.c:3901:21: error: 'const struct blk_mq_ops' has no member named 'register_queue'; did you mean 'exit_request'?
      return q->mq_ops->register_queue(ns);
                        ^~~~~~~~~~~~~~
                        exit_request
   drivers/nvme/host/core.c: At top level:
   drivers/nvme/host/core.c:3905:5: warning: no previous prototype for 'nvme_unregister_queue' [-Wmissing-prototypes]
    int nvme_unregister_queue(struct file *file, int qid)
        ^~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c: In function 'nvme_unregister_queue':
>> drivers/nvme/host/core.c:3912:28: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
     if (q->mq_ops && q->mq_ops->unregister_queue)
                               ^~
   drivers/nvme/host/core.c:3913:19: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
      return q->mq_ops->unregister_queue(ns, qid);
                      ^~
--
   drivers/nvme/host/ioctl.c: In function 'nvme_ns_head_register_queue':
>> drivers/nvme/host/ioctl.c:785:30: error: 'const struct blk_mq_ops' has no member named 'register_queue'; did you mean 'exit_request'?
     if (q->mq_ops && q->mq_ops->register_queue)
                                 ^~~~~~~~~~~~~~
                                 exit_request
   drivers/nvme/host/ioctl.c:786:20: error: 'const struct blk_mq_ops' has no member named 'register_queue'; did you mean 'exit_request'?
      ret = q->mq_ops->register_queue(ns);
                       ^~~~~~~~~~~~~~
                       exit_request
   drivers/nvme/host/ioctl.c: In function 'nvme_ns_head_unregister_queue':
>> drivers/nvme/host/ioctl.c:809:28: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
     if (q->mq_ops && q->mq_ops->unregister_queue)
                               ^~
   drivers/nvme/host/ioctl.c:810:18: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
      ret = q->mq_ops->unregister_queue(ns, qid);
                     ^~


vim +3900 drivers/nvme/host/core.c

  3892	
  3893	int nvme_register_queue(struct file *file)
  3894	{
  3895		struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
  3896				struct nvme_ns, cdev);
  3897		struct nvme_ctrl *ctrl = ns->ctrl;
  3898		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
  3899	
> 3900		if (q->mq_ops && q->mq_ops->register_queue)
  3901			return q->mq_ops->register_queue(ns);
  3902		return -EINVAL;
  3903	}
  3904	
  3905	int nvme_unregister_queue(struct file *file, int qid)
  3906	{
  3907		struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
  3908				struct nvme_ns, cdev);
  3909		struct nvme_ctrl *ctrl = ns->ctrl;
  3910		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
  3911	
> 3912		if (q->mq_ops && q->mq_ops->unregister_queue)
  3913			return q->mq_ops->unregister_queue(ns, qid);
  3914		return -EINVAL;
  3915	}
  3916	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
