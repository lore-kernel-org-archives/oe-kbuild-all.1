Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B3810E6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709453319; cv=none; b=F/KW03lsxRYakvaNiXuIP/hppp02QvtUsT5kojRaWI8rnzqV/duHGC7zyOXa/Wl6SRvTKnmlE236tSUL3nihSqFhCOTin4EaMjwaeOQk4NTlpSgqWXzIgMoWa5E3EFV+EBhAZYRvXy/tv5IWbheH5YwI4CnZrP1LjXoshEvtivM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709453319; c=relaxed/simple;
	bh=PPc7HVdSkwUrWTCoywZegjW8lHUJ7Y9o+c4y+PfuylU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aLKLf+z7OApmh0jVVMHrpOcfQsGdaX27bTzx64tfIyVPK716IQGfkTdjcd+26PIEUViERBd0l4G6F/YvgflYeS6foPV+4Zs1b1tZHt2Ccl5xqyTA2EcIDO/BHBGbxogMKQmh0ZYVrvDgPjFQs28Gqeoq+q5LdZ9+0xCydB09Kg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKxK8tmk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKxK8tmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709453318; x=1740989318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PPc7HVdSkwUrWTCoywZegjW8lHUJ7Y9o+c4y+PfuylU=;
  b=hKxK8tmk0x0Y85NfTXDruWWNi2sw+l/LKj9NjjXw1okFwTuw3G07lzGm
   /Bu6U8DRqXfjZ2f5RLbRD7W/TZbBa8Mbfc9gd/JX7ZnvL1g0RWm3asYG8
   MimGma9ayztTrptjdqkL9UvkKaAhVwNQHw0+RhyC05wiSdxqCjEHo3r16
   LLPQweSmfS3qDTg3+xkFkP+z4lbDdtPFLvb5u+PfGBA1sHnjoej0o2X1t
   HGr7ez+32zropZylMOyNbQ6PZUbHOLGIJI/C/xPPLRNnQNWJRIFdycuG3
   vWMqQJ629ERyxBXZmhqcDVANAj4pqX+WXtUetIzgy//tKSKskc41pjYoZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3817167"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="3817167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 00:08:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13157988"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2024 00:08:35 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rggtd-0001Nk-14;
	Sun, 03 Mar 2024 08:08:33 +0000
Date: Sun, 3 Mar 2024 16:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.8/isp/v2 14/22]
 drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h:422:39: error:
 'V4L2_PIX_FMT_Y12P' undeclared here (not in a function); did you mean
 'V4L2_PIX_FMT_Y12'?
Message-ID: <202403031533.6Hqo6Ulj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.8/isp/v2
head:   429a9c05cc5a81e4f62c163c2e8bbdc600cf6b91
commit: ccf04478fd461b0517a703743a57a65ca304faf2 [14/22] staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403031533.6Hqo6Ulj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031533.6Hqo6Ulj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031533.6Hqo6Ulj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:27:
>> drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h:422:39: error: 'V4L2_PIX_FMT_Y12P' undeclared here (not in a function); did you mean 'V4L2_PIX_FMT_Y12'?
     422 |                 .fourcc             = V4L2_PIX_FMT_Y12P,
         |                                       ^~~~~~~~~~~~~~~~~
         |                                       V4L2_PIX_FMT_Y12
>> drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h:431:39: error: 'V4L2_PIX_FMT_Y14P' undeclared here (not in a function); did you mean 'V4L2_PIX_FMT_Y14'?
     431 |                 .fourcc             = V4L2_PIX_FMT_Y14P,
         |                                       ^~~~~~~~~~~~~~~~~
         |                                       V4L2_PIX_FMT_Y14
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c: In function 'bcm2835_isp_buf_prepare':
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:499:70: warning: passing argument 3 of 'vb2_core_expbuf_dmabuf' makes pointer from integer without a cast [-Wint-conversion]
     499 |                                                                    vb->index, 0, O_CLOEXEC);
         |                                                                    ~~^~~~~~~
         |                                                                      |
         |                                                                      unsigned int
   In file included from include/media/videobuf2-v4l2.h:16,
                    from include/media/videobuf2-dma-contig.h:16,
                    from drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:17:
   include/media/videobuf2-core.h:947:59: note: expected 'struct vb2_buffer *' but argument is of type 'unsigned int'
     947 |                                        struct vb2_buffer *vb, unsigned int plane,
         |                                        ~~~~~~~~~~~~~~~~~~~^~


vim +422 drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h

    27	
    28	static const struct bcm2835_isp_fmt supported_formats[] = {
    29		{
    30			/* YUV formats */
    31			.fourcc		    = V4L2_PIX_FMT_YUV420,
    32			.depth		    = 8,
    33			.bytesperline_align = 64,
    34			.mmal_fmt	    = MMAL_ENCODING_I420,
    35			.size_multiplier_x2 = 3,
    36			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    37			.step_size	    = 2,
    38		}, {
    39			.fourcc		    = V4L2_PIX_FMT_YVU420,
    40			.depth		    = 8,
    41			.bytesperline_align = 64,
    42			.mmal_fmt	    = MMAL_ENCODING_YV12,
    43			.size_multiplier_x2 = 3,
    44			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    45			.step_size	    = 2,
    46		}, {
    47			.fourcc		    = V4L2_PIX_FMT_NV12,
    48			.depth		    = 8,
    49			.bytesperline_align = 32,
    50			.mmal_fmt	    = MMAL_ENCODING_NV12,
    51			.size_multiplier_x2 = 3,
    52			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    53			.step_size	    = 2,
    54		}, {
    55			.fourcc		    = V4L2_PIX_FMT_NV21,
    56			.depth		    = 8,
    57			.bytesperline_align = 32,
    58			.mmal_fmt	    = MMAL_ENCODING_NV21,
    59			.size_multiplier_x2 = 3,
    60			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    61			.step_size	    = 2,
    62		}, {
    63			.fourcc		    = V4L2_PIX_FMT_YUYV,
    64			.depth		    = 16,
    65			.bytesperline_align = 64,
    66			.mmal_fmt	    = MMAL_ENCODING_YUYV,
    67			.size_multiplier_x2 = 2,
    68			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    69			.step_size	    = 2,
    70		}, {
    71			.fourcc		    = V4L2_PIX_FMT_UYVY,
    72			.depth		    = 16,
    73			.bytesperline_align = 64,
    74			.mmal_fmt	    = MMAL_ENCODING_UYVY,
    75			.size_multiplier_x2 = 2,
    76			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    77			.step_size	    = 2,
    78		}, {
    79			.fourcc		    = V4L2_PIX_FMT_YVYU,
    80			.depth		    = 16,
    81			.bytesperline_align = 64,
    82			.mmal_fmt	    = MMAL_ENCODING_YVYU,
    83			.size_multiplier_x2 = 2,
    84			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    85			.step_size	    = 2,
    86		}, {
    87			.fourcc		    = V4L2_PIX_FMT_VYUY,
    88			.depth		    = 16,
    89			.bytesperline_align = 64,
    90			.mmal_fmt	    = MMAL_ENCODING_VYUY,
    91			.size_multiplier_x2 = 2,
    92			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    93			.step_size	    = 2,
    94		}, {
    95			/* RGB formats */
    96			.fourcc		    = V4L2_PIX_FMT_RGB24,
    97			.depth		    = 24,
    98			.bytesperline_align = 32,
    99			.mmal_fmt	    = MMAL_ENCODING_RGB24,
   100			.size_multiplier_x2 = 2,
   101			.colorspace	    = V4L2_COLORSPACE_SRGB,
   102			.step_size	    = 1,
   103		}, {
   104			.fourcc		    = V4L2_PIX_FMT_RGB565,
   105			.depth		    = 16,
   106			.bytesperline_align = 32,
   107			.mmal_fmt	    = MMAL_ENCODING_RGB16,
   108			.size_multiplier_x2 = 2,
   109			.colorspace	    = V4L2_COLORSPACE_SRGB,
   110			.step_size	    = 1,
   111		}, {
   112			.fourcc		    = V4L2_PIX_FMT_BGR24,
   113			.depth		    = 24,
   114			.bytesperline_align = 32,
   115			.mmal_fmt	    = MMAL_ENCODING_BGR24,
   116			.size_multiplier_x2 = 2,
   117			.colorspace	    = V4L2_COLORSPACE_SRGB,
   118			.step_size	    = 1,
   119		}, {
   120			.fourcc		    = V4L2_PIX_FMT_XBGR32,
   121			.depth		    = 32,
   122			.bytesperline_align = 64,
   123			.mmal_fmt	    = MMAL_ENCODING_BGRA,
   124			.size_multiplier_x2 = 2,
   125			.colorspace	    = V4L2_COLORSPACE_SRGB,
   126			.step_size	    = 1,
   127		}, {
   128			.fourcc		    = V4L2_PIX_FMT_RGBX32,
   129			.depth		    = 32,
   130			.bytesperline_align = 64,
   131			.mmal_fmt	    = MMAL_ENCODING_RGBA,
   132			.size_multiplier_x2 = 2,
   133			.colorspace	    = V4L2_COLORSPACE_SRGB,
   134			.step_size	    = 1,
   135		}, {
   136			/* Bayer formats */
   137			/* 8 bit */
   138			.fourcc		    = V4L2_PIX_FMT_SRGGB8,
   139			.depth		    = 8,
   140			.bytesperline_align = 32,
   141			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB8,
   142			.size_multiplier_x2 = 2,
   143			.colorspace	    = V4L2_COLORSPACE_RAW,
   144			.step_size	    = 2,
   145		}, {
   146			.fourcc		    = V4L2_PIX_FMT_SBGGR8,
   147			.depth		    = 8,
   148			.bytesperline_align = 32,
   149			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR8,
   150			.size_multiplier_x2 = 2,
   151			.colorspace	    = V4L2_COLORSPACE_RAW,
   152			.step_size	    = 2,
   153		}, {
   154			.fourcc		    = V4L2_PIX_FMT_SGRBG8,
   155			.depth		    = 8,
   156			.bytesperline_align = 32,
   157			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG8,
   158			.size_multiplier_x2 = 2,
   159			.colorspace	    = V4L2_COLORSPACE_RAW,
   160			.step_size	    = 2,
   161		}, {
   162			.fourcc		    = V4L2_PIX_FMT_SGBRG8,
   163			.depth		    = 8,
   164			.bytesperline_align = 32,
   165			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG8,
   166			.size_multiplier_x2 = 2,
   167			.colorspace	    = V4L2_COLORSPACE_RAW,
   168			.step_size	    = 2,
   169		}, {
   170			/* 10 bit */
   171			.fourcc		    = V4L2_PIX_FMT_SRGGB10P,
   172			.depth		    = 10,
   173			.bytesperline_align = 32,
   174			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10P,
   175			.size_multiplier_x2 = 2,
   176			.colorspace	    = V4L2_COLORSPACE_RAW,
   177			.step_size	    = 2,
   178		}, {
   179			.fourcc		    = V4L2_PIX_FMT_SBGGR10P,
   180			.depth		    = 10,
   181			.bytesperline_align = 32,
   182			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10P,
   183			.size_multiplier_x2 = 2,
   184			.colorspace	    = V4L2_COLORSPACE_RAW,
   185			.step_size	    = 2,
   186		}, {
   187			.fourcc		    = V4L2_PIX_FMT_SGRBG10P,
   188			.depth		    = 10,
   189			.bytesperline_align = 32,
   190			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10P,
   191			.size_multiplier_x2 = 2,
   192			.colorspace	    = V4L2_COLORSPACE_RAW,
   193			.step_size	    = 2,
   194		}, {
   195			.fourcc		    = V4L2_PIX_FMT_SGBRG10P,
   196			.depth		    = 10,
   197			.bytesperline_align = 32,
   198			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10P,
   199			.size_multiplier_x2 = 2,
   200			.colorspace	    = V4L2_COLORSPACE_RAW,
   201			.step_size	    = 2,
   202		}, {
   203			/* 12 bit */
   204			.fourcc		    = V4L2_PIX_FMT_SRGGB12P,
   205			.depth		    = 12,
   206			.bytesperline_align = 32,
   207			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12P,
   208			.size_multiplier_x2 = 2,
   209			.colorspace	    = V4L2_COLORSPACE_RAW,
   210			.step_size	    = 2,
   211		}, {
   212			.fourcc		    = V4L2_PIX_FMT_SBGGR12P,
   213			.depth		    = 12,
   214			.bytesperline_align = 32,
   215			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12P,
   216			.size_multiplier_x2 = 2,
   217			.colorspace	    = V4L2_COLORSPACE_RAW,
   218			.step_size	    = 2,
   219		}, {
   220			.fourcc		    = V4L2_PIX_FMT_SGRBG12P,
   221			.depth		    = 12,
   222			.bytesperline_align = 32,
   223			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12P,
   224			.size_multiplier_x2 = 2,
   225			.colorspace	    = V4L2_COLORSPACE_RAW,
   226			.step_size	    = 2,
   227		}, {
   228			.fourcc		    = V4L2_PIX_FMT_SGBRG12P,
   229			.depth		    = 12,
   230			.bytesperline_align = 32,
   231			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12P,
   232			.size_multiplier_x2 = 2,
   233			.colorspace	    = V4L2_COLORSPACE_RAW,
   234			.step_size	    = 2,
   235		}, {
   236			/* 14 bit */
   237			.fourcc		    = V4L2_PIX_FMT_SRGGB14P,
   238			.depth		    = 14,
   239			.bytesperline_align = 32,
   240			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14P,
   241			.size_multiplier_x2 = 2,
   242			.colorspace	    = V4L2_COLORSPACE_RAW,
   243			.step_size	    = 2,
   244		}, {
   245			.fourcc		    = V4L2_PIX_FMT_SBGGR14P,
   246			.depth		    = 14,
   247			.bytesperline_align = 32,
   248			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14P,
   249			.size_multiplier_x2 = 2,
   250			.colorspace	    = V4L2_COLORSPACE_RAW,
   251			.step_size	    = 2,
   252		}, {
   253			.fourcc		    = V4L2_PIX_FMT_SGRBG14P,
   254			.depth		    = 14,
   255			.bytesperline_align = 32,
   256			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14P,
   257			.size_multiplier_x2 = 2,
   258			.colorspace	    = V4L2_COLORSPACE_RAW,
   259			.step_size	    = 2,
   260		}, {
   261			.fourcc		    = V4L2_PIX_FMT_SGBRG14P,
   262			.depth		    = 14,
   263			.bytesperline_align = 32,
   264			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14P,
   265			.size_multiplier_x2 = 2,
   266			.colorspace	    = V4L2_COLORSPACE_RAW,
   267			.step_size	    = 2,
   268		}, {
   269			/* 16 bit */
   270			.fourcc		    = V4L2_PIX_FMT_SRGGB16,
   271			.depth		    = 16,
   272			.bytesperline_align = 32,
   273			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB16,
   274			.size_multiplier_x2 = 2,
   275			.colorspace	    = V4L2_COLORSPACE_RAW,
   276			.step_size	    = 2,
   277		}, {
   278			.fourcc		    = V4L2_PIX_FMT_SBGGR16,
   279			.depth		    = 16,
   280			.bytesperline_align = 32,
   281			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR16,
   282			.size_multiplier_x2 = 2,
   283			.colorspace	    = V4L2_COLORSPACE_RAW,
   284			.step_size	    = 2,
   285		}, {
   286			.fourcc		    = V4L2_PIX_FMT_SGRBG16,
   287			.depth		    = 16,
   288			.bytesperline_align = 32,
   289			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG16,
   290			.size_multiplier_x2 = 2,
   291			.colorspace	    = V4L2_COLORSPACE_RAW,
   292			.step_size	    = 2,
   293		}, {
   294			.fourcc		    = V4L2_PIX_FMT_SGBRG16,
   295			.depth		    = 16,
   296			.bytesperline_align = 32,
   297			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG16,
   298			.size_multiplier_x2 = 2,
   299			.colorspace	    = V4L2_COLORSPACE_RAW,
   300			.step_size	    = 2,
   301		}, {
   302			/* Bayer formats unpacked to 16bpp */
   303			/* 10 bit */
   304			.fourcc		    = V4L2_PIX_FMT_SRGGB10,
   305			.depth		    = 16,
   306			.bytesperline_align = 32,
   307			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10,
   308			.size_multiplier_x2 = 2,
   309			.colorspace	    = V4L2_COLORSPACE_RAW,
   310			.step_size	    = 2,
   311		}, {
   312			.fourcc		    = V4L2_PIX_FMT_SBGGR10,
   313			.depth		    = 16,
   314			.bytesperline_align = 32,
   315			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10,
   316			.size_multiplier_x2 = 2,
   317			.colorspace	    = V4L2_COLORSPACE_RAW,
   318			.step_size	    = 2,
   319		}, {
   320			.fourcc		    = V4L2_PIX_FMT_SGRBG10,
   321			.depth		    = 16,
   322			.bytesperline_align = 32,
   323			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10,
   324			.size_multiplier_x2 = 2,
   325			.colorspace	    = V4L2_COLORSPACE_RAW,
   326			.step_size	    = 2,
   327		}, {
   328			.fourcc		    = V4L2_PIX_FMT_SGBRG10,
   329			.depth		    = 16,
   330			.bytesperline_align = 32,
   331			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10,
   332			.size_multiplier_x2 = 2,
   333			.colorspace	    = V4L2_COLORSPACE_RAW,
   334			.step_size	    = 2,
   335		}, {
   336			/* 12 bit */
   337			.fourcc		    = V4L2_PIX_FMT_SRGGB12,
   338			.depth		    = 16,
   339			.bytesperline_align = 32,
   340			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12,
   341			.size_multiplier_x2 = 2,
   342			.colorspace	    = V4L2_COLORSPACE_RAW,
   343			.step_size	    = 2,
   344		}, {
   345			.fourcc		    = V4L2_PIX_FMT_SBGGR12,
   346			.depth		    = 16,
   347			.bytesperline_align = 32,
   348			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12,
   349			.size_multiplier_x2 = 2,
   350			.colorspace	    = V4L2_COLORSPACE_RAW,
   351			.step_size	    = 2,
   352		}, {
   353			.fourcc		    = V4L2_PIX_FMT_SGRBG12,
   354			.depth		    = 16,
   355			.bytesperline_align = 32,
   356			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12,
   357			.size_multiplier_x2 = 2,
   358			.colorspace	    = V4L2_COLORSPACE_RAW,
   359			.step_size	    = 2,
   360		}, {
   361			.fourcc		    = V4L2_PIX_FMT_SGBRG12,
   362			.depth		    = 16,
   363			.bytesperline_align = 32,
   364			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12,
   365			.size_multiplier_x2 = 2,
   366			.colorspace	    = V4L2_COLORSPACE_RAW,
   367			.step_size	    = 2,
   368		}, {
   369			/* 14 bit */
   370			.fourcc		    = V4L2_PIX_FMT_SRGGB14,
   371			.depth		    = 16,
   372			.bytesperline_align = 32,
   373			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14,
   374			.size_multiplier_x2 = 2,
   375			.colorspace	    = V4L2_COLORSPACE_RAW,
   376			.step_size	    = 2,
   377		}, {
   378			.fourcc		    = V4L2_PIX_FMT_SBGGR14,
   379			.depth		    = 16,
   380			.bytesperline_align = 32,
   381			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14,
   382			.size_multiplier_x2 = 2,
   383			.colorspace	    = V4L2_COLORSPACE_RAW,
   384			.step_size	    = 2,
   385		}, {
   386			.fourcc		    = V4L2_PIX_FMT_SGRBG14,
   387			.depth		    = 16,
   388			.bytesperline_align = 32,
   389			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14,
   390			.size_multiplier_x2 = 2,
   391			.colorspace	    = V4L2_COLORSPACE_RAW,
   392			.step_size	    = 2,
   393		}, {
   394			.fourcc		    = V4L2_PIX_FMT_SGBRG14,
   395			.depth		    = 16,
   396			.bytesperline_align = 32,
   397			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14,
   398			.size_multiplier_x2 = 2,
   399			.colorspace	    = V4L2_COLORSPACE_RAW,
   400			.step_size	    = 2,
   401		}, {
   402			/* Monochrome MIPI formats */
   403			/* 8 bit */
   404			.fourcc		    = V4L2_PIX_FMT_GREY,
   405			.depth		    = 8,
   406			.bytesperline_align = 32,
   407			.mmal_fmt	    = MMAL_ENCODING_GREY,
   408			.size_multiplier_x2 = 2,
   409			.colorspace	    = V4L2_COLORSPACE_RAW,
   410			.step_size	    = 2,
   411		}, {
   412			/* 10 bit */
   413			.fourcc		    = V4L2_PIX_FMT_Y10P,
   414			.depth		    = 10,
   415			.bytesperline_align = 32,
   416			.mmal_fmt	    = MMAL_ENCODING_Y10P,
   417			.size_multiplier_x2 = 2,
   418			.colorspace	    = V4L2_COLORSPACE_RAW,
   419			.step_size	    = 2,
   420		}, {
   421			/* 12 bit */
 > 422			.fourcc		    = V4L2_PIX_FMT_Y12P,
   423			.depth		    = 12,
   424			.bytesperline_align = 32,
   425			.mmal_fmt	    = MMAL_ENCODING_Y12P,
   426			.size_multiplier_x2 = 2,
   427			.colorspace	    = V4L2_COLORSPACE_RAW,
   428			.step_size	    = 2,
   429		}, {
   430			/* 14 bit */
 > 431			.fourcc		    = V4L2_PIX_FMT_Y14P,
   432			.depth		    = 14,
   433			.bytesperline_align = 32,
   434			.mmal_fmt	    = MMAL_ENCODING_Y14P,
   435			.size_multiplier_x2 = 2,
   436			.colorspace	    = V4L2_COLORSPACE_RAW,
   437			.step_size	    = 2,
   438		}, {
   439			/* 16 bit */
   440			.fourcc		    = V4L2_PIX_FMT_Y16,
   441			.depth		    = 16,
   442			.bytesperline_align = 32,
   443			.mmal_fmt	    = MMAL_ENCODING_Y16,
   444			.size_multiplier_x2 = 2,
   445			.colorspace	    = V4L2_COLORSPACE_RAW,
   446			.step_size	    = 2,
   447		}, {
   448			/* 10 bit as 16bpp */
   449			.fourcc		    = V4L2_PIX_FMT_Y10,
   450			.depth		    = 16,
   451			.bytesperline_align = 32,
   452			.mmal_fmt	    = MMAL_ENCODING_Y10,
   453			.size_multiplier_x2 = 2,
   454			.colorspace	    = V4L2_COLORSPACE_RAW,
   455			.step_size	    = 2,
   456		}, {
   457			/* 12 bit as 16bpp */
   458			.fourcc		    = V4L2_PIX_FMT_Y12,
   459			.depth		    = 16,
   460			.bytesperline_align = 32,
   461			.mmal_fmt	    = MMAL_ENCODING_Y12,
   462			.size_multiplier_x2 = 2,
   463			.colorspace	    = V4L2_COLORSPACE_RAW,
   464			.step_size	    = 2,
   465		}, {
   466			/* 14 bit as 16bpp */
   467			.fourcc		    = V4L2_PIX_FMT_Y14,
   468			.depth		    = 16,
   469			.bytesperline_align = 32,
   470			.mmal_fmt	    = MMAL_ENCODING_Y14,
   471			.size_multiplier_x2 = 2,
   472			.colorspace	    = V4L2_COLORSPACE_RAW,
   473			.step_size	    = 2,
   474		}, {
   475			.fourcc		    = V4L2_META_FMT_BCM2835_ISP_STATS,
   476			.depth		    = 8,
   477			.mmal_fmt	    = MMAL_ENCODING_BRCM_STATS,
   478			/* The rest are not valid fields for stats. */
   479		}
   480	};
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
