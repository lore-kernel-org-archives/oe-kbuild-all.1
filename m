Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B210A39
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZtq17bv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699521311; x=1731057311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V1ojQW6k/1fa+fti5BlrP+QFdrh5F3WbbV5rrS9WT1o=;
  b=WZtq17bvt/xeoL45rJH2Rc8k+rBNQUdX9vK2YfnGVJ44VQJuTVrsyw/V
   Hre/ApcBnBT7cwQh/iPte1me1ZEQcYk9/+/A0Mmb2a+OGn6HyYCL3bifP
   JYImAqCmTlbfuJqpgRUy7gacy1k8+0z7Y32IyK4rVTcvhsSNdKFcidRaJ
   Qa0xKqb6PoQSXuSM0YX0kaBaV/RfGDx00486HudQY6rPZkHYzlX1PPRvo
   gmV+8qxNDZaiesMiJ0N7b/9HHpClaD3NEy2WlauhO42er2H83w62ucwlC
   xT0JohEmi9sGJzTzlm2qiII7YCMWDMP342dRwh3Qsk4sAUWlsCt0b7MrD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="369281862"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="369281862"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 01:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="739791557"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="739791557"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2023 01:15:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r117t-0008bw-35;
	Thu, 09 Nov 2023 09:15:01 +0000
Date: Thu, 9 Nov 2023 17:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chang Ying <ying.chang@intel.com>
Subject: [intel-lts:4.19/android_t 3113/30000]
 drivers/media/media-device.c:928:57: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202311091754.SCurS4uo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: cbe0196f2e61288e2916821cbeb3190f1c09da7e [3113/30000] media: Add request API
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231109/202311091754.SCurS4uo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091754.SCurS4uo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091754.SCurS4uo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/media-device.c:928:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int poll_events @@     got restricted __poll_t @@
   drivers/media/media-device.c:928:57: sparse:     expected unsigned int poll_events
   drivers/media/media-device.c:928:57: sparse:     got restricted __poll_t
>> drivers/media/media-device.c:1010:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/media/media-device.c:1010:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/media/media-device.c:1010:17: sparse:     got unsigned int ( * )( ... )
   drivers/media/media-device.c:848:23: warning: cast between incompatible function types from 'long int (*)(struct media_device *, void *)' to 'long int (*)(struct media_device *, struct file *, void *)' [-Wcast-function-type]
     848 |                 .fn = (long (*)(struct media_device *,                  9-      |                       ^
   drivers/media/media-device.c:856:9: note: in expansion of macro 'MEDIA_IOC_ARG'
     856 |         MEDIA_IOC_ARG(__cmd, func, fl, copy_arg_from_user, copy_arg_to_user)
         |         ^~~~~~~~~~~~~
   drivers/media/media-device.c:872:9: note: in expansion of macro 'MEDIA_IOC'
     872 |         MEDIA_IOC(G_TOPOLOGY, media_device_get_topology, MEDIA_IOC_FL_GRAPH_MUTEX),
         |         ^~~~~~~~~
   drivers/media/media-device.c:848:23: warning: cast between incompatible function types from 'int (*)(struct media_device *, struct file *, struct media_event *)' to 'long int (*)(struct media_device *, struct file *, void *)' [-Wcast-function-type]
     848 |                 .fn = (long (*)(struct media_device *,                  18-      |                       ^
   drivers/media/media-device.c:856:9: note: in expansion of macro 'MEDIA_IOC_ARG'
     856 |         MEDIA_IOC_ARG(__cmd, func, fl, copy_arg_from_user, copy_arg_to_user)
         |         ^~~~~~~~~~~~~
   drivers/media/media-device.c:874:9: note: in expansion of macro 'MEDIA_IOC'
     874 |         MEDIA_IOC(DQEVENT, media_device_dqevent, 0),
         |         ^~~~~~~~~

vim +928 drivers/media/media-device.c

   922	
   923	static unsigned int media_device_poll(struct file *filp,
   924					      struct poll_table_struct *wait)
   925	{
   926		struct media_device_fh *fh = media_device_fh(filp);
   927		struct media_device *mdev = fh->fh.devnode->media_dev;
 > 928		unsigned int poll_events = poll_requested_events(wait);
   929		int ret = 0;
   930	
   931		if (poll_events & (POLLIN | POLLOUT))
   932			return POLLERR;
   933	
   934		if (poll_events & POLLPRI) {
   935			unsigned long flags;
   936			bool empty;
   937	
   938			spin_lock_irqsave(&mdev->req_lock, flags);
   939			empty = list_empty(&fh->kevents.head);
   940			spin_unlock_irqrestore(&mdev->req_lock, flags);
   941	
   942			if (empty)
   943				poll_wait(filp, &fh->kevents.wait, wait);
   944			else
   945				ret |= POLLPRI;
   946		}
   947	
   948		return ret;
   949	}
   950	
   951	#ifdef CONFIG_COMPAT
   952	
   953	struct media_links_enum32 {
   954		__u32 entity;
   955		compat_uptr_t pads; /* struct media_pad_desc * */
   956		compat_uptr_t links; /* struct media_link_desc * */
   957		__u32 reserved[4];
   958	};
   959	
   960	static long media_device_enum_links32(struct media_device *mdev,
   961							struct file *filp,
   962							struct media_links_enum32 __user *ulinks)
   963	{
   964		struct media_links_enum links;
   965		compat_uptr_t pads_ptr, links_ptr;
   966	
   967		memset(&links, 0, sizeof(links));
   968	
   969		if (get_user(links.entity, &ulinks->entity)
   970		    || get_user(pads_ptr, &ulinks->pads)
   971		    || get_user(links_ptr, &ulinks->links))
   972			return -EFAULT;
   973	
   974		links.pads = compat_ptr(pads_ptr);
   975		links.links = compat_ptr(links_ptr);
   976	
   977		return media_device_enum_links(mdev, filp, &links);
   978	}
   979	
   980	#define MEDIA_IOC_ENUM_LINKS32		_IOWR('|', 0x02, struct media_links_enum32)
   981	
   982	static long media_device_compat_ioctl(struct file *filp, unsigned int cmd,
   983					      unsigned long arg)
   984	{
   985		struct media_devnode *devnode = media_devnode_data(filp);
   986		struct media_device *dev = devnode->media_dev;
   987		long ret;
   988	
   989		switch (cmd) {
   990		case MEDIA_IOC_ENUM_LINKS32:
   991			mutex_lock(&dev->graph_mutex);
   992			ret = media_device_enum_links32(dev,
   993					filp,
   994					(struct media_links_enum32 __user *)arg);
   995			mutex_unlock(&dev->graph_mutex);
   996			break;
   997	
   998		default:
   999			return media_device_ioctl(filp, cmd, arg);
  1000		}
  1001	
  1002		return ret;
  1003	}
  1004	#endif /* CONFIG_COMPAT */
  1005	
  1006	static const struct media_file_operations media_device_fops = {
  1007		.owner = THIS_MODULE,
  1008		.open = media_device_open,
  1009		.ioctl = media_device_ioctl,
> 1010		.poll = media_device_poll,
  1011	#ifdef CONFIG_COMPAT
  1012		.compat_ioctl = media_device_compat_ioctl,
  1013	#endif /* CONFIG_COMPAT */
  1014		.release = media_device_close,
  1015	};
  1016	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
