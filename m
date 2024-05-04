Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8867710A0A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714810706; cv=none; b=HeS5pYrwyx3wSqDgAw1Vn1lzOA915U0ZCP8Hj8Cp+2QAjqKYeImLD69xZn+SVufuGBqsuADP6r901tepmlDFCXjCPGgE6f+Pc7h13BhKMk3ByCNR8OWszrN8z8fr52HNEKMTqsUUxxQtO2baaM4R1leIhgzCVVfVAfiCI4XMFKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714810706; c=relaxed/simple;
	bh=OXJtfNpamBvSNjGofbmnRuoemnBFCq4P2rKOOttYzXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifOe91RvPSmHT8WpNrOJxFC9+RUrHZNFf/Hf9W2Pa93sesuRYLQ0JdrVvZp332WhDuRxV+ecsCSImZXzE/5M5lkqdv1MKNMPZE5Uk21/F291RNGig641hvtfu0hnJxHVtvZhM9aK0xM3c31eZS4E3xTQ5VImxnog5bGgaEoCm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/JRxqNd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/JRxqNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714810704; x=1746346704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OXJtfNpamBvSNjGofbmnRuoemnBFCq4P2rKOOttYzXI=;
  b=f/JRxqNdvLMrsEEAFVypAJrBrdwTyADggrTMLMZQONJqb9zmHminSjcA
   AvSi6vixQbewKyzTp4CjeIyUdccI1znwEy6aWWiWTjPVYPYX8ARhWfLn9
   M946bP6557ihPVi1p1vGrQ+s1hbFJXbaphipGb5YbARz68cibxf6mBbqs
   x6Lw5N0V4Gux8CnqZS7Zzz/8EBxgRIH1gYVTR59kJEoLXaMYBXV25quph
   1RuLwdAoppTHJcyyltJRu9ZZUd7Jvr4oFOBMQdge4JE17t1ZD+KPtPbMT
   xkIC/Vb0klH/afsevohf53Ep1FxHLn0EjfdlSHvqhNrJpBJSMts6GXSEt
   Q==;
X-CSE-ConnectionGUID: 3m/LAY6OTHaDTIR2biWeQQ==
X-CSE-MsgGUID: PKdMofq5QCmI+Y+uNcK5tQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10775652"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="10775652"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 01:18:24 -0700
X-CSE-ConnectionGUID: Gsshf/pBSHS4szH0CFsJYA==
X-CSE-MsgGUID: WumJxAFmQbOd6RAADtiKtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="50864373"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 May 2024 01:18:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3Ab5-000CZc-0f;
	Sat, 04 May 2024 08:18:19 +0000
Date: Sat, 4 May 2024 16:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 569/1143]
 drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function
 parameter or struct member 'debugfs_entry' not described in 'aspeed_video'
Message-ID: <202405041634.ODOcVj0j-lkp@intel.com>
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
commit: 8e45f9d94d0186c7cc471bd7abc154df5ebf6997 [569/1143] media: aspeed: Add device-id to support multi-instance
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405041634.ODOcVj0j-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041634.ODOcVj0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041634.ODOcVj0j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'base' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'eclk' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'vclk' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'reset' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'dev' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'ctrl_handler' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'v4l2_dev' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'pix_fmt' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'active_timings' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'detected_timings' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'v4l2_input_status' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'queue' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'vdev' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'video_lock' not described in 'aspeed_video'
>> drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'debugfs_entry' not described in 'aspeed_video'
>> drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'id' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'scu' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'gfx' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'version' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'jpeg_mode' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'comp_size_read' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'compare_only' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'wait' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'lock' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'res_work' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'buffers' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'flags' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'sequence' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'max_compressed_size' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'srcs' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'jpeg' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'bcd' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'dbg_src' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'yuv420' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'format' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'hq_mode' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'input' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'frame_rate' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'jpeg_quality' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'jpeg_hq_quality' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'frame_bottom' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'frame_left' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'frame_right' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'frame_top' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'perf' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'bounding_box' not described in 'aspeed_video'
   drivers/media/platform/aspeed/aspeed-video.c:377: warning: Function parameter or struct member 'boxes' not described in 'aspeed_video'


vim +377 drivers/media/platform/aspeed/aspeed-video.c

52fed10ad7566c drivers/media/platform/aspeed-video.c        Jammy Huang  2021-10-01  290  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  291  #define to_aspeed_video_buffer(x) \
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  292  	container_of((x), struct aspeed_video_buffer, vb)
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  293  
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  294  /**
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  295   * struct aspeed_video - driver data
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  296   *
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  297   * res_work:		holds the delayed_work for res-detection if unlock
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  298   * buffers:		holds the list of buffer queued from user
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  299   * flags:		holds the state of video
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  300   * sequence:		holds the last number of frame completed
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  301   * max_compressed_size:holds max compressed stream's size
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  302   * srcs:		holds the buffer information for srcs
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  303   * jpeg:		holds the buffer information for jpeg header
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  304   * bcd:			holds the buffer information for bcd work
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  305   * dbg_src:		holds the buffer information for debug input
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  306   * yuv420:		a flag raised if JPEG subsampling is 420
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  307   * format:		holds the video format
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  308   * hq_mode:		a flag raised if HQ is enabled. Only for VIDEO_FMT_ASPEED
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  309   * input:		holds the video input
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  310   * frame_rate:		holds the frame_rate
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  311   * jpeg_quality:	holds jpeq's quality (0~11)
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  312   * jpeg_hq_quality:	holds hq's quality (1~12) only if hq_mode enabled
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  313   * frame_bottom:	end position of video data in vertical direction
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  314   * frame_left:		start position of video data in horizontal direction
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  315   * frame_right:	end position of video data in horizontal direction
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  316   * frame_top:		start position of video data in vertical direction
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  317   * perf:		holds the statistics primary for debugfs
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  318   * bounding_box:	holds the video rect for partial-jpeg
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  319   * boxes:		holds the list of video-rect info for each partial-jpeg
a12403affeac3d drivers/media/platform/aspeed-video.c        Jammy Huang  2021-12-07  320   */
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  321  struct aspeed_video {
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  322  	void __iomem *base;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  323  	struct clk *eclk;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  324  	struct clk *vclk;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  325  	struct reset_control *reset;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  326  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  327  	struct device *dev;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  328  	struct v4l2_ctrl_handler ctrl_handler;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  329  	struct v4l2_device v4l2_dev;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  330  	struct v4l2_pix_format pix_fmt;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  331  	struct v4l2_bt_timings active_timings;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  332  	struct v4l2_bt_timings detected_timings;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  333  	u32 v4l2_input_status;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  334  	struct vb2_queue queue;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  335  	struct video_device vdev;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  336  	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
8e45f9d94d0186 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-08-18  337  	struct dentry *debugfs_entry;
8e45f9d94d0186 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-08-18  338  	int id;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  339  
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  340  	struct regmap *scu;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  341  	struct regmap *gfx;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  342  
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  343  	u32 version;
39857de4f82f14 drivers/media/platform/aspeed-video.c        Joel Stanley 2020-01-07  344  	u32 jpeg_mode;
39857de4f82f14 drivers/media/platform/aspeed-video.c        Joel Stanley 2020-01-07  345  	u32 comp_size_read;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  346  	u32 compare_only;
39857de4f82f14 drivers/media/platform/aspeed-video.c        Joel Stanley 2020-01-07  347  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  348  	wait_queue_head_t wait;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  349  	spinlock_t lock;		/* buffer list lock */
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  350  	struct delayed_work res_work;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  351  	struct list_head buffers;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  352  	unsigned long flags;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  353  	unsigned int sequence;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  354  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  355  	unsigned int max_compressed_size;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  356  	struct aspeed_video_addr srcs[2];
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  357  	struct aspeed_video_addr jpeg;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  358  	struct aspeed_video_addr bcd;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  359  	struct aspeed_video_addr dbg_src;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  360  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  361  	bool yuv420;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  362  	enum aspeed_video_format format;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  363  	bool hq_mode;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  364  	enum aspeed_video_input input;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  365  	unsigned int frame_rate;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  366  	unsigned int jpeg_quality;
d4b9fd006fae58 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2022-10-28  367  	unsigned int jpeg_hq_quality;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  368  
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  369  	unsigned int frame_bottom;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  370  	unsigned int frame_left;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  371  	unsigned int frame_right;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  372  	unsigned int frame_top;
52fed10ad7566c drivers/media/platform/aspeed-video.c        Jammy Huang  2021-10-01  373  
52fed10ad7566c drivers/media/platform/aspeed-video.c        Jammy Huang  2021-10-01  374  	struct aspeed_video_perf perf;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  375  	struct v4l2_rect bounding_box;
a86e70cb305119 drivers/media/platform/aspeed/aspeed-video.c Jammy Huang  2023-04-10  376  	struct list_head boxes;
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11 @377  };
d2b4387f3bdf01 drivers/media/platform/aspeed-video.c        Eddie James  2018-12-11  378  

:::::: The code at line 377 was first introduced by commit
:::::: d2b4387f3bdf016e266d23cf657465f557721488 media: platform: Add Aspeed Video Engine driver

:::::: TO: Eddie James <eajames@linux.ibm.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
