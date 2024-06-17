Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFF5D2FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 03:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718593481; cv=none; b=nkrTPivu6EAJx93BpHo7NhhUvILGoSWbJv1DAyETTMvGo/o7HPKnWz3W6ls+NwljnvrNNjykvdzSGe71rzs5PCwkOiB2YRTZCDyKjY/7pYNdwy6GikrBC/i4M6q9314oHrQW4BBvK2WU2MDUSwxgNoblVlR7CuWFzSLziL7Vwm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718593481; c=relaxed/simple;
	bh=YDqR1tv9GqhYUESitLUfjWyx932rq9VDlOrSP4EitdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IqgUKZJ875gafhsYVey+XrhuFWPr4ggqu9jzw39VvD21ePyd/x33fSgDp7MkJvAOEaAcCljTdGRDznOl1qIY+wl0AKYXFEq5qYevW2ijFvtQChN4xWdZnCF0hfRb8MTIrJuq4kIeiwK1nlMSwI72proOfV6meFEpwCMokf453wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emE9Qxap; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emE9Qxap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718593480; x=1750129480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YDqR1tv9GqhYUESitLUfjWyx932rq9VDlOrSP4EitdQ=;
  b=emE9QxapNK7ryFyUj0uDvR6KdzNYxOF/9VSN6w0z6dyyyk1wSHg0vtgN
   YS2QIP4hKRXqtG5aZe9Z6TW3f6cfyzU7E96d2WAylW+h1W8+kLovOvTn0
   s3JmXpPgFUmSTpn9vgC9jzTAT9WIRYsCTCOKWKgxH9t1bqX1E1VEVRZ5j
   fAEo1PbIwewysP5aJ7uew46u4aGcNZAz0HiQEe/QhyDcyO3agNBUmZwmc
   kyY7LLp4a2DIDTDoE7EOxH7Ww4lKDisO0XCdSnaTHMJzc7zvkhCMer7MQ
   V81sxFo531/yzoBRYwRmo0XFxDlRyhhCe4JQBmidxGRAkxxoIIvRoFzwL
   Q==;
X-CSE-ConnectionGUID: x2DwGPe6RGKJnA/EPi2PWw==
X-CSE-MsgGUID: 4kQISRN1T+OOhJ/VR34R0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15244936"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15244936"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 20:04:39 -0700
X-CSE-ConnectionGUID: 6KYcv4YoQSKwAHY+Rkxe2g==
X-CSE-MsgGUID: /c/N0SH/Sk6A4BZW7pF3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="45606960"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2024 20:04:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ2fb-0003hm-1t;
	Mon, 17 Jun 2024 03:04:35 +0000
Date: Mon, 17 Jun 2024 11:04:05 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [shawnguo:imx/dt64 27/42]
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: hdmi@32fd8000:
 Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
Message-ID: <202406171104.SmweUTX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   152f7a9908b11ff55f3feb357a5f6ff84f90e69b
commit: 11af40dc13f328c76648e16b8c8a6902b35bbd8c [27/42] arm64: dts: imx8mp: Enable HDMI on i.MX8MP DHCOM PDK2 and PDK3
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171104.SmweUTX3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171104.SmweUTX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171104.SmweUTX3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:261.9-273.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:261.9-273.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: typec@3d: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/extcon/extcon-ptn5150.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
