Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD40629
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 00:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731026503; cv=none; b=tRif2GSIYIvPtMV0u5oSoRg68oV/3qTONcjk9g01nwEvNhxNDFj5/FHhtswS7VHbvEjqdpjOn9CbWcnCzacXPhArKokzMvcSmc3+WAMd/nc9PubD8bUvsXK9YCQ8Bz79VPuKzrXEMislgNo+m+oRRKZ8N0EsNfcFkDYJ3foSOtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731026503; c=relaxed/simple;
	bh=b0f0pjWj2e1uUyI4Ay3iTG/Y/gn/ePPMLcH9Uu2Uieg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dHL1B1tKMYtslGSm4HpZ/60q7C02Hj3ur21eyl8eSnDqjzmaGKOatSZN/YgjNB6W84dTWEKuuaXi7iYAP0lW0CE/4oFHhog8KS6GUe6ID8BfMQLj8fGrSMKnWPCO5pAnMdmy/dOBWDXqQNkfujDVbChFQNYSkAKHEWFNfs4pfJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3YPqKKF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3YPqKKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731026501; x=1762562501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b0f0pjWj2e1uUyI4Ay3iTG/Y/gn/ePPMLcH9Uu2Uieg=;
  b=j3YPqKKFNmaMa716jq0RWj+8GX70vbyWemz8mXmNSqep8+y98cF1mdkk
   A1NvpCDCDJH87SbDpgVoA9zM9CTOZSTHWSQmNDT0EPmJzucXt/gZdqGCU
   UNBervfUu391mGSHJbMKKtKqRim2pLFcWvRnU9hrErPmUAaCZWJACxc7Q
   6UeRZeSubgydMjqXyDWWm0jsAN+jmn87Em/gTs8bmB6xZHE7eCEkAWsLd
   TO/wI1MbIaXtrSBkSOCAyvfJ0zmgMXyhQ88BiLPayr5/zEm4p5uMmKJ4u
   6OKrKBBVsSzNwq+i3av45rkC1Gced4TyAaTVVUVS8OsRYQ9N7tS2fDA1d
   g==;
X-CSE-ConnectionGUID: A9znSj09QF6fEHzq6Y81Hg==
X-CSE-MsgGUID: cgG//TvBSvW7BLYBBR+f0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30856134"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30856134"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 16:41:40 -0800
X-CSE-ConnectionGUID: zS9M6OwcT+acJ1izkg1x8w==
X-CSE-MsgGUID: mzIKTbBzSdyD7581IPmlHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89943430"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 16:41:39 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9D4C-000qpY-2h;
	Fri, 08 Nov 2024 00:41:36 +0000
Date: Fri, 8 Nov 2024 08:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 3/6] ld.lld: error: undefined symbol:
 usb_debug_root
Message-ID: <202411080821.VufPPa3E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   b64a2ffeee9ddfa51fcd212f24b9e6abf79d54c5
commit: 6e97af079d7960bc7b60265e233f04ec8e218f98 [3/6] FROMGIT: phy: realtek: usb: Add driver for the Realtek SoC USB 3.0 PHY
config: x86_64-randconfig-071-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080821.VufPPa3E-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080821.VufPPa3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080821.VufPPa3E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: usb_debug_root
   >>> referenced by phy-rtk-usb3.c:349 (drivers/phy/realtek/phy-rtk-usb3.c:349)
   >>>               phy/realtek/phy-rtk-usb3.o:(rtk_usb3phy_probe) in archive drivers/built-in.a
   >>> referenced by phy-rtk-usb3.c:349 (drivers/phy/realtek/phy-rtk-usb3.c:349)
   >>>               phy/realtek/phy-rtk-usb3.o:(rtk_usb3phy_probe) in archive drivers/built-in.a
   >>> referenced by phy-rtk-usb3.c:349 (drivers/phy/realtek/phy-rtk-usb3.c:349)
   >>>               phy/realtek/phy-rtk-usb3.o:(rtk_usb3phy_probe) in archive drivers/built-in.a
   >>> referenced 3 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
