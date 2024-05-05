Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5934323B0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 06:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714891855; cv=none; b=t5652bn3YQzPDDWXkzqkHNGuE29jsXLJAgoKbGXC7Pd5JtcatxIIiWYWi7Gys2ogSI78T1GwZ9VEzLQB5TiIZjepb8gNwQJbWik2RBmFV+vKbEBrBE7EI0nRfzViv8lifxhUb6GHC7K9sTgrhIq2N0t0pz42y/rE4vV9VZP8skQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714891855; c=relaxed/simple;
	bh=UA4xFgjdyKrkylKKjlF71KT8nEo/H2azlB7X7edVy+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JpD4WHSEWYXu+aSjJ0x+m0R3O40RerRCOv+iRBMlzh6BRzshYDqa3bQjiMr8KV0CPRIgixutHmrsoeqRtVcGnNuIsI94omUq3FDqr3bQ7pe/YqNB9gfzcy0YOYEoOGshJnSAQ1uheFUvtxI6OAoKwV8YQt8KYt/2WV0UbqIVnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdrC4seV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdrC4seV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714891852; x=1746427852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UA4xFgjdyKrkylKKjlF71KT8nEo/H2azlB7X7edVy+4=;
  b=cdrC4seVe41Z+M670JclzybpGspuDwMJUvu3+qfXq0j3pNz3uGjowWU1
   S92zNcOKpQOwjj0QPWXY8U0hhAfMI8uf4ajnUVDTO+Uzgg1ABlTPZuPB+
   0gcdiJZVDx2oA5SLuU54Rah6rerdHIChi8WHn3CDdeRfuYnc3zXB0oYPq
   6iDIsNOVE4zF4IAKfQWFfpiS14DEGvhlH+V7Z5ICGL58Pz71nOzY5R71E
   r2i6+PrTYD4RXSIR4Tk4L+ghJ9HoKrt8l8/SQm+5ji+lGckSisS8RmDMP
   dIqlTBs65NcdaYTdwN3wdVPY8dcdZRf7ydIxPmKRNjwSGYzYb87GHBlUg
   A==;
X-CSE-ConnectionGUID: lU6XJ4vJSeq0AetCFO6MSw==
X-CSE-MsgGUID: 1kodtaazRhyfWxMkXBSDhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21807133"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="21807133"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 23:50:51 -0700
X-CSE-ConnectionGUID: hzNBmqieTNGaBz7/4LYrFQ==
X-CSE-MsgGUID: yDRWoSGiR0qay0FTjBzjJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="27814789"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 May 2024 23:50:50 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3Vhv-00002K-0y;
	Sun, 05 May 2024 06:50:47 +0000
Date: Sun, 5 May 2024 14:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 841/1143]
 drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function
 parameter or struct member 'video0' not described in 'aspeed_video'
Message-ID: <202405051409.xsMI3tIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: b7962bb5c0dd7d2c9be32906fd9b58acfb165e0f [841/1143] media: aspeed: Workaround for VE1 can't work without VE0
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240505/202405051409.xsMI3tIK-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405051409.xsMI3tIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405051409.xsMI3tIK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'base' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'vga_base' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'eclk' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'vclk' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'reset' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'dev' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'ctrl_handler' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'v4l2_dev' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'pix_fmt' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'active_timings' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'detected_timings' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'v4l2_input_status' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'queue' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'vdev' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'video_lock' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'debugfs_entry' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'id' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'scu' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'gfx' not described in 'aspeed_video'
>> drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'video0' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'version' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'jpeg_mode' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'comp_size_read' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'compare_only' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'wait' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'lock' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'res_work' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'buffers' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'flags' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'sequence' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'max_compressed_size' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'srcs' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'jpeg' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'bcd' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'dbg_src' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'yuv420' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'format' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'hq_mode' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'input' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'frame_rate' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'jpeg_quality' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'jpeg_hq_quality' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'frame_bottom' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'frame_left' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'frame_right' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'frame_top' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'perf' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'bounding_box' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:382: warning: Function parameter or struct member 'boxes' not described in 'aspeed_video'


vim +382 drivers/media/platform/aspeed/aspeed-video.c

52fed10ad7566c drivers/media/platform/aspeed-video.c        Jammy Huang  2021-10-01  293  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  294  #define to_aspeed_video_buffer(x) \
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  295  	container_of((x), struct aspeed_video_buffer, vb)
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  296  
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  297  /**
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  298   * struct aspeed_video - driver data
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  299   *
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  300   * res_work:		holds the delayed_work for res-detection if unlock
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  301   * buffers:		holds the list of buffer queued from user
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  302   * flags:		holds the state of video
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  303   * sequence:		holds the last number of frame completed
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  304   * max_compressed_size:holds max compressed stream's size
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  305   * srcs:		holds the buffer information for srcs
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  306   * jpeg:		holds the buffer information for jpeg header
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  307   * bcd:			holds the buffer information for bcd work
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  308   * dbg_src:		holds the buffer information for debug input
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  309   * yuv420:		a flag raised if JPEG subsampling is 420
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  310   * format:		holds the video format
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  311   * hq_mode:		a flag raised if HQ is enabled. Only for VIDEO_FMT_ASPEED
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  312   * input:		holds the video input
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  313   * frame_rate:		holds the frame_rate
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  314   * jpeg_quality:	holds jpeq's quality (0~11)
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  315   * jpeg_hq_quality:	holds hq's quality (1~12) only if hq_mode enabled
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  316   * frame_bottom:	end position of video data in vertical direction
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  317   * frame_left:		start position of video data in horizontal direction
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  318   * frame_right:	end position of video data in horizontal direction
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  319   * frame_top:		start position of video data in vertical direction
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  320   * perf:		holds the statistics primary for debugfs
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  321   * bounding_box:	holds the video rect for partial-jpeg
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  322   * boxes:		holds the list of video-rect info for each partial-jpeg
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  323   */
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  324  struct aspeed_video {
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  325  	void __iomem *base;
f927aff15f50ab drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-11-24  326  	void __iomem *vga_base;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  327  	struct clk *eclk;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  328  	struct clk *vclk;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  329  	struct reset_control *reset;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  330  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  331  	struct device *dev;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  332  	struct v4l2_ctrl_handler ctrl_handler;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  333  	struct v4l2_device v4l2_dev;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  334  	struct v4l2_pix_format pix_fmt;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  335  	struct v4l2_bt_timings active_timings;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  336  	struct v4l2_bt_timings detected_timings;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  337  	u32 v4l2_input_status;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  338  	struct vb2_queue queue;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  339  	struct video_device vdev;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  340  	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
8e45f9d94d0186 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-08-18  341  	struct dentry *debugfs_entry;
8e45f9d94d0186 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-08-18  342  	int id;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  343  
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  344  	struct regmap *scu;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  345  	struct regmap *gfx;
b7962bb5c0dd7d drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-12-05  346  	struct regmap *video0;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  347  
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  348  	u32 version;
39857de4f82f14 drivers/media/platform/aspeed-video.c        Joel Stanley 2020-01-07  349  	u32 jpeg_mode;
39857de4f82f14 drivers/media/platform/aspeed-video.c        Joel Stanley 2020-01-07  350  	u32 comp_size_read;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  351  	u32 compare_only;
39857de4f82f14 drivers/media/platform/aspeed-video.c        Joel Stanley 2020-01-07  352  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  353  	wait_queue_head_t wait;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  354  	spinlock_t lock;		/* buffer list lock */
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  355  	struct delayed_work res_work;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  356  	struct list_head buffers;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  357  	unsigned long flags;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  358  	unsigned int sequence;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  359  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  360  	unsigned int max_compressed_size;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  361  	struct aspeed_video_addr srcs[2];
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  362  	struct aspeed_video_addr jpeg;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  363  	struct aspeed_video_addr bcd;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  364  	struct aspeed_video_addr dbg_src;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  365  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  366  	bool yuv420;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  367  	enum aspeed_video_format format;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  368  	bool hq_mode;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  369  	enum aspeed_video_input input;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  370  	unsigned int frame_rate;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  371  	unsigned int jpeg_quality;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  372  	unsigned int jpeg_hq_quality;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  373  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  374  	unsigned int frame_bottom;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  375  	unsigned int frame_left;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  376  	unsigned int frame_right;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  377  	unsigned int frame_top;
52fed10ad7566c drivers/media/platform/aspeed-video.c        Jammy Huang  2021-10-01  378  
52fed10ad7566c drivers/media/platform/aspeed-video.c        Jammy Huang  2021-10-01  379  	struct aspeed_video_perf perf;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  380  	struct v4l2_rect bounding_box;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  381  	struct list_head boxes;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11 @382  };
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  383  

:::::: The code at line 382 was first introduced by commit
:::::: d2b4387f3bdf016e266d23cf657465f557721488 media: platform: Add Aspeed Video Engine driver

:::::: TO: Eddie James <eajames@linux.ibm.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
