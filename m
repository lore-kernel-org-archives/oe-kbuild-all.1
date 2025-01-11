Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F11922FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736597032; cv=none; b=Y8txR/w5mtYJLtuDl8Fk0oetJ03zyLgJSUl+3CbIL1X65IreHGrKGi8i7S3siiTl4QqowBBBNrBjo9+xSUQU1rgCv7wvGTnYqrXZ/zkW4jcw8R7aXP4u6EHv0MrK1Su08bOe32VTqKcJz0V7c9Y+bxkWqBIryMpNjGhc53rrI9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736597032; c=relaxed/simple;
	bh=o6Mqs6Ob88k9acAZ/4EeVPNukacO1UYo8pWciPZ/P1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SkbyTVKy5rhFTzx5JnYx+HAurwqepgqXfIv9iaulcM7rMv8lorbMuqOsRuqOSEq6V39l/nACprVUQSzJavteDHvU7sGBaryWNGclHCBxFySvws/PSS0ZPEUbn3viaPyjYjn5PqACa2AG+UzAT8OHuoU/dmpue+Aif/dTsYx6yMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuqzyE4q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuqzyE4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736597030; x=1768133030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6Mqs6Ob88k9acAZ/4EeVPNukacO1UYo8pWciPZ/P1E=;
  b=kuqzyE4q0iql91kb5GDWF20ZiajU2DG+CRb7nlP7eajyKiU2g6LOwQNF
   M4wN1H2PEvpF8RErTLl6HHEAffCJzcbVvtRKmx4qDWHV6Z53gdIlOlc9+
   hm0MQFwXpXhw79FcSZ5QFKfEha3FHj1QO/7QYlB5V7nKLFOngU8f8XzqX
   3Lfp5KA0LZNNf2FxaqMhYztOV+QCRe1bKdwYjBpFz4sKcUuanq3nTgEYr
   DeJp8oTzMp0mixOvpBKsCgr33bg06Ra8PVgB/H22dmsrZ40/3LO6i03dB
   IfL+nGzarKdgYe8i5+DlBnUrmkma8QsbQeSYDORLdNM0qUXfEliBYQrUw
   A==;
X-CSE-ConnectionGUID: tbizcC/5SIemXVeAaPhJ6w==
X-CSE-MsgGUID: WqszDRHERQm2cHKBT4bwqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="40565021"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="40565021"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 04:03:48 -0800
X-CSE-ConnectionGUID: 3XSf6Z/gQd2PGJCAuO0nGQ==
X-CSE-MsgGUID: m/sUULc1TI+jhLzSZrG7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="103781732"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2025 04:03:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWaDQ-000Kbl-33;
	Sat, 11 Jan 2025 12:03:44 +0000
Date: Sat, 11 Jan 2025 20:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:lkp_test 267/504] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_AES when selected by DRM_XLNX_HDCP
Message-ID: <202501112257.qj5t8R0f-lkp@intel.com>
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
commit: 6c8caf3eeadd38ffab47f6cfb7dba45556256143 [267/504] drm: xlnx: Add HDCP2X TX support
config: nios2-kismet-CONFIG_CRYPTO_AES-CONFIG_DRM_XLNX_HDCP-0-0 (https://download.01.org/0day-ci/archive/20250111/202501112257.qj5t8R0f-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250111/202501112257.qj5t8R0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112257.qj5t8R0f-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_AES when selected by DRM_XLNX_HDCP
   WARNING: unmet direct dependencies detected for CRYPTO_AES
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - DRM_XLNX_HDCP [=y] && HAS_IOMEM [=y] && DRM [=y] && (DRM_XLNX_DPTX [=y] || DRM_XLNX_HDMITX)
   
   WARNING: unmet direct dependencies detected for XLNX_HDCP1X_CIPHER
     Depends on [n]: STAGING [=n]
     Selected by [y]:
     - VIDEO_XILINX_HDCP1X_RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y]
   
   WARNING: unmet direct dependencies detected for XILINX_HDCP_COMMON
     Depends on [n]: STAGING [=n]
     Selected by [y]:
     - DRM_XLNX_HDCP [=y] && HAS_IOMEM [=y] && DRM [=y] && (DRM_XLNX_DPTX [=y] || DRM_XLNX_HDMITX)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
