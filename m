Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3BB6FB0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736680043; cv=none; b=Jkf0qd4tDGBQcVtMTL6UshzPRU/N41r5zVdKOospG3VFx5TsTMOX0nup3vTsQddH13cbkGZymtDI+gy4a4eoTVYuUtLyDcfIwblrLLbHc1xNG6SuNsq/7u3wcUjcugKJalWHAnvbk5127/DXiB2Tc+BhbqFWug7qegR+60SWYNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736680043; c=relaxed/simple;
	bh=qa0bYQ5w3i7Dyzyv6d9negQolur2zD3KnBoDDN4TD9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XfZNO5NomFGV0GNvhS+xG/kUtVXkWy7h0Qfgrg+zvL44Gs37q0Mx4QsfqltAwER23DnIEUWX9/9IpqoUTgGtXrgXgJ30DtDwKrpOeZgfVJNKBGdV9x2zP16oYJlSEPZugusxblKbY55lHiusb/6pQPEP8AUnilwCmZE68rp7990=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWA7Kl4C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWA7Kl4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736680042; x=1768216042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qa0bYQ5w3i7Dyzyv6d9negQolur2zD3KnBoDDN4TD9Q=;
  b=mWA7Kl4CTkwTGuoafx/JC2NBmUcFTxi1T+1WJcc9XWhCE54+tKQdOobw
   q2AesM/bjoF8ZMChshVnmMtCEUVCGFSC+gAujOlJUPl0KhTO0Lbn7rr1n
   d248yIIXr9bnBlIzOgUkCdF6DtFhJZkuLfr3rqwY2144Fr/iYJUQ8ixFf
   tMyHpg2WPYZWXkVNA3n5sRA9SQ+koxyIiwBtFsZlTtryk9WFPfCYfvVDB
   dEyJtGyd+0+Dx3ewoJNiy09zMNmaDxktnltfJOjMzTP7YNzxor3GRAmKY
   hrdtQZUaw44s0bW2ByIknLNMf+673guLhWfRnoDFk3qjuA59+3fiSPpF2
   w==;
X-CSE-ConnectionGUID: 5aBzn2MqTpqZmAi1Cj5OEg==
X-CSE-MsgGUID: vxrtOj5ZRIyCdmu3ku4Oeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36603758"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="36603758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 03:07:21 -0800
X-CSE-ConnectionGUID: 2WgOh652TLudhZ7O0l8OxQ==
X-CSE-MsgGUID: CtmUMm4ES52wdtFeB/+Pjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135047618"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2025 03:07:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWvoK-000Lpd-1y;
	Sun, 12 Jan 2025 11:07:16 +0000
Date: Sun, 12 Jan 2025 19:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.co>
Subject: [xilinx-xlnx:lkp_test 286/504] kismet: WARNING: unmet direct
 dependencies detected for XILINX_HDCP_COMMON when selected by
 VIDEO_XILINX_HDCP2X_RX
Message-ID: <202501122135.WS6Z8wM1-lkp@intel.com>
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
commit: 9be08bf6f7cab1202fc1167747dd2c79b1bf1523 [286/504] v4l2: xilinx: dprx: Add HDCP2x support
config: nios2-kismet-CONFIG_XILINX_HDCP_COMMON-CONFIG_VIDEO_XILINX_HDCP2X_RX-0-0 (https://download.01.org/0day-ci/archive/20250112/202501122135.WS6Z8wM1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501122135.WS6Z8wM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501122135.WS6Z8wM1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for XILINX_HDCP_COMMON when selected by VIDEO_XILINX_HDCP2X_RX
   WARNING: unmet direct dependencies detected for CRYPTO_AES
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - VIDEO_XILINX_HDCP2X_RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y]
   
   WARNING: unmet direct dependencies detected for XLNX_HDCP1X_CIPHER
     Depends on [n]: STAGING [=n]
     Selected by [y]:
     - VIDEO_XILINX_HDCP1X_RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - VIDEO_XILINX_DPRXSS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_XILINX [=y]
   
   WARNING: unmet direct dependencies detected for XILINX_HDCP_COMMON
     Depends on [n]: STAGING [=n]
     Selected by [y]:
     - VIDEO_XILINX_HDCP2X_RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_DISPLAY_HELPER [=y]
     Selected by [y]:
     - VIDEO_XILINX_DPRXSS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_XILINX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
