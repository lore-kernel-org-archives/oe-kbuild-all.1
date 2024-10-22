Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E39C158DAC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729588164; cv=none; b=rR2toFrlszmexkjBl5O7R8Uqp5TORS32C85Ame3blsANwqiaWA99QiD8mW12qwxrMk4PAp/iqBUKDtPQs3bfKVpOTxVq6/1aFk0t0gHNbpZn6bPOF5cNvWjx9DVShoLH5LtyP5jTTrP4m6vUQG0azn0zst3MXA/LHyZZQOyTAT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729588164; c=relaxed/simple;
	bh=1nV6HF2pnjxCw8PHd/o2089tWcV0CMkkJpSWJvVt2g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMTOMhMD+IweDz43XcRrtnrrkELOTtmG4yi8gngOZXQPjIefeDnGhRCtY5eh9q0hqpi46jkAFcjbPPTcG3j3ICaTqakSu36MbuvMFlJ9L6IP+YaHkkLdfP52BxJ1Qlu9vd4+pLYYeRmWTXEIIqjENoedh7Nbq41G/ivRfc9O5bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=jAKciuGF; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="jAKciuGF"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1F2B41F92C;
	Tue, 22 Oct 2024 11:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1729588159;
	bh=/oFOcSQ7VXXRHgCbTmfLYmU9DYujrbyLguV17IB9J7w=; h=From:To:Subject;
	b=jAKciuGFFZCcyMzhQLDQ/LfE5Ee7E/9bNJWxevFoJxnva3QuMbCKzdHRLiqAokVC4
	 +rVCdX3B5d0ukBv3QCOO72Y+dUgbG/0TtvXpVnhpTBSWOSquXP3bSOJgPgUSbvmNkR
	 llCv037jxp2XQZ2MHwIyCRAi+FLwCMErCQibBglQfbgE3TAs7JAYeKSt4NDdYd1qCQ
	 +aC36ZgTxv0FBRmzHIELyrP9NuwDWNEMl+IRNU6iVoWTALXJRLcGNBqjsJ1Glme8VT
	 Co5V/dJQ7sS1xiAo9TRlT5LLWHwzOwnzvSgtWmMtRYg2CX2rsM6ZpMe8XI2j5OouXi
	 XnjxkJX6ueDug==
Date: Tue, 22 Oct 2024 11:09:14 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: kernel test robot <lkp@intel.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [linux-next:master 5228/5686]
 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds:
 compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05',
 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2',
 'hydis,hv070wx2-1e0', 'tbs,a711-pa...
Message-ID: <20241022090914.GA22546@francesco-nb>
References: <202410190235.VogdBzI8-lkp@intel.com>
 <ZxdiZ2yjsfbnRN0v@dragon>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxdiZ2yjsfbnRN0v@dragon>

On Tue, Oct 22, 2024 at 04:29:27PM +0800, Shawn Guo wrote:
> On Sat, Oct 19, 2024 at 02:45:02AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
> > commit: adca46171ff7b3613cd7975f81870ae9025a34cf [5228/5686] arm64: dts: freescale: imx8mm-verdin: Add Ivy carrier board
> > config: arm64-randconfig-052-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/config)
> > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
> > dtschema version: 2024.10.dev6+g12c3cd5
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410190235.VogdBzI8-lkp@intel.com/
> > 
> > dtcheck warnings: (new ones prefixed by >>)
> >    	'tq,imx6dl-tqma6dl-b' was expected
> >    	'phytec,imx6ul-pcl063' was expected
> >    	'phytec,imx6ull-pcl063' was expected
> >    	'fsl,imx6ulz' was expected
> >    	'avnet,sm2s-imx8mp' was expected
> >    	'toradex,verdin-imx8mp' was expected
> >    	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
> >    	'fsl,vf500' was expected
> >    	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
> >    arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-nonwifi-ivy', 'toradex,verdin-imx8mm-nonwifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
> > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
> >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
> >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > --
> >    	'tq,imx6dl-tqma6dl-b' was expected
> >    	'phytec,imx6ul-pcl063' was expected
> >    	'phytec,imx6ull-pcl063' was expected
> >    	'fsl,imx6ulz' was expected
> >    	'avnet,sm2s-imx8mp' was expected
> >    	'toradex,verdin-imx8mp' was expected
> >    	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
> >    	'fsl,vf500' was expected
> >    	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
> >    arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-wifi-ivy', 'toradex,verdin-imx8mm-wifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
> > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
> >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
> >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> 
> João,
> 
> Could you check these issues?

The issue is not about Ivy, but about the SOM dtsi that it includes.
No immediate solution, discussion in progress here
https://lore.kernel.org/all/ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810/

Francesco


