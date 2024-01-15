Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1212C68E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnYw3+gE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705320531; x=1736856531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oNi0fYm53WeMCg6vNh/ZwnKsdih3/oQz9K0QZAcW29U=;
  b=PnYw3+gEsJf/tICWgkd0d3bV5bucKDXVbQ9Q/oxlnd03BrQOfoxeFAdV
   BkxZgRDKrwBnu7qZ8cp3nWtbk9Pl1m+PmY8G+e/KB4k+zebWnrpmNxTsn
   c7uND9SNuAFTovKG6cheHempb34f1qcuJlUBqh9I93aXORyTtNYrLyCgy
   52cSkGUc2i+8IucxqtcbJM0rYoX7jlmoErFGqPDTFrw6os3YiqcQeuWyt
   zwBCaXCg0J/EsMOEzFpIbqyFxzX8qWyu2k0k58QdXBMNaJtPaJkJuUNfH
   FO7sW7HTva4abZuRydhjHxsERS//HiNXz0sgqK9VmUE2zuUFRv1LTy6U1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6961671"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="6961671"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 04:08:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="759856582"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="759856582"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Jan 2024 04:08:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPLli-000CSC-39;
	Mon, 15 Jan 2024 12:08:43 +0000
Date: Mon, 15 Jan 2024 20:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Phi-bang Nguyen <pnguyen@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Julien Stephan <jstephan@baylibre.com>
Subject: [pinchartl:mtk/v6.8/pumpkin/camera 20/29]
 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c:118:24: error:
 implicit declaration of function 'v4l2_subdev_get_try_format'; did you mean
 'v4l2_subdev_get_fmt'?
Message-ID: <202401151904.0dFbqE5l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.8/pumpkin/camera
head:   112af108c9337e6c9849cdf5bbda7d13dabf81b2
commit: 232c18108136a990061216fc3431ebf07266be85 [20/29] media: platform: mediatek: isp_30: add mediatek ISP3.0 camsv
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240115/202401151904.0dFbqE5l-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151904.0dFbqE5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151904.0dFbqE5l-lkp@intel.com/

Note: the pinchartl/mtk/v6.8/pumpkin/camera HEAD 112af108c9337e6c9849cdf5bbda7d13dabf81b2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c: In function 'mtk_cam_get_pad_format':
>> drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c:118:24: error: implicit declaration of function 'v4l2_subdev_get_try_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
     118 |                 return v4l2_subdev_get_try_format(&cam->subdev, sd_state, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        v4l2_subdev_get_fmt
   drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c:118:24: warning: returning 'int' from a function with return type 'struct v4l2_mbus_framefmt *' makes pointer from integer without a cast [-Wint-conversion]
     118 |                 return v4l2_subdev_get_try_format(&cam->subdev, sd_state, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c: At top level:
   drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c:231:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'init_cfg'
     231 |         .init_cfg = mtk_cam_init_cfg,
         |          ^~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c:231:21: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' [-Werror=incompatible-pointer-types]
     231 |         .init_cfg = mtk_cam_init_cfg,
         |                     ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c:231:21: note: (near initialization for 'mtk_cam_subdev_pad_ops.enum_mbus_code')
   drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c:232:27: warning: initialized field overwritten [-Woverride-init]
     232 |         .enum_mbus_code = mtk_cam_enum_mbus_code,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c:232:27: note: (near initialization for 'mtk_cam_subdev_pad_ops.enum_mbus_code')
   cc1: some warnings being treated as errors


vim +118 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c

   110	
   111	static struct v4l2_mbus_framefmt *
   112	mtk_cam_get_pad_format(struct mtk_cam_dev *cam,
   113			       struct v4l2_subdev_state *sd_state,
   114			       unsigned int pad, u32 which)
   115	{
   116		switch (which) {
   117		case V4L2_SUBDEV_FORMAT_TRY:
 > 118			return v4l2_subdev_get_try_format(&cam->subdev, sd_state, pad);
   119		case V4L2_SUBDEV_FORMAT_ACTIVE:
   120			return &cam->formats[pad];
   121		default:
   122			return NULL;
   123		}
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
