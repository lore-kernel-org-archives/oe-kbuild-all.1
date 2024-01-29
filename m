Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C608F524B1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 23:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706570361; cv=none; b=pF34ORiJv/HNdESXMG9y8OYEwI6i0wJYFmNTnTXghsTfHllM8euq3j3JzwRw0QO+MkNKCYhrYDLLan7l9LJS3a0nMzloi+lgA4mb1AwixQjpXTb81iJVqJZiMYZIeahtPqKXE7E7uPphR4Lnl6kk7ORbaNgfGYF+A2YW0NNub1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706570361; c=relaxed/simple;
	bh=BIIXkhJg/Fwz6rC1XbaNpEsX/b7MeUpmeS2nVfWqrIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EDuMtgc2OsUi5uWvrc8ZPZGPuGe1gh51A/mUljj4+qUw7RKeDYZTRP42QzmOE57A4PwRiUysBfrILva4rZbdP+5CJDDRPVYQWL2QQQJKzaK5nnDLCp+VEk3YsPNUgEsxXTlMGkXcHKnxNmQDpak4oxirj7d0QVbHWhawkJ+wjYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnAmqfx0; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnAmqfx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706570359; x=1738106359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BIIXkhJg/Fwz6rC1XbaNpEsX/b7MeUpmeS2nVfWqrIw=;
  b=NnAmqfx0cqwthRXXMHhXgTbWeIJ7h34tiJn5/sYPA7yptrxLcZjphLXA
   EcZ80IYnyGUJt5Z4roQDRNX0PuFsiX3lzxM3jcexTi5jU8ZfxVMdaVuZ0
   7Zkx7xg+r/hfWxXcrWiPLdiFOahcSMfA6VUdLP37LJ4LVVRUfG6hgrfNa
   r3KluRrDFAtCtBMoYtMYdrQbl0t5zvVg5MVXyFlUEzDlKAaSkfWUl27+D
   VIHlTMqQdfTMrlqo9gtQFBHWji2GjnDc3H6ymgf+tIzIpi4r8LGr3mP8i
   QjeQaYij31f89qdzt1mDol4a6StOdky38EJB3h8zkLj2QWAF1b4PdIiin
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="467369847"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="467369847"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 15:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3467368"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Jan 2024 15:19:18 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUauJ-0004hs-1C;
	Mon, 29 Jan 2024 23:19:15 +0000
Date: Tue, 30 Jan 2024 07:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1528/26476]
 drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30:
 error: comparison of unsigned expression in '>= 0' is always true
Message-ID: <202401300724.sOf9JWc3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexey,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: df155f139a996df7c51bd7a6c99dcb44f84483b4 [1528/26476] mt6625l: fix out-of-tree build (i.e. when KBUILD_OUTPUT env is set)
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240130/202401300724.sOf9JWc3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300724.sOf9JWc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300724.sOf9JWc3-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/misc/mediatek/connectivity/common/common_detect/drv_init/conn_drv_init.c:20:
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/conn_drv_init.c: In function 'do_wlan_drv_init':
>> drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/conn_drv_init.c:31:9: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
      31 |         WMT_DETECT_ERR_FUNC("Can not find wlan module for chip: %d !\n", chip_id);
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/conn_drv_init.c: In function 'do_connectivity_driver_init':
>> drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/conn_drv_init.c:49:17: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
      49 |                 WMT_DETECT_ERR_FUNC("do common driver init failed, ret:%d\n", tmp_ret);
         |                 ^~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/conn_drv_init.c:50:17: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
      50 |                 WMT_DETECT_ERR_FUNC("abort connectivity driver init, because common part is not ready\n");
         |                 ^~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/conn_drv_init.c:58:17: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
      58 |                 WMT_DETECT_ERR_FUNC("do common driver init failed, ret:%d\n", tmp_ret);
         |                 ^~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/conn_drv_init.c:75:17: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
      75 |                 WMT_DETECT_ERR_FUNC("do wlan module init failed, ret:%d\n", tmp_ret);
         |                 ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/misc/mediatek/connectivity/common/common_detect/drv_init/common_drv_init.c:20:
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/common_drv_init.c: In function 'do_combo_common_drv_init':
>> drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/common_drv_init.c:54:9: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
      54 |         WMT_DETECT_ERR_FUNC("COMBO chip is not supported, please check CONFIG_MTK_COMBO_CHIP in kernel config\n");
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/common_drv_init.c: In function 'do_soc_common_drv_init':
>> drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/common_drv_init.c:76:9: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
      76 |         WMT_DETECT_ERR_FUNC("SOC chip is not supported, please check CONFIG_MTK_COMBO_CHIP in kernel config\n");
         |         ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/misc/mediatek/connectivity/common/common_detect/drv_init/wlan_drv_init.c:20:
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/wlan_drv_init.c: In function 'do_wlan_drv_init':
>> drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/wlan_drv_init.c:47:17: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
      47 |                 WMT_DETECT_ERR_FUNC("WLAN-GEN3 driver is not supported, please check CONFIG_MTK_COMBO_CHIP\n");
         |                 ^~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/drv_init/wlan_drv_init.c:62:17: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
      62 |                 WMT_DETECT_ERR_FUNC("WLAN-GEN2 driver is not supported, please check CONFIG_MTK_COMBO_CHIP\n");
         |                 ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +77 drivers/misc/mediatek/connectivity/common/common_detect/drv_init/../wmt_detect.h

06d376a01ea074 Frank Wunderlich 2019-10-04  54  
06d376a01ea074 Frank Wunderlich 2019-10-04  55  #define WMT_DETECT_LOUD_FUNC(fmt, arg...) \
06d376a01ea074 Frank Wunderlich 2019-10-04  56  do { \
06d376a01ea074 Frank Wunderlich 2019-10-04  57  	if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_LOUD) \
06d376a01ea074 Frank Wunderlich 2019-10-04  58  		pr_debug(DFT_TAG"[L]%s:"  fmt, __func__ , ##arg); \
06d376a01ea074 Frank Wunderlich 2019-10-04  59  } while (0)
06d376a01ea074 Frank Wunderlich 2019-10-04  60  #define WMT_DETECT_DBG_FUNC(fmt, arg...) \
06d376a01ea074 Frank Wunderlich 2019-10-04  61  do { \
06d376a01ea074 Frank Wunderlich 2019-10-04  62  	if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_DBG) \
06d376a01ea074 Frank Wunderlich 2019-10-04  63  		pr_debug(DFT_TAG"[D]%s:"  fmt, __func__ , ##arg); \
06d376a01ea074 Frank Wunderlich 2019-10-04  64  } while (0)
06d376a01ea074 Frank Wunderlich 2019-10-04  65  #define WMT_DETECT_INFO_FUNC(fmt, arg...) \
06d376a01ea074 Frank Wunderlich 2019-10-04  66  do { \
06d376a01ea074 Frank Wunderlich 2019-10-04  67  	if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_INFO) \
06d376a01ea074 Frank Wunderlich 2019-10-04  68  		pr_err(DFT_TAG"[I]%s:"  fmt, __func__ , ##arg); \
06d376a01ea074 Frank Wunderlich 2019-10-04  69  } while (0)
06d376a01ea074 Frank Wunderlich 2019-10-04  70  #define WMT_DETECT_WARN_FUNC(fmt, arg...) \
06d376a01ea074 Frank Wunderlich 2019-10-04  71  do { \
06d376a01ea074 Frank Wunderlich 2019-10-04  72  	if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_WARN) \
06d376a01ea074 Frank Wunderlich 2019-10-04  73  		pr_warn(DFT_TAG"[W]%s(%d):"  fmt, __func__ , __LINE__, ##arg); \
06d376a01ea074 Frank Wunderlich 2019-10-04  74  } while (0)
06d376a01ea074 Frank Wunderlich 2019-10-04  75  #define WMT_DETECT_ERR_FUNC(fmt, arg...) \
06d376a01ea074 Frank Wunderlich 2019-10-04  76  do { \
06d376a01ea074 Frank Wunderlich 2019-10-04 @77  	if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
06d376a01ea074 Frank Wunderlich 2019-10-04  78  		pr_err(DFT_TAG"[E]%s(%d):"  fmt, __func__ , __LINE__, ##arg); \
06d376a01ea074 Frank Wunderlich 2019-10-04  79  } while (0)
06d376a01ea074 Frank Wunderlich 2019-10-04  80  

:::::: The code at line 77 was first introduced by commit
:::::: 06d376a01ea074dd064fc447282fe587ea9ddbdb mt6625l: add driver-folder from 5.3

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
