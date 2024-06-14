Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3D19441
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 17:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718385497; cv=none; b=hB4MwuoN4H3njm6C7mc1+VWn+sD18EvNRAP6FIjQpor+kBOurJ3k0HsO3D20sb/QtyuvXJjNNDT0TOofRWuIBSyi0zHBH4EEzRb/cfsrII4wAtn5gmT07AiOHWcFrnHvXzipnYdMgCMJiFLthVBRI0pKLukdaTqTcko25VDGzkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718385497; c=relaxed/simple;
	bh=vG7PK13018hdmq6zZfMdkQhCJHbLjezTicri++zSxFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KQSjt2xtXdowwnzvA8Qk/aKIuyxexP7aX6wvsBHKajSyczf4CSJStf9h41xM4SdIKsJ0jRzSk+6nSc3iXKUFq23tKjazHrhs3BIVlDgswgeBNo1TABKAox087dCIqVpCPkOF57Nq/ccdPfYq/6XopYerrfqnuYfogRXfb53i8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ivc92+FE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ivc92+FE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718385495; x=1749921495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vG7PK13018hdmq6zZfMdkQhCJHbLjezTicri++zSxFM=;
  b=Ivc92+FEb2DCmnT7Ru/yEtBePPeMgXwpAPFoT2bUrhiQx3VP85I1g3yh
   BHFG0xgmxzdmkzwTJ8+63NUeT/xNUeJCPk3wNYn6puEyKzJFORTziw/d8
   EyspQIbBy230vQv8wkmUvESvwhKZdiNhdgVoOZ+LbuDvia/ZnxbF68xmH
   BGwnOWPyi42D/oq772GHGN5BS+xtbKeneixcUS2UWKaG/J/1OdBaXwbtt
   9qg6fq4BlhLgqgVH8pmjCl1VzDfKHArQRnNW9yXI+L2vEHTRs9vhXOpKR
   WH57Q2OD+DB/Dmtf7nG1goMZAM3RLjhAUCR2fbdcO5TkSOn5dCNNcIbKA
   A==;
X-CSE-ConnectionGUID: p+2hxBxnS9m+xPQ2j4j8NA==
X-CSE-MsgGUID: GikCxL2DRlyGFysaOkIhVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15417610"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15417610"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 10:18:13 -0700
X-CSE-ConnectionGUID: 4ATIZFCPQhSu2zdL35pYJA==
X-CSE-MsgGUID: qmh8xFJQRZOhr+Zq161QMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40418149"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jun 2024 10:18:12 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIAZ0-0001Zh-1M;
	Fri, 14 Jun 2024 17:18:10 +0000
Date: Sat, 15 Jun 2024 01:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 84/91]
 arch/arm64/boot/dts/rockchip/overlays/odroidm1s/display_vu8s.dts:41.15-46.5:
 Warning (unit_address_vs_reg): /fragment@3/__overlay__: node has a reg or
 ranges property, but no unit name
Message-ID: <202406150149.FrWTYvNV-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240615/202406150149.FrWTYvNV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150149.FrWTYvNV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150149.FrWTYvNV-lkp@intel.com/

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
