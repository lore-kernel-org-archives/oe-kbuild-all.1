Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E961DE4CE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728496693; cv=none; b=dxw97PYlQmALA57zWBrfsu+6xeNuQ2t1hq5SGLop4l+Pa3vlxOd9cIrZLKLYfOBKMrqv8ecJRib4WDT3Vs/hTvHSkqLBzp9BEI0gnnCsyl4klx23U72OVGg3QiQDlJ9udPnPzkaociyN5qTi4VFB1pPW8XAH2/DFEEOTLjIF5Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728496693; c=relaxed/simple;
	bh=/Lqe3nL0MZqy8+NT8yqFLtrg9PeN4BKf8FnIFFV1YwQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNTomw5Srm3Duz6ob4MZ6FK7bfLUCwshAZkp8TK4Poii5oT2oUPuSSgMA3cIPigcHiDslagyaHwu+fKq/cKCHgvoEEF3LzOzsfaJALfIfSIAo+dSfm0CUudMPq7ltAHe1euKxOqRM1CDOcsStAs9PiDAPuDpkbjmNhSsHd9nmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARdTe7+U; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARdTe7+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728496693; x=1760032693;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/Lqe3nL0MZqy8+NT8yqFLtrg9PeN4BKf8FnIFFV1YwQ=;
  b=ARdTe7+UIllr1amYnNg0QcehlsCjcDF8kVJhD9WnU1IBFk/D+xmkWf03
   P47YNL2ReQm3ZWzjv+lZ3hWSh6j1sIb/Xr9TGJP8JuK7FWHzRz36RqCRf
   8lSUf+FnUjTPlWggWxCJiqZB8V/VsUfYkjApPafurDLVtgvt9qmNNjA3m
   jV3dTh5kLPbYaw5KskwrgtdlwiFOp/LuzwLYWpADrbDnaPDEZZY5v0b+T
   X4CKxLbtPsAJLfcFm8UHfkTjC1Vpg2zYr9Bt2Zt6Xg7jF4+WWkK6957W5
   Y3pQyOUZWhCSmOvx45up6ZRy4IZOdgVC7nxPtJh7Ntag+P5S5Y2/bnP+J
   Q==;
X-CSE-ConnectionGUID: Inofi6DLSFSK/0vHMximEw==
X-CSE-MsgGUID: FwNo4BUMRl6IMb4GBfLukA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31610749"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="31610749"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 10:58:12 -0700
X-CSE-ConnectionGUID: HZgP09CGTBWE9lQ/s6fhCQ==
X-CSE-MsgGUID: chL1RctTTMez6W6Zb47j5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="75944601"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2024 10:58:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syawq-0009ZQ-1A;
	Wed, 09 Oct 2024 17:58:08 +0000
Date: Thu, 10 Oct 2024 01:58:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 44/137]
 drivers/net/can/m_can/m_can.c:1919:60: sparse: sparse: dubious: !x & y
Message-ID: <202410100112.hAuhC3pA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   7866eaeb3c1ddb52b976c3e4140cdfbba28a74f3
commit: a09b9245edfe4d1ebb54e1b9cfe06a801fc4e972 [44/137] can: m_can: Map WoL to device_set_wakeup_enable
config: i386-randconfig-061-20241009 (https://download.01.org/0day-ci/archive/20241010/202410100112.hAuhC3pA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100112.hAuhC3pA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100112.hAuhC3pA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/can/m_can/m_can.c:1919:60: sparse: sparse: dubious: !x & y

vim +1919 drivers/net/can/m_can/m_can.c

  1911	
  1912	static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
  1913	{
  1914		struct m_can_classdev *cdev = netdev_priv(dev);
  1915	
  1916		if ((wol->wolopts & WAKE_PHY) != wol->wolopts)
  1917			return -EINVAL;
  1918	
> 1919		device_set_wakeup_enable(cdev->dev, !!wol->wolopts & WAKE_PHY);
  1920	
  1921		return 0;
  1922	}
  1923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
