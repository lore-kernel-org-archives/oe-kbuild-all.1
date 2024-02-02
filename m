Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77DE4776F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706882081; cv=none; b=Ou1BXIdSIa2GSY781gmaF8j4xHCyRO8nU/LfFwRcncuScF5Cl7R1O7pKTcXX0Km+iyyRUlDHMBl7KUsWim6AuRzdiexFI3++LDyuh+6yrZiUUNGyRGv3cXHbkAOgfUgyfMQfKBskTfWUrcW2rF42OcvyoPG/ejYAE5FVmAAppkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706882081; c=relaxed/simple;
	bh=a1VzFmLXmjksmaRTqmH+S7rJa1dVgChuWLP+e1CI5qA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lboGaVLVk0H6WtVXGZ2HFL6qLFYHhcqx+CFj6vPDDlLXLPL3nCB7n1eQhG+eMqW4rFJxkvxY5G5IvtE2tvmg1UmL1GpDd2tVvmaa3oMaC6nsKvFC0gIn/H0VfTSUwzANvjZCEIFn2LfuQw/p5nVRkXfSLq5NdmLGpQkb78LVkdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOYeSKPk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOYeSKPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706882079; x=1738418079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a1VzFmLXmjksmaRTqmH+S7rJa1dVgChuWLP+e1CI5qA=;
  b=MOYeSKPk6fx88JQPYPGoKGYK2hN3SuqB751r9B7t9MloFkySrCqANAcm
   dDihcHET90a3zxq4NCBNv+T5FbRHl4/c5MXDj8ksR1Lam7EJamoHF0oi+
   IlxEtTimgoIaEEpCsWIGYFTyIEb07PZEKHe8NQVMFmLi7byWoDqJbNpK/
   7o1h61AEi7WVU2qW1kaliKvMZOZnZZPnl7SkjquTj5HxdY3343r5YIJ1S
   Jy0Fr4kDwaZM6Le3J6PuD2mqTf2OLjcQ9V5/kFyUbKKjnQ04UqWxRpkxy
   nw7JrNW7h4OEM318tWFWT8pkGQbY9tOOe6hmyjbRukVLlkvwIPTAFci74
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="341166"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="341166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 05:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4678461"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2024 05:54:36 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVu04-0003u4-0F;
	Fri, 02 Feb 2024 13:54:36 +0000
Date: Fri, 2 Feb 2024 21:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/6] ld.lld: error: undefined symbol:
 usb_debug_root
Message-ID: <202402022124.ar7vdyIj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   8d40c367ee22324a030e1997efc8ae6fd81ce75d
commit: 3dadac8ba6d606ac003fb282b9da6c9c7448bf03 [2/6] FROMGIT: phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY
config: i386-randconfig-141-20240202 (https://download.01.org/0day-ci/archive/20240202/202402022124.ar7vdyIj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402022124.ar7vdyIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022124.ar7vdyIj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: usb_debug_root
   >>> referenced by phy-rtk-usb2.c:715 (drivers/phy/realtek/phy-rtk-usb2.c:715)
   >>>               phy/realtek/phy-rtk-usb2.o:(rtk_usb2phy_probe) in archive drivers/built-in.a
   >>> referenced by phy-rtk-usb2.c:717 (drivers/phy/realtek/phy-rtk-usb2.c:717)
   >>>               phy/realtek/phy-rtk-usb2.o:(rtk_usb2phy_probe) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
