Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF12236FC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 22:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762728898; cv=none; b=uJhtrxPxVBgA8DFNRF9bAFgi5LO1Wv6OtQjtY2l4i5nUVID3A0obi3CdVgHnu9yX5w67KuxBr+gOmv2oeQ6AAQbBImyv1w04NLffJkMF9BOP5Yj1hjfBGdQkIMn0yCbI2C5GKyHC938rN1NjwG9bfUpS57d9sCunPdGU/LThM10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762728898; c=relaxed/simple;
	bh=G4umHvatCLLanZ/OPm/ChEq4TMCs18B4PUmLFgwx5PU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHbtNQ8AkyW+jr3VlQiNIIDZfoaXJakpmDYSWluVPZ03nY6N67NEW9KLctA25KD3aI3EeVLz/bBRKJ1HESZAHJ7HI33DfyUin3GYnqymhH4apWxw+5B7e0I5BlMykOw/lHHrtJX8Y6Zhhi/ype/fJ1n/uaNGK2ogWtrZvI2f8LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HquQv0qL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HquQv0qL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762728896; x=1794264896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G4umHvatCLLanZ/OPm/ChEq4TMCs18B4PUmLFgwx5PU=;
  b=HquQv0qLcqcv0TVed1S0WbH2DZW0XtYVyl+/pXkd58Q47WVHds/3VkA4
   gSVMSKVtHxOBQv1X3giSm+0E877WetUNRTHLcW8/WYr3S1KRrB5Z8HsLB
   A5L3NnGsFdSwR4FAeufmSmodSDSRAohns3COL6eHBM64h56ejM8+hLeWh
   SVuxnXvaaQlUFMEOoec/98ouId8LsXFIBT+OJbNNz4j96o5QNL8I0enr4
   IVj7hr+JOXydDp+hXU/WpFeffY2m9Me8N5A57DdJXJHbC9R7bxNMy1m4+
   Lf8pHrZeztfNsCRyVh0jcOSDj6cuLIEHasHxVInwyIMLLKkPFkEuCu6Ez
   w==;
X-CSE-ConnectionGUID: B9tegHQmS92bFDR+MP6DcQ==
X-CSE-MsgGUID: rtyiwbaqSOabVNWO/SNtOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64712985"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64712985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 14:54:55 -0800
X-CSE-ConnectionGUID: RdWJ4eIUQ0OKIctUGCxKng==
X-CSE-MsgGUID: /SFhQf0bTeWrjI+OZcJ6CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="188169020"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Nov 2025 14:54:54 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIEJA-0002T5-1b;
	Sun, 09 Nov 2025 22:54:52 +0000
Date: Mon, 10 Nov 2025 06:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: wx_ethtool.c:undefined reference to `phylink_ethtool_nway_reset'
Message-ID: <202511100619.YuRi6Tez-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f850568efe3a7a9ec4df357cfad1f997f0058924
commit: a0008a3658a34a54e77f2568bdaa2626233b1459 net: wangxun: add ngbevf build
date:   4 months ago
config: um-randconfig-001-20251110 (https://download.01.org/0day-ci/archive/20251110/202511100619.YuRi6Tez-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511100619.YuRi6Tez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511100619.YuRi6Tez-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_nway_reset':
>> wx_ethtool.c:(.text+0x7db): undefined reference to `phylink_ethtool_nway_reset'
   /usr/bin/ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_link_ksettings':
>> wx_ethtool.c:(.text+0x802): undefined reference to `phylink_ethtool_ksettings_get'
   /usr/bin/ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_link_ksettings':
>> wx_ethtool.c:(.text+0x82b): undefined reference to `phylink_ethtool_ksettings_set'
   /usr/bin/ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_pauseparam':
>> wx_ethtool.c:(.text+0x86b): undefined reference to `phylink_ethtool_set_pauseparam'
   /usr/bin/ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_pauseparam':
>> wx_ethtool.c:(.text+0xafb): undefined reference to `phylink_ethtool_get_pauseparam'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
