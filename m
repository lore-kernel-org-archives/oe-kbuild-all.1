Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1502592
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 20:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689454688; x=1720990688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Mqwu2IxW2UaP3zgmqUXAP0DHmurSN6c8Z8/cPZtsLk=;
  b=QfVnjCVe5nZT8fERwh2glAgfAXvG49xmZ006IrjIEeT5iT0fgz8HUnmE
   /eUAZbgd5WlE1ysPmhvXn+25p9Zijgwzd6jzjQuiX6wMa7dIjGZs2Gc+y
   ZkCSa5DT7dkLzmiUzY0XwwXgg3aXH3g7ojhJ1rJJdM9j1kvetY75ukgkF
   6n/3smTdOpUKWeFDkoYw0b0RE5gdF1zbq+rG9AjvAyia5OqlC1VHQjKKG
   SfcUWKRDQNnHmxxoF+z51nLUiiEXaVqqO1/d8+W9QQTQfVNDgP74iSIMr
   sdDA/LuPXOc10ywdguMlnui3WHy6ZX/VPOce5l2LFVXMZKrjdwZm3rutH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="350565185"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="350565185"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 13:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="722766511"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="722766511"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Jul 2023 13:58:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKmL7-0008MH-1P;
	Sat, 15 Jul 2023 20:58:05 +0000
Date: Sun, 16 Jul 2023 04:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: drivers/media/usb/uvc/uvc_queue.c:165:9: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202307160417.65ygNVzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   831fe284d8275987596b7d640518dddba5735f61
commit: 93a4fa622eb061f75f87f0cf9609ab4e69c67d01 LoongArch: Add STACKTRACE support
date:   11 months ago
config: loongarch-randconfig-r093-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160417.65ygNVzI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160417.65ygNVzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160417.65ygNVzI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/usb/uvc/uvc_queue.c:165:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/media/usb/uvc/uvc_queue.c:165:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/media/usb/uvc/uvc_queue.c:165:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/media/usb/uvc/uvc_queue.c:165:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/media/usb/uvc/uvc_queue.c:165:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     got int [noderef] __percpu *
>> drivers/media/usb/uvc/uvc_queue.c:165:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     got int [noderef] __percpu *
>> drivers/media/usb/uvc/uvc_queue.c:165:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     got int [noderef] __percpu *
>> drivers/media/usb/uvc/uvc_queue.c:165:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:165:9: sparse:     got int [noderef] __percpu *
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     got unsigned int [noderef] __percpu *
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     got unsigned int [noderef] __percpu *
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     got unsigned int [noderef] __percpu *
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     got unsigned int [noderef] __percpu *
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     got int [noderef] __percpu *
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     got int [noderef] __percpu *
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     got int [noderef] __percpu *
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     expected void *ptr
   drivers/media/usb/uvc/uvc_queue.c:184:9: sparse:     got int [noderef] __percpu *

vim +165 drivers/media/usb/uvc/uvc_queue.c

66847ef013cc4e drivers/media/video/uvc/uvc_queue.c Laurent Pinchart 2011-09-24  158  
a11a03e50b7323 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  159  static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
a11a03e50b7323 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  160  {
a11a03e50b7323 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  161  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
a11a03e50b7323 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  162  	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
ef33d901db3026 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  163  	int ret;
a11a03e50b7323 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  164  
c50c9c1e659d8d drivers/media/usb/uvc/uvc_queue.c   Kieran Bingham   2018-01-03 @165  	lockdep_assert_irqs_enabled();
c50c9c1e659d8d drivers/media/usb/uvc/uvc_queue.c   Kieran Bingham   2018-01-03  166  
a11a03e50b7323 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  167  	queue->buf_used = 0;
a11a03e50b7323 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  168  
571e70dbd42105 drivers/media/usb/uvc/uvc_queue.c   Kieran Bingham   2018-11-05  169  	ret = uvc_video_start_streaming(stream);
ef33d901db3026 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  170  	if (ret == 0)
ef33d901db3026 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  171  		return 0;
ef33d901db3026 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  172  
c50c9c1e659d8d drivers/media/usb/uvc/uvc_queue.c   Kieran Bingham   2018-01-03  173  	spin_lock_irq(&queue->irqlock);
ef33d901db3026 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  174  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
c50c9c1e659d8d drivers/media/usb/uvc/uvc_queue.c   Kieran Bingham   2018-01-03  175  	spin_unlock_irq(&queue->irqlock);
ef33d901db3026 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  176  
ef33d901db3026 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  177  	return ret;
a11a03e50b7323 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  178  }
a11a03e50b7323 drivers/media/usb/uvc/uvc_queue.c   Laurent Pinchart 2014-10-21  179  

:::::: The code at line 165 was first introduced by commit
:::::: c50c9c1e659d8de9c13441f243e7938413be6e71 media: uvcvideo: queue: Simplify spin-lock usage

:::::: TO: Kieran Bingham <kieran.bingham@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
