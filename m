Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297B0ED5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 07:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681544306; x=1713080306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wgtkubqKx13IcmbRJNbsfuDVfOA4eRgJklHSIK9RQVo=;
  b=E82J+SVcVRikZjLBYXaiMTXzMquTXLCkuRdFpOq8KLNuUhftWhytpOGR
   7yLbro+UY9wVuBoy8bWM8JVFC9CPX0pmdIf2wRo4g7BwYJUrL43adJ7lU
   xdCVx2eCTKaWyie383xu0288n32jtfMP2Vl2Fnc7CoDQ2ZOuOp07SQLNf
   NGARgNmAGGBmoh8t0tHsKcv7h9M+TegaRIMudEDP1EzM862KIyt6j2of4
   wL/2EDomCc6KEfkco5TknR44uudR+dD7NvmLqh1+zTu+/119dbft+wfHG
   j918qF/P7EwOe2wLLlFjpO0us49ZHpgB2Iv+qjg4G03WUyYYxjKtcfJX7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324973399"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324973399"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 00:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="1019866315"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="1019866315"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Apr 2023 00:38:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnaUG-000agx-2J;
	Sat, 15 Apr 2023 07:38:20 +0000
Date: Sat, 15 Apr 2023 15:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 3389/9838] cc1: warning:
 drivers/mxc/hantro_v4l2/include/: No such file or directory
Message-ID: <202304151559.c60pZuVH-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 591d6e848a7ca6530b7e288c7dfa52261b5d114a [3389/9838] mxc: vpu : kconfig: replace VIDEO_V4L2 with VIDEO_DEV
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304151559.c60pZuVH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/591d6e848a7ca6530b7e288c7dfa52261b5d114a
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 591d6e848a7ca6530b7e288c7dfa52261b5d114a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/ drivers/mxc/hantro_v4l2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151559.c60pZuVH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/hantro_v4l2/vsi-v4l2.c: In function 'release_ctx':
>> drivers/mxc/hantro_v4l2/vsi-v4l2.c:109:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     109 |         int ret = 0;
         |             ^~~
   drivers/mxc/hantro_v4l2/vsi-v4l2.c: At top level:
   drivers/mxc/hantro_v4l2/vsi-v4l2.c:772:42: warning: 'v4l2_platform_info' defined but not used [-Wunused-const-variable=]
     772 | static const struct platform_device_info v4l2_platform_info = {
         |                                          ^~~~~~~~~~~~~~~~~~
--
>> cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/hantro_v4l2/vsi-v4l2daemon.c: In function 'getbusaddr':
>> drivers/mxc/hantro_v4l2/vsi-v4l2daemon.c:297:27: warning: variable 'q' set but not used [-Wunused-but-set-variable]
     297 |         struct vb2_queue *q;
         |                           ^
--
>> cc1: warning: drivers/mxc/hantro_v4l2/include/: No such file or directory [-Wmissing-include-dirs]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
