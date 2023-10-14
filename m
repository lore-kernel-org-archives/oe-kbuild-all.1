Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704E07E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 06:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQV6usw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697264820; x=1728800820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P19jtRnCAQ51NYB+8WaKWOeYZuhWLZJ0ELu2bsNFsgY=;
  b=PQV6usw0h2xctXJ6RxMLzPYNWP3yMWoojJKA+BW0v9hNuftPkg6AqpZG
   EVjsrKtW0Q7USXpyC5fhB93qS3GbiH2mcFr75R0PqsG6WKJneXEfqQGDj
   zj5JMHWL1NmGdBZPMk4tC4NMblif2Pmit9QSI1aX6qFcgyYUTBF0uP36m
   JIkXkvL1Hj+aV8WBRH5ZkC9BFl3MydwS8PBQEEqcuHm12VneAgUkzXK5s
   abf9v6Y4tPcUbzmSp/lLbfBc+2Kq2NpTjIRTtvzp/3myezcNyzq1riW10
   W59zIfo5Oqx5+G6/Y4+vyc4G46uhXC+egUyLaItzm4XPIFrXIdHgAdQKz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389166782"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389166782"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 23:26:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871378491"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871378491"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 23:26:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrY6y-0005m9-0E;
	Sat, 14 Oct 2023 06:26:56 +0000
Date: Sat, 14 Oct 2023 14:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3395/15768]
 drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:269:5: warning: no previous prototype
 for 'vsi_dec_capture_off'
Message-ID: <202310141448.usv6nesq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ming,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: bb73ce236d7a42f2439007c7b58c6be33156ab01 [3395/15768] LF-5945-2: imx8m: vpu_dec: remove check reschange in driver
config: arm64-randconfig-003-20231013 (https://download.01.org/0day-ci/archive/20231014/202310141448.usv6nesq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141448.usv6nesq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141448.usv6nesq-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [m]:
   - TEST_MAPLE_TREE [=m] && RUNTIME_TESTING_MENU [=y]


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
https://github.com/intel/lkp-tests/wiki
