Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24D22AE7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 17:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736616509; cv=none; b=ngZvCg1L2KK0yTm5Mz2mY7by8ecX4XfefOdEFGHV7j1Zjlt9DdR9uAoV8gSDQvyVzUMLrAyvreBXhcjSXrBRIfYbxgHSX4RCWW4jmzI4yJHvPal0v4VJqtTZ1br+NoOsPmA9nt43fF4CGVmKXyznf1Hfec3WD/9m/mA1AW15S4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736616509; c=relaxed/simple;
	bh=pfBnr2pY0jWo8LMBkgct/80daNRPO8+iTUg37Y27C1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSgq2kypEHFuGcZDuo7UFTBDjk/mjXiXKs18GpkAumLlAHlg4GqSSvL6iCrN8+yI86mHcnIy5sYEFrGzx1cgxdUNw14u/KVwDVWtBscu9mBNM01Yd1r+HkjJZ8XmV8i8kogCL89D6qAnyFhESOwgfJHXTA8cbtkbK9PVId4mf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wp0/I1fT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wp0/I1fT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736616508; x=1768152508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pfBnr2pY0jWo8LMBkgct/80daNRPO8+iTUg37Y27C1M=;
  b=Wp0/I1fTmFrN0YsseMmivtu+PsXYYt7+vFSBVl220IjFgPtnRnlAsX6z
   YoaBRah66uJVVcWHJTYZX1euTqJc06DVnEApor4jgzyFplcM7H6sh2W/u
   Gy75KP4wxkb5rsAn8FboeUhEkTLrhlIKMaQRgimXpCVzZ/ZWjNlBLVYdx
   dKD0WMxqG76CX22SQnZK7wxiU+9S5IYZ4kvxkeLwY1OUIJ12ngdhYo9U3
   mv5nh1pxBvCDTPNG7EMPNBJ8ReaYo51XjVpgtVfmVxM6CdEVR3uevWxEJ
   6S4tjYBmx9DPXdLqJuRq+idgmMfffRrn9a/mmvkFs9MJer2de9jmf1nsC
   Q==;
X-CSE-ConnectionGUID: gylPaGuSQKOY4rk70o/+XQ==
X-CSE-MsgGUID: ujnzQGJLSyiN3Ezc1r9ncQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36781064"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36781064"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 09:28:25 -0800
X-CSE-ConnectionGUID: G4vMkb0oTPm3B192eBFCzg==
X-CSE-MsgGUID: QCMmZ/6bQBCHn3nyYSbW7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="134849314"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2025 09:28:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWfHY-000L3K-1H;
	Sat, 11 Jan 2025 17:28:20 +0000
Date: Sun, 12 Jan 2025 01:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 258/504] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_DP_HELPER when selected by
 VIDEO_XILINX_DPRXSS
Message-ID: <202501120303.liLQguHq-lkp@intel.com>
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
commit: a76e9bb15d68490da1eed3472ee1f554447a4a00 [258/504] v4l: xilinx: Driver support for Xilinx DP Rx subsystem
config: nios2-kismet-CONFIG_DRM_DISPLAY_DP_HELPER-CONFIG_VIDEO_XILINX_DPRXSS-0-0 (https://download.01.org/0day-ci/archive/20250112/202501120303.liLQguHq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501120303.liLQguHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120303.liLQguHq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER when selected by VIDEO_XILINX_DPRXSS
   WARNING: unmet direct dependencies detected for XLNX_HDCP1X_CIPHER
     Depends on [n]: STAGING [=n]
     Selected by [y]:
     - VIDEO_XILINX_HDCP1X_RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - VIDEO_XILINX_DPRXSS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_XILINX [=y]
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_DISPLAY_HELPER [=y]
     Selected by [y]:
     - VIDEO_XILINX_DPRXSS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_XILINX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
