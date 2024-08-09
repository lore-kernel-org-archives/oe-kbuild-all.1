Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A132F22
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723175772; cv=none; b=VFMtxoCQsvGNQUkbFiAISd8n6DBM8ltrXVGigq7ACtWIW04yrZnK+kRgqORKw7tGP/uSNc5Zgo825POyikOZ9BeSRmarndXcthmBUAfB1yIkwag2uaeGAkBNuD+9wRaApKZLT80jcJ5D6JFDBgkkLKvCy09bjIJHQMsA0lQuNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723175772; c=relaxed/simple;
	bh=3iOZeadks/1vP26Xmhv82XZnlsQH4MMfIZ+1T+dez1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUGnaK43Tpeu7gxpXwIMbgche93+kjPP5Y71vPJMAUQSlBRuk0jQ5OoK3KUTjyQMW5PjPoehFSl8ws+tpUZV4nU8NeO8Jm0wk8tij8/3D2JUn3qC80WhHvX1Ywqvc0k+X524FZyd7oYg2Q/Br7Sq19yj31KIzc6L61JM4d+TlMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7Ngnd0q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7Ngnd0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723175770; x=1754711770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iOZeadks/1vP26Xmhv82XZnlsQH4MMfIZ+1T+dez1g=;
  b=G7Ngnd0qAkSim/S6pgHOOKO1n57xen6921lGDtqyz3NkO9brVXi4eMgm
   mXNcwzTogKYLFyQ9KrtSlTBzvBUoWsjn6Fe6kB9Xt0X/ZFqmCUPPIq1y1
   h8HvPbdOlar+34wbnFwFkbBjX2WITQbHkszQRzfd7WfpSTciXn+IcDYzN
   l/6jslBxxB2NFB9XPKDTECCiDoUfvMYbUOI0iOdyV0/x3tQuWiR4WYc7/
   zoiXBCmOyM9je9fUH+adYf5apQE+tMupkZxZcYRdmXMbe0r6P7Cko8pbl
   bhuqN8qEA7gA/ZfdgIn5YCaL2WhkfaKir2y5pfHA3ELmnE1goO8rLdXK5
   Q==;
X-CSE-ConnectionGUID: qoaly1kiSOCTmtxljfCsuQ==
X-CSE-MsgGUID: ef0BpmytTGiMxAAKUo+NEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25205786"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="25205786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 20:56:09 -0700
X-CSE-ConnectionGUID: ME7NdFdPS8ONvsC9cEGzCw==
X-CSE-MsgGUID: jDb+f6KLQrCLDeBVucGWvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="58154717"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Aug 2024 20:56:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scGjW-0006o6-06;
	Fri, 09 Aug 2024 03:56:06 +0000
Date: Fri, 9 Aug 2024 11:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 5828/30000]
 drivers/media/virtio/virtio_video_vq.c:726:31: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202408091139.daio8wTP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   d68d0dae269ee3613f5ec1c021ba63501ccd6043
commit: edee3d02af1ea26ab4e525937ab2bf9fcf7318a0 [5828/30000] BACKPORT: FROMLIST: virtio_video: Add the Virtio Video V4L2 driver
config: arm-randconfig-r131-20240809 (https://download.01.org/0day-ci/archive/20240809/202408091139.daio8wTP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240809/202408091139.daio8wTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091139.daio8wTP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/virtio/virtio_video_vq.c:241:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:242:21: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] stream_id @@
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse:     expected unsigned long id
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse:     got restricted __le32 [usertype] stream_id
   drivers/media/virtio/virtio_video_vq.c:549:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_data_sizes @@     got unsigned char [usertype] num_data_size @@
   drivers/media/virtio/virtio_video_vq.c:549:31: sparse:     expected restricted __le32 [usertype] num_data_sizes
   drivers/media/virtio/virtio_video_vq.c:549:31: sparse:     got unsigned char [usertype] num_data_size
>> drivers/media/virtio/virtio_video_vq.c:726:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] top @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:726:31: sparse:     expected restricted __le32 [usertype] top
   drivers/media/virtio/virtio_video_vq.c:726:31: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_vq.c:727:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] left @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:727:32: sparse:     expected restricted __le32 [usertype] left
   drivers/media/virtio/virtio_video_vq.c:727:32: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_vq.c:728:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] width @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:728:33: sparse:     expected restricted __le32 [usertype] width
   drivers/media/virtio/virtio_video_vq.c:728:33: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_vq.c:729:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] height @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:729:34: sparse:     expected restricted __le32 [usertype] height
   drivers/media/virtio/virtio_video_vq.c:729:34: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:776:18: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:818:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] @@
   drivers/media/virtio/virtio_video_vq.c:818:34: sparse:     expected unsigned int [usertype] v4l2_format
   drivers/media/virtio/virtio_video_vq.c:818:34: sparse:     got restricted __le32 [usertype]
   drivers/media/virtio/virtio_video_vq.c:817:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] format @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:817:30: sparse:     expected restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_vq.c:817:30: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:309:28: sparse: sparse: context imbalance in 'virtio_video_queue_cmd_buffer_locked' - unexpected unlock

vim +726 drivers/media/virtio/virtio_video_vq.c

   696	
   697	static void
   698	virtio_video_cmd_get_params_cb(struct virtio_video *vv,
   699				       struct virtio_video_vbuffer *vbuf)
   700	{
   701		int i;
   702		struct virtio_video_get_params_resp *resp =
   703			(struct virtio_video_get_params_resp *)vbuf->resp_buf;
   704		struct virtio_video_params *params = &resp->params;
   705		struct virtio_video_stream *stream = vbuf->priv;
   706		enum virtio_video_queue_type queue_type;
   707		struct video_format_info *format_info = NULL;
   708	
   709		queue_type = le32_to_cpu(params->queue_type);
   710		if (queue_type == VIRTIO_VIDEO_QUEUE_TYPE_INPUT)
   711			format_info = &stream->in_info;
   712		else
   713			format_info = &stream->out_info;
   714	
   715		if (!format_info)
   716			return;
   717	
   718		format_info->frame_rate = le32_to_cpu(params->frame_rate);
   719		format_info->frame_width = le32_to_cpu(params->frame_width);
   720		format_info->frame_height = le32_to_cpu(params->frame_height);
   721		format_info->min_buffers = le32_to_cpu(params->min_buffers);
   722		format_info->max_buffers = le32_to_cpu(params->max_buffers);
   723		format_info->fourcc_format =
   724			virtio_video_format_to_v4l2(le32_to_cpu(params->format));
   725	
 > 726		format_info->crop.top = le32_to_cpu(params->crop.top);
 > 727		format_info->crop.left = le32_to_cpu(params->crop.left);
 > 728		format_info->crop.width = le32_to_cpu(params->crop.width);
 > 729		format_info->crop.height = le32_to_cpu(params->crop.height);
   730	
   731		format_info->num_planes = le32_to_cpu(params->num_planes);
   732		for (i = 0; i < le32_to_cpu(params->num_planes); i++) {
   733			struct virtio_video_plane_format *plane_formats =
   734							 &params->plane_formats[i];
   735			struct video_plane_format *plane_format =
   736							 &format_info->plane_format[i];
   737	
   738			plane_format->plane_size =
   739					 le32_to_cpu(plane_formats->plane_size);
   740			plane_format->stride = le32_to_cpu(plane_formats->stride);
   741		}
   742	
   743		format_info->is_updated = true;
   744		wake_up(&vv->wq);
   745	}
   746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
