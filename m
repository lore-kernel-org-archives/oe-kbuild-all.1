Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95D11422C8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714987583; cv=none; b=bvnXZpgQK8A09PaRqvwBQeRa7dviGUUROQ1jhLCsfURRJyZJ/Kv0bxudFd9YDmPpyXjLJCLtOPSUwPnEqlZnayqiNUL/8copWgNQdJyBPxaDX0pwnilfg+59ytm3z4azdtVUUiHflC6kaiN66XZ7GJjRFJEYSFRpXOVZv80jirA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714987583; c=relaxed/simple;
	bh=2ZkYKw20NRdup3m9JyThmFrrGTS/UnvPy1CcdjcQ3R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twfIm+beqcUccWMmlv9y3J6q8UrnGmhoLhyhMlhO4JgquzvFUPNOz0u3D0i74OrMEwIPHjHxN+Hnc3D3w5m0CYoqbpbO2G7kFu+sudeaKtoRPWLLyesU8JXsd+VvJphxrC+n0xWLECaEiFO/rYWiZ+lI80xZ5H7Rhn2ioXXl3+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxbfnD4c; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxbfnD4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714987581; x=1746523581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZkYKw20NRdup3m9JyThmFrrGTS/UnvPy1CcdjcQ3R8=;
  b=XxbfnD4cRGXB7SDM/RMaPl+fH+m2zwnZBX+EHuL66khynh9Naujd+58Q
   Zqc82LYxAozCaeqUWMv4Y+B6+e7oKrxo3chBImtS2MB3OBcmO3jgjkspo
   qE8x9x8DAy5PtuU8jnJu0SwC9g/+SnhguZrt2fiugVSqSLBQbXUwAFJwq
   GjLjbAr/V2Yz/VejVfAhON+W6npkGIlcfkImcRIKzabC/lVaLOc23B6oh
   VLDaMAhSUisQe3qwWArayLt3Xk7grtaB8i/eyZKVv0brR90ZLy2U3ComC
   gK8hhEFT3/83fDwKKeI9HXZUeR4hYihc5wzOB2SbeAPFeNNhDm+2N2gIy
   g==;
X-CSE-ConnectionGUID: xvQz7RmHRHCJxnBfSB96GQ==
X-CSE-MsgGUID: xYcRHFVXQfeGDHnXWWBIGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10847582"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10847582"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 02:26:20 -0700
X-CSE-ConnectionGUID: /59mtossT9+NSZ4I3c/VIg==
X-CSE-MsgGUID: NexvDYMATyGFv987qIWHVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28069990"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 May 2024 02:26:18 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3ubv-0000ae-2C;
	Mon, 06 May 2024 09:26:15 +0000
Date: Mon, 6 May 2024 17:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6110/30000]
 drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast
 between incompatible function types from 'int (*)(struct v4l2_int_device *,
 struct v4l2_fmtdesc *)' to 'int (*)(struct v4l2_int_device *)'
Message-ID: <202405061723.Bv5iemsV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: b83a99edcb3eb46360f4b4470a51e0f0749bd73e [6110/30000] Merge branch 'mxc/next' into next
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240506/202405061723.Bv5iemsV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061723.Bv5iemsV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405061723.Bv5iemsV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/arm/mm: No such file or directory [-Wmissing-include-dirs]
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:630:5: warning: no previous prototype for 'init_gpu_opp_table' [-Wmissing-prototypes]
     630 | int init_gpu_opp_table(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: In function 'init_gpu_opp_table':
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:679:58: warning: variable 'shader_volt' set but not used [-Wunused-but-set-variable]
     679 |         unsigned long core_freq, core_volt, shader_freq, shader_volt;
         |                                                          ^~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: At top level:
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:725:5: warning: no previous prototype for 'remove_gpu_opp_table' [-Wmissing-prototypes]
     725 | int remove_gpu_opp_table(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:1197:5: warning: no previous prototype for 'init_priv' [-Wmissing-prototypes]
    1197 | int init_priv(void)
         |     ^~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c:1217:1: warning: no previous prototype for 'free_priv' [-Wmissing-prototypes]
    1217 | free_priv(void)
         | ^~~~~~~~~
--
   In file included from drivers/media/platform/mxc/capture/mxc_v4l2_capture.c:35:
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_enum_fmt_cap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_fmtdesc *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:281:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     281 | V4L2_INT_WRAPPER_1(enum_fmt_cap, struct v4l2_fmtdesc, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_fmt_cap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:282:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     282 | V4L2_INT_WRAPPER_1(g_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_fmt_cap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:283:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     283 | V4L2_INT_WRAPPER_1(s_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_try_fmt_cap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:284:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     284 | V4L2_INT_WRAPPER_1(try_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_queryctrl_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_queryctrl *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:285:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     285 | V4L2_INT_WRAPPER_1(queryctrl, struct v4l2_queryctrl, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_ctrl_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_control *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:286:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     286 | V4L2_INT_WRAPPER_1(g_ctrl, struct v4l2_control, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_ctrl_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_control *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:287:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     287 | V4L2_INT_WRAPPER_1(s_ctrl, struct v4l2_control, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_cropcap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_cropcap *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:288:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     288 | V4L2_INT_WRAPPER_1(cropcap, struct v4l2_cropcap, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_crop_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_crop *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:289:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     289 | V4L2_INT_WRAPPER_1(g_crop, struct v4l2_crop, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_crop_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_crop *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:290:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     290 | V4L2_INT_WRAPPER_1(s_crop, struct v4l2_crop, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_parm_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_streamparm *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:291:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     291 | V4L2_INT_WRAPPER_1(g_parm, struct v4l2_streamparm, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_parm_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_streamparm *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:292:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     292 | V4L2_INT_WRAPPER_1(s_parm, struct v4l2_streamparm, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_querystd_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, v4l2_std_id *)' {aka 'int (*)(struct v4l2_int_device *, long long unsigned int *)'} to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:293:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     293 | V4L2_INT_WRAPPER_1(querystd, v4l2_std_id, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_std_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, v4l2_std_id *)' {aka 'int (*)(struct v4l2_int_device *, long long unsigned int *)'} to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:294:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     294 | V4L2_INT_WRAPPER_1(s_std, v4l2_std_id, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_power_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, enum v4l2_power)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:298:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     298 | V4L2_INT_WRAPPER_1(s_power, enum v4l2_power, /*dummy arg*/);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_priv_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, void *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:299:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     299 | V4L2_INT_WRAPPER_1(g_priv, void, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_ifparm_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_ifparm *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:300:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     300 | V4L2_INT_WRAPPER_1(g_ifparm, struct v4l2_ifparm, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_needs_reset_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, void *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:301:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     301 | V4L2_INT_WRAPPER_1(g_needs_reset, void, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_enum_framesizes_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_frmsizeenum *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:302:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     302 | V4L2_INT_WRAPPER_1(enum_framesizes, struct v4l2_frmsizeenum, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_enum_frameintervals_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_frmivalenum *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:303:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     303 | V4L2_INT_WRAPPER_1(enum_frameintervals, struct v4l2_frmivalenum, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_chip_ident_cb':
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, int *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:307:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     307 | V4L2_INT_WRAPPER_1(g_chip_ident, int, *);
         | ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/mxc/capture/mxc_v4l2_capture.c:37:
   drivers/media/platform/mxc/capture/mxc_v4l2_capture.h: At top level:
   drivers/media/platform/mxc/capture/mxc_v4l2_capture.h:28:10: fatal error: linux/pxp_dma.h: No such file or directory
      28 | #include <linux/pxp_dma.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from drivers/media/platform/mxc/capture/v4l2-int-device.c:19:
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_enum_fmt_cap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_fmtdesc *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:281:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     281 | V4L2_INT_WRAPPER_1(enum_fmt_cap, struct v4l2_fmtdesc, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_fmt_cap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:282:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     282 | V4L2_INT_WRAPPER_1(g_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_fmt_cap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:283:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     283 | V4L2_INT_WRAPPER_1(s_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_try_fmt_cap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_format *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:284:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     284 | V4L2_INT_WRAPPER_1(try_fmt_cap, struct v4l2_format, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_queryctrl_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_queryctrl *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:285:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     285 | V4L2_INT_WRAPPER_1(queryctrl, struct v4l2_queryctrl, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_ctrl_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_control *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:286:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     286 | V4L2_INT_WRAPPER_1(g_ctrl, struct v4l2_control, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_ctrl_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_control *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:287:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     287 | V4L2_INT_WRAPPER_1(s_ctrl, struct v4l2_control, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_cropcap_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_cropcap *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:288:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     288 | V4L2_INT_WRAPPER_1(cropcap, struct v4l2_cropcap, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_crop_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_crop *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:289:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     289 | V4L2_INT_WRAPPER_1(g_crop, struct v4l2_crop, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_crop_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_crop *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:290:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     290 | V4L2_INT_WRAPPER_1(s_crop, struct v4l2_crop, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_parm_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_streamparm *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:291:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     291 | V4L2_INT_WRAPPER_1(g_parm, struct v4l2_streamparm, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_parm_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_streamparm *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:292:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     292 | V4L2_INT_WRAPPER_1(s_parm, struct v4l2_streamparm, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_querystd_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, v4l2_std_id *)' {aka 'int (*)(struct v4l2_int_device *, long long unsigned int *)'} to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:293:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     293 | V4L2_INT_WRAPPER_1(querystd, v4l2_std_id, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_std_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, v4l2_std_id *)' {aka 'int (*)(struct v4l2_int_device *, long long unsigned int *)'} to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:294:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     294 | V4L2_INT_WRAPPER_1(s_std, v4l2_std_id, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_s_power_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, enum v4l2_power)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:298:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     298 | V4L2_INT_WRAPPER_1(s_power, enum v4l2_power, /*dummy arg*/);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_priv_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, void *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:299:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     299 | V4L2_INT_WRAPPER_1(g_priv, void, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_ifparm_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_ifparm *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:300:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     300 | V4L2_INT_WRAPPER_1(g_ifparm, struct v4l2_ifparm, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_needs_reset_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, void *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:301:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     301 | V4L2_INT_WRAPPER_1(g_needs_reset, void, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_enum_framesizes_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_frmsizeenum *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:302:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     302 | V4L2_INT_WRAPPER_1(enum_framesizes, struct v4l2_frmsizeenum, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_enum_frameintervals_cb':
>> drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, struct v4l2_frmivalenum *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:303:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     303 | V4L2_INT_WRAPPER_1(enum_frameintervals, struct v4l2_frmivalenum, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.h: In function 'vidioc_int_g_chip_ident_cb':
   drivers/media/platform/mxc/capture/v4l2-int-device.h:276:29: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, int *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     276 |                 desc.func = (v4l2_int_ioctl_func *)func;                \
         |                             ^
   drivers/media/platform/mxc/capture/v4l2-int-device.h:307:1: note: in expansion of macro 'V4L2_INT_WRAPPER_1'
     307 | V4L2_INT_WRAPPER_1(g_chip_ident, int, *);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/v4l2-int-device.c: In function 'v4l2_int_ioctl_1':
   drivers/media/platform/mxc/capture/v4l2-int-device.c:148:28: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *, void *)' to 'int (*)(struct v4l2_int_device *)' [-Wcast-function-type]
     148 |                            (v4l2_int_ioctl_func *)no_such_ioctl_1))(d, arg);
         |                            ^
   drivers/media/platform/mxc/capture/v4l2-int-device.c:146:17: warning: cast between incompatible function types from 'int (*)(struct v4l2_int_device *)' to 'int (*)(struct v4l2_int_device *, void *)' [-Wcast-function-type]
     146 |         return ((v4l2_int_ioctl_func_1 *)
         |                 ^
..


vim +276 drivers/media/platform/mxc/capture/v4l2-int-device.h

a4b77246f8fee2 Robby Cai 2019-09-25  235  
a4b77246f8fee2 Robby Cai 2019-09-25  236  /*
a4b77246f8fee2 Robby Cai 2019-09-25  237   *
a4b77246f8fee2 Robby Cai 2019-09-25  238   * IOCTL wrapper functions for better type checking.
a4b77246f8fee2 Robby Cai 2019-09-25  239   *
a4b77246f8fee2 Robby Cai 2019-09-25  240   */
a4b77246f8fee2 Robby Cai 2019-09-25  241  
a4b77246f8fee2 Robby Cai 2019-09-25  242  #define V4L2_INT_WRAPPER_0(name)					\
a4b77246f8fee2 Robby Cai 2019-09-25  243  	static inline int vidioc_int_##name(struct v4l2_int_device *d)	\
a4b77246f8fee2 Robby Cai 2019-09-25  244  	{								\
a4b77246f8fee2 Robby Cai 2019-09-25  245  		return v4l2_int_ioctl_0(d, vidioc_int_##name##_num);	\
a4b77246f8fee2 Robby Cai 2019-09-25  246  	}								\
a4b77246f8fee2 Robby Cai 2019-09-25  247  									\
a4b77246f8fee2 Robby Cai 2019-09-25  248  	static inline struct v4l2_int_ioctl_desc			\
a4b77246f8fee2 Robby Cai 2019-09-25  249  	vidioc_int_##name##_cb(int (*func)				\
a4b77246f8fee2 Robby Cai 2019-09-25  250  			       (struct v4l2_int_device *))		\
a4b77246f8fee2 Robby Cai 2019-09-25  251  	{								\
a4b77246f8fee2 Robby Cai 2019-09-25  252  		struct v4l2_int_ioctl_desc desc;			\
a4b77246f8fee2 Robby Cai 2019-09-25  253  									\
a4b77246f8fee2 Robby Cai 2019-09-25  254  		desc.num = vidioc_int_##name##_num;			\
a4b77246f8fee2 Robby Cai 2019-09-25  255  		desc.func = (v4l2_int_ioctl_func *)func;		\
a4b77246f8fee2 Robby Cai 2019-09-25  256  									\
a4b77246f8fee2 Robby Cai 2019-09-25  257  		return desc;						\
a4b77246f8fee2 Robby Cai 2019-09-25  258  	}
a4b77246f8fee2 Robby Cai 2019-09-25  259  
a4b77246f8fee2 Robby Cai 2019-09-25  260  #define V4L2_INT_WRAPPER_1(name, arg_type, asterisk)			\
a4b77246f8fee2 Robby Cai 2019-09-25  261  	static inline int vidioc_int_##name(struct v4l2_int_device *d,	\
a4b77246f8fee2 Robby Cai 2019-09-25  262  					    arg_type asterisk arg)	\
a4b77246f8fee2 Robby Cai 2019-09-25  263  	{								\
a4b77246f8fee2 Robby Cai 2019-09-25  264  		return v4l2_int_ioctl_1(d, vidioc_int_##name##_num,	\
a4b77246f8fee2 Robby Cai 2019-09-25  265  					(void *)(unsigned long)arg);	\
a4b77246f8fee2 Robby Cai 2019-09-25  266  	}								\
a4b77246f8fee2 Robby Cai 2019-09-25  267  									\
a4b77246f8fee2 Robby Cai 2019-09-25  268  	static inline struct v4l2_int_ioctl_desc			\
a4b77246f8fee2 Robby Cai 2019-09-25  269  	vidioc_int_##name##_cb(int (*func)				\
a4b77246f8fee2 Robby Cai 2019-09-25  270  			       (struct v4l2_int_device *,		\
a4b77246f8fee2 Robby Cai 2019-09-25  271  				arg_type asterisk))			\
a4b77246f8fee2 Robby Cai 2019-09-25  272  	{								\
a4b77246f8fee2 Robby Cai 2019-09-25  273  		struct v4l2_int_ioctl_desc desc;			\
a4b77246f8fee2 Robby Cai 2019-09-25  274  									\
a4b77246f8fee2 Robby Cai 2019-09-25  275  		desc.num = vidioc_int_##name##_num;			\
a4b77246f8fee2 Robby Cai 2019-09-25 @276  		desc.func = (v4l2_int_ioctl_func *)func;		\
a4b77246f8fee2 Robby Cai 2019-09-25  277  									\
a4b77246f8fee2 Robby Cai 2019-09-25  278  		return desc;						\
a4b77246f8fee2 Robby Cai 2019-09-25  279  	}
a4b77246f8fee2 Robby Cai 2019-09-25  280  

:::::: The code at line 276 was first introduced by commit
:::::: a4b77246f8fee2644228b40465dc8fe7a004cac2 media: v4l2: add int device framework for backward support

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
