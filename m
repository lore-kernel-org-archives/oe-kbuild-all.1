Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667FD8477
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679345820; x=1710881820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rYnnyTE4aMvPMTWbMAxUvWfYNNzoBDHhDSnyTej4HLA=;
  b=CHji/zhCa8DzoHBz7+HztgSbaKtiuPgLiefrXJZBWOUItDDPBLY3bVHK
   +SPwWXlaygAfLSd8EdHizdXakVDolkZN4KFM9cs9CMjgSmCe34+ctpiWJ
   vs/HSzY+JQ/qdXVT1r0nZvhKpV9l05LcXB7l9j81xXZ7LaM5URw+L6rtW
   uYrdCd/FNDp7QbX/W+LHHZYh0P5HVj1dHX6bewqGUuHP78gvikqXuzSS3
   +z+1jCSfdv9mRnF4cIpqESArn20BP8HWrLKsDLSsoTiajL2opmiCZkCug
   C4Ysd53YV2Zpl8WAEApJbyDcrciwQY7AszPK/QrUYteRKrmylBPZwRouV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340324997"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="340324997"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 13:56:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="658507103"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="658507103"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Mar 2023 13:56:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peMYq-000BJU-2U;
	Mon, 20 Mar 2023 20:56:56 +0000
Date: Tue, 21 Mar 2023 04:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Prutyanov <viktor@daynix.com>, mst@redhat.com,
	jasowang@redhat.com
Cc: oe-kbuild-all@lists.linux.dev,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, yan@daynix.com, viktor@daynix.com
Subject: Re: [PATCH] virtio: add VIRTIO_F_NOTIFICATION_DATA feature support
Message-ID: <202303210405.8GKuvBFx-lkp@intel.com>
References: <20230320115451.1232171-1-viktor@daynix.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320115451.1232171-1-viktor@daynix.com>

Hi Viktor,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viktor-Prutyanov/virtio-add-VIRTIO_F_NOTIFICATION_DATA-feature-support/20230320-195725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20230320115451.1232171-1-viktor%40daynix.com
patch subject: [PATCH] virtio: add VIRTIO_F_NOTIFICATION_DATA feature support
config: sparc64-randconfig-s052-20230319 (https://download.01.org/0day-ci/archive/20230321/202303210405.8GKuvBFx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/b6212a12ca1691dc346e5de046ec46bd3ce11247
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Viktor-Prutyanov/virtio-add-VIRTIO_F_NOTIFICATION_DATA-feature-support/20230320-195725
        git checkout b6212a12ca1691dc346e5de046ec46bd3ce11247
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210405.8GKuvBFx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_mmio.c:293:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le32 [usertype] data @@
   drivers/virtio/virtio_mmio.c:293:16: sparse:     expected unsigned int [usertype] l
   drivers/virtio/virtio_mmio.c:293:16: sparse:     got restricted __le32 [usertype] data

vim +293 drivers/virtio/virtio_mmio.c

   287	
   288	static bool vm_notify_with_data(struct virtqueue *vq)
   289	{
   290		struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vq->vdev);
   291		__le32 data = vring_fill_notification_data(vq);
   292	
 > 293		writel(data, vm_dev->base + VIRTIO_MMIO_QUEUE_NOTIFY);
   294	
   295		return true;
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
