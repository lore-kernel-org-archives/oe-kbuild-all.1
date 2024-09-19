Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907A3125DE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 03:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726715052; cv=none; b=rx4saQ1zElVayEtdqJ5EMe/syRfOnU0kmDhGsFRLa794xJzy4EEm7yu4wrTZf7qeTHOR4HExOP1U1gucSkhnFRoG+0mKxupu4Z3a1EUtjzcBA2YCOFFT74oR3VRxeoxAv51NC48JXkUhN5N5CkZRMqvCHMBWPhAz6m6KmqA0378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726715052; c=relaxed/simple;
	bh=3zau13kuIWNB7Jl5w3cS/HwAELY5WJpzSB83GKn++vc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NiXZ/uKkrQcpMSiTVllED57XtTNMILj1lEKBqrBLolteU5XHR5Tp7kn0AUsOo2jB8dGYMdqEmZyzRiy887k5jMySGegVIwkIZGKJLDqVy7+3O4zGjgoHNLwIwaX6ZAXyJfK1E2to8zhCc4eAkI0PbM3pccgnQCMMhvg8waLj0Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbLW2BMc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbLW2BMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726715051; x=1758251051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zau13kuIWNB7Jl5w3cS/HwAELY5WJpzSB83GKn++vc=;
  b=SbLW2BMcO0So6Ij/y4yTOzd2lKsF03/s/rtG+Kc4CEumA6VUxN2lLR6j
   Yw5+XSazYOc+6AyxZLke6SLwvTLCeGC9wyxvoWnOQlrtY18Sq6mTjlEGc
   g0leuLL78V2wlV+/cyxkKzCcPrkpz1Mnw8SX5nH/usatOtNkXLod30yx9
   QiccUFIkBmXPl3+vkCT7TznMuMY/MgJt5iXXqY9oGgfHpxxhQ498GDeL2
   URU0l5pOo4hNI19svaV68BiG4ioC3ijCzXXHj63XtnPCak41GJFPFLU+y
   6Fwis3nQ/nliXozblJuurgAYTbE9Sl5F+wD3TFZhILsbXQlbDKcEet2RQ
   Q==;
X-CSE-ConnectionGUID: EXcYKd1GTD27F+cCOEBp5A==
X-CSE-MsgGUID: +JsZs9ahRcKu00zdwryvqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="37016519"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="37016519"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 20:04:08 -0700
X-CSE-ConnectionGUID: wvHqiFSmTJGRj+kqzuZ9/g==
X-CSE-MsgGUID: 62OzENk0SvG1tLIyKA5Mpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="74574776"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Sep 2024 20:04:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr7Sf-000CqM-01;
	Thu, 19 Sep 2024 03:04:05 +0000
Date: Thu, 19 Sep 2024 11:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1518/28533]
 drivers/misc/mediatek/connectivity/common/conn_soc/linux/include/wmt_idc.h:
 wmt_stp_exp.h is included more than once.
Message-ID: <202409191015.vSjxJags-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   92b88e0e59c946d552fb3d375d60e775a4151ea2
commit: 06d376a01ea074dd064fc447282fe587ea9ddbdb [1518/28533] mt6625l: add driver-folder from 5.3
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409191015.vSjxJags-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/include/wmt_idc.h: wmt_stp_exp.h is included more than once.
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_os.h: linux/wireless.h is included more than once.
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/include/precomp.h: que_mgt.h is included more than once.
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/include/p2p_precomp.h: que_mgt.h is included more than once.
--
>> drivers/misc/mediatek/include/mt-plat/mt8127/include/mach/mtk_thermal.h: linux/types.h is included more than once.

vim +20 drivers/misc/mediatek/connectivity/common/conn_soc/linux/include/wmt_idc.h

    17	
    18	#include "osal_typedef.h"
    19	#include "osal.h"
  > 20	#include "wmt_stp_exp.h"
    21	
    22	#if CFG_WMT_LTE_COEX_HANDLING
    23	
  > 24	#include "wmt_stp_exp.h"
    25	#include "conn_md_exp.h"
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
