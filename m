Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3971F134A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687381581; x=1718917581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nKmUWZUkCUbFohxhGpZc8ua917DKX+Hh8PosOC3XbUY=;
  b=OGeps5T4Shz5/g1XmB+yVlQ+bdPub6U2jPpnlsL2FRNmP/iNU1U8iBa6
   wzeQ8eOB9IPgZKYtpDq0bi0Z/mVQFHSFpOLsrIpTiaO4nItG+npHLaEwH
   m80UZyDpKI1Yo1n3GVRrzURscACeKDa+8k1nCTF8K8V4zh0Q/43aFxmEp
   Bq4iJa0BLwczBRei0K6Gsel5pkMRJjtOiMlhTLyDl2h4/6lWn02zNgYim
   2k1SPrSrRy/whGM3PqOHbV8HoqjC5Vrb4EJ8onyYdrX6NJuGou1A1EXAo
   lO+0/eUxQKNWj2BwMsFZs864n5p68oHe46XzJbcNifvKujOnuorGrhJq5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="426249266"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="426249266"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 14:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="838765805"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="838765805"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Jun 2023 14:06:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC51u-00075P-1U;
	Wed, 21 Jun 2023 21:06:18 +0000
Date: Thu, 22 Jun 2023 05:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2j 14/18] drivers/gpu/drm/tiny/ili9486.c:103:2: error:
 call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202306220545.w49P0uew-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-fix-2j
head:   053ed838ef797bc62fac181ee8e2397a5d05e7a9
commit: 22165fc936fdd4350d07543cf7dade980fad9c44 [14/18] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: i386-randconfig-r002-20230622 (https://download.01.org/0day-ci/archive/20230622/202306220545.w49P0uew-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220545.w49P0uew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220545.w49P0uew-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/ili9486.c:103:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG_KMS("\n");
           ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/tiny/ili9163.c:48:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG_KMS("\n");
           ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/tiny/ili9341.c:65:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG_KMS("\n");
           ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/tiny/mi0283qt.c:63:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG_KMS("\n");
           ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/tiny/hx8357d.c:59:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG_KMS("\n");
           ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/tiny/st7735r.c:72:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG_KMS("\n");
           ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/vkms/vkms_plane.c:40:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("Couldn't allocate frame_info\n");
                   ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/vkms/vkms_writeback.c:45:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
                   ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/vkms/vkms_crtc.c:46:4: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           DRM_DEBUG_DRIVER("crc worker falling behind, frame_start: %llu, frame_end: %llu\n",
                           ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'DRM_DEBUG_DRIVER'
           __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/vkms/vkms_composer.c:283:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_DRIVER("unknown source %s\n", src_name);
                   ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'DRM_DEBUG_DRIVER'
           __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:631:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("DP bandwidth (%#02x) not supported\n", dp_bw);
                   ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:696:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG("Enable downspread on the sink\n");
                   ^
   include/drm/drm_print.h:576:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:1060:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG_KMS("Handle DP interrupt 1: %02x\n", irq);
           ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:1080:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG_KMS("Handle common interrupt 4: %02x\n", irq);
           ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:1109:2: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG_KMS("Handle HDMI interrupt 1: %02x\n", irq);
           ^
   include/drm/drm_print.h:584:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:537:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   5 errors generated.
..


vim +/_dynamic_func_call_cls +103 drivers/gpu/drm/tiny/ili9486.c

cdb702a655582e Kamlesh Gurudasani 2020-02-09   90  
cdb702a655582e Kamlesh Gurudasani 2020-02-09   91  static void waveshare_enable(struct drm_simple_display_pipe *pipe,
cdb702a655582e Kamlesh Gurudasani 2020-02-09   92  			     struct drm_crtc_state *crtc_state,
cdb702a655582e Kamlesh Gurudasani 2020-02-09   93  			     struct drm_plane_state *plane_state)
cdb702a655582e Kamlesh Gurudasani 2020-02-09   94  {
cdb702a655582e Kamlesh Gurudasani 2020-02-09   95  	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
cdb702a655582e Kamlesh Gurudasani 2020-02-09   96  	struct mipi_dbi *dbi = &dbidev->dbi;
cdb702a655582e Kamlesh Gurudasani 2020-02-09   97  	u8 addr_mode;
cdb702a655582e Kamlesh Gurudasani 2020-02-09   98  	int ret, idx;
cdb702a655582e Kamlesh Gurudasani 2020-02-09   99  
cdb702a655582e Kamlesh Gurudasani 2020-02-09  100  	if (!drm_dev_enter(pipe->crtc.dev, &idx))
cdb702a655582e Kamlesh Gurudasani 2020-02-09  101  		return;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  102  
cdb702a655582e Kamlesh Gurudasani 2020-02-09 @103  	DRM_DEBUG_KMS("\n");
cdb702a655582e Kamlesh Gurudasani 2020-02-09  104  
cdb702a655582e Kamlesh Gurudasani 2020-02-09  105  	ret = mipi_dbi_poweron_conditional_reset(dbidev);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  106  	if (ret < 0)
cdb702a655582e Kamlesh Gurudasani 2020-02-09  107  		goto out_exit;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  108  	if (ret == 1)
cdb702a655582e Kamlesh Gurudasani 2020-02-09  109  		goto out_enable;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  110  
cdb702a655582e Kamlesh Gurudasani 2020-02-09  111  	mipi_dbi_command(dbi, ILI9486_ITFCTR1);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  112  	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  113  	msleep(250);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  114  
cdb702a655582e Kamlesh Gurudasani 2020-02-09  115  	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  116  
cdb702a655582e Kamlesh Gurudasani 2020-02-09  117  	mipi_dbi_command(dbi, ILI9486_PWCTRL1, 0x44);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  118  
cdb702a655582e Kamlesh Gurudasani 2020-02-09  119  	mipi_dbi_command(dbi, ILI9486_VMCTRL1, 0x00, 0x00, 0x00, 0x00);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  120  
cdb702a655582e Kamlesh Gurudasani 2020-02-09  121  	mipi_dbi_command(dbi, ILI9486_PGAMCTRL,
cdb702a655582e Kamlesh Gurudasani 2020-02-09  122  			 0x0F, 0x1F, 0x1C, 0x0C, 0x0F, 0x08, 0x48, 0x98,
cdb702a655582e Kamlesh Gurudasani 2020-02-09  123  			 0x37, 0x0A, 0x13, 0x04, 0x11, 0x0D, 0x0);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  124  	mipi_dbi_command(dbi, ILI9486_NGAMCTRL,
cdb702a655582e Kamlesh Gurudasani 2020-02-09  125  			 0x0F, 0x32, 0x2E, 0x0B, 0x0D, 0x05, 0x47, 0x75,
cdb702a655582e Kamlesh Gurudasani 2020-02-09  126  			 0x37, 0x06, 0x10, 0x03, 0x24, 0x20, 0x00);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  127  	mipi_dbi_command(dbi, ILI9486_DGAMCTRL,
cdb702a655582e Kamlesh Gurudasani 2020-02-09  128  			 0x0F, 0x32, 0x2E, 0x0B, 0x0D, 0x05, 0x47, 0x75,
cdb702a655582e Kamlesh Gurudasani 2020-02-09  129  			 0x37, 0x06, 0x10, 0x03, 0x24, 0x20, 0x00);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  130  
cdb702a655582e Kamlesh Gurudasani 2020-02-09  131  	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  132  	msleep(100);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  133  
cdb702a655582e Kamlesh Gurudasani 2020-02-09  134   out_enable:
cdb702a655582e Kamlesh Gurudasani 2020-02-09  135  	switch (dbidev->rotation) {
cdb702a655582e Kamlesh Gurudasani 2020-02-09  136  	case 90:
cdb702a655582e Kamlesh Gurudasani 2020-02-09  137  		addr_mode = ILI9486_MADCTL_MY;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  138  		break;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  139  	case 180:
cdb702a655582e Kamlesh Gurudasani 2020-02-09  140  		addr_mode = ILI9486_MADCTL_MV;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  141  		break;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  142  	case 270:
cdb702a655582e Kamlesh Gurudasani 2020-02-09  143  		addr_mode = ILI9486_MADCTL_MX;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  144  		break;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  145  	default:
cdb702a655582e Kamlesh Gurudasani 2020-02-09  146  		addr_mode = ILI9486_MADCTL_MV | ILI9486_MADCTL_MY |
cdb702a655582e Kamlesh Gurudasani 2020-02-09  147  			ILI9486_MADCTL_MX;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  148  		break;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  149  	}
cdb702a655582e Kamlesh Gurudasani 2020-02-09  150  	addr_mode |= ILI9486_MADCTL_BGR;
cdb702a655582e Kamlesh Gurudasani 2020-02-09  151  	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  152  	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  153   out_exit:
cdb702a655582e Kamlesh Gurudasani 2020-02-09  154  	drm_dev_exit(idx);
cdb702a655582e Kamlesh Gurudasani 2020-02-09  155  }
cdb702a655582e Kamlesh Gurudasani 2020-02-09  156  

:::::: The code at line 103 was first introduced by commit
:::::: cdb702a655582e80139525156c57e6e48da08393 drm/tiny: add support for tft displays based on ilitek,ili9486

:::::: TO: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
:::::: CC: Sam Ravnborg <sam@ravnborg.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
