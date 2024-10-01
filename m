Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368091BF324
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727780293; cv=none; b=MconiMD1/R3YRnAP/N48FSmFH8jU9O2EPoCAwzc4l+lWxuJ9vHgVSPPjXlmSC3fmt0tJTVAP0dBQUzv9LWGHc8xS23x8O3vmvUXux9RdDoLqPGOfk0r2FhsbZBcrYyp/uOAdjx8iM4L7Lmsd9+yLFEoANcELHSh3zVUshJwY4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727780293; c=relaxed/simple;
	bh=+oY9QzmH6rNmdhvBoatUPDmvhaR7tZL9DOG9EelcrRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZqNjeqnHr/Q+Al4KtJgyiciKaVoxy6DP37Nte4UJNNY6j4S1efkkz6R05T3KVVVRYIQ2rRhy959xarKhJEOvZdD+FiPkzYv6i+MfJqBu20Glg0YusDIRRnvzw79dZLL+kmkqBcGdVXnDmNGoAZ1pktT9HFtlSrjj/JKPEmWS1lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJGU0bJm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJGU0bJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727780291; x=1759316291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+oY9QzmH6rNmdhvBoatUPDmvhaR7tZL9DOG9EelcrRk=;
  b=JJGU0bJm26f46U3pJuV4HVUwGbyKjEt1EgLwp7mw/gSZGkOiCh9xNT2Q
   gBhXuKiiH0Km2CNJreQu7YQd6hLK0k/A1pQJmEM32DmXvCQj1OYJ7Qnm3
   EnODXJpYuUO7q+i7WgwV5+DWBBn8WkR4W8O46b2lV6duGryFNhAqHiffe
   IIC2qjNZEqETmk3gRMM9c/lA+4Mvm2mUuqyizgKOL3LIRM34pZWA9F10V
   tnDiFu4sW3HP449oxF/KqYuGD1C/2azwXrlfxZB/CUc2Aq0F6hW0NekkG
   bjOLU+FyDU/brr0xExqB5CbJmzTjqwd5SLfZH2+PjnY4z4mGNbZCUyBpx
   g==;
X-CSE-ConnectionGUID: +Cv0XY4lSJ65Pk24W0SGVQ==
X-CSE-MsgGUID: rNBc3SqXRRyWdGLA4PK7tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37499720"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37499720"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 03:58:11 -0700
X-CSE-ConnectionGUID: T0zwpF2DSC2rDngt48OuTA==
X-CSE-MsgGUID: x2Tnev0CTYKqkeWxnyiVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73529241"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2024 03:58:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svaZy-000Qa1-26;
	Tue, 01 Oct 2024 10:58:06 +0000
Date: Tue, 1 Oct 2024 18:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 968/1347]
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb:
 /i2c@ff110000/audio-codec@1a: failed to match any schema with compatible:
 ['realtek,rt5651']
Message-ID: <202410011845.UiVJJtwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   77df9e4bb2224d8ffbddec04c333a9d7965dad6c
commit: 2f39bba3b4f037d6c3c9174eed5befcef1c79abb [968/1347] arm64: dts: rockchip: Fix rt5651 compatible value on rk3399-eaidk-610
config: arm64-randconfig-051-20241001 (https://download.01.org/0day-ci/archive/20241001/202410011845.UiVJJtwf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011845.UiVJJtwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011845.UiVJJtwf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:581.31-583.7: Warning (unit_address_vs_reg): /i2c@ff3d0000/typec-portc@22/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:906.7-913.4: Warning (graph_child_address): /usb@fe800000/usb@fe800000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:575.9-585.5: Warning (graph_child_address): /i2c@ff3d0000/typec-portc@22/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /i2c@ff110000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5651']
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: typec-portc@22: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000: usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
