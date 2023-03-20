Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D0F46B7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 20:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679344563; x=1710880563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rrN+hrhid+SViXwfcEyKDi0uSLxuM8T2YB3BL4dqeEg=;
  b=F4eyZh84BcMCJ+cFOWFGSvh7qKyAXtDCF9dBcCB3s86ydknJXVdsxZgG
   8D7p0J3XtYHWKXMGAi+dRHrbgcWJORjQ+PRfkkyc7NUymh/o6JXa/JH6i
   YUu8pAWNa0ks4XKaYeU9kHfk6aY911iUW/KySWDZghCXFfeSI+ahfG1Vx
   BDUu3EPxtDwWFcbd7u7weIHGqsE9EU7ny4Z8grfCQMVNGeW3c+UeqQXeR
   Qi+k7tKxBRdKR79kMcq++Cmkofip/x4HGbpvJ+STrViV0YPOKhn9T2/uB
   LEVg2vUUmyQOIUWco5xJLvE0u4gbbqYYimrErxgPudUQQGicrbGxAy6Zp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318424164"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="318424164"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 13:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="681223525"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="681223525"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Mar 2023 13:36:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peMEW-000BIU-0S;
	Mon, 20 Mar 2023 20:35:56 +0000
Date: Tue, 21 Mar 2023 04:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Prutyanov <viktor@daynix.com>, mst@redhat.com,
	jasowang@redhat.com
Cc: oe-kbuild-all@lists.linux.dev,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, yan@daynix.com, viktor@daynix.com
Subject: Re: [PATCH] virtio: add VIRTIO_F_NOTIFICATION_DATA feature support
Message-ID: <202303210403.LsRG8goQ-lkp@intel.com>
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
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230321/202303210403.LsRG8goQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/b6212a12ca1691dc346e5de046ec46bd3ce11247
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Viktor-Prutyanov/virtio-add-VIRTIO_F_NOTIFICATION_DATA-feature-support/20230320-195725
        git checkout b6212a12ca1691dc346e5de046ec46bd3ce11247
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210403.LsRG8goQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_mmio.c:293:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] data @@
   drivers/virtio/virtio_mmio.c:293:16: sparse:     expected unsigned int val
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
