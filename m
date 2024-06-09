Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4AC405E6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717935851; cv=none; b=nW9lsSU1KI/0wKkx4roo4sFIN3w7Mjik4XJd56aI9GteVkmoa9bx0a4S2QdysalyqTDVHB8lYNi1tQJtCCuHipN5mmFJLazVn3lE7CNkNIUsOQIgVwel7MWbcCZhVlAv9GfeNXODpNuf/hj9Td8dqFVCd2DT6H5TMqZt5zv2Pm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717935851; c=relaxed/simple;
	bh=uqlx1eyH5xmQYKgtrMFKzY6KFZgQ7/1zSIW1mbREKZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dLz1sJ5CWKjHzZECXC+ROFwqLH2I4Hoh+GUFlO1bB9+b4Cery7v+Qp7B8/8vMl/Bu45s5G6vDF14Src1mjbG0LeiayeSkaRYnqhIO12AShix3xZbLECtd/2xIp5EYXGQDl4HrICY/8uynL3ktuHe8qxq/znOmIrfCz4RsEBShUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuAwZW3V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuAwZW3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717935849; x=1749471849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uqlx1eyH5xmQYKgtrMFKzY6KFZgQ7/1zSIW1mbREKZ4=;
  b=JuAwZW3Va1VeZgYq/ZHl4hSrPZpnWiRHcIjeEEgGLBQSSCQYZWqoSJne
   I9YyRjY0wojaUOb2degS6fS/ap0jcUTOmT820dVzNvbrBQYFuFn4wsFFo
   FbA00vEDqShLVsxKT7HNRll06+lwhVL/YtbPC7+pF7Yxg0mRkFx4AXr5c
   v+u92Yr24BUYxtIR/w0DiENdYA+Yq54L2crWYkEYHdjgVKc0yHXh1aLT2
   5GEZPNwocMyuCfKVmf+VN2EA0jx9mBnGbU2KtwZaRQAdY1ttxu/HAGAu0
   bMutUmJh596JMPHI08bRv2XyLbinnPCH0KZ/0xsJGfWXyn/aVtYJPNmin
   w==;
X-CSE-ConnectionGUID: OUiWbAigTpqA439esG7pzw==
X-CSE-MsgGUID: YC1dDnNbThuwQgNJX2F6Bg==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="25262822"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="25262822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 05:24:09 -0700
X-CSE-ConnectionGUID: P9req6uaQsq8544yQckhSQ==
X-CSE-MsgGUID: hSOwOV9KRZiCyHGbLvhoRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="43727104"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2024 05:24:08 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGHaf-0001By-15;
	Sun, 09 Jun 2024 12:24:05 +0000
Date: Sun, 9 Jun 2024 20:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amlogic:v6.11/arm64-dt 16/18] dtbs_check:
 arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: mmc@10000: Unevaluated
 properties are not allowed ('power-domains' was unexpected)
Message-ID: <202406092013.soNc9rAK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.11/arm64-dt
head:   e822ce43968daf9da4368617d2c948c22ccf93f9
commit: ea99706a438f19cf352242ffabab46bbc76a03d3 [16/18] arm64: dts: amlogic: a1: use correct node name for mmc controller
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092013.soNc9rAK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406092013.soNc9rAK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: efuse: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/amlogic,meson-gxbb-efuse.yaml#
   arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: spi@fd000400: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/amlogic,a1-spifc.yaml#
   arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: adc@2c00: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/amlogic,meson-saradc.yaml#
   arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: phy@4000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/amlogic,g12a-usb2-phy.yaml#
   arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: rng@5118: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rng/amlogic,meson-rng.yaml#
>> arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: mmc@10000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/amlogic,meson-gx-mmc.yaml#
   arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: usb@fe004400: 'reset-name' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/amlogic,meson-g12a-usb-ctrl.yaml#
   arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: thermal-zones: 'soc_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
