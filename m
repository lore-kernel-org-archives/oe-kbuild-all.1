Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25425740
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717837171; cv=none; b=q76QL4wBYqft/sdj0KYUYUL29oEeIuS7skk87y+ovPP98LbjAKWAo5S+I95NxXngv9ey8f2stfScCHEv00gcHfAXt441Fvi6C7Jf39m7bRsI+Dfpmqlesd1T2CCHb5SM/tuD3j37uGdjNPuk4NGRdqZPscgiO7en7iQqsh8AL2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717837171; c=relaxed/simple;
	bh=bGlm2WuGGzIP/t19EvYAMI11rj06AIy45kYmYdp5bH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGLnKRhk+LsfW5qC+MphCD9aOeOWR+2ysQ9siT/8lNlG/XxFk/uDzuY5sLWV03nj8xZfOJXByVZtCJiE/Q4+nRokvn+65qsuMHR0DCYyI1lGSeMj9YsQNFhqRcQXNG4kbimAUDp66PMoqqib5nGTl8emjBnir0RPY0c5feV4xCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNPXfR+I; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNPXfR+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717837169; x=1749373169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bGlm2WuGGzIP/t19EvYAMI11rj06AIy45kYmYdp5bH8=;
  b=aNPXfR+ImWHLQ9SiHeUdl1wait43FJKauTY7F1E6JAxodab0SxrSBHnG
   hE5MExQXSIh8hffP/9ngOF9C4NRTe7HqhkmdD7kkReOaUphCigG0fD7rv
   rN0vSnxn1wDgF6+E9L/2s0Kce6aifQSvIOl08rgcdT9VcW+p/K2E0QNk6
   YdB5SxF63wcUPlPpFaWzfut1pNslsCKP0RYDgtzxpLzszG8IqPEAas9JU
   sZIkHiAXv4lCdkrQmhuBFtYtw0/tg06zpWG1ABQaoloJyZ+rcR6q1obHf
   +x+d9n9QX08bW2Vt8+4aJBo3VFalCsQ1M2fp4gahgZA9L4R+q4CvN2am9
   Q==;
X-CSE-ConnectionGUID: AH6VOr42Q6apOp5dCdu1rQ==
X-CSE-MsgGUID: zZ2BkiYMTeammtLQZwuGig==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14405582"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14405582"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 01:59:28 -0700
X-CSE-ConnectionGUID: A4DqGbzIRvOTDP6dDVp9wg==
X-CSE-MsgGUID: OzVzuxWhReuIE7VLUtCX/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="42999365"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2024 01:59:27 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFrv2-0001LS-2i;
	Sat, 08 Jun 2024 08:59:24 +0000
Date: Sat, 8 Jun 2024 16:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: switch I2C2 to
 i2c-gpio
Message-ID: <202406081606.P8q8ACWW-lkp@intel.com>
References: <20240604-rb12-i2c2g-pio-v1-2-f323907179d9@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604-rb12-i2c2g-pio-v1-2-f323907179d9@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0e1980c40b6edfa68b6acf926bab22448a6e40c9]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/arm64-dts-qcom-qrb2210-rb1-switch-I2C2-to-i2c-gpio/20240604-181644
base:   0e1980c40b6edfa68b6acf926bab22448a6e40c9
patch link:    https://lore.kernel.org/r/20240604-rb12-i2c2g-pio-v1-2-f323907179d9%40linaro.org
patch subject: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: switch I2C2 to i2c-gpio
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce: (https://download.01.org/0day-ci/archive/20240608/202406081606.P8q8ACWW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081606.P8q8ACWW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1919.27-1989.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/qcom/qrb4210-rb2.dts:248.12-251.3
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1877.11-1887.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: /: i2c2-gpio: {'compatible': ['i2c-gpio'], 'sda-gpios': [[43, 6, 0]], 'scl-gpios': [[43, 7, 0]], '#address-cells': [[1]], '#size-cells': [[0]], 'status': ['okay'], 'clock-frequency': [[400000]], 'hdmi-bridge@2b': {'compatible': ['lontium,lt9611uxc'], 'reg': [[43]], 'interrupts-extended': [[43, 46, 2]], 'reset-gpios': [[43, 41, 0]], 'vdd-supply': [[178]], 'vcc-supply': [[179]], 'pinctrl-0': [[180, 181]], 'pinctrl-names': ['default'], '#sound-dai-cells': [[1]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[182]], 'phandle': [[127]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint': [[183]], 'phandle': [[177]]}}}}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
