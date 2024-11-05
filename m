Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02B31FC3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 00:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730767617; cv=none; b=U2joyt9gIN3ixTy3g3LQPEoperFmxLey1u+lQ9w8KVHUDyEwtE7C4syyYjSX6Ox4ZUdoExnATmc1meQqQItaA0bQO2izMZRrqS3KRyakS4QqMbDjISjA/oQA4aOurCYWipwWDbIvBMNvZ6Fq5Js78dQ3+xWdlfjZVdYZLsSU/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730767617; c=relaxed/simple;
	bh=61vI2HR48wN5HKUE5/wSXhrrWfnGmN16XpYJ8lo9lQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AhON4/YzTslQCbrZjgCBXI45BPEQ3+u5sR9beDioWqHAfwFj45gdjirAVbuLJU3pkbYc93e5TjBjM2otCVba8Hc1HkWe1aK2qLhwEhF0QvIqGxqAqyzC9YqorgVDRLwP0/ZxZESAk9XvgJD9BXaN5sRAt2FfT6IWhgisvLnbELo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7hBelKy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7hBelKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730767616; x=1762303616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61vI2HR48wN5HKUE5/wSXhrrWfnGmN16XpYJ8lo9lQo=;
  b=W7hBelKyYfRBx794Ox1IuPjaTVWrHom/4oqY4cB1JL17VjOQFo/BBWSd
   IaDPpWMR9c6vth0rowwu7FDr8T+oDZaN7PZn+lH7o049fhXeX2VIFmfpo
   cnL07kiDVh3paOHvPI9y2R6OO08ReNM9FXBrFAbgM215BNfMK6ClFUQYo
   r/9s2Chj9wuNWs8x474727YZHqplkgxnE56fYFje90eZg2O47YF8MBgij
   FyurhWp7YxyjFNydcG3nYWueOoOIYuxqgZO5WmlUquWYOt7Jy0PW04Gxy
   Nr9xNlIO/oBtzuJrLuBx3If1K04BP7OybC/m+rVGB7mG2H170SQ+QG8/e
   Q==;
X-CSE-ConnectionGUID: OvgnKNEsTjSBtFsiaWgaPg==
X-CSE-MsgGUID: HIkuodbzSOyBIeqy3k60GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30341776"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30341776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 16:46:55 -0800
X-CSE-ConnectionGUID: u4xJ8bS7RyS1hRFul4Qakg==
X-CSE-MsgGUID: vMnYarMgTWmvCurWcv/1gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="107161008"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Nov 2024 16:46:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t87ic-000lRl-2w;
	Tue, 05 Nov 2024 00:46:50 +0000
Date: Tue, 5 Nov 2024 08:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Sai Krishna <saikrishnag@marvell.com>,
	Simon Horman <horms@kernel.org>, Ahmed Zaki <ahmed.zaki@intel.com>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Subject: [tnguy-next-queue:dev-queue 59/85] iavf_main.c:undefined reference
 to `iavf_ptp_release'
Message-ID: <202411050805.cfj4ObQq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   676d779106de51fc4e2685ca8de610ee5a70d35f
commit: c12eccf6bcdc66b3b1e3826ea01bba30b04095b2 [59/85] iavf: add initial framework for registering PTP clock
config: parisc-randconfig-001-20241105 (https://download.01.org/0day-ci/archive/20241105/202411050805.cfj4ObQq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050805.cfj4ObQq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050805.cfj4ObQq-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_remove':
>> iavf_main.c:(.text+0x72bc): undefined reference to `iavf_ptp_release'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_init_config_adapter':
>> iavf_main.c:(.text+0x8484): undefined reference to `iavf_ptp_init'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_configure_queues':
>> drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:381:(.text+0xf08): undefined reference to `iavf_ptp_cap_supported'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_virtchnl_completion':
>> drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:2618:(.text+0x4634): undefined reference to `iavf_ptp_process_caps'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
