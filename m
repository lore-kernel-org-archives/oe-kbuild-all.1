Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79A1D357A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 22:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737671802; cv=none; b=Mge/YRAjiTJ2mfVNlNMDcsyx6V3V+GS1oQcJs+uZEyDXhWqXwCh9GfhI0RTRGsOJs16koX1tajeTtEQgxU6aJa/epfBcewayhnytDOuCpm/UJgWwMrjohwZCnMkI12MY2WopKbk+AKZnM2XUUG4jmocbmV5R02UVDWQODBwzIIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737671802; c=relaxed/simple;
	bh=dTBjcrXzTJ5S5im5R2ZURJ+NnYCOeK+BaQo09ETIeCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGA4UJWe8ULIMF5crJTvWSTGAEM7ri1zLKiRycF4w0yOKUGYCcYz4cUncFCGQJSID92kiv3MoKu/G0u2LcgaM9VKCf6oaO02P514VJYR12jHUl4X0B0gXRuCb8TlretZHdnOK0Cy4PqaABM/bc7qdqN2bpVdBlLOHkiYV1++Z2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWiQq/3I; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWiQq/3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737671800; x=1769207800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dTBjcrXzTJ5S5im5R2ZURJ+NnYCOeK+BaQo09ETIeCA=;
  b=TWiQq/3IONmTQfZbXOkwqUQvqfu5F8K4daVfwfpa6l6U2HxzAjMK7y01
   VlvK/lJ10mKkQ99VK1BJCM2x0kwE4KSwidFxAW5rP9DabKGigpgWgn+rk
   TgmmfINFZxkay9xUQ+xYqmaINAh8IaBaP1yuYEDtifvlsGaA1OyO9YQJu
   jKj8EXr99pd7WGl5kRxzV81JlbUmwZ3LAq3zd4TtrlqzpGL2BB3dfHRtQ
   ZlDotyzaZgq/R9xfsUh6858NuIvMO04GZS0lsGaPG3yYxqm5qGIoaiiYc
   wcvJ4Cp912d8BOp7mArY4g9hljv4MSPTTaMRu/7XP4DJ3xXlPxjEDp4RH
   A==;
X-CSE-ConnectionGUID: m/lJjfZDQKOSOsPSzLsNsA==
X-CSE-MsgGUID: rO5/GgJuRmCK/TAAbCbRAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38079867"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38079867"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 14:36:40 -0800
X-CSE-ConnectionGUID: F+Ahnj2oTcirK2Jdfy3iDA==
X-CSE-MsgGUID: P++5PcaVQRWVzDytLTsq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111631875"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jan 2025 14:36:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb5oS-000bnT-2d;
	Thu, 23 Jan 2025 22:36:36 +0000
Date: Fri, 24 Jan 2025 06:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kismet: WARNING: unmet direct
 dependencies detected for CAN_RX_OFFLOAD when selected by
 GKI_HIDDEN_MCP251XFD_CONFIGS
Message-ID: <202501240623.zXrCuMFu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   0a1ffa01c80c97268367cb421dcf1fddb9fe7721
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [1/1] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: arm64-kismet-CONFIG_CAN_RX_OFFLOAD-CONFIG_GKI_HIDDEN_MCP251XFD_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240623.zXrCuMFu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240623.zXrCuMFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240623.zXrCuMFu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD when selected by GKI_HIDDEN_MCP251XFD_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_CORE
     Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_PROC
     Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_PRIV
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_SPY
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
