Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0378155CB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732178732; cv=none; b=YmuQCd+N+oXqPTEeP8xjJZv1hQsB/5bfno6h2LMf92zrbDZU7MN4j9VzQ1+346sYzwt44MKm66QFmCGwDnTHsEvfNCYRxI6jNBWFKkC768hY5kt4HGLUZZ3hON6Ep0XxbMuml91UhVbmDxpfuQstxO1Xu9CKl1VOXgxMZYyg2Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732178732; c=relaxed/simple;
	bh=aST327pdkM7qz5W8E6WY+olHzyFPGWXyqTc/P/ETdN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PSblvuzB18suCkbJjlS17QiPqgLvRZgEnkWQv/Uhts5s75AO+ZHqenR1v4yD5Ey2kTfcWFkG7wcYx6JcaZUxFPbhyj15qTSWQSqg/CAT7ATgxtq+q6wZh4ThXH+pkAJJl7MiUedL9F1sGkEbdAhoiIEbAsQqVCPQlVc4l0+pTAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoKTwMDL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoKTwMDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732178731; x=1763714731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aST327pdkM7qz5W8E6WY+olHzyFPGWXyqTc/P/ETdN8=;
  b=AoKTwMDLD/VMV21oKpP5loBqXZPnBftRmD4C0fSL+WuWiGMMq7xbxcRo
   zK9B8vA3G8nks/q6H0vCJ2I/7RkASw1Xm9AcXWN4yCoQtcSXQ26U9xTpY
   +AE4slYY7FpcvJSxo52MPOpmfZ+h0hkhcq7eT2fCsma7e02Xv2x1vy403
   rCSxNg9Flo/ECWTM/cj+0TDLgs1w0rOiW0UgPDYalDgl4QTl5Gq95uMQW
   VTpbu+JTb10bNOU0uxz5M4nAi9xqgpcnlz4vDk5GnwMzqAOWKQ55aRxkj
   Udism2xr4ra64PErs0v/nL5Hmiy7OwX5tp86d3ai9Jil8B50IudDtUoNq
   g==;
X-CSE-ConnectionGUID: cuxYTkZUQSuBZX5uVb8rjw==
X-CSE-MsgGUID: DpJETho7RoSjB/4GvjMdDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31640982"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="31640982"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 00:45:30 -0800
X-CSE-ConnectionGUID: VryToYkOQGuBRWUdLERkmw==
X-CSE-MsgGUID: 9LXQ1doNTfWHMd3BfapOoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="90302777"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Nov 2024 00:45:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE2oZ-0002l5-05;
	Thu, 21 Nov 2024 08:45:27 +0000
Date: Thu, 21 Nov 2024 16:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14326/24476]
 drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c:10:10: fatal error:
 linux/hsr_main.h: No such file or directory
Message-ID: <202411211603.dOfENGK6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   dcb22c65d3166899f42ea70a7705c5bff529ad33
commit: c63f309bddd4b2e77469531d5a54eeb30cefbe18 [14326/24476] CHROMIUM: iwl7000: mvm: work around HSR stack skb handling issue
config: x86_64-randconfig-103-20241121 (https://download.01.org/0day-ci/archive/20241121/202411211603.dOfENGK6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211603.dOfENGK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211603.dOfENGK6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c:10:10: fatal error: linux/hsr_main.h: No such file or directory
      10 | #include <linux/hsr_main.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +10 drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c

  > 10	#include <linux/hsr_main.h>
    11	#endif
    12	#include "iwl-trans.h"
    13	#include "mvm.h"
    14	#include "fw-api.h"
    15	#include "time-sync.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
