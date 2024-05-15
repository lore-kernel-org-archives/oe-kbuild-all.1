Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B114136AF5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715750127; cv=none; b=mCmjE2/D4hkppOxOMeVv2F0oqwS1TJdDn0j7W838fE/TnlUp71VHuiNewkANjAIYkzpDzIp3DG/XnhMy9MkH7B0Kp7kaAeehkAIDdneZJjKkkJBjMwlXYSLFqUS6ieSFX2Wf60FC/JZ2s2UaWRzENkcMNLuVHF3gAhmcMWiO0Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715750127; c=relaxed/simple;
	bh=i2kznJ8JYHXV/892BCIFVionKOlAmS63377TM0HNFuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bDc5YQYg5WDKXJ5MCAjkB3eRAWINKA1UasNdwKfSBfUdYIBKS2QSsmMuB+POGyrs9/ScNotm9coWIQImBH1wu6lwsj30r5BaHQVvQOWvHC6m1sQFWehSDAVxfKilaqnWRXsAsbWKEy6YA4wLgfGtJi7G81jJdDFTy/9JDnAiVs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WawMKncT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WawMKncT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715750125; x=1747286125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2kznJ8JYHXV/892BCIFVionKOlAmS63377TM0HNFuo=;
  b=WawMKncTxKt6MX6m6Sob+xun5sPazm2oqwKIF8WpzABYjuyu4UXNpV4L
   b5jdU7tM84M6R5dFq++RxMfoiSyKujqqYO5aEhQ0C74C0tRxWDrWMFXQ3
   sujlahBqQN0VyXYnIQGAzzwDOXH8nEdeSo/lCcrYHE8gI+pnKUBxEnjuI
   cDOZJzv/GrJjYJ5GoXru1S5zJZTa7cQFCjahj5eN7x7p+nkNA5KQvtNy0
   BjP/CuekOpIAxP1ghOBitvJ6h02atXSj4QGRjUnyLJG+l7+xL380pCzKz
   TT239AEQ6Ev5ScysVAJheC39J/8N2ryKrWvUfAA6hQPaTSI9wlgSiARzG
   w==;
X-CSE-ConnectionGUID: uyYSnZiqQTGT8jG85vElaA==
X-CSE-MsgGUID: 6sb6zqZRQRyB5Xs9dwgf+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11632648"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="11632648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 22:15:24 -0700
X-CSE-ConnectionGUID: Q+MYupQjS0mu2+uOVZ60ZQ==
X-CSE-MsgGUID: JZZ5WxF/TheZqKRIYNgkPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="35823043"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 May 2024 22:15:24 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s76z3-000CTM-1M;
	Wed, 15 May 2024 05:15:21 +0000
Date: Wed, 15 May 2024 13:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 15/16]
 drivers/virtio/virtio_pvclock.c:244:42: error: invalid application of
 'sizeof' to incomplete type 'struct pvclock_vsyscall_time_info'
Message-ID: <202405151339.waKKeTDO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   161aa0ad82f4cbd233d93470dbc4d33da26e8c5a
commit: 5f974515fd4a128e7c07fe36db373f468d31ef36 [15/16] CHROMIUM: virtio-pvclock driver for arm64.
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240515/202405151339.waKKeTDO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405151339.waKKeTDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151339.waKKeTDO-lkp@intel.com/

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

2b1ff8683a4370 Hikaru Nishida   2023-02-28  225  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  226  static int virtpvclock_probe(struct virtio_device *vdev)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  227  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  228  	struct virtio_pvclock *vp;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  229  	int err;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  230  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  231  	if (!vdev->config->get) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  232  		dev_err(&vdev->dev, "%s: config access disabled\n", __func__);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  233  		return -EINVAL;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  234  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28  235  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  236  	vp = kzalloc(sizeof(*vp), GFP_KERNEL);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  237  	if (!vp) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  238  		err = -ENOMEM;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  239  		goto out;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  240  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28  241  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  242  	virtio_pvclock_page =
2b1ff8683a4370 Hikaru Nishida   2023-02-28  243  		dma_alloc_coherent(vdev->dev.parent,
2b1ff8683a4370 Hikaru Nishida   2023-02-28 @244  				   sizeof(*virtio_pvclock_page),
2b1ff8683a4370 Hikaru Nishida   2023-02-28  245  				   &vp->pvclock_page_dma_addr, GFP_KERNEL);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  246  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  247  	if (!virtio_pvclock_page) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  248  		err = -ENOMEM;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  249  		goto out_free_vp;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  250  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28  251  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  252  	INIT_WORK(&vp->update_suspend_time_work, update_suspend_time);
5f974515fd4a12 Suleiman Souhlal 2024-04-08  253  #ifdef CONFIG_X86
2b1ff8683a4370 Hikaru Nishida   2023-02-28  254  	INIT_WORK(&vp->create_clocksource_work, create_clocksource);
5f974515fd4a12 Suleiman Souhlal 2024-04-08  255  #endif
2b1ff8683a4370 Hikaru Nishida   2023-02-28  256  	mutex_init(&vp->inject_suspend_lock);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  257  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  258  	vp->vdev = vdev;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  259  	vdev->priv = vp;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  260  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  261  	err = init_vqs(vp);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  262  	if (err)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  263  		goto out_free_pvclock_page;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  264  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  265  	virtio_device_ready(vdev);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  266  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  267  	return 0;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  268  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  269  out_free_pvclock_page:
2b1ff8683a4370 Hikaru Nishida   2023-02-28  270  	dma_free_coherent(vdev->dev.parent, sizeof(*virtio_pvclock_page),
2b1ff8683a4370 Hikaru Nishida   2023-02-28  271  			  virtio_pvclock_page, vp->pvclock_page_dma_addr);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  272  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  273  out_free_vp:
2b1ff8683a4370 Hikaru Nishida   2023-02-28  274  	kfree(vp);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  275  out:
2b1ff8683a4370 Hikaru Nishida   2023-02-28  276  	return err;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  277  }
2b1ff8683a4370 Hikaru Nishida   2023-02-28  278  

:::::: The code at line 244 was first introduced by commit
:::::: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 CHROMIUM: virtio_pvclock: port driver impl from Android

:::::: TO: Hikaru Nishida <hikalium@chromium.org>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
