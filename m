Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CF21D6BD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717833392; cv=none; b=ByJqpuZALSUJQe9h7o+isPuL3rsrmPKwxiO9Z59ktSW2pgrDgpaq5mb+x3VpMZR4fYhXLs2Q05nN7LH+QyKxZQEwPwNmKSnJ7tSwg1eFOdTS/k8px7XH/0TTfLE2qtBeWZ1c6+ONRDyjMV6PGut8JzNfWkZ2LJppUcBv5t7BD8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717833392; c=relaxed/simple;
	bh=MxvILTLB/c9pcQMzuZwXp+aRcmXsT8hvCqo2/+L6K6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jt1fbbNb6SeFLd/x0iO245eXpmEFgnWW3i/eVAf+EEJwLnJee22JBy8rlzJLb8pHvw7GBHgKaUWzjmwBIrBBfQmaWkVykz8mpOckK/lqKgCgq8CO10EMzGeQotRAgijlyQ8GrIZWuimt3W0qi1ZXUiYb4jEW0l5zqM/dRPHAkvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/aR79P+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/aR79P+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717833390; x=1749369390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MxvILTLB/c9pcQMzuZwXp+aRcmXsT8hvCqo2/+L6K6I=;
  b=e/aR79P+SeMD/bfwf5CNLobwHE9mGyZXEl35GuzLCHCCZG87KwHdH0jO
   xnYSS+SuMfNArzUOos0J0qlxHj9a7BpC5zqED9PO/1uonCBJNQ6OtUp1l
   iEuDLimkiK4dkKw+55K0HZGN+3EbZucFpRCyygd4tuHEm6syUPNuZqixu
   LUHslvphQVwm6MM+cTGIFDGBjEO+0Gs1u1CYRxs2hRFD4GZZddyb5OeeJ
   AoPtPvAPPIaQFpEjOij5x5YvZAL7AjfXLhJgmeRqJJdM4nl8dwPBHoaj1
   AB8sQco+rL8u5ysF1v8HLGKp1CLyYfVS8a8IuZRvoL5W2UC8lNbM/0yn+
   g==;
X-CSE-ConnectionGUID: Vhyjt6JaSqunJTrcNFRMyg==
X-CSE-MsgGUID: 9oLSWtE4R52Q7bjfMEh6GA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14742994"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14742994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 00:56:25 -0700
X-CSE-ConnectionGUID: CmiG9uvqR6GF37NByUviMQ==
X-CSE-MsgGUID: NL4Jme6SRM+jwutgc6+/ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="42995449"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jun 2024 00:56:24 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFqw2-0001HW-0F;
	Sat, 08 Jun 2024 07:56:22 +0000
Date: Sat, 8 Jun 2024 15:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: switch I2C2 to
 i2c-gpio
Message-ID: <202406081515.QEfWiA9f-lkp@intel.com>
References: <20240604-rb12-i2c2g-pio-v1-1-f323907179d9@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604-rb12-i2c2g-pio-v1-1-f323907179d9@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0e1980c40b6edfa68b6acf926bab22448a6e40c9]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/arm64-dts-qcom-qrb2210-rb1-switch-I2C2-to-i2c-gpio/20240604-181644
base:   0e1980c40b6edfa68b6acf926bab22448a6e40c9
patch link:    https://lore.kernel.org/r/20240604-rb12-i2c2g-pio-v1-1-f323907179d9%40linaro.org
patch subject: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: switch I2C2 to i2c-gpio
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce: (https://download.01.org/0day-ci/archive/20240608/202406081515.QEfWiA9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081515.QEfWiA9f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1528.27-1601.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/qcom/qrb2210-rb1.dts:257.12-260.3
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1486.11-1496.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /: i2c2-gpio: {'compatible': ['i2c-gpio'], 'sda-gpios': [[25, 6, 0]], 'scl-gpios': [[25, 7, 0]], '#address-cells': [[1]], '#size-cells': [[0]], 'status': ['okay'], 'clock-frequency': [[400000]], 'hdmi-bridge@2b': {'compatible': ['lontium,lt9611uxc'], 'reg': [[43]], 'interrupts-extended': [[25, 46, 2]], 'reset-gpios': [[25, 41, 0]], 'vdd-supply': [[107]], 'vcc-supply': [[108]], 'pinctrl-0': [[109, 110]], 'pinctrl-names': ['default'], '#sound-dai-cells': [[1]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[111]], 'phandle': [[92]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint': [[112]], 'phandle': [[106]]}}}}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
