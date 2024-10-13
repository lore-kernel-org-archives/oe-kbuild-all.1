Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5D360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 02:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728785195; cv=none; b=ng+86+GZaYWhJDXgXfluXTwufOazEIfqHLPkHqAtl6LRgl8KYEgI5Mh+gJ0QPwSGksPtJ8R0wHJZW41cFgXPIOBKi1zPrB+orkBLZVQGNBq4tuEtE+OQtC+ENbODNvaQpPOmuOZbT6e3IYdER9lpeo1nF4NGLUMXA9N46ZzWUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728785195; c=relaxed/simple;
	bh=YcTBndSO6m5OUxaG/GgTc9aZN3NPY2cLdIlUjJlAf1c=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rVyen47pmST3Kcfvo66e/T8Sv0H18vASDZvRA5cY2XOz0amLR2YxxnVm4I5pc5AP1BXWus5YfrJ6Jk9gRypDCDPqks6ISp7/LYlmd1xFwgIjsNMLtfiEtUEl+sXn4DPw9o10GwM9mT4FYWlYvQBWknt5XqgUlPwvq8KNthQ1ZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWBrDX2v; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWBrDX2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728785193; x=1760321193;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YcTBndSO6m5OUxaG/GgTc9aZN3NPY2cLdIlUjJlAf1c=;
  b=kWBrDX2vQbU3foK4v6QH+BiDIAxcP+zJtGE3L98UGaQ3QMqRR+uZXvOW
   gpq3EYmFlaE6LERPnJC6fN2FSYOsnULSpTKQGN8fTm6qJLXH3EYnCDiH1
   2I5dV4h6eGE29nlrSm7p/yDAZ/IOLn9B0RlVi8p9qDBrVY2rJT4GBnplg
   C8nLadSU2+iTqRXn6jkliEvRzaUXvkMGDsungNhqLNX9JDIeUN7o1skkh
   WxHBiZltplFyqdAHG2isFCQfizXB2T/FFiZ09fX26wQirWDD1HXTAKBkb
   A2xgi7cWaoDolYW0EH7W82op1Dv/a68bMtp5YPb+HHnS6Z4m6h38BJEtZ
   Q==;
X-CSE-ConnectionGUID: HkaK/MzgQ+CrteiqzsKfaw==
X-CSE-MsgGUID: f97g6DbxSj6bGLOD2bQJUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28291520"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28291520"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 19:06:33 -0700
X-CSE-ConnectionGUID: rUf1dQbtRY2+524O0a/Mqg==
X-CSE-MsgGUID: EakGOQwiSaehK8eh8xscHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77700648"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Oct 2024 19:06:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szo04-000DzD-2v;
	Sun, 13 Oct 2024 02:06:28 +0000
Date: Sun, 13 Oct 2024 10:06:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 47/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB953
Message-ID: <202410130946.yvV9zdRt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: d1a221d48b45bc73a80c3e86a028dfe60f8a34b2 [47/107] media: i2c: add DS90UB953 driver
config: alpha-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB953-0-0 (https://download.01.org/0day-ci/archive/20241013/202410130946.yvV9zdRt-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130946.yvV9zdRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130946.yvV9zdRt-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB953
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB953 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
