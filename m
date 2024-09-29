Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCBC125A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727632007; cv=none; b=TVU+ycw49rSMkKYj++vX7wubIscOdb5zH7P9y3ICFt+NUdmpnGcl3C2XxIIFrv5RsIzVHY4PKB1EotFUcJ/ydEgCr+Fk+9wYKyInFt75FfiXPQnzGAAd/6ovg6m0/4g9wjd4dtxJ4yPYo/OFNR4W7QGFGGg0qlbsmcOaXtVqfG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727632007; c=relaxed/simple;
	bh=G6jhTyq1oJwjeSt15yNq1rY0awiF5StkPtTvEt7gimU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1G5ZBQcCAXE/0zl+EamwIY+cmPvtRsy+hss7Ba46fZVcPHoxOtbQfYkf5/1tFg1m9+tstyCT1+2RLhxrPmOhWgOTAE1v+A+u2iLPlk2tli5pMcfGi6liNREWRPoLh64MKlwhlnJYCTxZ94jSIxvpJnsmQ5Lq051vu1chh8L3VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHr4R9TD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHr4R9TD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727632006; x=1759168006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6jhTyq1oJwjeSt15yNq1rY0awiF5StkPtTvEt7gimU=;
  b=nHr4R9TD3dPLNC8aI443NV311f2JtRZVJmLWGoHYYkZ2Sfd7eFCFkbAZ
   z57iq5TmytAoiWZrdZbW0XXE9DFwX66XYQX7ds04N23u8yyEC6rSFb4jl
   UnTCJbmUdUZuYQQMwyTbbGQUVi4Tg5xyW/AwhmqwJSUQzhI+ajM9BQgZP
   zXrgY9RU3WqOXGcfy0x8f72OvibZJ1ORjQaCuqxmH0byeZvTjsADvvH8p
   olgJ35wvI36yU2rVzgklIBMxEQ/V2Dvjylf1BXI2nxjEfoNnD7lBhewjV
   UWQmvaXY4+luCPVjDvyPq8EKFFLZG1Dkk4c4VCbQBQBPd/sWqsjPqnuCi
   Q==;
X-CSE-ConnectionGUID: ieIU5RUZRHGunHhILuxVZg==
X-CSE-MsgGUID: vrfzwh0AR0m/SO9DXczYlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="49239859"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="49239859"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:46:42 -0700
X-CSE-ConnectionGUID: XfgcW8HBQ7ibCLseGUIcwA==
X-CSE-MsgGUID: iim89dK6SpiYfa/dSSTiUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73391280"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2024 10:46:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suy0F-000OWn-13;
	Sun, 29 Sep 2024 17:46:39 +0000
Date: Mon, 30 Sep 2024 01:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3650/16788]
 drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for function
 'imx_rpmsg_restore'
Message-ID: <202409300114.IXdg2tCk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: a388cfc5b5001e76c8c3b9866d6e9abf44d03c58 [3650/16788] rpmsg: imx_rpmsg: add partition reset notify
config: arm-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240930/202409300114.IXdg2tCk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300114.IXdg2tCk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300114.IXdg2tCk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/rpmsg/imx_rpmsg.c:19:
   In file included from include/linux/virtio_config.h:7:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for function 'imx_rpmsg_restore' [-Wmissing-prototypes]
     371 | void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
         |      ^
   drivers/rpmsg/imx_rpmsg.c:371:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     371 | void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
         | ^
         | static 
   2 warnings generated.


vim +/imx_rpmsg_restore +371 drivers/rpmsg/imx_rpmsg.c

   369	
   370	#ifdef CONFIG_IMX_SCU
 > 371	void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
   372	{
   373		int i;
   374		int vdev_nums = rpdev->vdev_nums;
   375	
   376		for (i = 0; i < vdev_nums; i++) {
   377			unregister_virtio_device(&rpdev->ivdev[i]->vdev);
   378			kfree(rpdev->ivdev[i]);
   379		}
   380	
   381		/* Make a double check that remote processor is ready or not */
   382		for (i = 0; i < REMOTE_READY_WAIT_MAX_RETRIES; i++) {
   383			if (rpdev->flags & REMOTE_IS_READY)
   384				break;
   385			udelay(100);
   386		}
   387		if (unlikely((rpdev->flags & REMOTE_IS_READY) == 0)) {
   388			pr_err("Wait for remote ready timeout, assume it's dead.\n");
   389			/*
   390			 * In order to make the codes to be robust and back compatible.
   391			 * When wait remote ready timeout, use the MU_SendMessageTimeout
   392			 * to send the first kick-off message when register the vdev.
   393			 */
   394			rpdev->first_notify = rpdev->vdev_nums;
   395		}
   396	
   397		/* Allocate and setup ivdev again to register virtio devices */
   398		if (set_vring_phy_buf(rpdev->pdev, rpdev, rpdev->vdev_nums))
   399			pr_err("No vring buffer.\n");
   400	
   401		for (i = 0; i < vdev_nums; i++) {
   402			rpdev->ivdev[i]->vdev.id.device = VIRTIO_ID_RPMSG;
   403			rpdev->ivdev[i]->vdev.config = &imx_rpmsg_config_ops;
   404			rpdev->ivdev[i]->vdev.dev.parent = &rpdev->pdev->dev;
   405			rpdev->ivdev[i]->vdev.dev.release = imx_rpmsg_vproc_release;
   406			rpdev->ivdev[i]->base_vq_id = i * 2;
   407			rpdev->ivdev[i]->rpdev = rpdev;
   408	
   409			if (register_virtio_device(&rpdev->ivdev[i]->vdev))
   410				pr_err("%s failed to register rpdev.\n", __func__);
   411		}
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
