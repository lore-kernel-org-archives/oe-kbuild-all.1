Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E8D10798
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694012920; x=1725548920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kQIc90W97l4NPmJ09Cvx0nE553qiSkrRbq9ebITDWXY=;
  b=AMbqoltxK5QsYbDNjrQD5AL6X6msUlyUakpRnA64nKUb0fJ2i0OlzYee
   20AB8PNyHVfbsCuqxT89NOMB++7qxvT5XM/UCMxOejcICFJrjWS6MjMAT
   B9T7+SqwzAgh6Y+U2NRcafnH7rX+HUrtzgbq94S5fPDJfkVE+PQUJXQoX
   f5fJgdsQMZvMVCsMdp2ZPvIORNAEc6vLohz90+MGjpiGBtuwkOexqiOiY
   xDC/ImTFtxwrXv1zzUgC+hm4aT1Bna3URg4zp7ZSEmgR6oMBleOzUJitW
   v9gJ8rxvJLAl7LvCl2BgyQSgZGQpFXqVibNjcQ6Hz8z4U4nn61Gu4hRfU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367315359"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="367315359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 08:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="811692596"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="811692596"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2023 08:08:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdu8b-0000Jr-1o;
	Wed, 06 Sep 2023 15:08:13 +0000
Date: Wed, 6 Sep 2023 23:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1315/24606]
 drivers/gpu/drm/imx/dw_hdmi-imx.c:319:6: warning: no previous prototype for
 function 'imx8mp_hdmi_enable_audio'
Message-ID: <202309062311.zc5fjulD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: 78c4f6405d0fc05a9bd039456f4d31a216c4b061 [1315/24606] MLK-23250-09: drm: imx: pavi: Add PAVI driver for iMX8MP HDMI
config: arm64-randconfig-r014-20230906 (https://download.01.org/0day-ci/archive/20230906/202309062311.zc5fjulD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062311.zc5fjulD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062311.zc5fjulD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/dw_hdmi-imx.c:319:6: warning: no previous prototype for function 'imx8mp_hdmi_enable_audio' [-Wmissing-prototypes]
     319 | void imx8mp_hdmi_enable_audio(struct dw_hdmi *dw_hdmi, void *data, int channel)
         |      ^
   drivers/gpu/drm/imx/dw_hdmi-imx.c:319:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     319 | void imx8mp_hdmi_enable_audio(struct dw_hdmi *dw_hdmi, void *data, int channel)
         | ^
         | static 
>> drivers/gpu/drm/imx/dw_hdmi-imx.c:325:6: warning: no previous prototype for function 'imx8mp_hdmi_disable_audio' [-Wmissing-prototypes]
     325 | void imx8mp_hdmi_disable_audio(struct dw_hdmi *dw_hdmi, void *data)
         |      ^
   drivers/gpu/drm/imx/dw_hdmi-imx.c:325:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     325 | void imx8mp_hdmi_disable_audio(struct dw_hdmi *dw_hdmi, void *data)
         | ^
         | static 
   drivers/gpu/drm/imx/dw_hdmi-imx.c:332:11: error: incompatible function pointer types initializing 'int (*)(struct dw_hdmi *, void *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct dw_hdmi *, void *, struct drm_display_mode *)' [-Wincompatible-function-pointer-types]
     332 |         .init           = imx8mp_hdmi_phy_init,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/dw_hdmi-imx.c:346:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct dw_hdmi *, void *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'enum drm_mode_status (struct drm_connector *, const struct drm_display_mode *)' [-Wincompatible-function-pointer-types]
     346 |         .mode_valid = imx8mp_hdmi_mode_valid,
         |                       ^~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +/imx8mp_hdmi_enable_audio +319 drivers/gpu/drm/imx/dw_hdmi-imx.c

459ca80fe5fb46d Sandor Yu 2020-01-19  318  
459ca80fe5fb46d Sandor Yu 2020-01-19 @319  void imx8mp_hdmi_enable_audio(struct dw_hdmi *dw_hdmi, void *data, int channel)
459ca80fe5fb46d Sandor Yu 2020-01-19  320  {
459ca80fe5fb46d Sandor Yu 2020-01-19  321  	imx8mp_hdmi_pai_powerup();
459ca80fe5fb46d Sandor Yu 2020-01-19  322  	imx8mp_hdmi_pai_enable(channel);
459ca80fe5fb46d Sandor Yu 2020-01-19  323  }
459ca80fe5fb46d Sandor Yu 2020-01-19  324  
459ca80fe5fb46d Sandor Yu 2020-01-19 @325  void imx8mp_hdmi_disable_audio(struct dw_hdmi *dw_hdmi, void *data)
459ca80fe5fb46d Sandor Yu 2020-01-19  326  {
459ca80fe5fb46d Sandor Yu 2020-01-19  327  	imx8mp_hdmi_pai_disable();
459ca80fe5fb46d Sandor Yu 2020-01-19  328  	imx8mp_hdmi_pai_powerdown();
459ca80fe5fb46d Sandor Yu 2020-01-19  329  }
459ca80fe5fb46d Sandor Yu 2020-01-19  330  

:::::: The code at line 319 was first introduced by commit
:::::: 459ca80fe5fb46d43c1cd4b63df5cf9c1c773dc8 MLK-23250-10: drm: imx: hdmi: Add iMX8MP hdmi driver

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
