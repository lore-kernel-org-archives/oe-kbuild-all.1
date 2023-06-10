Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179C206B8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 20:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686428486; x=1717964486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uj87he4To4VCHnFNBjKdpkt4T1rvOjDghpHQyxj7dEk=;
  b=XqkiQAY6HOV+5lqcxos8RVFqcsy7tSVSE8GQnxQTwyMCgo/92mbBegHq
   kpxP2r7cSqRiLLpMgjUDgvz59/KNudP1y7vypXRCRDnLkW7K1JAnlhQSW
   Y2n3TNsQLWaba+HhfXh9+Qa9/a4w2slG0XdvFPBi9RDWuQwwMQWOjqyVU
   Q+F8M3yfpQH5i3T/4u0JAsncJ60plHJqxYdzG2ELU5XhTO0UdKKhhzKsw
   irHgTVg5D/F1x0Tvhdvu0jyeP5qnmdjzykLqXsmwPDs7pCP34qtoS9xWX
   VTupFKYN6qI0c8Ku3YU2Ry0fZhg2PfxuHn8GlH+kQtTQgPCtya519XUrj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="342488176"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="342488176"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 13:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="775861163"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="775861163"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jun 2023 13:21:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q855P-000APM-3D;
	Sat, 10 Jun 2023 20:21:24 +0000
Date: Sun, 11 Jun 2023 04:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 24/44]
 drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:751:92: warning:
 implicit conversion from 'enum img_format' to 'enum img_standard'
Message-ID: <202306110412.HpJ6jMdJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   625b783e0c76b86448fb8a8b9f8c09fb2220e096
commit: a27688b9cf83d2519fb3427e048342f6f180a051 [24/44] media: img: vxe-vxd: enable GStreamer 1.20.5
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230611/202306110412.HpJ6jMdJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout a27688b9cf83d2519fb3427e048342f6f180a051
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/img/vxe-vxd/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110412.HpJ6jMdJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c: In function 'vxe_open':
>> drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:751:92: warning: implicit conversion from 'enum img_format' to 'enum img_standard' [-Wenum-conversion]
     751 |                                                                          ctx->cap_queue.fmt->fmt,
         |                                                                          ~~~~~~~~~~~~~~~~~~^~~~~


vim +751 drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c

   685	
   686	static int vxe_open(struct file *file)
   687	{
   688		struct vxe_dev *vxe = video_drvdata(file);
   689		struct vxe_enc_ctx *ctx;
   690		int i, ret = 0;
   691		struct v4l2_ctrl_handler *v4l2_ctrl_hdl;
   692	
   693		dev_dbg(vxe->dev, "%s:%d vxe %p\n", __func__, __LINE__, vxe);
   694	
   695		mutex_lock((struct mutex *)vxe->mutex);
   696	
   697		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   698		if (!ctx) {
   699			mutex_unlock((struct mutex *)vxe->mutex);
   700			return -ENOMEM;
   701		}
   702	
   703		v4l2_ctrl_hdl = &ctx->v4l2_ctrl_hdl;
   704	
   705		ctx->mutex = kzalloc(sizeof(*ctx->mutex), GFP_KERNEL);
   706		if (!ctx->mutex)
   707			return -ENOMEM;
   708	
   709		mutex_init(ctx->mutex);
   710	
   711		ctx->dev = vxe;
   712		ctx->s_fmt_flags = 0;
   713		ctx->eos = FALSE;
   714		ctx->flag_last = FALSE;
   715		ctx->available_coded_packages = 0;
   716		ctx->available_source_frames = 0;
   717		ctx->frames_encoding = 0;
   718		ctx->frame_num = 0;
   719		ctx->rc.frame_rate = VXE_ENCODER_DEFAULT_FRAMERATE;
   720		ctx->rc.initial_qp_i = VXE_ENCODER_INITIAL_QP_I;
   721		ctx->out_queue.streaming = FALSE;
   722		ctx->cap_queue.streaming = FALSE;
   723	
   724		/* set the sequence numbers to zero */
   725		ctx->cap_seq = 0;
   726		ctx->out_seq = 0;
   727	
   728		/* set some default widths and heights */
   729		ctx->cap_queue.height = VXE_ENCODER_DEFAULT_HEIGHT;
   730		ctx->cap_queue.width = VXE_ENCODER_DEFAULT_WIDTH;
   731		ctx->out_queue.height = VXE_ENCODER_DEFAULT_HEIGHT;
   732		ctx->out_queue.width = VXE_ENCODER_DEFAULT_WIDTH;
   733	
   734		for (i = 0; i < ARRAY_SIZE(vxe_enc_formats); i++) {
   735			if (vxe_enc_formats[i].type ==
   736				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
   737				ctx->out_queue.fmt = &vxe_enc_formats[i];
   738				break;
   739			}
   740		}
   741		for (i = 0; i < ARRAY_SIZE(vxe_enc_formats); i++) {
   742			if (vxe_enc_formats[i].type ==
   743				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
   744				ctx->cap_queue.fmt = &vxe_enc_formats[i];
   745				break;
   746			}
   747		}
   748	
   749		for (i = 0; i < ctx->cap_queue.fmt->num_planes; i++) {
   750			ctx->cap_queue.size_image[i] = topaz_get_coded_buffer_max_size(NULL,
 > 751										 ctx->cap_queue.fmt->fmt,
   752										 ctx->cap_queue.width,
   753										 ctx->cap_queue.height,
   754										 &ctx->rc);
   755	
   756			ctx->cap_queue.bytesperline[i] = 0;
   757		}
   758	
   759		for (i = 0; i < ctx->out_queue.fmt->num_planes; i++) {
   760			ctx->out_queue.bytesperline[i] = vxe_get_stride(ctx->out_queue.width,
   761							ctx->out_queue.fmt);
   762			ctx->out_queue.size_image[i] = vxe_get_sizeimage(ctx->out_queue.bytesperline[i],
   763							ctx->out_queue.height, ctx->out_queue.fmt, i);
   764		}
   765	
   766		v4l2_fh_init(&ctx->fh, video_devdata(file));
   767		file->private_data = &ctx->fh;
   768	
   769		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vxe->m2m_dev, ctx, &queue_init);
   770		if (IS_ERR_VALUE((unsigned long)ctx->fh.m2m_ctx)) {
   771			ret = (long)(ctx->fh.m2m_ctx);
   772			goto exit;
   773		}
   774	
   775		v4l2_ctrl_handler_init(v4l2_ctrl_hdl, 10);
   776		v4l2_ctrl_new_std(v4l2_ctrl_hdl, &vxe_enc_ctrl_ops,
   777				  V4L2_CID_MPEG_VIDEO_BITRATE,
   778				  0, 700000000, 1, 100000);
   779		v4l2_ctrl_new_std(v4l2_ctrl_hdl, &vxe_enc_ctrl_ops,
   780				  V4L2_CID_MPEG_VIDEO_GOP_SIZE,
   781				  0, 2047, 1, 30);
   782		v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &vxe_enc_ctrl_ops,
   783				       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
   784				       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE, 0,
   785				       V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
   786		v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &vxe_enc_ctrl_ops,
   787				       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
   788				       V4L2_MPEG_VIDEO_H264_LEVEL_5_1, 0,
   789				       V4L2_MPEG_VIDEO_H264_LEVEL_1_0);
   790		v4l2_ctrl_new_std(v4l2_ctrl_hdl, &vxe_enc_ctrl_ops,
   791				  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 2);
   792	
   793		if (v4l2_ctrl_hdl->error) {
   794			kfree(ctx->mutex);
   795			kfree(ctx);
   796			return -ENODEV;
   797		}
   798	
   799		ctx->fh.ctrl_handler = v4l2_ctrl_hdl;
   800		v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
   801	
   802		ctx->colorspace = V4L2_COLORSPACE_REC709;
   803		ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
   804		ctx->hsv_enc = 0;
   805		ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
   806		ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
   807	
   808		vxe_fill_default_params(ctx);
   809	
   810		v4l2_fh_add(&ctx->fh);
   811	
   812		vxe_create_ctx(vxe, ctx);
   813	
   814		/* TODO: Add stream id creation */
   815	exit:
   816		mutex_unlock((struct mutex *)vxe->mutex);
   817		return ret;
   818	}
   819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
