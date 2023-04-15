Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AAA1868
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681561120; x=1713097120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vyl6rRIEYamP66Q8kU/UkBgPQPlCebRI/dqN6UCwaho=;
  b=TQdvGchFUHniY6sVUQOKw7VhPzO4yljNAAjp2G4rXXPSqN5yiViRwmJQ
   nFeO9LyC6opQGREbObxACUbCQdG5S82Qe1P5DBV2owGhSeiOvA4qAlj8j
   RBK1p+xO8gENwf+a2GiXbnGX2LGbEzSGXzEalv6J3wFXJhbg8XtsiHy6o
   ZdeVmH4EJ+xNfP97a8c3GjeTE3XwzO7gEnC2LiLdpM/eSFnH8VuIpqsr5
   HEjiO1cak22WuxK2Rg69aYuw9t8iiDnjXSGm5AerKEfzsFMeNWbMsVsUe
   cU2UxL07GTPWm6c0IrOw8i7Rxrng2DfBDLnCwJP3VpthKAIdBcNhAWLgf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="347371288"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="347371288"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 05:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="683672286"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="683672286"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2023 05:18:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnerW-000b0Z-1M;
	Sat, 15 Apr 2023 12:18:38 +0000
Date: Sat, 15 Apr 2023 20:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 3395/9838]
 drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:269:5: warning: no previous prototype
 for 'vsi_dec_capture_off'
Message-ID: <202304152014.q03gl2jc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: bb73ce236d7a42f2439007c7b58c6be33156ab01 [3395/9838] LF-5945-2: imx8m: vpu_dec: remove check reschange in driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304152014.q03gl2jc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/bb73ce236d7a42f2439007c7b58c6be33156ab01
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout bb73ce236d7a42f2439007c7b58c6be33156ab01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/ drivers/mxc/hantro_v4l2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152014.q03gl2jc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
>> drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:269:5: warning: no previous prototype for 'vsi_dec_capture_off' [-Wmissing-prototypes]
     269 | int vsi_dec_capture_off(struct vsi_v4l2_ctx *ctx)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: In function 'vsi_dec_streamoff':
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:356:28: warning: variable 'otype' set but not used [-Wunused-but-set-variable]
     356 |         enum v4l2_buf_type otype;
         |                            ^~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: At top level:
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:707:5: warning: no previous prototype for 'vsi_dec_decoder_cmd' [-Wmissing-prototypes]
     707 | int vsi_dec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:772:33: warning: initialized field overwritten [-Woverride-init]
     772 |         .vidioc_g_fmt_vid_out = vsi_dec_g_fmt,
         |                                 ^~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:772:33: note: (near initialization for 'vsi_dec_ioctl.vidioc_g_fmt_vid_out')
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: In function 'vsi_dec_buf_queue':
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:807:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     807 |         int ret;
         |             ^~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: At top level:
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:964:18: error: initialization of 'bool (*)(const struct v4l2_ctrl *, union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)' {aka '_Bool (*)(const struct v4l2_ctrl *, union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)'} from incompatible pointer type 'bool (*)(const struct v4l2_ctrl *, u32,  union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)' {aka '_Bool (*)(const struct v4l2_ctrl *, unsigned int,  union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)'} [-Werror=incompatible-pointer-types]
     964 |         .equal = vsi_dec_ctrl_equal,
         |                  ^~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:964:18: note: (near initialization for 'vsi_dec_type_ops.equal')
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:967:21: error: initialization of 'int (*)(const struct v4l2_ctrl *, union v4l2_ctrl_ptr)' from incompatible pointer type 'int (*)(const struct v4l2_ctrl *, u32,  union v4l2_ctrl_ptr)' {aka 'int (*)(const struct v4l2_ctrl *, unsigned int,  union v4l2_ctrl_ptr)'} [-Werror=incompatible-pointer-types]
     967 |         .validate = vsi_dec_ctrl_validate,
         |                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:967:21: note: (near initialization for 'vsi_dec_type_ops.validate')
   cc1: some warnings being treated as errors


vim +/vsi_dec_capture_off +269 drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c

   268	
 > 269	int vsi_dec_capture_off(struct vsi_v4l2_ctx *ctx)
   270	{
   271		int ret;
   272		struct vb2_queue *q = &ctx->output_que;
   273	
   274		if (!vb2_is_streaming(q))
   275			return 0;
   276	
   277		ret = vsiv4l2_execcmd(ctx, V4L2_DAEMON_VIDIOC_STREAMOFF_CAPTURE, NULL);
   278		if (ret < 0)
   279			return -EFAULT;
   280	
   281		mutex_unlock(&ctx->ctxlock);
   282		if (wait_event_interruptible(ctx->capoffdone_queue, vsi_checkctx_capoffdone(ctx) != 0))
   283			v4l2_klog(LOGLVL_WARNING, "%lx wait capture streamoff done timeout\n", ctx->ctxid);
   284		if (mutex_lock_interruptible(&ctx->ctxlock))
   285			return -EBUSY;
   286		ctx->buffed_capnum = 0;
   287		ctx->buffed_cropcapnum = 0;
   288		return_all_buffers(q, VB2_BUF_STATE_ERROR, 1);
   289		return vb2_streamoff(q, q->type);
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
