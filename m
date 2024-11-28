Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E711C07DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732814493; cv=none; b=hMZZMjahX0vECCmH7WrYErg8yW2UYR53EC8EiAWxgnA9p9UM84Bf7EOnZXMbMrGz4sDtmVnRg1wr2bS5Q1IyjGAzMVMIRgcI5bvFPsnKr1hW9Gn3bPpEVZlh94WtIKjp80k6h/drpdSGBSig0WBsmQRf55eIOCQ2z3/scVTfUoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732814493; c=relaxed/simple;
	bh=ZkCeZo7wzBKs+pNDnicEb6bN7gt4x8tRILqZWOlw0n8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qRoIkJTVa7DBgBuj9YDZB/RH02SKHXUubE6uJe4T0BtvPqFaiww3joYouG9RNNRMT/z7mJhArBFwQqg0dW4YWerFBlaSyngO9plv4mTyLSS6YUExalpCimoqTpdEdudX83VcVzRut+A89NB3lglzQcE3UnQ9XcyIlWfSCV0pjSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZ/GYQMU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZ/GYQMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732814491; x=1764350491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZkCeZo7wzBKs+pNDnicEb6bN7gt4x8tRILqZWOlw0n8=;
  b=gZ/GYQMU1vFx2F8ZzVqswU4n+zHuShuWts6jPqePPb1Qtft1asCmMQ0y
   iOSlhs72cni+S9dh1ptMPk/YTYUqkylqZ/8LYCl2fIsG+5mYVdFr4CEaY
   2SSt8XQbIhoWQYVp7p7RlSASz+JMFEF69T55ugmCm0ew+c+i4nYmTFe+W
   hmKFMJH77en2uX/g84hrNtdMtgUsAUcWhJW4wk2ORmYQdsYxryWXG0Yik
   hYWjfCoG1JSWTDcDgf2gcevP6BLjwydFtQ4VT9ziTA8MGIvqZNKG6tJ4e
   78AL6FvcBOHQwObstZRqUmO5eRnyoqju9S59G12hyn4DtWWiLfWryH7Cj
   Q==;
X-CSE-ConnectionGUID: GyKR3G0qTqiPOa+WYljoGg==
X-CSE-MsgGUID: Rgrf9sr7TDaqzsz7XoZcZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32989911"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="32989911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:21:30 -0800
X-CSE-ConnectionGUID: 7ZKnwzDpQfeyerpCC5WcwQ==
X-CSE-MsgGUID: 4E/X4AFFR3+n7yN1rGZR2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97386019"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2024 09:21:30 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGiCl-0009rN-1O;
	Thu, 28 Nov 2024 17:21:27 +0000
Date: Fri, 29 Nov 2024 01:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14326/24490]
 drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c:10:10: fatal error:
 linux/hsr_main.h: No such file or directory
Message-ID: <202411290140.Z7oYDkLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Avraham,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   0dd7d0550725fad6528d113fb89a2838b5db8af4
commit: c63f309bddd4b2e77469531d5a54eeb30cefbe18 [14326/24490] CHROMIUM: iwl7000: mvm: work around HSR stack skb handling issue
config: x86_64-randconfig-103-20241121 (https://download.01.org/0day-ci/archive/20241129/202411290140.Z7oYDkLc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290140.Z7oYDkLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290140.Z7oYDkLc-lkp@intel.com/

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
