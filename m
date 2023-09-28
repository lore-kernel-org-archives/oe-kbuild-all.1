Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9734C853
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 15:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695913570; x=1727449570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=82qSmG45u85QY9VwTRRFaJd3r/P+NKsvrvyVwpqtbJo=;
  b=HQRWpq7oUMFmsYJO3r8uEvGBzvHxWZXLsk7HTWg89tywyXu0IQPHlJPa
   2gXjQh6k1vtUGf59K38G5W/Tn38G4KfzT1ILUShrFBgVwD+0+uOILQUsw
   12LQBEbmfJXZ3Cown2R2gvz1l2KSaAWHu7Wfkz/KqGCLTT/HUc0YOJdc/
   630B/bjYl/cIan+2gq322WTySJxDL4+2fJ8E/Z5O2Q6ahvRxvbEUNeyrM
   vITDnpusJamdzBBGx9dBbz6zm6sbCZMMjXCzX6Qrvcypz5IWYh/E9hdPc
   oivWMzuKnymqarVZnPS8OZ8CuWzds6lAMEkQwY7bbaTKcDwdid3/AxwAB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446235864"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="446235864"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 08:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873321351"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="873321351"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Sep 2023 08:06:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlsaV-0001aI-1t;
	Thu, 28 Sep 2023 15:05:59 +0000
Date: Thu, 28 Sep 2023 23:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: add Amlogic C3 peripherals clock
 controller bindings
Message-ID: <202309282224.aGUP85Fs-lkp@intel.com>
References: <20230928063448.3544464-3-xianwei.zhao@amlogic.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928063448.3544464-3-xianwei.zhao@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao/dt-bindings-clock-add-Amlogic-C3-PLL-clock-controller-bindings/20230928-143707
base:   57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239
patch link:    https://lore.kernel.org/r/20230928063448.3544464-3-xianwei.zhao%40amlogic.com
patch subject: [PATCH 2/4] dt-bindings: clock: add Amlogic C3 peripherals clock controller bindings
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309282224.aGUP85Fs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309282224.aGUP85Fs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:2:1: [error] missing document start "---" (document-start)
>> Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:50:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:4:1: but found another document
>> Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
   	[{'description': 'input oscillator (usually at 24MHz)'}, {'description': 'input fixed pll'}, {'description': 'input fixed pll div2'}, {'description': 'input fixed pll div2p5'}, {'description': 'input fixed pll div3'}, {'description': 'input fixed pll div4'}, {'description': 'input fixed pll div5'}, {'description': 'input fixed pll div7'}, {'description': 'input gp0 pll'}, {'description': 'input hifi pll'}] is too long
   	[{'description': 'input oscillator (usually at 24MHz)'}, {'description': 'input fixed pll'}, {'description': 'input fixed pll div2'}, {'description': 'input fixed pll div2p5'}, {'description': 'input fixed pll div3'}, {'description': 'input fixed pll div4'}, {'description': 'input fixed pll div5'}, {'description': 'input fixed pll div7'}, {'description': 'input gp0 pll'}, {'description': 'input hifi pll'}] is too short
   	False schema does not allow 10
   	1 was expected
   	10 is greater than the maximum of 2
   	10 is greater than the maximum of 3
   	10 is greater than the maximum of 4
   	10 is greater than the maximum of 5
   	10 is greater than the maximum of 6
   	10 is greater than the maximum of 7
   	10 is greater than the maximum of 8
   	10 is greater than the maximum of 9
   	hint: "minItems" is only needed if less than the "items" list length
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>> Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
   	[{'const': 'xtal'}, {'const': 'fixed_pll'}, {'const': 'fclk_div2'}, {'const': 'fclk_div2p5'}, {'const': 'fclk_div3'}, {'const': 'fclk_div4'}, {'const': 'fclk_div5'}, {'const': 'fclk_div7'}, {'const': 'gp0_pll'}, {'const': 'hifi_pll'}] is too long
   	[{'const': 'xtal'}, {'const': 'fixed_pll'}, {'const': 'fclk_div2'}, {'const': 'fclk_div2p5'}, {'const': 'fclk_div3'}, {'const': 'fclk_div4'}, {'const': 'fclk_div5'}, {'const': 'fclk_div7'}, {'const': 'gp0_pll'}, {'const': 'hifi_pll'}] is too short
   	False schema does not allow 10
   	1 was expected
   	10 is greater than the maximum of 2
   	10 is greater than the maximum of 3
   	10 is greater than the maximum of 4
   	10 is greater than the maximum of 5
   	10 is greater than the maximum of 6
   	10 is greater than the maximum of 7
--
>> Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
