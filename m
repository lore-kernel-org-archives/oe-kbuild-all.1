Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96461198B3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694190674; x=1725726674;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0Ary4DTKv4GIutmZG0yH/8l0zQTwjhjgav26mXUBs60=;
  b=cZw6H0MtWaP1FBQ3abpNQ9mw0ySR2FDy+EpWRay3xH9NnThXZlMAIDB/
   46fkbizd7u0FZyAKND1HyzjjUzfBDUecpDBp/VXLA+NpjATM+gJH5pgTp
   D+Y0ApCR0h6Or55quqEeSB16Efat//JKJCqvVkBR10vyWeZVdnJTRt6Vu
   9wMhTIw5GyKLthMqsjz9/+hTDNpdSSqDdNTUewj+R/tJg0RiUbsiZb9GB
   U4bng8VSoBtNQNSp56yiz43uCz1d+pVu1VG2LjZG5C7AGVO4MWDA1Th2N
   lYSpT5sXiWkdzNIDC4kBhGMU1vQob359LOeNzNs2ToLphtG/sdekmPTcN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380422095"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="380422095"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 09:30:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="866161210"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="866161210"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Sep 2023 09:30:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeeN2-0002SB-2m
	for oe-kbuild-all@lists.linux.dev;
	Fri, 08 Sep 2023 16:30:12 +0000
Date: Sat, 9 Sep 2023 00:29:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14 7465/9354]
 drivers/virtio/virtio_wl.c:930:32: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202309090055.twADzn1b-lkp@intel.com>
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
commit: 4d9bff60fff8af91b4a0cef05552958b1a072993 [7465/9354] CHROMIUM: virtwl: add dmabuf vfd support
config: i386-randconfig-062-20230908 (https://download.01.org/0day-ci/archive/20230909/202309090055.twADzn1b-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090055.twADzn1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090055.twADzn1b-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_wl.c:205:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:205:21: sparse:     expected unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:205:21: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:231:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:231:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:231:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:232:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:232:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:232:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:233:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:233:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:233:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:246:39: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:246:39: sparse:     expected int id
   drivers/virtio/virtio_wl.c:246:39: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:280:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:280:42: sparse:     expected int id
   drivers/virtio/virtio_wl.c:280:42: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:308:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:308:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:308:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:484:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:489:26: sparse: sparse: cast from restricted __le32
   drivers/virtio/virtio_wl.c:491:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:515:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:520:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:558:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:564:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:602:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:602:30: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:602:30: sparse:     got int
   drivers/virtio/virtio_wl.c:603:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:603:28: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:603:28: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:742:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:742:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:742:29: sparse:     got int
   drivers/virtio/virtio_wl.c:743:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:743:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:743:27: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:744:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned int [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:744:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:744:30: sparse:     got unsigned int [assigned] [usertype] vfd_count
   drivers/virtio/virtio_wl.c:764:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:764:45: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:764:45: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:922:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:922:26: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:922:26: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:925:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:925:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:925:36: sparse:     got int
   drivers/virtio/virtio_wl.c:926:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:926:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:926:33: sparse:     got int
   drivers/virtio/virtio_wl.c:929:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:929:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:929:36: sparse:     got int
>> drivers/virtio/virtio_wl.c:930:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got unsigned int @@
   drivers/virtio/virtio_wl.c:930:32: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:930:32: sparse:     got unsigned int
   drivers/virtio/virtio_wl.c:933:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:933:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:933:36: sparse:     got int
   drivers/virtio/virtio_wl.c:934:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:934:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:934:33: sparse:     got int
   drivers/virtio/virtio_wl.c:937:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:937:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:937:36: sparse:     got int
   drivers/virtio/virtio_wl.c:938:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:938:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:938:33: sparse:     got int
   drivers/virtio/virtio_wl.c:943:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:943:44: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:943:44: sparse:     got int
   drivers/virtio/virtio_wl.c:965:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:965:44: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:965:44: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:969:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:969:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:969:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:970:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:970:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:970:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:971:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:971:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:971:20: sparse:     got restricted __le32 [usertype] flags

vim +930 drivers/virtio/virtio_wl.c

   878	
   879	static struct virtwl_vfd *do_new(struct virtwl_info *vi,
   880					 struct virtwl_ioctl_new *ioctl_new,
   881					 size_t ioctl_new_size, bool nonblock)
   882	{
   883		struct virtio_wl_ctrl_vfd_new *ctrl_new;
   884		struct virtwl_vfd *vfd;
   885		struct completion finish_completion;
   886		struct scatterlist out_sg;
   887		struct scatterlist in_sg;
   888		int ret = 0;
   889	
   890		if (ioctl_new->type != VIRTWL_IOCTL_NEW_CTX &&
   891			ioctl_new->type != VIRTWL_IOCTL_NEW_ALLOC &&
   892			ioctl_new->type != VIRTWL_IOCTL_NEW_PIPE_READ &&
   893			ioctl_new->type != VIRTWL_IOCTL_NEW_PIPE_WRITE &&
   894			ioctl_new->type != VIRTWL_IOCTL_NEW_DMABUF)
   895			return ERR_PTR(-EINVAL);
   896	
   897		ctrl_new = kzalloc(sizeof(*ctrl_new), GFP_KERNEL);
   898		if (!ctrl_new)
   899			return ERR_PTR(-ENOMEM);
   900	
   901		vfd = virtwl_vfd_alloc(vi);
   902		if (!vfd) {
   903			ret = -ENOMEM;
   904			goto free_ctrl_new;
   905		}
   906	
   907		/*
   908		 * Take the lock before adding it to the vfds list where others might
   909		 * reference it.
   910		 */
   911		mutex_lock(&vfd->lock);
   912	
   913		mutex_lock(&vi->vfds_lock);
   914		ret = idr_alloc(&vi->vfds, vfd, 1, VIRTWL_MAX_ALLOC, GFP_KERNEL);
   915		mutex_unlock(&vi->vfds_lock);
   916		if (ret <= 0)
   917			goto free_vfd;
   918	
   919		vfd->id = ret;
   920		ret = 0;
   921	
   922		ctrl_new->vfd_id = vfd->id;
   923		switch (ioctl_new->type) {
   924		case VIRTWL_IOCTL_NEW_CTX:
 > 925			ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW_CTX;
   926			ctrl_new->flags = VIRTIO_WL_VFD_WRITE | VIRTIO_WL_VFD_READ;
   927			break;
   928		case VIRTWL_IOCTL_NEW_ALLOC:
   929			ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW;
 > 930			ctrl_new->size = PAGE_ALIGN(ioctl_new->size);
   931			break;
   932		case VIRTWL_IOCTL_NEW_PIPE_READ:
   933			ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW_PIPE;
   934			ctrl_new->flags = VIRTIO_WL_VFD_READ;
   935			break;
   936		case VIRTWL_IOCTL_NEW_PIPE_WRITE:
   937			ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW_PIPE;
   938			ctrl_new->flags = VIRTIO_WL_VFD_WRITE;
   939			break;
   940		case VIRTWL_IOCTL_NEW_DMABUF:
   941			/* Make sure ioctl_new contains enough data for NEW_DMABUF. */
   942			if (ioctl_new_size == sizeof(*ioctl_new)) {
   943				ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW_DMABUF;
   944				/* FIXME: convert from host byte order. */
   945				memcpy(&ctrl_new->dmabuf, &ioctl_new->dmabuf,
   946				       sizeof(ioctl_new->dmabuf));
   947				break;
   948			}
   949			/* fall-through */
   950		default:
   951			ret = -EINVAL;
   952			goto remove_vfd;
   953		}
   954	
   955		init_completion(&finish_completion);
   956		sg_init_one(&out_sg, ctrl_new, sizeof(*ctrl_new));
   957		sg_init_one(&in_sg, ctrl_new, sizeof(*ctrl_new));
   958	
   959		ret = vq_queue_out(vi, &out_sg, &in_sg, &finish_completion, nonblock);
   960		if (ret)
   961			goto remove_vfd;
   962	
   963		wait_for_completion(&finish_completion);
   964	
   965		ret = virtwl_resp_err(ctrl_new->hdr.type);
   966		if (ret)
   967			goto remove_vfd;
   968	
   969		vfd->size = ctrl_new->size;
   970		vfd->pfn = ctrl_new->pfn;
   971		vfd->flags = ctrl_new->flags;
   972	
   973		mutex_unlock(&vfd->lock);
   974	
   975		if (ioctl_new->type == VIRTWL_IOCTL_NEW_DMABUF) {
   976			/* FIXME: convert to host byte order. */
   977			memcpy(&ioctl_new->dmabuf, &ctrl_new->dmabuf,
   978			       sizeof(ctrl_new->dmabuf));
   979		}
   980	
   981		kfree(ctrl_new);
   982		return vfd;
   983	
   984	remove_vfd:
   985		/* unlock the vfd to avoid deadlock when unlinking it */
   986		mutex_unlock(&vfd->lock);
   987		virtwl_vfd_lock_unlink(vfd);
   988	free_vfd:
   989		virtwl_vfd_free(vfd);
   990	free_ctrl_new:
   991		kfree(ctrl_new);
   992		return ERR_PTR(ret);
   993	}
   994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
