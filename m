Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77B838F9D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgjahGrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699568889; x=1731104889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NzZun91rK2ZYHuPbK2XlXmGD/BdEFWiUu4HxMpUZF2g=;
  b=cgjahGrTZwHH8O+2KG01nCjz3jVHDBY4bh5i8awH402a+MBD+yqWmA6K
   aV77ptUOJGHsrdAlJlET5rkbAeVZ3Eq3sj11ew8GfQNTYcM7x4IKTvOdX
   a4kyCVpLRZjeNy3IdC/9CVejkf5kH7G2OTQvp2xi2ledNK491xt/DFkxs
   2Rll2EjMiK7sIq6O/GsWxW71ffdjW5+T8H32dP9N8iocOexOs4kyCxRXf
   OdBELTHB/E5l26rZXjOmu3AyXqmnpFldFHHTTIlGHRk3rIWjut1tAJlsP
   5P//gZkbqA3bU+T1VZd9lw9JOq8dxhOePNODpdzZPS72ix7wjmpok6Qcv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="456580159"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="456580159"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:28:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="829458490"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="829458490"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2023 14:28:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1DVN-0009D2-2E;
	Thu, 09 Nov 2023 22:28:05 +0000
Date: Fri, 10 Nov 2023 06:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:master 32/34] drivers/media/i2c/adv7183.c:446:18:
 error: implicit declaration of function 'v4l2_subdev_state_get_format'
Message-ID: <202311100616.h7UgoA0S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   62bdf633090d684c3ac6d3b46e926c0ac8cef466
commit: c2c00a388aa086ffb18e44c3ba35db764a9dce3f [32/34] media: v4l: subdev: Switch to stream-aware state functions
config: i386-randconfig-062-20231110 (https://download.01.org/0day-ci/archive/20231110/202311100616.h7UgoA0S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100616.h7UgoA0S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100616.h7UgoA0S-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/adv7183.c: In function 'adv7183_set_fmt':
>> drivers/media/i2c/adv7183.c:446:18: error: implicit declaration of function 'v4l2_subdev_state_get_format' [-Werror=implicit-function-declaration]
     446 |                 *v4l2_subdev_state_get_format(sd_state, 0) = *fmt;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7183.c:446:17: error: invalid type argument of unary '*' (have 'int')
     446 |                 *v4l2_subdev_state_get_format(sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/i2c/tw9910.c: In function 'tw9910_set_fmt':
>> drivers/media/i2c/tw9910.c:832:10: error: implicit declaration of function 'v4l2_subdev_state_get_format' [-Werror=implicit-function-declaration]
     832 |         *v4l2_subdev_state_get_format(sd_state, 0) = *mf;
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tw9910.c:832:9: error: invalid type argument of unary '*' (have 'int')
     832 |         *v4l2_subdev_state_get_format(sd_state, 0) = *mf;
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/v4l2_subdev_state_get_format +446 drivers/media/i2c/adv7183.c

   421	
   422	static int adv7183_set_fmt(struct v4l2_subdev *sd,
   423			struct v4l2_subdev_state *sd_state,
   424			struct v4l2_subdev_format *format)
   425	{
   426		struct adv7183 *decoder = to_adv7183(sd);
   427		struct v4l2_mbus_framefmt *fmt = &format->format;
   428	
   429		if (format->pad)
   430			return -EINVAL;
   431	
   432		fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
   433		fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
   434		if (decoder->std & V4L2_STD_525_60) {
   435			fmt->field = V4L2_FIELD_SEQ_TB;
   436			fmt->width = 720;
   437			fmt->height = 480;
   438		} else {
   439			fmt->field = V4L2_FIELD_SEQ_BT;
   440			fmt->width = 720;
   441			fmt->height = 576;
   442		}
   443		if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
   444			decoder->fmt = *fmt;
   445		else
 > 446			*v4l2_subdev_state_get_format(sd_state, 0) = *fmt;
   447		return 0;
   448	}
   449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
