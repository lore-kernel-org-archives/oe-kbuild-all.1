Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39378B4C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 21:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706650842; cv=none; b=fD8+O3siQHX7gTX+K/CBmNtRvYeuDIK9NLgBYwR0NZqtpxsstgjFPIikppdf1xJJvMPkO1ezV7vywBg1xPQqXDToF86xBjZEX9JVWSEBrbF+NsUz16g4Qre8H86F0GrHncg0RFe6z85z3a0H8b01weNkCeNr6qEwVGzeE8PWSkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706650842; c=relaxed/simple;
	bh=q1RMk7IZvcdhmMtDsjI0+m5igo2kuufhQQcLJedShgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TimzHeW/7Ynx0hC5kxYHWEKAUG9E2L/zDvjDj7a7zldQ+NXNcRC8xygZMxyU4GO+xImExt2MOGafh2e2o6GBZfIuVcjnQ19bube1m2xLk+eYHWin4MUFTD7l/89s1boeVQ3KZgUeVC9buS9XCfS1LDi3Mb4j7E3bFgn5u/dUcxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imnZpn7E; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imnZpn7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706650840; x=1738186840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1RMk7IZvcdhmMtDsjI0+m5igo2kuufhQQcLJedShgc=;
  b=imnZpn7EBYK8hI6vVrC/xYT78TTaBHeTlEvvqyjAbow8BLT9AHDYEGbz
   ZEPwmE1S5il2QPSDMxTRr3LH9MSYdq8P/AlVhMTgB2Db1sMFbibR7c1fd
   cwtHCauHYsc5trXvuMJ6ss/HKtPuX63RfJ8hYKq1kBQapqE26VW7RT5IP
   wc40peCzzCis3UnW8zF7UGCn2uXVl1G3k0HHFU4ndbMGePCL49L1qljW1
   UowLZG+aIlbNbLNQYlZU7shNW/UUNp5n768GOBscqT6iIibx0BpCltxEN
   Ir0AJvfheR8DkPzHkV09+MuIpTdZQjmyzT6K68LtbRKmlyxZOD2WS0nQ+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434584461"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="434584461"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 13:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931595247"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="931595247"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2024 13:40:36 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUvqM-0000r8-0f;
	Tue, 30 Jan 2024 21:40:34 +0000
Date: Wed, 31 Jan 2024 05:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1519/26476] cc1: error:
 drivers/misc/mediatek/include/mt-plat//include: No such file or directory
Message-ID: <202401310558.3tQ0EnQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: 846b1dc5520ecb419469f5b97434328cc6f30b81 [1519/26476] mt6625l: include wifi-folder
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240131/202401310558.3tQ0EnQW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310558.3tQ0EnQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310558.3tQ0EnQW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/arm/mach-/include/mach: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/btif/common/inc: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/btif/common/plat_inc: No such file or directory [-Werror=missing-include-dirs]
   drivers/misc/mediatek/btif/common/mtk_btif.c:37:10: fatal error: btif_pub.h: No such file or directory
      37 | #include "btif_pub.h"
         |          ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/arm/mach-/include/mach: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/btif/common/inc: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/btif/common/plat_inc: No such file or directory [-Werror=missing-include-dirs]
   drivers/misc/mediatek/btif/common/mtk_btif_exp.c:20:10: fatal error: mtk_btif.h: No such file or directory
      20 | #include "mtk_btif.h"
         |          ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/arm/mach-/include/mach: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/btif/common/inc: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/btif/common/plat_inc: No such file or directory [-Werror=missing-include-dirs]
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:22:10: fatal error: btif_dma_priv.h: No such file or directory
      22 | #include "btif_dma_priv.h"
         |          ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/arm/mach-/include/mach: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/btif/common/inc: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/btif/common/plat_inc: No such file or directory [-Werror=missing-include-dirs]
   drivers/misc/mediatek/btif/common/btif_plat.c:21:10: fatal error: btif_pub.h: No such file or directory
      21 | #include "btif_pub.h"
         |          ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/slab.h:136,
                    from include/linux/irq.h:21,
                    from include/linux/of_irq.h:7,
                    from drivers/misc/mediatek/connectivity/common/common_detect/mtk_wcn_stub_alps.c:62:
   include/linux/kasan.h:14:10: fatal error: asm/kasan.h: No such file or directory
      14 | #include <asm/kasan.h>
         |          ^~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   drivers/misc/mediatek/connectivity/common/common_detect/wmt_stp_exp.c:14:10: fatal error: osal_typedef.h: No such file or directory
      14 | #include "osal_typedef.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/misc/mediatek/connectivity/common/common_detect/sdio_detect.c:20:
   drivers/misc/mediatek/connectivity/common/common_detect/sdio_detect.c: In function 'hif_sdio_is_chipid_valid':
>> drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/sdio_detect.c:108:17: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
     108 |                 WMT_DETECT_ERR_FUNC("no supported chipid found\n");
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/common_detect/sdio_detect.c: In function 'hif_sdio_match_chipid_by_dev_id':
>> drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/sdio_detect.c:135:17: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
     135 |                 WMT_DETECT_ERR_FUNC("No valid chipId found, vendor id(0x%x), device id(0x%x)\n", id->vendor,
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/common_detect/sdio_detect.c: In function 'sdio_detect_probe':
>> drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.h:77:30: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      77 |         if (gWmtDetectDbgLvl >= WMT_DETECT_LOG_ERR) \
         |                              ^~
   drivers/misc/mediatek/connectivity/common/common_detect/sdio_detect.c:236:25: note: in expansion of macro 'WMT_DETECT_ERR_FUNC'
     236 |                         WMT_DETECT_ERR_FUNC("sdio_enable_func failed!\n");
         |                         ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
