Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7996387
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 01:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677460398; x=1708996398;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XL5yfPX43V/HJKD5ytSJLY725BzbQEb8Ft7TWPfohoo=;
  b=LeFrh5JZq7cLYikP4deJNVyvEDa2OVTYaDKYQVLll++Qp/MUgYqJkQAM
   r45ecHdRoHrRGSSTrEcYdow7I9B8y0RVZSmNXTm6iLWJ8NRU0wFKFOYN3
   PyL4p8HDpr4U1cL30leiwopgwqKRJS3ertMpacU3Jnz8xmQ7Ao7dwF7Sw
   +kFjTyXYVwlJC8vcWYroOYuaYkDYLHWp/UyAnYcn5JqsX/F3+iMwUHoh8
   yfp68RgcIDDEjPD4kLcjuC6Z4+xW1MbOP0ORG5YfrnHb5orrbvZ+2g5XP
   r2VWYEfA/RkznwAQOBXQJKw2cj3CgvdpOpS6uOGIPQoZCb3oVoUqfLunq
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="398530500"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="398530500"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 17:13:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="1002517420"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="1002517420"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Feb 2023 17:13:14 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWS4n-0003yv-2C;
	Mon, 27 Feb 2023 01:13:13 +0000
Date: Mon, 27 Feb 2023 09:13:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [ti:ti-rt-linux-5.10.y 540/9999]
 drivers/rpmsg/virtio_rpmsg_bus.c:893:58: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202302270933.iOJxbuh9-lkp@intel.com>
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
commit: 7e3ea0d62a4bf0ca04be9bc320d13f564aab0a92 [540/9999] TEMP: rpmsg: add a description field
config: s390-randconfig-s052-20230226 (https://download.01.org/0day-ci/archive/20230227/202302270933.iOJxbuh9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout 7e3ea0d62a4bf0ca04be9bc320d13f564aab0a92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302270933.iOJxbuh9-lkp@intel.com/

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
