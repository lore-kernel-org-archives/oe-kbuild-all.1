Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346F547078
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665106; cv=none; b=YCaZl5K65jlYI/HtaNXMRHwsHIwfgPBPYj5gIfQPWrfNjl/oFnTGjkkADfKTTOc2oLIUYfyXYgOAw/+xgDWLGBcLbXG/MzaHPr/6YO1GgY8DhTVcF0gj8lTwwPgnkg6sLcWVKK1G5BfcVaCrZTjRD4N/p4iZMrDjKLltS3oYzXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665106; c=relaxed/simple;
	bh=obuJt6Q2f0IlS8Z2SPycKZ2Vxg+tKiYlRglOs29lvIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M+fHMXmZkGiP5xsIyLC/rZOUJ4Eb1wWcruQ74FcNbUBzwOBo04L3tzRKH2sxclp2ju4nWD256aiAnSVGdbQLBYq9bh60xBWs+h3+fd4TPZuxUKSbqUcwip6n27uEXNaecEIEKBqmUfrQwRh/5fP+rUySF7dp6SP9yXkbIBXHR84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IM7WsHTU; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IM7WsHTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789665104; x=1821201104;
  h=date:from:to:cc:subject:message-id;
  bh=obuJt6Q2f0IlS8Z2SPycKZ2Vxg+tKiYlRglOs29lvIU=;
  b=IM7WsHTU7HJrkMVX8ZxtUdLkv3NaMHnTZksEyC/MNzi+x3kt9F1BzbvV
   nyp8cVg7DRRg7v9wKrR9SMfcJqQPoewjAgel+l5TezTSPGAqxR2I5wnbE
   k0DJQvloqR6a5U3nCCcwDc50FdvsXiUPZbdOSaSsq/n1BZE5FkJfSAAtm
   WpFCcAaDSnAZ/U1W/nEtkawieB5md8k17WFOUfmh75H6F4k6D8zCS9c+p
   A7xdhOODDgQ226hYzP5A6K3CCPxETVF+0TF4Px7D8XEr1EYm8Z+KE6Mk7
   /Gx7Yx/IpcgEOT0q+73tzC01MvPbXox9jGbN6rBPhKlz3eHcZg71StX6y
   A==;
X-CSE-ConnectionGUID: 2u4z61C+TludR9zGNVoDkA==
X-CSE-MsgGUID: Pr8BMNHbRoqKq533hCpf7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="620829"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="620829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:11:42 -0700
X-CSE-ConnectionGUID: LFZIXZRIQ0aiyEa3btNSVg==
X-CSE-MsgGUID: RNxPJTZPR1mUAWAgd4SX5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269636591"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2026 10:11:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Fe5-000000008HD-3Qpk;
	Thu, 17 Sep 2026 17:11:37 +0000
Date: Fri, 18 Sep 2026 01:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-jumbo 217/217] ERROR: modpost:
 "mtk_xfi_tphy_valid_ctle" [drivers/net/pcs/pcs-mtk-usxgmii.ko] undefined!
Message-ID: <202609180135.OhWf5UaX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-jumbo
head:   bcc06aa67cff0213e2c9da870784b2134b137ff5
commit: 82d9d66d807e6c2614dba69eb9df68393527060b [217/217] net: pcs: mtk-usxgmii: check link status and phy ctle before reset
config: powerpc64-randconfig-r1308-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180135.OhWf5UaX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180135.OhWf5UaX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180135.OhWf5UaX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mtk_xfi_tphy_valid_ctle" [drivers/net/pcs/pcs-mtk-usxgmii.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
