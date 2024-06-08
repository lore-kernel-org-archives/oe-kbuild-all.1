Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DEB1386C6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717849123; cv=none; b=mjZ4TjindtOAA0mey1k8Khrflnhs+mCTorfyOomqrj0JjyGkL7d9dKr6q+0B+XkIfwedl9gBGa3WGMB4SkQrPTZ1AA8ah9UGQRY2+gbawSYXifjBOhI7eSKiXjCn1SjhtUN2U1hx/ktSfcx9x0ggUHz8fWAMVOYZXLkWTWrT8GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717849123; c=relaxed/simple;
	bh=6ehIePUyXK/oDCmy9u0jQHGJM7TVyOSK66aU5f8sWH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0QFFHEDDN+pu58euO4h4+lWEdQOOG5GajK4unWJ8lKfgfty+a/WhqL0l2HwifMfKNPZyo5TxxZBBhSInBHYHOajCiLNoQfSMYKgHWALU7PTS+xpfFCO7qadCT4WoDCVY/uGznm1VY45qImYkdtzf8QW3Nl9JrbCLFBu9WI7ZVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkathMvh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkathMvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717849121; x=1749385121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ehIePUyXK/oDCmy9u0jQHGJM7TVyOSK66aU5f8sWH4=;
  b=SkathMvh5Zr1jOHSJcpW4/83D2e6LoNb38wwtXOo2/AOdqkb6Cgt5vVb
   JEBNPGeVrE+dfKEO8hQRJHaFs+rsxamNOUw5J14AJCOF+UWG9LxFE6vis
   0FZxk/TIovKKDOwZ7ukUzIiKUGBBjXw12JglQHUzgqrXUlUdGs41KSO8g
   jlvMjbvGynz55/CBH66XSJ8Ln3sUg2T/aWyEPkqAZWLku01G01Su4p+D1
   3mCqRvP9N/TUSwD8peyiQYnARyZj3SxshK51NCgMXdnFD9oo8zyB18W+j
   r5STHcWIb/O+ebaZsEjKHiNn9Ep57Z1rtfNpj564psax7xQz515/PE140
   A==;
X-CSE-ConnectionGUID: Ouumy/S+T2CfYTKzvXc5IA==
X-CSE-MsgGUID: yDU8MRt4Tr6V9wPBkuvTBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18357918"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="18357918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 05:18:41 -0700
X-CSE-ConnectionGUID: P/27zTV7QSWtpX/1HC7Npg==
X-CSE-MsgGUID: YJ6G4x4USU6cbOG5jHhHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="43712969"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jun 2024 05:18:38 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFv1n-0001YQ-1E;
	Sat, 08 Jun 2024 12:18:35 +0000
Date: Sat, 8 Jun 2024 20:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Bocharov <adeep@lexina.in>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: meson-axg: add support for JetHome
 JetHub D2 (j200)
Message-ID: <202406082025.lTEnYgrR-lkp@intel.com>
References: <20240607145148.2246990-3-adeep@lexina.in>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607145148.2246990-3-adeep@lexina.in>

Hi Viacheslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 32f88d65f01bf6f45476d7edbe675e44fb9e1d58]

url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Bocharov/dt-bindings-arm-amlogic-add-binding-for-JetHome-JetHub-D2/20240607-225905
base:   32f88d65f01bf6f45476d7edbe675e44fb9e1d58
patch link:    https://lore.kernel.org/r/20240607145148.2246990-3-adeep%40lexina.in
patch subject: [PATCH v1 2/2] arm64: dts: meson-axg: add support for JetHome JetHub D2 (j200)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce: (https://download.01.org/0day-ci/archive/20240608/202406082025.lTEnYgrR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406082025.lTEnYgrR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
