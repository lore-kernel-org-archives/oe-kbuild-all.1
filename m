Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC58116E886
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 08:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585800; cv=none; b=kdAmGpcV/d4GX7HcFLoHEnqlzNp508R/UghZlk8Dv7lKMN44HSbGteqpr6ECK+BxrOy1fvxHELxi6yg31r4Wrn6PZzrRQn9MGpSAVCXKmqgcWFByPxfAyOlsZy8BXoYwqwsly+nRjxZxxq/1vQdz9InhAhhnd0E4lBGYQlwxZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585800; c=relaxed/simple;
	bh=SdzKl7zOLE6WDOX80QCJfPvw1r7tgfg0no+c7bZy2tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A72V1lEhTvATrvZlwGpuzZ5BpRWM0Bu6Ns4zoOF5pol9xXu35vveU4ld+r6MhzyCeEftFAjbZXVAU0x/h1K5nkC8IT+QX/ASzsR86xSTpc7AckgQSH538bXXjQdtgiyV28lX9ih9/y2O/GpWYg1r9lFHSGAbHHaUspCZwH/8UpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VnkYGGrG; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VnkYGGrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FmfVkbikhNVx2HgUhuWEXAwyz/VCsh3wgwS62j3qrPc=;
	b=VnkYGGrGMQ89VEsqi3oUhzoBcedGzvasTaAh1hysNsiKbMxLrj4Om4ng6jIUdJ
	iXwTu+clsXMGnOoFnlGwvNykfqoNjVTxo4ZZ3nz9otxggqXBG/03dWRGGf4wvg4w
	PeEBSvoHGEOjVtRUR6vtF5+tAmCqp6Ga6N1C7JcZR+a+c=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgB3NZpnYhdn4eqXAA--.5350S3;
	Tue, 22 Oct 2024 16:29:29 +0800 (CST)
Date: Tue, 22 Oct 2024 16:29:27 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: kernel test robot <lkp@intel.com>
Cc: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [linux-next:master 5228/5686]
 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds:
 compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05',
 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2',
 'hydis,hv070wx2-1e0', 'tbs,a711-pa...
Message-ID: <ZxdiZ2yjsfbnRN0v@dragon>
References: <202410190235.VogdBzI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202410190235.VogdBzI8-lkp@intel.com>
X-CM-TRANSID:M88vCgB3NZpnYhdn4eqXAA--.5350S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw17tw43GF15Kw15Xr4DXFb_yoWrJw45pa
	4xtF9rX3WSgF1xu3y7G3Z7GrsxJw4fXr1a93ZxGrW2ka45uFy3KF1fKr4DWw129rnY9a4S
	9F48Xr17Ww1rZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jhwIDUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCx6AZWcXFXLo6AAAsn

On Sat, Oct 19, 2024 at 02:45:02AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
> commit: adca46171ff7b3613cd7975f81870ae9025a34cf [5228/5686] arm64: dts: freescale: imx8mm-verdin: Add Ivy carrier board
> config: arm64-randconfig-052-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
> dtschema version: 2024.10.dev6+g12c3cd5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410190235.VogdBzI8-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    	'tq,imx6dl-tqma6dl-b' was expected
>    	'phytec,imx6ul-pcl063' was expected
>    	'phytec,imx6ull-pcl063' was expected
>    	'fsl,imx6ulz' was expected
>    	'avnet,sm2s-imx8mp' was expected
>    	'toradex,verdin-imx8mp' was expected
>    	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
>    	'fsl,vf500' was expected
>    	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>    arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-nonwifi-ivy', 'toradex,verdin-imx8mm-nonwifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
>    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
>    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> --
>    	'tq,imx6dl-tqma6dl-b' was expected
>    	'phytec,imx6ul-pcl063' was expected
>    	'phytec,imx6ull-pcl063' was expected
>    	'fsl,imx6ulz' was expected
>    	'avnet,sm2s-imx8mp' was expected
>    	'toradex,verdin-imx8mp' was expected
>    	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
>    	'fsl,vf500' was expected
>    	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>    arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-wifi-ivy', 'toradex,verdin-imx8mm-wifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
>    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
>    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

João,

Could you check these issues?

Shawn

