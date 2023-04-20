Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD78F44
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 17:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682013457; x=1713549457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FPQODkT9MsR3u92pYJqJT/Xfe785FIMlUqq28fc35d8=;
  b=VRyOoVLT4xGG1komssIdqIUGFS5agHIjkcw5m3VqLYN2wu5rMPzkeV7K
   Ofx0WlS/JJTOmgQPCfeTpOwbhWbPX5hWabdSsVo30AAO9/Z4+EhdCgR3K
   3XFs44ISUP9FUPJ45FadWWE8FBRNJJ1GX69T3BY4IcKzMeOrtRlIxhA2A
   nX3x+T6j6DEpoKdYUNiPptj9tfVYdkODtHR7vxklK8yM3TgDGsdxhxFTz
   P726BB7Iylv9wZ2QREN3YOJvHP9AJllvJVyodUnjG5Kw6BzWZu6PyplKd
   W+RmRe/XeG6a8rUkIMfv4zhWQFMYdjAjgWfKlaPgrUq0WYnuts1wRmNcK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348596100"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="348596100"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 10:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="866394719"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="866394719"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Apr 2023 10:38:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppYF6-000fz4-0k;
	Thu, 20 Apr 2023 17:38:48 +0000
Date: Fri, 21 Apr 2023 01:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [mgr:v6.3/topic/rk3568-vepu-h264-stateless-bootlin 2/4]
 drivers/media/platform/verisilicon/rockchip_vpu_hw_h264_enc.c:102:13:
 warning: variable 'encoded_slices' set but not used
Message-ID: <202304210125.6BdceEqd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.pengutronix.de/git/mgr/linux v6.3/topic/rk3568-vepu-h264-stateless-bootlin
head:   d0897ac6844c86a8d8d6f90d4116eb068184010c
commit: 452e1107911322bff499bf90e88a42b4d3560e6e [2/4] media: hantro: Add H.264 encoding support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230421/202304210125.6BdceEqd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add mgr https://git.pengutronix.de/git/mgr/linux
        git fetch --no-tags mgr v6.3/topic/rk3568-vepu-h264-stateless-bootlin
        git checkout 452e1107911322bff499bf90e88a42b4d3560e6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/platform/verisilicon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210125.6BdceEqd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/verisilicon/rockchip_vpu_hw_h264_enc.c: In function 'rk3399_vpu_h264_enc_done':
>> drivers/media/platform/verisilicon/rockchip_vpu_hw_h264_enc.c:102:13: warning: variable 'encoded_slices' set but not used [-Wunused-but-set-variable]
     102 |         u32 encoded_slices;
         |             ^~~~~~~~~~~~~~


vim +/encoded_slices +102 drivers/media/platform/verisilicon/rockchip_vpu_hw_h264_enc.c

    92	
    93	void rk3399_vpu_h264_enc_done(struct hantro_ctx *ctx)
    94	{
    95		struct hantro_dev *vpu = ctx->dev;
    96		struct vb2_v4l2_buffer *dst_buf;
    97		struct v4l2_ctrl_h264_encode_feedback encode_feedback = { 0 };
    98		struct v4l2_ctrl *ctrl;
    99		unsigned int i;
   100		u32 cp_overflow = 0;
   101		u32 cp_prev = 0;
 > 102		u32 encoded_slices;
   103		u32 bytesused;
   104	
   105		ctrl = v4l2_ctrl_find(&ctx->ctrl_handler,
   106				      V4L2_CID_STATELESS_H264_ENCODE_FEEDBACK);
   107		if (!ctrl)
   108			return;
   109	
   110		dst_buf = hantro_get_dst_buf(ctx);
   111		if (!dst_buf)
   112			return;
   113	
   114		bytesused = vepu_read(vpu, VEPU_REG_STR_BUF_LIMIT) / 8;
   115		dst_buf->vb2_buf.planes[0].bytesused = bytesused;
   116	
   117		encode_feedback.qp_sum =
   118			VEPU_REG_QP_SUM(vepu_read(vpu, VEPU_REG_QP_SUM_DIV2));
   119	
   120		encode_feedback.mad_count =
   121			VEPU_REG_MB_CNT_SET(vepu_read(vpu, VEPU_REG_MB_CTRL));
   122	
   123		encode_feedback.rlc_count =
   124			VEPU_REG_RLC_SUM_OUT(vepu_read(vpu, VEPU_REG_RLC_SUM));
   125	
   126		for (i = 0; i < ARRAY_SIZE(encode_feedback.cp); i++) {
   127			/* Each register holds two checkpoint values. */
   128			u32 cp_index = i / 2;
   129			u32 cp_reg = VEPU_REG_CHECKPOINT(cp_index);
   130			u32 cp_read = vepu_read(vpu, cp_reg);
   131			u32 cp_value = VEPU_REG_CHECKPOINT_RESULT(cp_read, i);
   132	
   133			/* Hardware might overflow, correct it here. */
   134			if (cp_value < cp_prev)
   135				cp_overflow += (1 << 21);
   136	
   137			encode_feedback.cp[i] = cp_value + cp_overflow;
   138			cp_prev = cp_value;
   139		}
   140	
   141		v4l2_ctrl_s_ctrl_compound(ctrl, V4L2_CTRL_TYPE_H264_ENCODE_FEEDBACK,
   142					  &encode_feedback);
   143	
   144		encoded_slices = (vepu_read(vpu, VEPU_REG_ENC_CTRL1) >> 16) & 0xff;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
