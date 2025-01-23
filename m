Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC98320E314
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632471; cv=none; b=k6KC2JmtE+czEcmTJZiY8uzI7DEbtg2EqI/YRsV6VS2cj7TvDkPFwi9iqBcU7Q3gXZ5ednpLJ1U1E3nS0cp6rZw41dr4uWQ1hu0T1/GbbyRifq74f/X5icIWBoIEyE+IP+kmjqB4Xr0voNYsPwxlNq6OHgohOytXDRbOpmMk5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632471; c=relaxed/simple;
	bh=4lbQd2ape74AdbcXmishF4k5AYz8wOoAPfGC4iINyog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FaboNdQCQ5YE9SXJQUDs3X1YGsvIRPaUZyH9w8tOyFCdnOcepGq5getE3eWQJMIl5w0OfUuXcCLR7abyGVcuZSYbleUqKXumvX0eV02pbYTPiDyJxkcFEqoRDk6WocCTtympoWvH2r123h3NnyFOPEj/GIV+AbRmsiDxVVXfsJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPaCp603; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPaCp603"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737632469; x=1769168469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4lbQd2ape74AdbcXmishF4k5AYz8wOoAPfGC4iINyog=;
  b=ZPaCp603Znu+TxdCAuiPLyHZRmKZ2IkOL8io6OoYJbtkWtCsFcv+zTgJ
   M2T/0+fBLtfRiEne80VTQcwJTMQEZFHGqVAmDiILpt9S5wHdj7PulpzTw
   Tec2tJvnKQVG1qqWBEYRqkJLCbPJJ0xJXnMCmojLf55rfRSGghsNNRgXn
   7sASaQP4ExthkSztDyimaF4STYgG0cjpEFbB5fzdmmlpzCdguCNezhABk
   sg3eYIBKT0ApKlgA14Y1ZP3K6No5VuLhGyEQPFJ/Q7yF19df7HGblLeXq
   PYnCi6K/1y33OCzv4kuohbWJfFxc1W5tIR7aC7l9zeGaCrzz53sUSVP4J
   w==;
X-CSE-ConnectionGUID: hj42zfG9ThmAwsmJ6G6jCQ==
X-CSE-MsgGUID: QP3ZVvVBSDKlUriPhzWrpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37823148"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="37823148"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 03:41:08 -0800
X-CSE-ConnectionGUID: RVk0v17QSTqoF7eAxsKClw==
X-CSE-MsgGUID: tjkP3qIBRPi5NR7Mt0DwSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="112462771"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2025 03:41:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tava4-000b83-2i;
	Thu, 23 Jan 2025 11:41:04 +0000
Date: Thu, 23 Jan 2025 19:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 69/74] kismet: WARNING:
 unmet direct dependencies detected for REGMAP_SPI when selected by
 DRM_PANEL_NOVATEK_NT37801
Message-ID: <202501231935.kqUYAJfm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   3d4ec7553fa4310579528818ee68ffff4b614b66
commit: dc3f7215cca7f40f995b5349e5bd9b4f7fcbeb12 [69/74] WIP: panel-novatek-nt37801.c
config: openrisc-kismet-CONFIG_REGMAP_SPI-CONFIG_DRM_PANEL_NOVATEK_NT37801-0-0 (https://download.01.org/0day-ci/archive/20250123/202501231935.kqUYAJfm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250123/202501231935.kqUYAJfm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231935.kqUYAJfm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REGMAP_SPI when selected by DRM_PANEL_NOVATEK_NT37801
   WARNING: unmet direct dependencies detected for REGMAP_SPI
     Depends on [n]: SPI [=n]
     Selected by [y]:
     - DRM_PANEL_NOVATEK_NT37801 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && DRM_MIPI_DSI [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
