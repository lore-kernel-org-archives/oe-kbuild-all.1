Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D76619923F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729591073; cv=none; b=sI9Nxovy/YAMEzrJLwnrLCdf9E3ds0j0ETyCNHDuRFTDYDw049i1SNSSibA0VMoZgQ+gfwYlrUpwZUBqzfKOqrl7YE656RGSSlL3izXF9gUeYuatUBUzttVjVNmiwcguDZ9Oy4pertj7gVpKPu3J9G19WaPYeI6pxu8rAKrVza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729591073; c=relaxed/simple;
	bh=lnKC0iyWoK8WM0S55jNxcARkXPZj6DM0Z1tQ/QFG7UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxEAeIHpszlhaTfyUkLYI0Fv39+MDrk7t+Uj6ss1TF1+x+ILO77OcsRK+HdZ/NcR84jWEY8wpLpF41EL9RH3XtrhzxUn93wRPSuvtVJ85taGfEMAKWyxhVMKjqArHAzibOlPntBPc/P88BsQd+Gac4NI2C2yR/3fiSfHQJKCagM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=KEOTdZ6r; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="KEOTdZ6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PiQwwo3QC650xtZerPO7QVSjWBs6Kid9EtjHarNxlQs=;
	b=KEOTdZ6rzOgmjFVuJgWTi5FcKmYzFsqKqZSX9OnQ7zSRLoZ3YNKLw/AFodyIiY
	qPP5ycYFkGgahPOiejybvOK0iLYwj34GjsWLbignKmLIkooxFEqBFugXodP2xu3O
	FX0CrcENELio/DeKV6LHvJCwixFhIsUQsHJhKJW9Vwuds=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB310P9dhdnGLmcAA--.5752S3;
	Tue, 22 Oct 2024 17:57:19 +0800 (CST)
Date: Tue, 22 Oct 2024 17:57:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: kernel test robot <lkp@intel.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [linux-next:master 5228/5686]
 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds:
 compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05',
 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2',
 'hydis,hv070wx2-1e0', 'tbs,a711-pa...
Message-ID: <Zxd2/awbBYI5Grh0@dragon>
References: <202410190235.VogdBzI8-lkp@intel.com>
 <ZxdiZ2yjsfbnRN0v@dragon>
 <20241022090914.GA22546@francesco-nb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241022090914.GA22546@francesco-nb>
X-CM-TRANSID:Ms8vCgB310P9dhdnGLmcAA--.5752S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw45WFWDur4kArWrurWUCFg_yoWrZr17pF
	yxtFyUXF4SqF1xurW7K3Z7CFsxtw4SqrnavFn8Gry2ka43uFy3K3WfKr45W3W2krn5u3WS
	9F4xXryxuw1rZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVv38UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQyAZWcXUTBx4QAAs5

On Tue, Oct 22, 2024 at 11:09:14AM +0200, Francesco Dolcini wrote:
> On Tue, Oct 22, 2024 at 04:29:27PM +0800, Shawn Guo wrote:
> > On Sat, Oct 19, 2024 at 02:45:02AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
> > > commit: adca46171ff7b3613cd7975f81870ae9025a34cf [5228/5686] arm64: dts: freescale: imx8mm-verdin: Add Ivy carrier board
> > > config: arm64-randconfig-052-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/config)
> > > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
> > > dtschema version: 2024.10.dev6+g12c3cd5
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202410190235.VogdBzI8-lkp@intel.com/
> > > 
> > > dtcheck warnings: (new ones prefixed by >>)
> > >    	'tq,imx6dl-tqma6dl-b' was expected
> > >    	'phytec,imx6ul-pcl063' was expected
> > >    	'phytec,imx6ull-pcl063' was expected
> > >    	'fsl,imx6ulz' was expected
> > >    	'avnet,sm2s-imx8mp' was expected
> > >    	'toradex,verdin-imx8mp' was expected
> > >    	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
> > >    	'fsl,vf500' was expected
> > >    	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
> > >    arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-nonwifi-ivy', 'toradex,verdin-imx8mm-nonwifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
> > > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
> > >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
> > >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > > --
> > >    	'tq,imx6dl-tqma6dl-b' was expected
> > >    	'phytec,imx6ul-pcl063' was expected
> > >    	'phytec,imx6ull-pcl063' was expected
> > >    	'fsl,imx6ulz' was expected
> > >    	'avnet,sm2s-imx8mp' was expected
> > >    	'toradex,verdin-imx8mp' was expected
> > >    	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
> > >    	'fsl,vf500' was expected
> > >    	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
> > >    arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-wifi-ivy', 'toradex,verdin-imx8mm-wifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
> > > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
> > >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
> > >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > 
> > João,
> > 
> > Could you check these issues?
> 
> The issue is not about Ivy, but about the SOM dtsi that it includes.
> No immediate solution, discussion in progress here
> https://lore.kernel.org/all/ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810/

It seems a compatible for the panel used on toradex verdin-imx8mm device
should be added in the beginning?

And the first warning against fsl.yaml seems about Ivy?

Shawn

