Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4800917F7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 04:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714882567; cv=none; b=WJ6nNyGd0UUlKNRXkJ69SLvn/1m3Ngmbs7dhOTW5rW7sncQnVilICt4vfeupCAX/ub+QTi/q2Ms/1PKt/wE8yGniVor6i5fuNBN3Ps1s5GWblaPAw5n8ER4TsNhFvaxl0xexrF1igxDk4JukqPfvMcMcVcL9mzd8w/RvvLlmNio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714882567; c=relaxed/simple;
	bh=G8uSsYdMsXhKYL3BqB6vJCgBpj9jjoQ4b7S1cbd59FE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IkTpoSNHGUoefY2SHuXh+o87h543OGxSzQDty1hq29S45o+XdtCieRGwD1JCPOih4n8tdXyhSk8CRxg0Xhu3BJrVqDhdJ5GXt/iRwOjL1WLQ+oyu3Rn9TsjDSEF9IgXxuicTnba1qglpDw31qChvPMe64VVLXui0ho16ib7DyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1+d91Yq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1+d91Yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714882565; x=1746418565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8uSsYdMsXhKYL3BqB6vJCgBpj9jjoQ4b7S1cbd59FE=;
  b=U1+d91YqvmF/izVu3Yuz+6m26jpYAvxr7SnwNhq91eiWwJdtmqTMwWFg
   SivrQcpJcYH6WiWcdsz/k8O4kj/V09s6Faux05GrspPiTgRe+Fq84ea2N
   QhgLXwYJ63/KwhDGZ70E6KmiF/leEzLdtg6QO/F7+Zp9QpB3eDVYl6PFr
   wAvRTowfK8mkshN2C768ZSCI8wi6bT/mUKizZJDavI/i3ccTO+/xNsF5K
   MHCIctHEWiI8ee5htvSaXXo7bMXukne1tSvP4Ip3pQR4MQTWYHgKdTWP5
   NnkUJ6y7WGWvtnuEDigX4ymlADcM6JSPSw1gTCIdmE36Xf7onABZA3uyC
   w==;
X-CSE-ConnectionGUID: rbfjz8JaSGWbgbCOMqB1TQ==
X-CSE-MsgGUID: ykfM+ZLoSvKPbuVtZH+rHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14437387"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="14437387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 21:16:05 -0700
X-CSE-ConnectionGUID: WBCPB3uBQCuboHfT8NuK+A==
X-CSE-MsgGUID: ujNP0C7eQ8aoGneyJYjywA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="27890380"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 May 2024 21:16:04 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3TI9-000DQ8-0u;
	Sun, 05 May 2024 04:16:01 +0000
Date: Sun, 5 May 2024 12:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 833/1143]
 drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function
 parameter or struct member 'vga_base' not described in 'aspeed_video'
Message-ID: <202405051227.v4M3ZwJk-lkp@intel.com>
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
commit: f927aff15f50ab040743318cbffad708f2a60818 [833/1143] media: aspeed: Workaround for AST2700 VE1
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240505/202405051227.v4M3ZwJk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405051227.v4M3ZwJk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405051227.v4M3ZwJk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'base' not described in 'aspeed_video'
>> drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'vga_base' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'eclk' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'vclk' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'reset' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'dev' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'ctrl_handler' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'v4l2_dev' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'pix_fmt' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'active_timings' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'detected_timings' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'v4l2_input_status' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'queue' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'vdev' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'video_lock' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'debugfs_entry' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'id' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'scu' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'gfx' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'version' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'jpeg_mode' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'comp_size_read' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'compare_only' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'wait' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'lock' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'res_work' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'buffers' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'flags' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'sequence' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'max_compressed_size' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'srcs' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'jpeg' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'bcd' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'dbg_src' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'yuv420' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'format' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'hq_mode' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'input' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'frame_rate' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'jpeg_quality' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'jpeg_hq_quality' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'frame_bottom' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'frame_left' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'frame_right' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'frame_top' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'perf' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'bounding_box' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:381: warning: Function parameter or struct member 'boxes' not described in 'aspeed_video'


vim +381 drivers/media/platform/aspeed/aspeed-video.c

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
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  346  
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  347  	u32 version;
39857de4f82f14 drivers/media/platform/aspeed-video.c        Joel Stanley 2020-01-07  348  	u32 jpeg_mode;
39857de4f82f14 drivers/media/platform/aspeed-video.c        Joel Stanley 2020-01-07  349  	u32 comp_size_read;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  350  	u32 compare_only;
39857de4f82f14 drivers/media/platform/aspeed-video.c        Joel Stanley 2020-01-07  351  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  352  	wait_queue_head_t wait;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  353  	spinlock_t lock;		/* buffer list lock */
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  354  	struct delayed_work res_work;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  355  	struct list_head buffers;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  356  	unsigned long flags;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  357  	unsigned int sequence;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  358  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  359  	unsigned int max_compressed_size;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  360  	struct aspeed_video_addr srcs[2];
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  361  	struct aspeed_video_addr jpeg;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  362  	struct aspeed_video_addr bcd;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  363  	struct aspeed_video_addr dbg_src;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  364  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  365  	bool yuv420;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  366  	enum aspeed_video_format format;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  367  	bool hq_mode;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  368  	enum aspeed_video_input input;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  369  	unsigned int frame_rate;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  370  	unsigned int jpeg_quality;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  371  	unsigned int jpeg_hq_quality;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  372  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  373  	unsigned int frame_bottom;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  374  	unsigned int frame_left;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  375  	unsigned int frame_right;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  376  	unsigned int frame_top;
52fed10ad7566c drivers/media/platform/aspeed-video.c        Jammy Huang  2021-10-01  377  
52fed10ad7566c drivers/media/platform/aspeed-video.c        Jammy Huang  2021-10-01  378  	struct aspeed_video_perf perf;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  379  	struct v4l2_rect bounding_box;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  380  	struct list_head boxes;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11 @381  };
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  382  

:::::: The code at line 381 was first introduced by commit
:::::: d2b4387f3bdf016e266d23cf657465f557721488 media: platform: Add Aspeed Video Engine driver

:::::: TO: Eddie James <eajames@linux.ibm.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
