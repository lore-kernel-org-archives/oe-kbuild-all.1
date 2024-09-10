Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1213192B62
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725976125; cv=none; b=HmISiclj1gAmaD8Oe6CzVN/tKJTVc/Kk98yNQorfjjxri76TAeg6zgKYc/SwUXa2kBtV0dgfqKShdAF7LiHuZWpuUtNG+1ji+T3Mk96uWV0vpfq4GkO4CAz+xrGKBm7s/XJ24OSNcg3K8L6Pyo5A3XUSZ1E6IFW21eUNfBVfWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725976125; c=relaxed/simple;
	bh=ejyNHpRrV23FW9/UExOlJSs0NVECBTXHBatWeVanJL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ri5SA1HtpFV4z73xGNLexCUv2+6m2oCZ5vCCthn7CSJk+wllQsBAF3xzQbRZzDHZGdLQ/TRnycRGADUbyfDLp2jkxIvygyA5zSqzoQ0qYdxFMBu67ue1EzVtIcXkbr2gu7yxUVPWutju8MVvAiWr0QOyyrqQ7rvAkKVe2xc90FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D232AQzY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D232AQzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725976124; x=1757512124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ejyNHpRrV23FW9/UExOlJSs0NVECBTXHBatWeVanJL0=;
  b=D232AQzYbi0GlnjRQpTDsi416nCnSCCDqR0uy4LobKGObGXcJ52Ur0CO
   yMwtm6BcuSj9uxzssHTlz+sqL8ZRYd4UuNMCBq53KD+aBStXziFsgHuSQ
   XkC+ckGbdKL2RJBkjrGfvprrVcHo2YZ19XLCIC8eArov46HzkpE9gMLYD
   1oTsm03BSswPaSowP37j5pv73blJy1qGVtejF5wsGO2zb+/sUThYE4VTJ
   3xt7HXkjxe3iojb7SG7oM8VhihcWjJE9Ysa+OAHj7X08tRg1TOwzwkDTF
   kvprlk2DU5amy+dlHFgggAVOnLT3yhjgmE3dT5nowQIDeuBUwsfCdHzod
   A==;
X-CSE-ConnectionGUID: qVUp4/RkREWcsLZu3AcOCQ==
X-CSE-MsgGUID: Irsbh0bWR/CTzgXpALqjBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24872516"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24872516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 06:48:43 -0700
X-CSE-ConnectionGUID: DMxK2+UFRYmSnGQN1VwAug==
X-CSE-MsgGUID: oB8oKaclQzik7tF8rmrd8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="67801685"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2024 06:48:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so1EV-00029Y-0M;
	Tue, 10 Sep 2024 13:48:39 +0000
Date: Tue, 10 Sep 2024 21:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [linux-next:master 6907/10862]
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000:
 power-domains: False schema does not allow [[55, 18]]
Message-ID: <202409102119.AYvaTjUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6708132e80a2ced620bde9b9c36e426183544a23
commit: 5474d49b2f79b41f2ab09b0deb9d97d47b18d094 [6907/10862] dt-bindings: display: mediatek: dpi: Add power domains
config: arm64-randconfig-051-20240909 (https://download.01.org/0day-ci/archive/20240910/202409102119.AYvaTjUi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409102119.AYvaTjUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409102119.AYvaTjUi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[55, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[54, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[54, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[54, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[42, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[42, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[44, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[43, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[47, 18]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
