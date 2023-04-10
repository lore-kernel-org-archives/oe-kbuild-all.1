Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81523A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 06:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681107257; x=1712643257;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fYa/DyciVUrEL9TPNUQKKlNLumd2kwUJ+LqaBq4Ymc8=;
  b=MSOLgCiHW9HqAP2fJKJExSmi96Ux/Gten5OyNRJTVK81/fGg0rNcUlDJ
   aE3bbDySqujXcq+fqQApV5SQKalIMOFAYgp9H65xdtPdOpkbV+cNCPMdI
   4op6i+GRUGirs/bgo3W0h7aoCuYNdZVCa1Hv7upvxMxWpHEX/lkNXYcVk
   FKOYEkpSoN8KptvoEIj1WGTNBS0GBZI9NLE3WuXMYcICwYU961xSLYQcO
   3cKjKCqDRFNpPVAikuLoFAcShLsRdFABxx5E9GsaqoAs5WtHf93/DYs+S
   3+G9OJhISgKnJfvXCQwmzKV45S2LNJqMMcFQgCpWMAwUqd1IGDxfcZ4R/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="408431330"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="408431330"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 23:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="681645542"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="681645542"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Apr 2023 23:14:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plkn7-000V93-0n;
	Mon, 10 Apr 2023 06:14:13 +0000
Date: Mon, 10 Apr 2023 14:13:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [ti:ti-rt-linux-5.10.y 448/9999]
 drivers/rpmsg/virtio_rpmsg_bus.c:893:58: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202304101401.jGjBGpQI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   c1a12919117a6978f40e723d6e0c67c744e026b9
commit: 7e3ea0d62a4bf0ca04be9bc320d13f564aab0a92 [448/9999] TEMP: rpmsg: add a description field
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230410/202304101401.jGjBGpQI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout 7e3ea0d62a4bf0ca04be9bc320d13f564aab0a92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/rpmsg/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101401.jGjBGpQI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rpmsg/virtio_rpmsg_bus.c:893:58: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __virtio32 [usertype] val @@     got unsigned int [usertype] addr @@
   drivers/rpmsg/virtio_rpmsg_bus.c:893:58: sparse:     expected restricted __virtio32 [usertype] val
   drivers/rpmsg/virtio_rpmsg_bus.c:893:58: sparse:     got unsigned int [usertype] addr
>> drivers/rpmsg/virtio_rpmsg_bus.c:894:59: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __virtio32 [usertype] val @@     got unsigned int [usertype] flags @@
   drivers/rpmsg/virtio_rpmsg_bus.c:894:59: sparse:     expected restricted __virtio32 [usertype] val
   drivers/rpmsg/virtio_rpmsg_bus.c:894:59: sparse:     got unsigned int [usertype] flags

vim +893 drivers/rpmsg/virtio_rpmsg_bus.c

   887	
   888		if (len == sizeof(*msg)) {
   889			addr = virtio32_to_cpu(vrp->vdev, msg->addr);
   890			flags = virtio32_to_cpu(vrp->vdev, msg->flags);
   891			chinfo.desc[0] = '\0';
   892		} else if (len == sizeof(*msg_ext)) {
 > 893			addr = virtio32_to_cpu(vrp->vdev, msg_ext->addr);
 > 894			flags = virtio32_to_cpu(vrp->vdev, msg_ext->flags);
   895			msg_ext->desc[RPMSG_NAME_SIZE - 1] = '\0';
   896			strncpy(chinfo.desc, msg_ext->desc, sizeof(chinfo.desc));
   897		} else {
   898			dev_err(dev, "malformed ns msg (%d)\n", len);
   899			return -EINVAL;
   900		}
   901	
   902		/*
   903		 * the name service ept does _not_ belong to a real rpmsg channel,
   904		 * and is handled by the rpmsg bus itself.
   905		 * for sanity reasons, make sure a valid rpdev has _not_ sneaked
   906		 * in somehow.
   907		 */
   908		if (rpdev) {
   909			dev_err(dev, "anomaly: ns ept has an rpdev handle\n");
   910			return -EINVAL;
   911		}
   912	
   913		/* don't trust the remote processor for null terminating the name */
   914		msg->name[RPMSG_NAME_SIZE - 1] = '\0';
   915	
   916		strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
   917		chinfo.src = RPMSG_ADDR_ANY;
   918		chinfo.dst = addr;
   919	
   920		dev_info(dev, "%sing channel %s addr 0x%x\n",
   921			 flags & RPMSG_NS_DESTROY ?
   922			 "destroy" : "creat", msg->name, chinfo.dst);
   923	
   924		if (flags & RPMSG_NS_DESTROY) {
   925			ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
   926			if (ret)
   927				dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
   928		} else {
   929			newch = rpmsg_create_channel(vrp, &chinfo);
   930			if (!newch)
   931				dev_err(dev, "rpmsg_create_channel failed\n");
   932		}
   933	
   934		return 0;
   935	}
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
