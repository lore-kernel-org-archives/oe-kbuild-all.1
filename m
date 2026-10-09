Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3614DEC15
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560487; cv=none; b=A4+RCaVhRxXitzOnnqZ0sqy7qyp++u+1ntaN5e7Dzc00wZbLtxctHG1yDeOB2W52J51J/5ZFWyxVVGhYx5y0tNnRyhM1ZD9DsjyksO/iqS84QrgMeyEjKFLxRmgf8F27U9tpWlphhh+dLm/pHTtBs0yT4hsPiEgt4NpueyUPiKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560487; c=relaxed/simple;
	bh=LRFdrfO3H+84EqxWI43BMoesGjOdpn7EWKlOfn+yxNY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rHTPESmkATATfFxuyQaL0rsjlg+dnWiS9BzW3Z4pf6irzkH6ryxucW9wx4r/9c6q1oHn+vmg8Zus5FYneqgRhavWBvYEvUQQ70KIlJEQHz/feo0UO5+DHtKcxxmzuam6bC1GZFou+mDtNVNAlwmlZRK706yRQNf7pwaIcGqDHuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B98qnxCb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B98qnxCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791560485; x=1823096485;
  h=date:from:to:cc:subject:message-id;
  bh=LRFdrfO3H+84EqxWI43BMoesGjOdpn7EWKlOfn+yxNY=;
  b=B98qnxCboKN2f2MaWbpyvuzls4NqeSuZ21zMjA9bN/Vp3ZFR66+Vrhey
   3ByGAP7j8tC4FBzzGqGdaOcG4iyyjrYN2RCBA+wAAJMAOJtyiB+QTyyrN
   52gEU5QS7DzisqVM5561KFJ5WR+cKBCTjH1KJqD0VN6zI+kgHHmRHn9fM
   FywsPIg/0RuqKZD3mDK4LMfhCa0rljl93vgj67lsv4u4fWOhHoX36Lrb1
   eORsTq75ZMoD6QSeLD7vsNOZ/8CdliPiz0mii5/r78HeImZs73/Y7TTIS
   VPM7ONufOSRhrFbCc8ijkgpGD0qDfBOXHTPREsq9ZG8xbCNgz/+S+ZKft
   A==;
X-CSE-ConnectionGUID: SA0StyTERzSinrM5PNTuaQ==
X-CSE-MsgGUID: chrfuYuSTsioi2/tGlq70w==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="258815"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="258815"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:41:25 -0700
X-CSE-ConnectionGUID: czGwlkGRTvOtbhgZ5nKuBg==
X-CSE-MsgGUID: etTsLVxYQsyYvN577bLQfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="341932"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Oct 2026 08:41:23 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFCin-00000000783-002y;
	Fri, 09 Oct 2026 15:41:21 +0000
Date: Fri, 09 Oct 2026 17:40:52 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 13/13] kismet: WARNING: unmet
 direct dependencies detected for PHY_DW_DPHY when selected by
 VERISILICON_DW_MIPI_DSI
Message-ID: <202610091725.WK6FIAgP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6b7e53dfabebf2217f7ba34cf4bc9869454c8371
commit: 500e70f6113ba8e3d77cbe6c36fb5a5d546e0557 [13/13] anolis: riscv: gpu/drm: add T-HEAD Light support
config: x86_64-kismet-CONFIG_PHY_DW_DPHY-CONFIG_VERISILICON_DW_MIPI_DSI-0-0 (https://download.01.org/0day-ci/archive/20261009/202610091725.WK6FIAgP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261009/202610091725.WK6FIAgP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091725.WK6FIAgP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_DW_DPHY when selected by VERISILICON_DW_MIPI_DSI
   WARNING: unmet direct dependencies detected for PHY_DW_DPHY
     Depends on [n]: HAS_IOMEM [=y] && OF [=n]
     Selected by [y]:
     - VERISILICON_DW_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM_VERISILICON [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
