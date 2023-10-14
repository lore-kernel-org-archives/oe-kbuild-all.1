Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06F8A47
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 04:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8GJ7rsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697258940; x=1728794940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C7gmjRdy5d3lQZDa38XcYaYnwafn7mE5fpQiij0THJs=;
  b=Y8GJ7rsgMoM7O4H8LMfKpLWQmZS3726h4Deqie2dwHkeqR0Cke08IFtf
   VkZG4Sk1XYgQ7fDpO1WglORamUkTmYWmP266SCjXAJUzOW40XuN37Laeq
   uRT2tqhwZ8vU2QIrhdCOlpFy/cKFwRkpm6mjTGYsquUKGLp9DJToePme3
   zriXstmKtlqA+cLN7+vqxEefyQsrZ/c+z3YQSU2GNSsfV9sGlnaWptNY3
   6mickPI+yr8tNz0PK1EjuBNVmuEs9WX7TOlELDvw2yFf/AaThy96zoZ0g
   puCB3EXwojng4U6eyLr98t3lEYreOwH/g6vznbUgnKVtBbBwUDKExYdgH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="6865804"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="6865804"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 21:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086393569"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1086393569"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 21:48:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrWa5-0005iF-1n;
	Sat, 14 Oct 2023 04:48:53 +0000
Date: Sat, 14 Oct 2023 12:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3389/15768] cc1: warning:
 drivers/mxc/hantro_v4l2/include/: No such file or directory
Message-ID: <202310141247.IW3Nwqx1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 591d6e848a7ca6530b7e288c7dfa52261b5d114a [3389/15768] mxc: vpu : kconfig: replace VIDEO_V4L2 with VIDEO_DEV
config: arm64-randconfig-003-20231013 (https://download.01.org/0day-ci/archive/20231014/202310141247.IW3Nwqx1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141247.IW3Nwqx1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141247.IW3Nwqx1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
--
>> cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/hantro_v4l2/vsi-v4l2daemon.c: In function 'getbusaddr':
>> drivers/mxc/hantro_v4l2/vsi-v4l2daemon.c:297:27: warning: variable 'q' set but not used [-Wunused-but-set-variable]
     297 |         struct vb2_queue *q;
         |                           ^
--
>> cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: In function 'vsi_dec_streamoff':
>> drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:359:28: warning: variable 'otype' set but not used [-Wunused-but-set-variable]
     359 |         enum v4l2_buf_type otype;
         |                            ^~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: At top level:
>> drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:683:5: warning: no previous prototype for 'vsi_dec_decoder_cmd' [-Wmissing-prototypes]
     683 | int vsi_dec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:751:33: warning: initialized field overwritten [-Woverride-init]
     751 |         .vidioc_g_fmt_vid_out = vsi_dec_g_fmt,
         |                                 ^~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:751:33: note: (near initialization for 'vsi_dec_ioctl.vidioc_g_fmt_vid_out')
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: In function 'vsi_dec_buf_queue':
>> drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:786:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     786 |         int ret;
         |             ^~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: At top level:
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:943:18: error: initialization of 'bool (*)(const struct v4l2_ctrl *, union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)' {aka '_Bool (*)(const struct v4l2_ctrl *, union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)'} from incompatible pointer type 'bool (*)(const struct v4l2_ctrl *, u32,  union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)' {aka '_Bool (*)(const struct v4l2_ctrl *, unsigned int,  union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)'} [-Werror=incompatible-pointer-types]
     943 |         .equal = vsi_dec_ctrl_equal,
         |                  ^~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:943:18: note: (near initialization for 'vsi_dec_type_ops.equal')
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:946:21: error: initialization of 'int (*)(const struct v4l2_ctrl *, union v4l2_ctrl_ptr)' from incompatible pointer type 'int (*)(const struct v4l2_ctrl *, u32,  union v4l2_ctrl_ptr)' {aka 'int (*)(const struct v4l2_ctrl *, unsigned int,  union v4l2_ctrl_ptr)'} [-Werror=incompatible-pointer-types]
     946 |         .validate = vsi_dec_ctrl_validate,
         |                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c:946:21: note: (near initialization for 'vsi_dec_type_ops.validate')
   cc1: some warnings being treated as errors
--
>> cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/hantro_v4l2/vsi-v4l2.c: In function 'release_ctx':
>> drivers/mxc/hantro_v4l2/vsi-v4l2.c:109:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     109 |         int ret = 0;
         |             ^~~
   drivers/mxc/hantro_v4l2/vsi-v4l2.c: At top level:
>> drivers/mxc/hantro_v4l2/vsi-v4l2.c:772:42: warning: 'v4l2_platform_info' defined but not used [-Wunused-const-variable=]
     772 | static const struct platform_device_info v4l2_platform_info = {
         |                                          ^~~~~~~~~~~~~~~~~~
--
>> cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c:747:40: warning: initialized field overwritten [-Woverride-init]
     747 |         .vidioc_g_fmt_vid_out_mplane = vsi_enc_g_fmt,
         |                                        ^~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c:747:40: note: (near initialization for 'vsi_enc_ioctl.vidioc_g_fmt_vid_out_mplane')
   drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c: In function 'vsi_enc_buf_queue':
>> drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c:786:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     786 |         int ret;
         |             ^~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c: At top level:
   drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c:1051:18: error: initialization of 'bool (*)(const struct v4l2_ctrl *, union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)' {aka '_Bool (*)(const struct v4l2_ctrl *, union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)'} from incompatible pointer type 'bool (*)(const struct v4l2_ctrl *, u32,  union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)' {aka '_Bool (*)(const struct v4l2_ctrl *, unsigned int,  union v4l2_ctrl_ptr,  union v4l2_ctrl_ptr)'} [-Werror=incompatible-pointer-types]
    1051 |         .equal = vsi_enc_ctrl_equal,
         |                  ^~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c:1051:18: note: (near initialization for 'vsi_enc_type_ops.equal')
   drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c:1054:21: error: initialization of 'int (*)(const struct v4l2_ctrl *, union v4l2_ctrl_ptr)' from incompatible pointer type 'int (*)(const struct v4l2_ctrl *, u32,  union v4l2_ctrl_ptr)' {aka 'int (*)(const struct v4l2_ctrl *, unsigned int,  union v4l2_ctrl_ptr)'} [-Werror=incompatible-pointer-types]
    1054 |         .validate = vsi_enc_ctrl_validate,
         |                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c:1054:21: note: (near initialization for 'vsi_enc_type_ops.validate')
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [m]:
   - TEST_MAPLE_TREE [=m] && RUNTIME_TESTING_MENU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
