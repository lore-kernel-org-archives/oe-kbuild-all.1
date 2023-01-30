Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3833C13
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675095035; x=1706631035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YtXPq6j9wEoizKEGCfjWmjtNFGa8QS16bW3Fx/cJNBs=;
  b=G4Z17kyOjYtFUV15Nay519J1gIQ8S/2TDZt3cmIQrMVsOkvr0GWxGKGS
   R3umxrLaT91zNQRivd6Mo+ikf+0WWGrKuKENlVOJmrNBhbkRHNSl42iAU
   ywK5ATqwrnG2/l/nuJ8rpqdiGyK+3cavzmIQJqcR6e9nAEZubTAOO00w/
   BVPQxB59aqR+QGKLDKTZHlFywmybgz9sdgBtaXe6D/BkZWo8RBYjxrRdL
   pYLJVRfbN2ClXNJ3XvsNRnrt5StgUXL4AU/fwd70QLxIxS8K156qKcZsq
   uRPCNqrL1r+i9cg6QKXS3MbOa28IWac8BZby8zkUXxAB7TqKvCDQMpPAR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307942456"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="307942456"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 08:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="641597727"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="641597727"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jan 2023 08:08:13 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMWhT-0003jU-1O;
	Mon, 30 Jan 2023 16:08:07 +0000
Date: Tue, 31 Jan 2023 00:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.co.uk
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v6 3/5] media: verisilicon: Do not set ctx->bit_depth in
 hantro_try_ctrl()
Message-ID: <202301302359.3230lcVf-lkp@intel.com>
References: <20230130135802.744743-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130135802.744743-4-benjamin.gaignard@collabora.com>

Hi Benjamin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/streams linus/master v6.2-rc6 next-20230130]
[cannot apply to pza/reset/next pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-verisilicon-Do-not-set-context-src-dst-formats-in-reset-functions/20230130-220204
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230130135802.744743-4-benjamin.gaignard%40collabora.com
patch subject: [PATCH v6 3/5] media: verisilicon: Do not set ctx->bit_depth in hantro_try_ctrl()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230130/202301302359.3230lcVf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aecd2de6feaeb163aa78d82f1172b0020b64b174
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/media-verisilicon-Do-not-set-context-src-dst-formats-in-reset-functions/20230130-220204
        git checkout aecd2de6feaeb163aa78d82f1172b0020b64b174
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/platform/verisilicon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/platform/verisilicon/hantro_drv.c: In function 'hantro_try_ctrl':
>> drivers/media/platform/verisilicon/hantro_drv.c:254:28: warning: variable 'ctx' set but not used [-Wunused-but-set-variable]
     254 |         struct hantro_ctx *ctx;
         |                            ^~~


vim +/ctx +254 drivers/media/platform/verisilicon/hantro_drv.c

775fec69008d30 drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c Ezequiel Garcia       2018-12-05  251  
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  252  static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  253  {
4bec03301ecd81 drivers/media/platform/verisilicon/hantro_drv.c       Benjamin Gaignard     2022-08-29 @254  	struct hantro_ctx *ctx;
4bec03301ecd81 drivers/media/platform/verisilicon/hantro_drv.c       Benjamin Gaignard     2022-08-29  255  
4bec03301ecd81 drivers/media/platform/verisilicon/hantro_drv.c       Benjamin Gaignard     2022-08-29  256  	ctx = container_of(ctrl->handler,
4bec03301ecd81 drivers/media/platform/verisilicon/hantro_drv.c       Benjamin Gaignard     2022-08-29  257  			   struct hantro_ctx, ctrl_handler);
4bec03301ecd81 drivers/media/platform/verisilicon/hantro_drv.c       Benjamin Gaignard     2022-08-29  258  
46a309d2751787 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-11-26  259  	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  260  		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  261  
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  262  		if (sps->chroma_format_idc > 1)
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  263  			/* Only 4:0:0 and 4:2:0 are supported */
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  264  			return -EINVAL;
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  265  		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  266  			/* Luma and chroma bit depth mismatch */
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  267  			return -EINVAL;
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  268  		if (sps->bit_depth_luma_minus8 != 0)
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  269  			/* Only 8-bit is supported */
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  270  			return -EINVAL;
b92de2f91821ce drivers/staging/media/hantro/hantro_drv.c             Benjamin Gaignard     2022-07-08  271  	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
8968cfc282955c drivers/staging/media/hantro/hantro_drv.c             Benjamin Gaignard     2021-06-03  272  		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
8968cfc282955c drivers/staging/media/hantro/hantro_drv.c             Benjamin Gaignard     2021-06-03  273  
d040a24b5aaede drivers/media/platform/verisilicon/hantro_drv.c       Benjamin Gaignard     2022-08-29  274  		if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
d040a24b5aaede drivers/media/platform/verisilicon/hantro_drv.c       Benjamin Gaignard     2022-08-29  275  			/* Only 8-bit and 10-bit are supported */
df9ec2fc8e70e0 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2022-07-18  276  			return -EINVAL;
e2da465455ce48 drivers/staging/media/hantro/hantro_drv.c             Andrzej Pietrasiewicz 2021-11-16  277  	} else if (ctrl->id == V4L2_CID_STATELESS_VP9_FRAME) {
e2da465455ce48 drivers/staging/media/hantro/hantro_drv.c             Andrzej Pietrasiewicz 2021-11-16  278  		const struct v4l2_ctrl_vp9_frame *dec_params = ctrl->p_new.p_vp9_frame;
e2da465455ce48 drivers/staging/media/hantro/hantro_drv.c             Andrzej Pietrasiewicz 2021-11-16  279  
e2da465455ce48 drivers/staging/media/hantro/hantro_drv.c             Andrzej Pietrasiewicz 2021-11-16  280  		/* We only support profile 0 */
e2da465455ce48 drivers/staging/media/hantro/hantro_drv.c             Andrzej Pietrasiewicz 2021-11-16  281  		if (dec_params->profile != 0)
e2da465455ce48 drivers/staging/media/hantro/hantro_drv.c             Andrzej Pietrasiewicz 2021-11-16  282  			return -EINVAL;
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  283  	}
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  284  	return 0;
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  285  }
d70cca73234420 drivers/staging/media/hantro/hantro_drv.c             Ezequiel Garcia       2020-07-09  286  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
