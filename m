Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252611804A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727623177; cv=none; b=oFeWPGKipSYSbv0XGiWlDMGpbh0o//v6/0c5+OKqvWKRmTZ0VfpVLIyyBwA9uULFSJMNVtSXmKuwQVvSI7RMsg3Q2q1jKhyoWNoSeODgDv7eW7W7Vi8/7hgXSTuIzSf9HBbdQiFbb0kumiSB2lpwtsb9l2swzeVGTEJ0jwG12qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727623177; c=relaxed/simple;
	bh=aNIB3oPL+PHxpwfln8V4m/Iff5mj6I4gbmBivG44t/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHHCb72OEkhZCeWMpxvNQo3UsV1SdgXESvIacmk+71HwT0meRODEIyCFiZZQccJqfUueqyzFCuz6wUBg7B3ISiKbsyMUXmotX3Njb8DJIjs5Bq6Ra2ccYhBIM0LJjmvugdkBiyvik19mYqYrY7O64jqAIZ9owoP0uUg2zh5pSto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F11svbm8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F11svbm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727623176; x=1759159176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNIB3oPL+PHxpwfln8V4m/Iff5mj6I4gbmBivG44t/c=;
  b=F11svbm8Ojwpw6BIp+iiTk9Wa1hcyWUaBvkOVW0fKKMd+2OeB9eKgov0
   fTwusWAEUVPJPSXjyz8yNxfKbyYzDJ8dkz9ISyTiR2IOwRCqrrYtgSW9Y
   LmztFgzeWOd2ny9YVKHlvVXndyIM3GOlz+pHWSjWDUUvkfDyOx0YrCsTx
   j3sBG5R0fHYZW1N7UZupYTIczOIR7w+AbbFmmZKu6fjE2HEi94o9EP2de
   TuAFBrsjkS1X8QqrLp2ce3yrHt6k/np8QI3YKOhaMjq4eMENF8gNhMGPh
   /mAzskOBLC/UlS8zpkJei8MNEzdCZut04K7UFUIsF0LU0zs39k3a/JM/L
   A==;
X-CSE-ConnectionGUID: DC2jp3kWQdqDBydNr8ncfQ==
X-CSE-MsgGUID: m1c50gYBTJu7nD56mOAj+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="49234665"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="49234665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 08:19:35 -0700
X-CSE-ConnectionGUID: s+zce0MmSYGEs2dvfj/h0Q==
X-CSE-MsgGUID: NqkXrPrhQwSlT+8mqtHtkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="103839414"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2024 08:19:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suvhr-000OOJ-0y;
	Sun, 29 Sep 2024 15:19:31 +0000
Date: Sun, 29 Sep 2024 23:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3650/16788]
 drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for
 'imx_rpmsg_restore'
Message-ID: <202409292304.O0065cFS-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409292304.O0065cFS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292304.O0065cFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292304.O0065cFS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for 'imx_rpmsg_restore' [-Wmissing-prototypes]
     371 | void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
         |      ^~~~~~~~~~~~~~~~~


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
