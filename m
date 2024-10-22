Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A508152166
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586693; cv=none; b=XgV744++WYfiXYNY53NXLkiOxSrtwdAjsdFHQLuVbxBX1DRuwo72nZ3hYs8sMwCX+sRsCdpmq+lGdICouofUt4d9+9FzAx2zE/vRTV2S2EUheFJp6f3nBMqVmI61lciH3y1zpkxhwZ57HrXmhLXOJOLx4pbJqAbj393YuZV2KYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586693; c=relaxed/simple;
	bh=F2YmLamT+t8npCOXIXoFchbNth+A2Y3uEcVimauYeZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjDfn8No+QQXVz3FTTO9dwKxkd4dfWfIodHVokhh9hBPyNVr+0g4d4UxNDBwAhVnN9ZKySmLx0Z0OEMSFrIG6DbEitf08WP5FnrlmmL17Ii97eBIOETGPRe2SjRveYRPzBFWzWCVNdZsdMK1KrcAFICrfOzG0RSdUS+nqDB1GC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Uy+5yMXH; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Uy+5yMXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=shw/SGM6Uqi1wbTJkBAWqvVUTE+zb2wQqtM9ZX6+JmY=;
	b=Uy+5yMXHse/nC1gsSd3wm6vZ3leqCw4jIo2UG+i8/6ujAQZ1OjUEERYq6zatU9
	tJiZXbbwIDNj5dwgf9Pax1y1KB7guQPZEmKSRpaRtsuokJ+b76p6I8shC9t1bVcp
	xfTBER0SkGvUmOVP8q7K77myhvwFmN7igDrsskQFRmxoc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXHz7oZRdn06+bAA--.5636S3;
	Tue, 22 Oct 2024 16:44:25 +0800 (CST)
Date: Tue, 22 Oct 2024 16:44:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: kernel test robot <lkp@intel.com>
Cc: Fabio Estevam <festevam@denx.de>, oe-kbuild-all@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [linux-next:master 4743/5686]
 arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /ldb: failed to match any schema
 with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
Message-ID: <Zxdl6KIVe+m9IP5h@dragon>
References: <202410220602.WnWrz1yk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410220602.WnWrz1yk-lkp@intel.com>
X-CM-TRANSID:Ms8vCgCXHz7oZRdn06+bAA--.5636S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw13Ww1ftr1xCFykKFyDZFb_yoWruF48pa
	4IyrWDCrWxKF1fK3y3Krn7Ca15Zw13Cryay3s8Cry7KF9xWFy7Jryft3sIvry3ZF1rKa13
	t3Z3Z34xXw18WaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jV_MfUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCx6AZWcXFXLo6AABsm

On Tue, Oct 22, 2024 at 06:12:06AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
> commit: 178edf156657a783c5be19ea01e73ec4c259e6a4 [4743/5686] ARM: dts: imx6q-lxr: Add board support
> config: arm-randconfig-053-20241017 (https://download.01.org/0day-ci/archive/20241022/202410220602.WnWrz1yk-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
> dtschema version: 2024.10.dev6+g12c3cd5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410220602.WnWrz1yk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410220602.WnWrz1yk-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    	'phytec,imx6ul-pcl063' was expected
>    	'phytec,imx6ull-pcl063' was expected
>    	'fsl,imx6ulz' was expected
>    	'toradex,verdin-imx8mm' was expected
>    	'avnet,sm2s-imx8mp' was expected
>    	'toradex,verdin-imx8mp' was expected
>    	'fsl,imx6q' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
>    	'fsl,vf500' was expected
>    	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>    arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /: failed to match any schema with compatible: ['comvetia,imx6q-lxr', 'phytec,imx6q-pfla02', 'fsl,imx6q']
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: '#address-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: '#size-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: '#address-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: '#size-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6q-iomuxc']
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
>    arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
> >> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
>    arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /spi/fpga@0: failed to match any schema with compatible: ['altr,fpga-passive-serial']

Fabio,

Could you look at these issues?

Shawn

