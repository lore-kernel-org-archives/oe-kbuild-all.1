Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA2C1ADFE0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736687054; cv=none; b=E5hwKA19s825UfhWHL457wh/wfiQGviU5BV8SvUj2LJk05zaaCdpjyEeZkvu9ZO18mX5xkfhemAx/KerSTqRwxpx8ssHJs6ePHWg4yD1xbUA2Ov8Ja5s4Isl9Oq9E9dV8N1dCgIeZnbcc81NvOzbRuU+Gy6IL6lmnEmsLBFJggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736687054; c=relaxed/simple;
	bh=TMkm2zxGueRFIS9BupB4tsol89co3hXv34uSZwtIwLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwE4lBeuPP07oMGpVgFjVrnwrpRTmrFOnmiifOnVbO752WbXpdy2UWdXnQuL0b3SCqtVhOMFIYvOA1vhLRa8sbeCIfTLRxNP82nSteKAmgVSC57eyziwp9PLc0vC4sH31bCPQ8ARlfuPwj6Kx3pEQZlDamT+gzuT6zUW2TIZNwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cy8CLTFl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cy8CLTFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736687052; x=1768223052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMkm2zxGueRFIS9BupB4tsol89co3hXv34uSZwtIwLc=;
  b=Cy8CLTFl9bm/4JbJgsWEoFTbmch0z27dsFolyDgMBSuq7yrmuFTBAT34
   sAy+JlGC0GfkDnyc1P3J+HpYkDqNlEEp0EoJsdmyA3oC9jQYNVzgk+ZLh
   4XrbjZBIIMZkfMZgFpQ3wKsrjojsn6tbLXzJkgX/M2IfaVHAjiw1Pwf3g
   yNL6D7zXtH9oyknyJZwq5fxL/iNVNjjW27wh6Qaxxj4/jx0UXnyKfjWJ2
   oBzeFUKc6jaNpR81Gln4JexFVCIv75zEgbwU2DSSB0wS+pfha4f/h3J3I
   h6iPLNcmA7REid156AjQ+oLI8lj9LZTZoWlCrgD6V0ERS1CDWEgImlubH
   Q==;
X-CSE-ConnectionGUID: nXTOt5uQQyiFRupiQWKcgg==
X-CSE-MsgGUID: sS4GERSdT5Sc+pdGDijLnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="62297121"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="62297121"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 05:04:12 -0800
X-CSE-ConnectionGUID: H5B/2eXDQnOO9GzjTiI4Bw==
X-CSE-MsgGUID: hskPrPSHT1q6XzPBRaYJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="103989660"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jan 2025 05:04:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWxdP-000LyD-2u;
	Sun, 12 Jan 2025 13:04:07 +0000
Date: Sun, 12 Jan 2025 21:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 258/504] kismet: WARNING: unmet direct
 dependencies detected for XLNX_HDCP1X_CIPHER when selected by
 VIDEO_XILINX_HDCP1X_RX
Message-ID: <202501122353.jpoPvzMg-lkp@intel.com>
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
config: nios2-kismet-CONFIG_XLNX_HDCP1X_CIPHER-CONFIG_VIDEO_XILINX_HDCP1X_RX-0-0 (https://download.01.org/0day-ci/archive/20250112/202501122353.jpoPvzMg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501122353.jpoPvzMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501122353.jpoPvzMg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for XLNX_HDCP1X_CIPHER when selected by VIDEO_XILINX_HDCP1X_RX
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
