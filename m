Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721C3A31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 04:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726546429; cv=none; b=CyXkJQqwfeUI+XAG9NcgW/RPLpPMaweiX39gbJn3GgUTerw8dX2GQJbJ5EyGUFWvFxf3joNFXljWhLyZxQMsROb8l01f/O+ElLNyK9Wq4H2PY1ZYjFVbPz32NCBLWOrSOYIlKXeKGbu7LUM7oNlz7hE2oXMUsFduhKShseeRq+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726546429; c=relaxed/simple;
	bh=eKbQWR3cm9VUF7dhvqLye/a9jobAt8BN9ZwHFkT5qBM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8nVN5gOhUuyYKfkAm1spHsTP5nZbl64u+W2qUv0A5PEoo1K87TaLyr+54108uSO7eKS8Q1oxeRyy3y4uvY7njiVQ5Sj+vE7T1Zp/hLmZfAxKbMvo+fEFYkvf1a2POFEx4H5ZfQylOvl0E0K5x5JhBRVFO5Xlr3BAPKJqEfJAxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1O2Y5qW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1O2Y5qW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726546428; x=1758082428;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eKbQWR3cm9VUF7dhvqLye/a9jobAt8BN9ZwHFkT5qBM=;
  b=H1O2Y5qWzEi/+63gWyzqfoxuafUQ8nWK09w751HYCidH8Pw8GQ1Tu/nc
   pAs0NkNCUi7iI11LKk3jHMCeL7CY4WLOd1lciOmKvcQvYXiKrWQ0CZnvG
   bucrrCRTSikGgAwPPMrnsPNIeNNtkQAhl/xEI9cNwalDwuXQCOVLUpCUV
   nINCMvn+v3a+OMH5DpWFmO1iLNk1XNPUSuZn2Bg6KTiDx2FMp7MW1DYuq
   n7zPv/5CwN3JPy7IFKeZhdbmXlAVFsN0PkL1+zycCF4H7lPp6xf9w7E9l
   ImOOerUZJtP6L4qlL/wmV2FVbVPva4Z/cbm3jSNEQkoJcyFi4AfUYeBi8
   w==;
X-CSE-ConnectionGUID: tS3EWkjOQt2m3Sjt5czvEA==
X-CSE-MsgGUID: phq4Zx2oSB6g5uO2MHmxcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25326725"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="25326725"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 21:13:48 -0700
X-CSE-ConnectionGUID: jil7VlvCQkKY4pFIc8vwIg==
X-CSE-MsgGUID: 66E6oMtlRzGku8KHZSzDlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="74064111"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Sep 2024 21:13:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqPax-000Ami-1G;
	Tue, 17 Sep 2024 04:13:43 +0000
Date: Tue, 17 Sep 2024 12:12:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 46/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB913
Message-ID: <202409171210.PgjJvSZf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   96b0ebd82722d16e9ab646cd3a73080e6f790747
commit: b18364151a13ff12dcf5655d4c13e734e824206c [46/107] media: i2c: add DS90UB913 driver
config: nios2-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB913-0-0 (https://download.01.org/0day-ci/archive/20240917/202409171210.PgjJvSZf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240917/202409171210.PgjJvSZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171210.PgjJvSZf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB913
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB913 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
