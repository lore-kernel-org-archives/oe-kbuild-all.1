Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6502596
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674400953; x=1705936953;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eOCr3dgAZ+K+kZ7SQMxID34Z543/B59WYGKAyc/mNp0=;
  b=L0tOLoJhShbgaE2aw2ChIKIDUg7DWPd04wsqP1QmhE04Sd5qIg3rx9ur
   UXQop0joLghH0sD4C2/lSnuoxF5gm0J+HJwWhuGOvScKOmeiSu3vSNejU
   uw6Vk1ztD+Ar4VAnFSI8LTfjIr7vdpzYj3ddzH15x1b5+wHa9wrM7XnS2
   hTpkxqyTEsv9FHhBVWp4/wvqFNX/uZfOqY8nSQ7Bw6y64iCNueSV8y57M
   cTrLjtEf6UMtdt6iHY1almegQfVmBi/pxji/iQIzhuKwCKa93+YEJ4lon
   OXaAtHWNIK31ev1vZriVzCs/3ugYyLqBzeT6P2ihP3Rpa1+iAiQjcXSK+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="313793632"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="313793632"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 07:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="835186742"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="835186742"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Jan 2023 07:22:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJcAw-00054e-1C;
	Sun, 22 Jan 2023 15:22:30 +0000
Date: Sun, 22 Jan 2023 23:21:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [ti:ti-rt-linux-5.10.y 540/9999]
 drivers/rpmsg/virtio_rpmsg_bus.c:893:58: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202301222319.eyITklCR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   81b9bbe05bd82c315c8ddc77974b1b3031d03bfd
commit: 7e3ea0d62a4bf0ca04be9bc320d13f564aab0a92 [540/9999] TEMP: rpmsg: add a description field
config: alpha-randconfig-s033-20230122 (https://download.01.org/0day-ci/archive/20230122/202301222319.eyITklCR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/rpmsg/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
