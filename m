Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DA13955CB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 03:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517886; cv=none; b=fl4w2vZxvNp9jicSHopRAS/pwNUEOhAzIKXzUyDk2+ojuGfZLs41nRz1AUIMugGFA8cHdbp/EwYxOSdDSjMvEG1+N4rnJc5HQYdt6gQO/P7EQUtcDeaymQgb6/y6DU0qy/8uN9UC8hMgUA6haOVhlOIV/SOLPA0NHA0hcO/VAag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517886; c=relaxed/simple;
	bh=qEYqpBCbCJ8LxjdfehcjLAqWWvo24ZSR4qXM48nW0g4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CNswlKgIkcl7dTycWwXQwprLCaXo2GH09g/mM9zlonRr6naMXbrGd4FyoJTraniULwTzHVDPO2kRO9VvblVLGAYe+E2bz5znexFZBVpc1VTIt1HCSiV3uQwMRdUqP21RDHdqLZ9DvDld1wB3+4aqhXzANfLc0vPc0ViePjCU1pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmfB8WMM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmfB8WMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791517882; x=1823053882;
  h=date:from:to:cc:subject:message-id;
  bh=qEYqpBCbCJ8LxjdfehcjLAqWWvo24ZSR4qXM48nW0g4=;
  b=kmfB8WMMir3+eGqX36HmQvBm+FwM4UHL/7WTYYixbmW9jVizGqdWBOAG
   5Nd8IoHmUsMw5S9Z6Rd4GjeIdeUwoswaZat+71krwE2IgRc5W+csrRs20
   MDJJqZMZfaQ9R8f+lqagkg4uGb6JmBWJMvUUWourC5/O1RHClQ+gFlEzu
   KV3JE+HtEW/Ui4CcA6iBS5pycdpqWp3DbgKLl+phJ+tEXFc9A7wooraTk
   xHbetJJ+oFB2OXHDAH44kgZ8haQLNFKYzBFiQZiEOnpepQGNLlp71ZvDc
   CgBiSPzVZfE6z9LkyRqmOQ1cxa/apRqj8Fpi1DG7nyFGPxYgFQSsc2s8h
   g==;
X-CSE-ConnectionGUID: q2z7lrERRHalUp1KI/RX+A==
X-CSE-MsgGUID: o4VvsLykSsedSiP754rNxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="321242"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="321242"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 20:51:21 -0700
X-CSE-ConnectionGUID: GqNxriejQMejDWzmWH5hHg==
X-CSE-MsgGUID: dyOMatPsQReGI5d08rY49g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="535033"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Oct 2026 20:51:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF1dd-000000005Gi-2qSs;
	Fri, 09 Oct 2026 03:51:17 +0000
Date: Fri, 09 Oct 2026 11:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 drivers/virtio/virtio_pvclock.c:244:42: error: invalid application of
 'sizeof' to incomplete type 'struct pvclock_vsyscall_time_info'
Message-ID: <202610091108.hyjuJeaf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suleiman,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   4307d952cdef0e45aa82ddde5f6e3b35d84623c6
commit: 5f974515fd4a128e7c07fe36db373f468d31ef36 [4/4] CHROMIUM: virtio-pvclock driver for arm64.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261009/202610091108.hyjuJeaf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091108.hyjuJeaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091108.hyjuJeaf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_pvclock.c:69:6: warning: no previous prototype for 'update_suspend_time' [-Wmissing-prototypes]
      69 | void update_suspend_time(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_pvclock.c: In function 'virtpvclock_probe':
>> drivers/virtio/virtio_pvclock.c:244:42: error: invalid application of 'sizeof' to incomplete type 'struct pvclock_vsyscall_time_info'
     244 |                                    sizeof(*virtio_pvclock_page),
         |                                          ^
   drivers/virtio/virtio_pvclock.c:270:51: error: invalid application of 'sizeof' to incomplete type 'struct pvclock_vsyscall_time_info'
     270 |         dma_free_coherent(vdev->dev.parent, sizeof(*virtio_pvclock_page),
         |                                                   ^
   drivers/virtio/virtio_pvclock.c: In function 'virtpvclock_remove':
   drivers/virtio/virtio_pvclock.c:293:51: error: invalid application of 'sizeof' to incomplete type 'struct pvclock_vsyscall_time_info'
     293 |         dma_free_coherent(vdev->dev.parent, sizeof(*virtio_pvclock_page),
         |                                                   ^


vim +244 drivers/virtio/virtio_pvclock.c

2b1ff8683a4370e Hikaru Nishida   2023-02-28  225  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  226  static int virtpvclock_probe(struct virtio_device *vdev)
2b1ff8683a4370e Hikaru Nishida   2023-02-28  227  {
2b1ff8683a4370e Hikaru Nishida   2023-02-28  228  	struct virtio_pvclock *vp;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  229  	int err;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  230  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  231  	if (!vdev->config->get) {
2b1ff8683a4370e Hikaru Nishida   2023-02-28  232  		dev_err(&vdev->dev, "%s: config access disabled\n", __func__);
2b1ff8683a4370e Hikaru Nishida   2023-02-28  233  		return -EINVAL;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  234  	}
2b1ff8683a4370e Hikaru Nishida   2023-02-28  235  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  236  	vp = kzalloc(sizeof(*vp), GFP_KERNEL);
2b1ff8683a4370e Hikaru Nishida   2023-02-28  237  	if (!vp) {
2b1ff8683a4370e Hikaru Nishida   2023-02-28  238  		err = -ENOMEM;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  239  		goto out;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  240  	}
2b1ff8683a4370e Hikaru Nishida   2023-02-28  241  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  242  	virtio_pvclock_page =
2b1ff8683a4370e Hikaru Nishida   2023-02-28  243  		dma_alloc_coherent(vdev->dev.parent,
2b1ff8683a4370e Hikaru Nishida   2023-02-28 @244  				   sizeof(*virtio_pvclock_page),
2b1ff8683a4370e Hikaru Nishida   2023-02-28  245  				   &vp->pvclock_page_dma_addr, GFP_KERNEL);
2b1ff8683a4370e Hikaru Nishida   2023-02-28  246  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  247  	if (!virtio_pvclock_page) {
2b1ff8683a4370e Hikaru Nishida   2023-02-28  248  		err = -ENOMEM;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  249  		goto out_free_vp;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  250  	}
2b1ff8683a4370e Hikaru Nishida   2023-02-28  251  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  252  	INIT_WORK(&vp->update_suspend_time_work, update_suspend_time);
5f974515fd4a128 Suleiman Souhlal 2024-04-08  253  #ifdef CONFIG_X86
2b1ff8683a4370e Hikaru Nishida   2023-02-28  254  	INIT_WORK(&vp->create_clocksource_work, create_clocksource);
5f974515fd4a128 Suleiman Souhlal 2024-04-08  255  #endif
2b1ff8683a4370e Hikaru Nishida   2023-02-28  256  	mutex_init(&vp->inject_suspend_lock);
2b1ff8683a4370e Hikaru Nishida   2023-02-28  257  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  258  	vp->vdev = vdev;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  259  	vdev->priv = vp;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  260  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  261  	err = init_vqs(vp);
2b1ff8683a4370e Hikaru Nishida   2023-02-28  262  	if (err)
2b1ff8683a4370e Hikaru Nishida   2023-02-28  263  		goto out_free_pvclock_page;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  264  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  265  	virtio_device_ready(vdev);
2b1ff8683a4370e Hikaru Nishida   2023-02-28  266  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  267  	return 0;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  268  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  269  out_free_pvclock_page:
2b1ff8683a4370e Hikaru Nishida   2023-02-28  270  	dma_free_coherent(vdev->dev.parent, sizeof(*virtio_pvclock_page),
2b1ff8683a4370e Hikaru Nishida   2023-02-28  271  			  virtio_pvclock_page, vp->pvclock_page_dma_addr);
2b1ff8683a4370e Hikaru Nishida   2023-02-28  272  
2b1ff8683a4370e Hikaru Nishida   2023-02-28  273  out_free_vp:
2b1ff8683a4370e Hikaru Nishida   2023-02-28  274  	kfree(vp);
2b1ff8683a4370e Hikaru Nishida   2023-02-28  275  out:
2b1ff8683a4370e Hikaru Nishida   2023-02-28  276  	return err;
2b1ff8683a4370e Hikaru Nishida   2023-02-28  277  }
2b1ff8683a4370e Hikaru Nishida   2023-02-28  278  

:::::: The code at line 244 was first introduced by commit
:::::: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 CHROMIUM: virtio_pvclock: port driver impl from Android

:::::: TO: Hikaru Nishida <hikalium@chromium.org>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
