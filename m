Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5A02BAF9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 21:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736631431; cv=none; b=bxxCo7KMX8MNiyZJjSn0CqDkb8mX+fjfYLzEhleLzFTpoLxHsTLFsg9KaCrLKFBLeHMjKF7NfB7bRUZ1S+vRaZLNnm/fnOyKi/fu9VC/mmCD8XBas1FKpPfquE8G2bsbT0O45uqIuL+pq36BiENUBLDqWVrudrgr/eWf6FgI1rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736631431; c=relaxed/simple;
	bh=FSTZmUZitM+j/cV0eWBfmTGW0RpRtbZOM9JPrsIBc7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ut/h/j2joZuC6bugLL6U/D/vvHs7YCt5NNetzJl5pzQ7PZzzoQrxYrxmVzgIAGa2MKmHcSY0RGFQZ/RPVf2xeVmsLcr1IlMFpGaYnaXUH09aY4BIjnaPWE2R3RawsfIOZwkoC0G/yUpotMkeJVdw/ULyZ28EUmOpnTDbUtUN04E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llWmZ9+Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llWmZ9+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736631429; x=1768167429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FSTZmUZitM+j/cV0eWBfmTGW0RpRtbZOM9JPrsIBc7g=;
  b=llWmZ9+Zo5rjeIBMMGRn2t6H6y4UC7OshKvZLsJBea7arFFziYOGyIxz
   spo8/tDXQquPHLWqF3Ohh6VVE+IrAhOIkSmqWYJ/ZQZ9Sm7vwch493hgh
   dCKa8FU5ZY9bii/kiLnQbtvlApSm+HUzjtBxrCRHIjOrKpOwN+xIMgcmn
   YsJevd14ScmgkqeLh0KTlaYo9fV9qAKUMrC8F6u9twGWtouHlSKdW+yZv
   CqyBJsw96unt4qo67ZC1RQpA/jQLCOuDT2wtS+VjO5yzqhXYnczNCZT03
   vwdd2Iz0UgMbNfundOyNr3KYY+K1xszjPK5wVS+AkRmhDNDK1VyDWHi3N
   w==;
X-CSE-ConnectionGUID: IJ+WVu3JS1iWuc8v0W8abw==
X-CSE-MsgGUID: Ygcrq+4gRsyuBIqh6mHaYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36583492"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36583492"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 13:37:08 -0800
X-CSE-ConnectionGUID: XI+ig2tQTWuDBayDi73bxA==
X-CSE-MsgGUID: wwihb9SxR6OtCAG/GVwrDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109088594"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2025 13:37:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWjAF-000LFP-20;
	Sat, 11 Jan 2025 21:37:03 +0000
Date: Sun, 12 Jan 2025 05:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 111/504] kismet: WARNING: unmet direct
 dependencies detected for NET_SWITCHDEV when selected by XILINX_TSN_SWITCH
Message-ID: <202501120714.G2Kwncuo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 79569a88d904a3efdb6a5f054e40344b688ed82e [111/504] staging: net: xilinx: add Xilinx TSN driver
config: nios2-kismet-CONFIG_NET_SWITCHDEV-CONFIG_XILINX_TSN_SWITCH-0-0 (https://download.01.org/0day-ci/archive/20250112/202501120714.G2Kwncuo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501120714.G2Kwncuo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120714.G2Kwncuo-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_SWITCHDEV when selected by XILINX_TSN_SWITCH
   WARNING: unmet direct dependencies detected for NET_SWITCHDEV
     Depends on [n]: NET [=y] && INET [=n]
     Selected by [y]:
     - XILINX_TSN_SWITCH [=y] && STAGING [=y] && NET_VENDOR_XILINX [=y] && XILINX_TSN [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
