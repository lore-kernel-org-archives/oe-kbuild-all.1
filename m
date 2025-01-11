Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DB4199234
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736602874; cv=none; b=AGFonm6kv3k0Qm1Q3RlrocsrufvuNdNmg3Kjt1qVPUOmaPYbMrS+JLxe2Zu50v4O8laZ9q00AjN18wtOtPvbRCy3mOTfbb+K/Zi45brTq0flJ8boc1dlzH5LisV76B9cSGA9bp4F+khgsqYPy1bSi8TqnIyrzIIkPwS1tyj3VOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736602874; c=relaxed/simple;
	bh=XlNt2HfVoQ/cp4W4PsyIUuxGgGRB0ggy13279MCpNUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NX6hNnVMTurG+6cp371rP8HsyXXQS74CNS5wYZ3VDhbEWrAzx2jHNVWA0gtndiZF6FFIdAnjJ0FWd0FsaBnkrCsikl7drjvuZ8ysV4omRE6OQO2JX5KYY174VrQZz1uSctlciSggyLkZlHGxLBeI57qHVNgNPmnJBP8oW7IA0gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtKgl8h3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtKgl8h3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736602873; x=1768138873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XlNt2HfVoQ/cp4W4PsyIUuxGgGRB0ggy13279MCpNUo=;
  b=NtKgl8h3WYMEKgnrp6P80EyLaXnoY1eQBbuieEJ6kWEKiKhlb6deqvr6
   vcDeS0h0gNex4ZGQbqHEgT1y1btspSy0mhEs/KihxXb13plO08GRFoJU7
   BK6sFS5PCo+5x5kKyif9HzfOxtmXcxb+nhVRJ1Ft97Y07wNGTxuTWCd2Y
   15SNHKW7Z4EO07O2u7n8JtEQTMQdlNut5lBNi9t7FmQvqZL5AYOmL7mty
   SjrCRfVQ4S9BzbxP9Tz4F0GmDLEbTO16iEOQusaztGSQ7jt5O4CLIS/X2
   5dUW6Ym2RYtj3eFmPdaxBzhJQ7oEi95+OxInDtFiMx8mQo6NpWvvKE951
   w==;
X-CSE-ConnectionGUID: IbUpVjo3SW+VIqpMHvEwIw==
X-CSE-MsgGUID: UuE5aV43ShmCB9n7Jz2u9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47879620"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47879620"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 05:41:12 -0800
X-CSE-ConnectionGUID: e05hoJykSGyUe4GxJCz4+g==
X-CSE-MsgGUID: MKgrLgtdSOW0QloeQT08Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="104043391"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jan 2025 05:41:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWbjg-000Kho-09;
	Sat, 11 Jan 2025 13:41:08 +0000
Date: Sat, 11 Jan 2025 21:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.co>
Subject: [xilinx-xlnx:lkp_test 286/504] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_AES when selected by VIDEO_XILINX_HDCP2X_RX
Message-ID: <202501112315.6ZkOwgZg-lkp@intel.com>
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
config: nios2-kismet-CONFIG_CRYPTO_AES-CONFIG_VIDEO_XILINX_HDCP2X_RX-0-0 (https://download.01.org/0day-ci/archive/20250111/202501112315.6ZkOwgZg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250111/202501112315.6ZkOwgZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112315.6ZkOwgZg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_AES when selected by VIDEO_XILINX_HDCP2X_RX
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
