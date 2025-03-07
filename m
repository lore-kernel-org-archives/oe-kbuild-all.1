Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EE5183CB0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741379610; cv=none; b=T8U4nK1b1IXYrUyMzHddIiT0Sqks0JdLLBDXRLkgGS0z4Ji0nUHzgJLYQaER0QOVffb0GU8vGKoTxRvpJImnpN4OQqrZZBTk8d4+n/SVl2kX1y9iSMq9saMHkwjM/cC6v7r9XMbu9UeJX9MLGS5gYdchQmowA5fQDYjOMKn0teg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741379610; c=relaxed/simple;
	bh=tS7JJb396GejuAUockN4t0fcxkRJdES3/ko4rFyBeYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KfuOKiqaBvMvRYMT7lqsth5AVLAN7ET/XOfGPQTI+xUvunfEU2ecSUcc3nQBnrqafS7+SNlIJpI8ZhHwpvXPnqfVcns6iIGzDXE9vE6Kk8rJzLY0MlNPYLyH8S6Nh1blEWbx8vd5LJFCPwsVlRD00NE1Ko3/+23RUgNNdWD4WBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1HbB1w6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1HbB1w6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741379608; x=1772915608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tS7JJb396GejuAUockN4t0fcxkRJdES3/ko4rFyBeYQ=;
  b=j1HbB1w6G7dNW5yMwRhCQbx71IPz5ScPdlKa8Pl1lNR4jnYi9MyG3w3E
   pD3Cd3tAMHf5c4qXQlTQAcn/LvbTtv418yEhC1DQnk/LFiPeALpLi7kP4
   wM66cz6NtVaVV1mK2lYZa32MS3agWbONXQ+Ze3WPp+LFYZC2vx0su4BU7
   +Sd6OqmLAKbrs1iU4HNTp6h6UPXtW6AcxsOR4XOVD+wsgQ9sLiLBzuKBN
   mW4T48IiWVhZyvDFRWI/aVdLUXdZF3w1yLaTj5bwtav4UYQ2BCi+fhTFI
   ZROqXnJDowp1biYas7tT3dTmS5Jr4UZjCXnd1VL5P6mV8REsZ3a2CNp27
   Q==;
X-CSE-ConnectionGUID: 5B4t6xy8R7qygPqMVZkz4Q==
X-CSE-MsgGUID: ThS9OWILSl2XA4slV2PeYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="53837023"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="53837023"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 12:33:27 -0800
X-CSE-ConnectionGUID: UOdet5zfSV6aheLaxPAsEg==
X-CSE-MsgGUID: L2YGpN0OQo64Ma3N8aQZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156638136"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2025 12:33:26 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqeNo-00011f-0C;
	Fri, 07 Mar 2025 20:33:24 +0000
Date: Sat, 8 Mar 2025 04:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Subject: [linux-next:master 8082/9634]
 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb:
 pinctrl@f4000: 'cam0-reset-pins-default', 'cam1-reset-pins-default',
 'cam2-reset-pins-default', 'cam3-reset-pins-default' do not match any of the
 regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0...
Message-ID: <202503080456.KtfrLdjI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 938806652b0a3c90d67e7137c91708d06940b03d [8082/9634] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640
config: arm64-randconfig-051-20250306 (https://download.01.org/0day-ci/archive/20250308/202503080456.KtfrLdjI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080456.KtfrLdjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080456.KtfrLdjI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: pinctrl@f4000: 'cam0-reset-pins-default', 'cam1-reset-pins-default', 'cam2-reset-pins-default', 'cam3-reset-pins-default' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: i2c-mux@70: Unevaluated properties are not allowed ('i2c-alias-pool' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: i2c-mux@71: Unevaluated properties are not allowed ('i2c-alias-pool' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
