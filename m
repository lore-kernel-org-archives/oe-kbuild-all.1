Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD542A9B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 21:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567073; cv=none; b=AxUW3NOnDbUK29Rjv+1x3fuSle/VqVkVOQXbPeLFfr54mqs9vCdCRC73EJMYcMrg56Wg9yEAZd9AJJdCmXp01w3Ur9EEtT8ZOefMY1hANheWVLCT91OYjvGPleK3MSASRNuI8G5UBZLQtRj02opMGlcYAuMtKwEzw60ezall9O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567073; c=relaxed/simple;
	bh=qMZIhMK34ZFBIexmQGPXmlfcUORK1J/vIpewi3USUvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpm55VO3WCTYeTmbsDT8AZduZkIeCc49xK0mlMqrdjmMPecb7PnOA1mB6OAsy3UUwtMayioIr2AZmDQNWrH+MZka7m2K68nQsTEO//X51vf0BQY1roR79zDcMmLvBpXWYU5YY5WJYNNp2ecsjHEh0YfxQMaZ28mfJx9++PT7nxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQWDvMdq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQWDvMdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746567071; x=1778103071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMZIhMK34ZFBIexmQGPXmlfcUORK1J/vIpewi3USUvw=;
  b=OQWDvMdqY2vpdWmonBUGmOnEmXc9MkQh1TWQDGHGEh/092fGTFpcxrQC
   5LrpJ9OQvLQALJMmEa+l6g16Usv4TwauOZd0dFpdMzd17spe7CSGWTW9+
   4GD5RI92dSHm3BX4GwJHwhQwBEzEgk4b852k0DPC0tlTPVcw0wcKXKrsT
   Hrsc7BMHRITjT3s2P6FF0TdGHf62lOOe5kNVp7gEEOoFSMYTQfnuqeCMF
   vJtcXd8rhumGInNeT1r2itmvC8jAIUfOy29T8oEv6ZG60RCb0F+ELYIpD
   rMZ9GDJslPtwc1mnu+VaejoIsm0QrBV2zKRNRgG1NAdB3ExJkRaXBR3Rh
   w==;
X-CSE-ConnectionGUID: /FHJSvOkQiG+2JguoSn/Zw==
X-CSE-MsgGUID: J8OQ3cvGQwqpiMLPGVWL/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47971324"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="47971324"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 14:31:10 -0700
X-CSE-ConnectionGUID: JxTD8O/UQdi/AGZyXLFm/A==
X-CSE-MsgGUID: yiqj0pWISruOBG1vTuh6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="135641342"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2025 14:31:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCPsZ-0006s5-2P;
	Tue, 06 May 2025 21:31:07 +0000
Date: Wed, 7 May 2025 05:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for CAN_RX_OFFLOAD when selected by
 GKI_HIDDEN_MCP251XFD_CONFIGS
Message-ID: <202505070529.oeubUhLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   3d5bad71a79830f131d55d077053e1e8993f2f6d
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [2/2] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: i386-kismet-CONFIG_CAN_RX_OFFLOAD-CONFIG_GKI_HIDDEN_MCP251XFD_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250507/202505070529.oeubUhLT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505070529.oeubUhLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070529.oeubUhLT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD when selected by GKI_HIDDEN_MCP251XFD_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
