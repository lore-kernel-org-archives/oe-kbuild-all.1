Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0A328E579
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841464; cv=none; b=de9/BbclbYLep5+B4hp+tBkxT+GxOtLyIIUtiW47KKCdBYFQckQlIOBe2aYP4nkVdSqaOTFHb3YfETrcsCZfVvxtTPGT4fU7Qjzvl9QD/cuc7gUND6HGnF5TrUYnFYVk7VFJOb5A2efN2e2DgbCHWuGj4uLcGnxEKKko6GNNhhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841464; c=relaxed/simple;
	bh=nX07GncPo0u5I2+4OSUddBAUDPLKEf2x3P2JgzvbumU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hwyLwSSlBqqZqLXiDgNWwQZwic0CYvxjg+vNcqL94PhiOUP+ldQEiOlF7qHkjvhjC+7zb3rn2e/0AmZZeV8Ci6ECCuZkt4y7T7eX++rJhm6WGkIt1c2QPSFUvJ0VkGcjVwY2aE7x5c0cQNLS68wm1xu5z5dI0kRBjFB+Kh4aiEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDDyOhho; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDDyOhho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768841462; x=1800377462;
  h=date:from:to:cc:subject:message-id;
  bh=nX07GncPo0u5I2+4OSUddBAUDPLKEf2x3P2JgzvbumU=;
  b=GDDyOhhojtEZYxSZdgRwTVFdiJgKhb7CbxEoWhVqnpetFmSZEqOp4NYx
   iK9at9r7nRFrkEs0pGo22jbFsi9NS1B03N5Usr9VjmNV5E/Ea+CUc6ZAC
   dubTqBo8EoDK+Xojb9slGNZPpW1qWHsVDk4Q0GxeOZ00uOCyYC2BTiwAz
   s8+7ksMYxgVbBvQtNTb+LsiEoSzopzcn8/janr37ka8EUdi8KPMlEwMzT
   /oSIZBL1PD/kIcRb1Uszb3TWbt1+6PVPvCFQ80Hp9HRfIp2DjVEocyrhz
   XexwdaQtAQtGguooLrMXL56uIestHJ+doVVZJ4MaPlkgVdAdv1yFzRIL2
   Q==;
X-CSE-ConnectionGUID: 6g3k7zjWRZyc5QY6FvAHGw==
X-CSE-MsgGUID: RdsezJIqQc6bTklyV+pLtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57609702"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="57609702"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:51:00 -0800
X-CSE-ConnectionGUID: Lceet55YR8mAJjkvz5uCvA==
X-CSE-MsgGUID: VbmjVPTxTfuj4bA/yeS70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="236584882"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jan 2026 08:50:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhsSt-00000000O4f-2HG6;
	Mon, 19 Jan 2026 16:50:55 +0000
Date: Tue, 20 Jan 2026 00:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 95/113]
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1026:17: error: implicit
 declaration of function 'close_streaming_firmware'; did you mean
 'ipu6_isys_close_streaming_firmware'?
Message-ID: <202601200058.QeQb8IRb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 2085a6131710b0e5e886b3d14118d986c34b2087 [95/113] media: ipu6: Move streaming control to CSI-2 receiver driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601200058.QeQb8IRb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200058.QeQb8IRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200058.QeQb8IRb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'ipu6_isys_video_set_streaming':
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1026:17: error: implicit declaration of function 'close_streaming_firmware'; did you mean 'ipu6_isys_close_streaming_firmware'? [-Wimplicit-function-declaration]
    1026 |                 close_streaming_firmware(av);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 ipu6_isys_close_streaming_firmware


vim +1026 drivers/media/pci/intel/ipu6/ipu6-isys-video.c

3c1dfb5a69cf83 Bingbu Cao   2024-01-31   986  
2085a6131710b0 Sakari Ailus 2025-11-10   987  int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   988  {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   989  	struct v4l2_subdev_krouting *routing;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   990  	struct ipu6_isys_stream *stream = av->stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   991  	struct v4l2_subdev_state *subdev_state;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   992  	struct device *dev = &av->isys->adev->auxdev.dev;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   993  	struct v4l2_subdev *sd;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   994  	struct media_pad *r_pad;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   995  	u32 sink_pad, sink_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   996  	u64 r_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   997  	u64 stream_mask = 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   998  	int ret = 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   999  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1000  	dev_dbg(dev, "set stream: %d\n", state);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1001  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1002  	sd = &stream->asd->sd;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1003  	r_pad = media_pad_remote_pad_first(&av->pad);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1004  	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1005  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1006  	subdev_state = v4l2_subdev_lock_and_get_active_state(sd);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1007  	routing = &subdev_state->routing;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1008  	ret = v4l2_subdev_routing_find_opposite_end(routing, r_pad->index,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1009  						    r_stream, &sink_pad,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1010  						    &sink_stream);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1011  	v4l2_subdev_unlock_state(subdev_state);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1012  	if (ret)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1013  		return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1014  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1015  	stream_mask = get_stream_mask_by_pipeline(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1016  	if (!state) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1017  		/* stop sub-device which connects with video */
3a5c59ad926b89 Sakari Ailus 2024-05-30  1018  		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
3a5c59ad926b89 Sakari Ailus 2024-05-30  1019  			sd->name, r_pad->index, stream_mask);
3a5c59ad926b89 Sakari Ailus 2024-05-30  1020  		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
3a5c59ad926b89 Sakari Ailus 2024-05-30  1021  						  stream_mask);
2b08b7007e55bd Sakari Ailus 2026-01-07  1022  		if (ret)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1023  			dev_err(dev, "stream off %s failed with %d\n", sd->name,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1024  				ret);
2b08b7007e55bd Sakari Ailus 2026-01-07  1025  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31 @1026  		close_streaming_firmware(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1027  	} else {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1028  		/* start sub-device which connects with video */
3a5c59ad926b89 Sakari Ailus 2024-05-30  1029  		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
3a5c59ad926b89 Sakari Ailus 2024-05-30  1030  			r_pad->index, stream_mask);
3a5c59ad926b89 Sakari Ailus 2024-05-30  1031  		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
2085a6131710b0 Sakari Ailus 2025-11-10  1032  		if (ret)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1033  			dev_err(dev, "stream on %s failed with %d\n", sd->name,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1034  				ret);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1035  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1036  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1037  	av->streaming = state;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1038  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1039  	return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1040  }
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1041  

:::::: The code at line 1026 was first introduced by commit
:::::: 3c1dfb5a69cf836f513a2a49113ee946a4b9d95d media: intel/ipu6: input system video nodes and buffer queues

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
