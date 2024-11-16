Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1707191F7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 22:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731795497; cv=none; b=tVSDse7VaF8TS+qQiPW9l+WT1zH2fjewTf0lz5Y6rlDCQHcsRPcOc4sX7MdVDMgmycjNidaUuTSLHVfWiKh/Mn7K/o6psezMUh45zdcSpLfLv9KRJAztNRsdnzyBKuSCaE8kswiplpoP581iaxU8BuTBEbr+2PoSLyfyPh3Wv/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731795497; c=relaxed/simple;
	bh=nR7PFfUSXOMK5Eksu9/gBkXED89l9el1QOILHBqq7h0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=axqLEG+habBicH9hw3iHhkUYjKOvW9cjd/duhWfukOuQBfAAuNOGwPTcouyN6P9T4/sV2ZXUNGuz9QBNCOn41J3zFC/jkVb5JEHw/FX96vJ9h1Rx5amAZVXfgjyGS5wFDHmCroeN51GZsJKB5A4rnG8WtL+bWcIVW5Pvt1oBO/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbeYImGR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbeYImGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731795496; x=1763331496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nR7PFfUSXOMK5Eksu9/gBkXED89l9el1QOILHBqq7h0=;
  b=mbeYImGRq6gpJK4M8QYWJLsfBT8+Ukq9ssfF9cGGuV8CdoiUdEubN4ZJ
   RYOUAhSPtgmOhhTcYIn8kwHWrnEuXCCSWkTrMXI8yAAoDCwirebV4GsUD
   0pfNf8XevsBpPl27EawwQ5lNAczAAmw05Z10VzCTzpNXghf31R5O0qnJ4
   LCVs+58qBVdSC8l/0g7OMAO1y558ik3qfrOa7MBHU0tUxnqOEtEv8Oz5R
   dJbvX7wIq1vLB8mg15i/yzRxzjWIj30C59BnpUfjr/+L74WyprPbcgR6j
   VPKOgMFbVtRMw+Hm8d3L7NJ32FWVwwmJKj0OflOBpvW1boOqMiUGxPjJa
   w==;
X-CSE-ConnectionGUID: nZ6AAYXVRlOVbVjHPgazKQ==
X-CSE-MsgGUID: U549H19lQcu0ECsAG6a3Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54280935"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="54280935"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 14:18:15 -0800
X-CSE-ConnectionGUID: ewhROn4iQF6KAFUQoVCLcg==
X-CSE-MsgGUID: SCIckaqfSo6UKh9ZtfGSBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89278205"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Nov 2024 14:18:14 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCR7L-000193-1R;
	Sat, 16 Nov 2024 22:18:11 +0000
Date: Sun, 17 Nov 2024 06:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 30/67]
 ./usr/include/linux/mtk-fd-v4l2-controls.h:2:1: error: C++ style comments
 are not allowed in ISO C90
Message-ID: <202411170620.AZt4JYAU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   e2b6daceb83c9b9ae90fca4b78fc265484ded662
commit: d45de2088e68aedd84809ac6f8ad73c04252d0c2 [30/67] BACKPORT: FROMLIST: media: platform: mediatek: isp: Add Mediatek FD driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170620.AZt4JYAU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170620.AZt4JYAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170620.AZt4JYAU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/mtk-fd-v4l2-controls.h:2:1: error: C++ style comments are not allowed in ISO C90
       2 | //
         | ^
   ./usr/include/linux/mtk-fd-v4l2-controls.h:2:1: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
