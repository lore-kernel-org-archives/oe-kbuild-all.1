Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA881F5428
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 05:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739338505; cv=none; b=Yq5kNx1Odq4VEOdwKkWcT2pNhrBof0YZdb8aXNGeIp5NIU4Hhc7Xx2NeDVbpeCpqif+rCLc7TmbDgILA32TD4UKtc0MPab9NqW4P4sdpwlEZKWV+91u5dZOhQkUx9HYvtTHCFJ5SxTJ9GprrgnPOvIZSjaTEg01owtemZKGESKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739338505; c=relaxed/simple;
	bh=7/i1lwIAfBMlVCaj8vLL2hpOkrv44+T6BM1i42+DrBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ruKh5qSzc5QYLtnHDfOiXiSQQGewL9DVNBgrzIB+ZgATGqWMlj0+xsm8MecLzKH5v8eS90ypumCt5tGsFEor6vTd+u1jd9b0FmsUe/VeXgZSHBw8wjN+C9NomDsSN3qG700Yo1vGxQfmanrEkgqWS4c7qck1N18z/430tDhVVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZU7r2j9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZU7r2j9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739338502; x=1770874502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/i1lwIAfBMlVCaj8vLL2hpOkrv44+T6BM1i42+DrBo=;
  b=lZU7r2j9wgG7Rr90P2fnwA8N7aXjLqISA4mPmWDkXKV/ipZ8fuzfJQT7
   d41uC0nkU/HeSg3ye6n+IzBQ6QtPdCoKarZvjPfZuqRy30wQ1v4v4/BzT
   DvZLTJ4W/B840NnBxNN8Anyv8rMsF1cflq0ta5QGDybTbwm0Sl+e0Gc3u
   aIX2ingTt0J/ijuyosyBZIYB6NwJHZAh4v5SbJw2Tfknd47Xr9VYgerpl
   +O3OemPnZgbYoixhbCUMXO3p9zH2CowCQVV0mSGpC0m9DKfvsRXj5hnF6
   tEXpN7cHU11enjDACaWfMljsa4BfBDxsGxuYFOJKcQIACyJqwFUyH6Nm5
   Q==;
X-CSE-ConnectionGUID: w/UB2TVJTT+QLasJDmctUA==
X-CSE-MsgGUID: 5NUfmbuyS9CYIA06AO1olA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="65336263"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="65336263"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 21:35:01 -0800
X-CSE-ConnectionGUID: laM4wPDETEeMtkYw1A6svA==
X-CSE-MsgGUID: /6AhfV5UQh+GAVvmrToiWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135985860"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2025 21:35:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti5Ok-0015AR-2V;
	Wed, 12 Feb 2025 05:34:58 +0000
Date: Wed, 12 Feb 2025 13:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 5/5]
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: wifi@0: 'vddrfa1p8-supply' does
 not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502121316.TxXENhuC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   7b6df7ad6ccb2c1f0d82abb3ea088c9684cc7545
commit: e848528bdfc2a933590498c326d3320d85078c93 [5/5] arm64: dts: qcom: sc8280xp-crd: model the PMU of the on-board wcn6855
config: arm64-randconfig-051-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121316.TxXENhuC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121316.TxXENhuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121316.TxXENhuC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: wifi@0: 'vddrfa1p8-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: wcn6855-pmu: 'vddpmucx-supply', 'vddpmumx-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
