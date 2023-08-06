Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABBB1C26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 06:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691303046; x=1722839046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qWUTOpyr6HZmscTmUrbKQkoQK8taXH8ihBdyEiW4sM=;
  b=MV+8KBbJYhaWsHk5x8hqp7AaG1R+nS9xwYT7P5fBYKyUpZ1iTHsqeZSN
   RqZqej4PFFnoJL/P4hm/CIgLYkMRntg6yl9moZXPFg5Ye9QoKPKoHGqzR
   xXSH/XV9kxJniZSoUXbDtxs8RiJBYFkS5fRzXu5LdBmXbN6/2RbfAcZ/P
   S8J0niU1D9X/eDdGMcLMmbci2fYH6O6leWQ1WP0/1J7NGj2gGqAXRFBpK
   nNoCbWu4bnOwamyeOGs00BIQDH71i6JGtFBO6Q/u0VN5E9m8+tr11Bwrc
   Eeazo4o5mEj0U8+0ycPP6BnN8xCelVBwNvZxDRzHbJv7PsZmfig62BEPk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="436688769"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="436688769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 23:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="765596337"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="765596337"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Aug 2023 23:24:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSXBL-00045E-1Y;
	Sun, 06 Aug 2023 06:24:03 +0000
Date: Sun, 6 Aug 2023 14:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chang Ying <ying.chang@intel.com>
Subject: [intel-lts:4.19/android_s 3641/30000]
 drivers/media/media-device.c:928:57: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202308061417.KOuB2i1T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: cbe0196f2e61288e2916821cbeb3190f1c09da7e [3641/30000] media: Add request API
config: sh-randconfig-r093-20230806 (https://download.01.org/0day-ci/archive/20230806/202308061417.KOuB2i1T-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061417.KOuB2i1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061417.KOuB2i1T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/media-device.c:928:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int poll_events @@     got restricted __poll_t @@
   drivers/media/media-device.c:928:57: sparse:     expected unsigned int poll_events
   drivers/media/media-device.c:928:57: sparse:     got restricted __poll_t
>> drivers/media/media-device.c:1010:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/media/media-device.c:1010:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/media/media-device.c:1010:17: sparse:     got unsigned int ( * )( ... )
   In file included from include/linux/gfp.h:6,
                    from include/linux/percpu_counter.h:16,
                    from include/linux/quota.h:40,
                    from include/linux/fs.h:235,
                    from include/linux/compat.h:17,
                    from drivers/media/media-device.c:19:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/media/media-device.c: At top level:
   drivers/media/media-device.c:848:23: warning: cast between incompatible function types from 'long int (*)(struct media_device *, void *)' to 'long int (*)(struct media_device *, struct file *, void *)' [-Wcast-function-type]
     848 |                 .fn = (long (*)(struct media_device *,                  23-      |                       ^
   drivers/media/media-device.c:856:9: note: in expansion of macro 'MEDIA_IOC_ARG'
     856 |         MEDIA_IOC_ARG(__cmd, func, fl, copy_arg_from_user, copy_arg_to_user)
         |         ^~~~~~~~~~~~~
   drivers/media/media-device.c:872:9: note: in expansion of macro 'MEDIA_IOC'
     872 |         MEDIA_IOC(G_TOPOLOGY, media_device_get_topology, MEDIA_IOC_FL_GRAPH_MUTEX),
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
