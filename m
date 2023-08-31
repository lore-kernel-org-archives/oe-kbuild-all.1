Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5746720FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 07:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693466147; x=1725002147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxEJ1WjHq14D6I/NfalJahQWmtcJm2AaXeT/1U7O2rw=;
  b=RGZNraiiTgL32lIPaljmZ+Pr2vjljH1S68xnl66m2W02vCfXBIxki/e2
   Jh+VNjzPQdG0AATEcoKdPtRj7/rRO4xY7IaXpYIvEK/JBW/KdEfV7IQCU
   VrNcUrlOgtvuHJ6tzELVveRY1Ww1XL2ceqb53hClF+M/bOeBaYTk7n5wz
   JQwvPBWMuU6ujGCqYAFnVTFQU3m43/eNvvK+XNv0XJ6pnQnltJJxduw68
   n2UssXsKeKClUhkZDRnvTThHRUhlylx7B72JbyqQPBSTFPMsLqa5+TMfi
   arNpYTPrdg0DwL16ZuiO5a4OHdYAh8sQxFqIkWhAwciHUktLh2IN7sfmW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373244460"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="373244460"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 00:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768683210"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="768683210"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 31 Aug 2023 00:15:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbbu0-000B4B-0i;
	Thu, 31 Aug 2023 07:15:40 +0000
Date: Thu, 31 Aug 2023 15:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.5/isp/v2 17/24]
 drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h:421:39: error:
 'V4L2_PIX_FMT_Y12P' undeclared here (not in a function); did you mean
 'V4L2_PIX_FMT_Y12'?
Message-ID: <202308311505.A8GoqJ0d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.5/isp/v2
head:   f21e9808068119a1ea8f1ddb5677c982b79ac10d
commit: 11c7ef536f621f0e16903697c4785f7eee84f6d8 [17/24] staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230831/202308311505.A8GoqJ0d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311505.A8GoqJ0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311505.A8GoqJ0d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:27:
>> drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h:421:39: error: 'V4L2_PIX_FMT_Y12P' undeclared here (not in a function); did you mean 'V4L2_PIX_FMT_Y12'?
     421 |                 .fourcc             = V4L2_PIX_FMT_Y12P,
         |                                       ^~~~~~~~~~~~~~~~~
         |                                       V4L2_PIX_FMT_Y12
>> drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h:430:39: error: 'V4L2_PIX_FMT_Y14P' undeclared here (not in a function); did you mean 'V4L2_PIX_FMT_Y14'?
     430 |                 .fourcc             = V4L2_PIX_FMT_Y14P,
         |                                       ^~~~~~~~~~~~~~~~~
         |                                       V4L2_PIX_FMT_Y14


vim +421 drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h

    26	
    27	static const struct bcm2835_isp_fmt supported_formats[] = {
    28		{
    29			/* YUV formats */
    30			.fourcc		    = V4L2_PIX_FMT_YUV420,
    31			.depth		    = 8,
    32			.bytesperline_align = 64,
    33			.mmal_fmt	    = MMAL_ENCODING_I420,
    34			.size_multiplier_x2 = 3,
    35			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    36			.step_size	    = 2,
    37		}, {
    38			.fourcc		    = V4L2_PIX_FMT_YVU420,
    39			.depth		    = 8,
    40			.bytesperline_align = 64,
    41			.mmal_fmt	    = MMAL_ENCODING_YV12,
    42			.size_multiplier_x2 = 3,
    43			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    44			.step_size	    = 2,
    45		}, {
    46			.fourcc		    = V4L2_PIX_FMT_NV12,
    47			.depth		    = 8,
    48			.bytesperline_align = 32,
    49			.mmal_fmt	    = MMAL_ENCODING_NV12,
    50			.size_multiplier_x2 = 3,
    51			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    52			.step_size	    = 2,
    53		}, {
    54			.fourcc		    = V4L2_PIX_FMT_NV21,
    55			.depth		    = 8,
    56			.bytesperline_align = 32,
    57			.mmal_fmt	    = MMAL_ENCODING_NV21,
    58			.size_multiplier_x2 = 3,
    59			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    60			.step_size	    = 2,
    61		}, {
    62			.fourcc		    = V4L2_PIX_FMT_YUYV,
    63			.depth		    = 16,
    64			.bytesperline_align = 64,
    65			.mmal_fmt	    = MMAL_ENCODING_YUYV,
    66			.size_multiplier_x2 = 2,
    67			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    68			.step_size	    = 2,
    69		}, {
    70			.fourcc		    = V4L2_PIX_FMT_UYVY,
    71			.depth		    = 16,
    72			.bytesperline_align = 64,
    73			.mmal_fmt	    = MMAL_ENCODING_UYVY,
    74			.size_multiplier_x2 = 2,
    75			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    76			.step_size	    = 2,
    77		}, {
    78			.fourcc		    = V4L2_PIX_FMT_YVYU,
    79			.depth		    = 16,
    80			.bytesperline_align = 64,
    81			.mmal_fmt	    = MMAL_ENCODING_YVYU,
    82			.size_multiplier_x2 = 2,
    83			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    84			.step_size	    = 2,
    85		}, {
    86			.fourcc		    = V4L2_PIX_FMT_VYUY,
    87			.depth		    = 16,
    88			.bytesperline_align = 64,
    89			.mmal_fmt	    = MMAL_ENCODING_VYUY,
    90			.size_multiplier_x2 = 2,
    91			.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
    92			.step_size	    = 2,
    93		}, {
    94			/* RGB formats */
    95			.fourcc		    = V4L2_PIX_FMT_RGB24,
    96			.depth		    = 24,
    97			.bytesperline_align = 32,
    98			.mmal_fmt	    = MMAL_ENCODING_RGB24,
    99			.size_multiplier_x2 = 2,
   100			.colorspace	    = V4L2_COLORSPACE_SRGB,
   101			.step_size	    = 1,
   102		}, {
   103			.fourcc		    = V4L2_PIX_FMT_RGB565,
   104			.depth		    = 16,
   105			.bytesperline_align = 32,
   106			.mmal_fmt	    = MMAL_ENCODING_RGB16,
   107			.size_multiplier_x2 = 2,
   108			.colorspace	    = V4L2_COLORSPACE_SRGB,
   109			.step_size	    = 1,
   110		}, {
   111			.fourcc		    = V4L2_PIX_FMT_BGR24,
   112			.depth		    = 24,
   113			.bytesperline_align = 32,
   114			.mmal_fmt	    = MMAL_ENCODING_BGR24,
   115			.size_multiplier_x2 = 2,
   116			.colorspace	    = V4L2_COLORSPACE_SRGB,
   117			.step_size	    = 1,
   118		}, {
   119			.fourcc		    = V4L2_PIX_FMT_XBGR32,
   120			.depth		    = 32,
   121			.bytesperline_align = 64,
   122			.mmal_fmt	    = MMAL_ENCODING_BGRA,
   123			.size_multiplier_x2 = 2,
   124			.colorspace	    = V4L2_COLORSPACE_SRGB,
   125			.step_size	    = 1,
   126		}, {
   127			.fourcc		    = V4L2_PIX_FMT_RGBX32,
   128			.depth		    = 32,
   129			.bytesperline_align = 64,
   130			.mmal_fmt	    = MMAL_ENCODING_RGBA,
   131			.size_multiplier_x2 = 2,
   132			.colorspace	    = V4L2_COLORSPACE_SRGB,
   133			.step_size	    = 1,
   134		}, {
   135			/* Bayer formats */
   136			/* 8 bit */
   137			.fourcc		    = V4L2_PIX_FMT_SRGGB8,
   138			.depth		    = 8,
   139			.bytesperline_align = 32,
   140			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB8,
   141			.size_multiplier_x2 = 2,
   142			.colorspace	    = V4L2_COLORSPACE_RAW,
   143			.step_size	    = 2,
   144		}, {
   145			.fourcc		    = V4L2_PIX_FMT_SBGGR8,
   146			.depth		    = 8,
   147			.bytesperline_align = 32,
   148			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR8,
   149			.size_multiplier_x2 = 2,
   150			.colorspace	    = V4L2_COLORSPACE_RAW,
   151			.step_size	    = 2,
   152		}, {
   153			.fourcc		    = V4L2_PIX_FMT_SGRBG8,
   154			.depth		    = 8,
   155			.bytesperline_align = 32,
   156			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG8,
   157			.size_multiplier_x2 = 2,
   158			.colorspace	    = V4L2_COLORSPACE_RAW,
   159			.step_size	    = 2,
   160		}, {
   161			.fourcc		    = V4L2_PIX_FMT_SGBRG8,
   162			.depth		    = 8,
   163			.bytesperline_align = 32,
   164			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG8,
   165			.size_multiplier_x2 = 2,
   166			.colorspace	    = V4L2_COLORSPACE_RAW,
   167			.step_size	    = 2,
   168		}, {
   169			/* 10 bit */
   170			.fourcc		    = V4L2_PIX_FMT_SRGGB10P,
   171			.depth		    = 10,
   172			.bytesperline_align = 32,
   173			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10P,
   174			.size_multiplier_x2 = 2,
   175			.colorspace	    = V4L2_COLORSPACE_RAW,
   176			.step_size	    = 2,
   177		}, {
   178			.fourcc		    = V4L2_PIX_FMT_SBGGR10P,
   179			.depth		    = 10,
   180			.bytesperline_align = 32,
   181			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10P,
   182			.size_multiplier_x2 = 2,
   183			.colorspace	    = V4L2_COLORSPACE_RAW,
   184			.step_size	    = 2,
   185		}, {
   186			.fourcc		    = V4L2_PIX_FMT_SGRBG10P,
   187			.depth		    = 10,
   188			.bytesperline_align = 32,
   189			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10P,
   190			.size_multiplier_x2 = 2,
   191			.colorspace	    = V4L2_COLORSPACE_RAW,
   192			.step_size	    = 2,
   193		}, {
   194			.fourcc		    = V4L2_PIX_FMT_SGBRG10P,
   195			.depth		    = 10,
   196			.bytesperline_align = 32,
   197			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10P,
   198			.size_multiplier_x2 = 2,
   199			.colorspace	    = V4L2_COLORSPACE_RAW,
   200			.step_size	    = 2,
   201		}, {
   202			/* 12 bit */
   203			.fourcc		    = V4L2_PIX_FMT_SRGGB12P,
   204			.depth		    = 12,
   205			.bytesperline_align = 32,
   206			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12P,
   207			.size_multiplier_x2 = 2,
   208			.colorspace	    = V4L2_COLORSPACE_RAW,
   209			.step_size	    = 2,
   210		}, {
   211			.fourcc		    = V4L2_PIX_FMT_SBGGR12P,
   212			.depth		    = 12,
   213			.bytesperline_align = 32,
   214			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12P,
   215			.size_multiplier_x2 = 2,
   216			.colorspace	    = V4L2_COLORSPACE_RAW,
   217			.step_size	    = 2,
   218		}, {
   219			.fourcc		    = V4L2_PIX_FMT_SGRBG12P,
   220			.depth		    = 12,
   221			.bytesperline_align = 32,
   222			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12P,
   223			.size_multiplier_x2 = 2,
   224			.colorspace	    = V4L2_COLORSPACE_RAW,
   225			.step_size	    = 2,
   226		}, {
   227			.fourcc		    = V4L2_PIX_FMT_SGBRG12P,
   228			.depth		    = 12,
   229			.bytesperline_align = 32,
   230			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12P,
   231			.size_multiplier_x2 = 2,
   232			.colorspace	    = V4L2_COLORSPACE_RAW,
   233			.step_size	    = 2,
   234		}, {
   235			/* 14 bit */
   236			.fourcc		    = V4L2_PIX_FMT_SRGGB14P,
   237			.depth		    = 14,
   238			.bytesperline_align = 32,
   239			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14P,
   240			.size_multiplier_x2 = 2,
   241			.colorspace	    = V4L2_COLORSPACE_RAW,
   242			.step_size	    = 2,
   243		}, {
   244			.fourcc		    = V4L2_PIX_FMT_SBGGR14P,
   245			.depth		    = 14,
   246			.bytesperline_align = 32,
   247			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14P,
   248			.size_multiplier_x2 = 2,
   249			.colorspace	    = V4L2_COLORSPACE_RAW,
   250			.step_size	    = 2,
   251		}, {
   252			.fourcc		    = V4L2_PIX_FMT_SGRBG14P,
   253			.depth		    = 14,
   254			.bytesperline_align = 32,
   255			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14P,
   256			.size_multiplier_x2 = 2,
   257			.colorspace	    = V4L2_COLORSPACE_RAW,
   258			.step_size	    = 2,
   259		}, {
   260			.fourcc		    = V4L2_PIX_FMT_SGBRG14P,
   261			.depth		    = 14,
   262			.bytesperline_align = 32,
   263			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14P,
   264			.size_multiplier_x2 = 2,
   265			.colorspace	    = V4L2_COLORSPACE_RAW,
   266			.step_size	    = 2,
   267		}, {
   268			/* 16 bit */
   269			.fourcc		    = V4L2_PIX_FMT_SRGGB16,
   270			.depth		    = 16,
   271			.bytesperline_align = 32,
   272			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB16,
   273			.size_multiplier_x2 = 2,
   274			.colorspace	    = V4L2_COLORSPACE_RAW,
   275			.step_size	    = 2,
   276		}, {
   277			.fourcc		    = V4L2_PIX_FMT_SBGGR16,
   278			.depth		    = 16,
   279			.bytesperline_align = 32,
   280			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR16,
   281			.size_multiplier_x2 = 2,
   282			.colorspace	    = V4L2_COLORSPACE_RAW,
   283			.step_size	    = 2,
   284		}, {
   285			.fourcc		    = V4L2_PIX_FMT_SGRBG16,
   286			.depth		    = 16,
   287			.bytesperline_align = 32,
   288			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG16,
   289			.size_multiplier_x2 = 2,
   290			.colorspace	    = V4L2_COLORSPACE_RAW,
   291			.step_size	    = 2,
   292		}, {
   293			.fourcc		    = V4L2_PIX_FMT_SGBRG16,
   294			.depth		    = 16,
   295			.bytesperline_align = 32,
   296			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG16,
   297			.size_multiplier_x2 = 2,
   298			.colorspace	    = V4L2_COLORSPACE_RAW,
   299			.step_size	    = 2,
   300		}, {
   301			/* Bayer formats unpacked to 16bpp */
   302			/* 10 bit */
   303			.fourcc		    = V4L2_PIX_FMT_SRGGB10,
   304			.depth		    = 16,
   305			.bytesperline_align = 32,
   306			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10,
   307			.size_multiplier_x2 = 2,
   308			.colorspace	    = V4L2_COLORSPACE_RAW,
   309			.step_size	    = 2,
   310		}, {
   311			.fourcc		    = V4L2_PIX_FMT_SBGGR10,
   312			.depth		    = 16,
   313			.bytesperline_align = 32,
   314			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10,
   315			.size_multiplier_x2 = 2,
   316			.colorspace	    = V4L2_COLORSPACE_RAW,
   317			.step_size	    = 2,
   318		}, {
   319			.fourcc		    = V4L2_PIX_FMT_SGRBG10,
   320			.depth		    = 16,
   321			.bytesperline_align = 32,
   322			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10,
   323			.size_multiplier_x2 = 2,
   324			.colorspace	    = V4L2_COLORSPACE_RAW,
   325			.step_size	    = 2,
   326		}, {
   327			.fourcc		    = V4L2_PIX_FMT_SGBRG10,
   328			.depth		    = 16,
   329			.bytesperline_align = 32,
   330			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10,
   331			.size_multiplier_x2 = 2,
   332			.colorspace	    = V4L2_COLORSPACE_RAW,
   333			.step_size	    = 2,
   334		}, {
   335			/* 12 bit */
   336			.fourcc		    = V4L2_PIX_FMT_SRGGB12,
   337			.depth		    = 16,
   338			.bytesperline_align = 32,
   339			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12,
   340			.size_multiplier_x2 = 2,
   341			.colorspace	    = V4L2_COLORSPACE_RAW,
   342			.step_size	    = 2,
   343		}, {
   344			.fourcc		    = V4L2_PIX_FMT_SBGGR12,
   345			.depth		    = 16,
   346			.bytesperline_align = 32,
   347			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12,
   348			.size_multiplier_x2 = 2,
   349			.colorspace	    = V4L2_COLORSPACE_RAW,
   350			.step_size	    = 2,
   351		}, {
   352			.fourcc		    = V4L2_PIX_FMT_SGRBG12,
   353			.depth		    = 16,
   354			.bytesperline_align = 32,
   355			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12,
   356			.size_multiplier_x2 = 2,
   357			.colorspace	    = V4L2_COLORSPACE_RAW,
   358			.step_size	    = 2,
   359		}, {
   360			.fourcc		    = V4L2_PIX_FMT_SGBRG12,
   361			.depth		    = 16,
   362			.bytesperline_align = 32,
   363			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12,
   364			.size_multiplier_x2 = 2,
   365			.colorspace	    = V4L2_COLORSPACE_RAW,
   366			.step_size	    = 2,
   367		}, {
   368			/* 14 bit */
   369			.fourcc		    = V4L2_PIX_FMT_SRGGB14,
   370			.depth		    = 16,
   371			.bytesperline_align = 32,
   372			.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14,
   373			.size_multiplier_x2 = 2,
   374			.colorspace	    = V4L2_COLORSPACE_RAW,
   375			.step_size	    = 2,
   376		}, {
   377			.fourcc		    = V4L2_PIX_FMT_SBGGR14,
   378			.depth		    = 16,
   379			.bytesperline_align = 32,
   380			.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14,
   381			.size_multiplier_x2 = 2,
   382			.colorspace	    = V4L2_COLORSPACE_RAW,
   383			.step_size	    = 2,
   384		}, {
   385			.fourcc		    = V4L2_PIX_FMT_SGRBG14,
   386			.depth		    = 16,
   387			.bytesperline_align = 32,
   388			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14,
   389			.size_multiplier_x2 = 2,
   390			.colorspace	    = V4L2_COLORSPACE_RAW,
   391			.step_size	    = 2,
   392		}, {
   393			.fourcc		    = V4L2_PIX_FMT_SGBRG14,
   394			.depth		    = 16,
   395			.bytesperline_align = 32,
   396			.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14,
   397			.size_multiplier_x2 = 2,
   398			.colorspace	    = V4L2_COLORSPACE_RAW,
   399			.step_size	    = 2,
   400		}, {
   401			/* Monochrome MIPI formats */
   402			/* 8 bit */
   403			.fourcc		    = V4L2_PIX_FMT_GREY,
   404			.depth		    = 8,
   405			.bytesperline_align = 32,
   406			.mmal_fmt	    = MMAL_ENCODING_GREY,
   407			.size_multiplier_x2 = 2,
   408			.colorspace	    = V4L2_COLORSPACE_RAW,
   409			.step_size	    = 2,
   410		}, {
   411			/* 10 bit */
   412			.fourcc		    = V4L2_PIX_FMT_Y10P,
   413			.depth		    = 10,
   414			.bytesperline_align = 32,
   415			.mmal_fmt	    = MMAL_ENCODING_Y10P,
   416			.size_multiplier_x2 = 2,
   417			.colorspace	    = V4L2_COLORSPACE_RAW,
   418			.step_size	    = 2,
   419		}, {
   420			/* 12 bit */
 > 421			.fourcc		    = V4L2_PIX_FMT_Y12P,
   422			.depth		    = 12,
   423			.bytesperline_align = 32,
   424			.mmal_fmt	    = MMAL_ENCODING_Y12P,
   425			.size_multiplier_x2 = 2,
   426			.colorspace	    = V4L2_COLORSPACE_RAW,
   427			.step_size	    = 2,
   428		}, {
   429			/* 14 bit */
 > 430			.fourcc		    = V4L2_PIX_FMT_Y14P,
   431			.depth		    = 14,
   432			.bytesperline_align = 32,
   433			.mmal_fmt	    = MMAL_ENCODING_Y14P,
   434			.size_multiplier_x2 = 2,
   435			.colorspace	    = V4L2_COLORSPACE_RAW,
   436			.step_size	    = 2,
   437		}, {
   438			/* 16 bit */
   439			.fourcc		    = V4L2_PIX_FMT_Y16,
   440			.depth		    = 16,
   441			.bytesperline_align = 32,
   442			.mmal_fmt	    = MMAL_ENCODING_Y16,
   443			.size_multiplier_x2 = 2,
   444			.colorspace	    = V4L2_COLORSPACE_RAW,
   445			.step_size	    = 2,
   446		}, {
   447			/* 10 bit as 16bpp */
   448			.fourcc		    = V4L2_PIX_FMT_Y10,
   449			.depth		    = 16,
   450			.bytesperline_align = 32,
   451			.mmal_fmt	    = MMAL_ENCODING_Y10,
   452			.size_multiplier_x2 = 2,
   453			.colorspace	    = V4L2_COLORSPACE_RAW,
   454			.step_size	    = 2,
   455		}, {
   456			/* 12 bit as 16bpp */
   457			.fourcc		    = V4L2_PIX_FMT_Y12,
   458			.depth		    = 16,
   459			.bytesperline_align = 32,
   460			.mmal_fmt	    = MMAL_ENCODING_Y12,
   461			.size_multiplier_x2 = 2,
   462			.colorspace	    = V4L2_COLORSPACE_RAW,
   463			.step_size	    = 2,
   464		}, {
   465			/* 14 bit as 16bpp */
   466			.fourcc		    = V4L2_PIX_FMT_Y14,
   467			.depth		    = 16,
   468			.bytesperline_align = 32,
   469			.mmal_fmt	    = MMAL_ENCODING_Y14,
   470			.size_multiplier_x2 = 2,
   471			.colorspace	    = V4L2_COLORSPACE_RAW,
   472			.step_size	    = 2,
   473		}, {
   474			.fourcc		    = V4L2_META_FMT_BCM2835_ISP_STATS,
   475			.depth		    = 8,
   476			.mmal_fmt	    = MMAL_ENCODING_BRCM_STATS,
   477			/* The rest are not valid fields for stats. */
   478		}
   479	};
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
