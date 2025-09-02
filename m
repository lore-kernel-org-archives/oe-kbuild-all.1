Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3647C26B95B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804838; cv=none; b=D0vBXx89kKebplkNh6mVfGBKXqXs066+in9bPOV2ls4MadY546gIKcVO5GBvtXhxr73UPFl6ldRklnvXQL/I5tvhd2PlWD+yldHiJDN+SNKzolJh6nSD1S9AZ/KSspEJQIe9VMJIVWej4Pm2YqYZ25TfWwHaHtitieHpVOyhCco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804838; c=relaxed/simple;
	bh=ZXrmoO4A2YcY7kXtls0uYJWOwQHRzkdLmytuh25NCyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZ59/G2+rc6seNGBJwoVPLvR9B3iLqX2nl2x7oEQkhS2dYt/RaExx9Zpd6HW1+49z/pM5tBeVnGxD+bwwHLGN2UovaowC3v9Yis1IrrxNDEY9B4LMPCUCKpyiO0fBoON+JUZMG8/81+0JuxZJrp/I80LI9/hlruwybV6We/kFWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=emCAmN05; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="emCAmN05"
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 07DB6C6E;
	Tue,  2 Sep 2025 11:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756804765;
	bh=ZXrmoO4A2YcY7kXtls0uYJWOwQHRzkdLmytuh25NCyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emCAmN05MxRqhia0vPvdDMTl1eXkRMYf+yOAtqgBeHB2PF2JoZJKnzHvFLdvqKmlj
	 Y8BQ673hFNFzvKLrbjKWb0aacmpU2k6c54iJrisGVZ/SN1LPWtYaCOQgA1Ov6N1CSu
	 lCQOBpEns17lUJsanGWjrjJjYBlHOo9rGYpUbgZA=
Date: Tue, 2 Sep 2025 11:20:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [linux-next:master 4756/5291]
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
 isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too
 short
Message-ID: <20250902092012.GG13448@pendragon.ideasonboard.com>
References: <202509021101.Bz8COtDw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202509021101.Bz8COtDw-lkp@intel.com>

CC'ing Shawn.

On Tue, Sep 02, 2025 at 11:33:28AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   33bcf93b9a6b028758105680f8b538a31bc563cf
> commit: acfaba169385bfa243a10a027f8272a974b2288a [4756/5291] dt-bindings: media: rkisp1: Require pclk clock on i.MX8MP variant
> config: arm64-randconfig-052-20250831 (https://download.01.org/0day-ci/archive/20250902/202509021101.Bz8COtDw-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
> dtschema version: 2025.6.2.dev4+g8f79ddd
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021101.Bz8COtDw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509021101.Bz8COtDw-lkp@intel.com/

This is fixed by https://lore.kernel.org/all/20250616011115.19515-7-laurent.pinchart@ideasonboard.com/

Shawn, could you merge that one quickly if possible ?

Rob, how should I handle this next time to avoid breakages in -next ? As
far as I understand I can't merge .dts changes through the media tree,
is that a strict rule ?

> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
>    	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#

-- 
Regards,

Laurent Pinchart
