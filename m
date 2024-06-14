Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1DA1822F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718352889; cv=none; b=Yu1YOm77bsyszj+DeSQNr4JoEfaQLqjbxz16Ax7/nK6uDcNWO1m1864kyucXT0vOyeSuCgbCDnSei292Lf8t+2MV+IZFovNgmzCDLKWkhQ+X1culYmwCJl9HKDpD9ByTcSvgCNApsu+Cy2qOVHeMTYhPICR1rBnX5pFRAmHqyPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718352889; c=relaxed/simple;
	bh=9qLuFH8m0WnX0NhZ+LYYjtPGkV6EpnAfS3pI9O5uxMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KTpA8xEDLEAKv1FKb6FGsZq8XjUNFWJ9NNOggfE6HJqq38h4mPG/YMUwd3jD70/g+022P+3hoGH0xabG/djfIQF/HU9w+m/G73RY02ZP/PFdMV2SurG6CCS8FGkGar5cpd542FP+Rqt5jv2Ffhx8NSfbdMRA7YQgCTVBPcI0pT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ls6FWCv/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ls6FWCv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718352888; x=1749888888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9qLuFH8m0WnX0NhZ+LYYjtPGkV6EpnAfS3pI9O5uxMw=;
  b=ls6FWCv/pKKhV1lZYnI2yEOiicY/wcNjWJT14p10uzsvFlK/wM62Ihee
   ln1xYTwDIkJyD/+l+3bq1YSll7+GTRP+fYklaqN6fdEL+vgQtTjVkLDq+
   Cx46LLkU+DD53a//wb3afEAWS5krIFT4EcSk2HbA/Re1mq+9plT/D704n
   ajfX6VigBVz4WzGa1rD+o/3Kd5Gu2ndWm/zsNDcSZ3LncBwSdPuttxMq9
   Da/H3mLYjaEt6W7Af+bVz9m0ym5Qk9upOSLob8FUDn0MumiCNsFHUGIWo
   wP2d7MQLsZR9DsWuOiu7/hOfkke6m6gV9kSSYiqGdGBj0dPlXPeeWNU5E
   w==;
X-CSE-ConnectionGUID: tviqpPzVQxqPVZEWJGR3sg==
X-CSE-MsgGUID: c/gemmhLTR65gmp/138vqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15362069"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15362069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 01:14:47 -0700
X-CSE-ConnectionGUID: JcwZYfx3QeS1zPW4HqzclQ==
X-CSE-MsgGUID: m6Vu9FQ7SbKxvqBPDH3dlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="71201226"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2024 01:14:45 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI255-000116-0y;
	Fri, 14 Jun 2024 08:14:43 +0000
Date: Fri, 14 Jun 2024 16:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 84/91]
 arch/arm64/boot/dts/rockchip/overlays/odroidm1s/display_vu8s.dts:41.15-46.5:
 Warning (unit_address_vs_reg): /fragment@3/__overlay__: node has a reg or
 ranges property, but no unit name
Message-ID: <202406141527.ArSmEYQ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   a50c6922e2b4c1d7c895bde521d13096ba16a863
commit: b0ba08f75cf1fc43c19f57ea6930f3358bd2e196 [84/91] ODROID-M1S: dtb/dtbo: add new device tree for ODROID-Vu8S display
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240614/202406141527.ArSmEYQ1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141527.ArSmEYQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141527.ArSmEYQ1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1s/display_vu8s.dts:41.15-46.5: Warning (unit_address_vs_reg): /fragment@3/__overlay__: node has a reg or ranges property, but no unit name

vim +41 arch/arm64/boot/dts/rockchip/overlays/odroidm1s/display_vu8s.dts

     9	
    10	/{
    11		fragment@0 {
    12			target = <&backlight>;
    13	
    14			__overlay__ {
    15				status = "okay";
    16			};
    17		};
    18	
    19		fragment@1 {
    20			target = <&pwm4>;
    21	
    22			__overlay__ {
    23				status = "okay";
    24			};
    25		};
    26	
    27		fragment@2 {
    28			target = <&i2c2>;
    29	
    30			__overlay__ {
    31				status = "okay";
    32			};
    33		};
    34	
    35		fragment@3 {
    36			target = <&touchscreen>;
    37	
    38			#address-cells = <1>;
    39			#size-cells = <0>;
    40	
  > 41			__overlay__ {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
