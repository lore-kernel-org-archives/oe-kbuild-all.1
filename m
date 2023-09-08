Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E6930F80
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 18:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694198382; x=1725734382;
  h=date:from:cc:subject:message-id:mime-version;
  bh=V0KsW/FfWnF8FClbMEuBaAaQd5fuhXdojmoewJo+T1s=;
  b=EFucnu56IYDP56bk3/TXF+8bPWzs9TQDYQBayK+DGMYtJfXtj552inz4
   5COLFuKWXjVKegXdX4knBiuJunyptlVkU4c+jfUkyL1buUMuxn5seUoVv
   Sh7roRPlGX6fE3JHnqT620Z/9I3u9EPBXu2YNzIuENuG86tpNFjmLxKYW
   E0x6qwKymCHbdL45XUiu3c7YCutLCzt6AP7ZDwVyinCM3r8qrnzmL9cAl
   ZlgeUh4UNgMvik9+s4mroNSHPCRXJX/J2FwruDd6dp/B/nePeBoPSGbfS
   zpGlQeoA1oyE9d8FI9qm/VmpFKI3KBzxOQ7Uiq0nF2kGIYfwCaCQXcKNk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="444151343"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="444151343"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 11:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="832746956"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="832746956"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2023 11:39:18 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qegNv-0002WF-2W
	for oe-kbuild-all@lists.linux.dev;
	Fri, 08 Sep 2023 18:39:15 +0000
Date: Sat, 9 Sep 2023 02:38:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14 8449/9354]
 drivers/virtio/virtio_wl.c:795:33: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202309090221.PIKO5aLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: 838f0480d46ea0d18c23fdb32b981a610750e594 [8449/9354] CHROMIUM: virtwl: add dmabuf sync ioctl
config: i386-randconfig-062-20230908 (https://download.01.org/0day-ci/archive/20230909/202309090221.PIKO5aLn-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090221.PIKO5aLn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090221.PIKO5aLn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_wl.c:207:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:207:21: sparse:     expected unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:207:21: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:233:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:233:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:233:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:234:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:234:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:234:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:235:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:235:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:235:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:248:39: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:248:39: sparse:     expected int id
   drivers/virtio/virtio_wl.c:248:39: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:282:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:282:42: sparse:     expected int id
   drivers/virtio/virtio_wl.c:282:42: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:310:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:310:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:310:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:486:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:491:26: sparse: sparse: cast from restricted __le32
   drivers/virtio/virtio_wl.c:493:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:517:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:522:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:560:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:566:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:604:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:604:30: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:604:30: sparse:     got int
   drivers/virtio/virtio_wl.c:605:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:605:28: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:605:28: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:744:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:744:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:744:29: sparse:     got int
   drivers/virtio/virtio_wl.c:745:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:745:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:745:27: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:746:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned int [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:746:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:746:30: sparse:     got unsigned int [assigned] [usertype] vfd_count
   drivers/virtio/virtio_wl.c:766:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:766:45: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:766:45: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:793:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:793:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:793:36: sparse:     got int
   drivers/virtio/virtio_wl.c:794:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:794:34: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:794:34: sparse:     got unsigned int [usertype] id
>> drivers/virtio/virtio_wl.c:795:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned int [usertype] flags @@
   drivers/virtio/virtio_wl.c:795:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:795:33: sparse:     got unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:964:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:964:26: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:964:26: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:967:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:967:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:967:36: sparse:     got int
   drivers/virtio/virtio_wl.c:968:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:968:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:968:33: sparse:     got int
   drivers/virtio/virtio_wl.c:971:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:971:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:971:36: sparse:     got int
   drivers/virtio/virtio_wl.c:972:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got unsigned int @@
   drivers/virtio/virtio_wl.c:972:32: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:972:32: sparse:     got unsigned int
   drivers/virtio/virtio_wl.c:975:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:975:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:975:36: sparse:     got int
   drivers/virtio/virtio_wl.c:976:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:976:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:976:33: sparse:     got int
   drivers/virtio/virtio_wl.c:979:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:979:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:979:36: sparse:     got int
   drivers/virtio/virtio_wl.c:980:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:980:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:980:33: sparse:     got int
   drivers/virtio/virtio_wl.c:985:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:985:44: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:985:44: sparse:     got int
   drivers/virtio/virtio_wl.c:1007:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:1007:44: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:1007:44: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1011:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:1011:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:1011:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1012:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:1012:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:1012:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:1013:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:1013:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1013:20: sparse:     got restricted __le32 [usertype] flags

vim +795 drivers/virtio/virtio_wl.c

   778	
   779	static int virtwl_vfd_dmabuf_sync(struct file *filp, u32 flags)
   780	{
   781		struct virtio_wl_ctrl_vfd_dmabuf_sync *ctrl_dmabuf_sync;
   782		struct virtwl_vfd *vfd = filp->private_data;
   783		struct virtwl_info *vi = vfd->vi;
   784		struct completion finish_completion;
   785		struct scatterlist out_sg;
   786		struct scatterlist in_sg;
   787		int ret = 0;
   788	
   789		ctrl_dmabuf_sync = kzalloc(sizeof(*ctrl_dmabuf_sync), GFP_KERNEL);
   790		if (!ctrl_dmabuf_sync)
   791			return -ENOMEM;
   792	
   793		ctrl_dmabuf_sync->hdr.type = VIRTIO_WL_CMD_VFD_DMABUF_SYNC;
   794		ctrl_dmabuf_sync->vfd_id = vfd->id;
 > 795		ctrl_dmabuf_sync->flags = flags;
   796	
   797		sg_init_one(&in_sg, &ctrl_dmabuf_sync->hdr,
   798			    sizeof(struct virtio_wl_ctrl_vfd_dmabuf_sync));
   799		sg_init_one(&out_sg, &ctrl_dmabuf_sync->hdr,
   800			    sizeof(struct virtio_wl_ctrl_hdr));
   801	
   802		init_completion(&finish_completion);
   803		ret = vq_queue_out(vi, &out_sg, &in_sg, &finish_completion,
   804				   false /* block */);
   805		if (ret) {
   806			pr_warn("virtwl: failed to queue dmabuf sync vfd id %u: %d\n",
   807				vfd->id,
   808				ret);
   809			goto free_ctrl_dmabuf_sync;
   810		}
   811	
   812		wait_for_completion(&finish_completion);
   813	
   814	free_ctrl_dmabuf_sync:
   815		kfree(ctrl_dmabuf_sync);
   816		return ret;
   817	}
   818	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
