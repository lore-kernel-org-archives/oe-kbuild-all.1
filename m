Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5219CC2A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597574; cv=none; b=KkEIrjeNSaUtPIOOSBxolpU4EjaFm9CbLWA6Q36FaQIVKmtXYOgQWNznuMyj5XUOoglgESJoDhPfnxTAYCpqb4l6CAqRJLnBKEltqKlzXj8YF3LeCidEEB7vCZFLTA5fW4R6u4ZpOw+rkBWEXuav/EbptsQhh+rWNqB4hp4l6m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597574; c=relaxed/simple;
	bh=UnHpkMG+9J+s0iZXxDof9Q5kpjiPa3bBbyLDJNre0K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsZ57o6opDIcb4Nli0XAFIOk0RVzLobM6517B9sp8r9u9Ah4RLWHi3mxAjmyv78dbplTrfUqp+eYQE31i3aS8LbJ1SD+H8VfnxXE4B101xBii0hTXcqAvAGdR4LxU+DSnVzM4XRo1rwfTbvQ/EeSxGC6nAPGY05TsqVjOPHtXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Ec3T0Vfy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Ec3T0Vfy"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A55A11F929;
	Tue, 22 Oct 2024 13:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1729597562;
	bh=jzG4VySxJyi89HcOTkdCQklvboMsm5PgtZwW9XtUb0U=; h=From:To:Subject;
	b=Ec3T0VfyRCoHLIsszb6g/pw8d12WQFeA0n4/scvRn5PaHzWBRMJCYhpS9hm8KPDeB
	 3XXxVwUvfpTR7tPoNeNGy19BRhHwAnyf2P25mgEVt+BXEfo3v15LenxDZUn/16sG0Q
	 4nKN6QDxswOYkk8iMH/5Ly3VcIhcO8SDHkZleU4JgUU4XqxcRrr7/Nvt7KLo3ckh5v
	 Ox893iL2IytLmojdzzp5oQMfeSS7VA/DKWHEXj7slPA9Mzw86yRXXtu6OwarFIRiWm
	 o+bCQWPixmQUU703+JUEo+7EgC9VRhqjRYmt27jtIZvWWyR73fakdpHl+iM5GXaeIg
	 ddjVPT2q14DLA==
Date: Tue, 22 Oct 2024 13:45:57 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	kernel test robot <lkp@intel.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [linux-next:master 5228/5686]
 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds:
 compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05',
 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2',
 'hydis,hv070wx2-1e0', 'tbs,a711-pa...
Message-ID: <20241022114557.GA32030@francesco-nb>
References: <202410190235.VogdBzI8-lkp@intel.com>
 <ZxdiZ2yjsfbnRN0v@dragon>
 <20241022090914.GA22546@francesco-nb>
 <Zxd2/awbBYI5Grh0@dragon>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zxd2/awbBYI5Grh0@dragon>

On Tue, Oct 22, 2024 at 05:57:17PM +0800, Shawn Guo wrote:
> On Tue, Oct 22, 2024 at 11:09:14AM +0200, Francesco Dolcini wrote:
> > On Tue, Oct 22, 2024 at 04:29:27PM +0800, Shawn Guo wrote:
> > > On Sat, Oct 19, 2024 at 02:45:02AM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
> > > > commit: adca46171ff7b3613cd7975f81870ae9025a34cf [5228/5686] arm64: dts: freescale: imx8mm-verdin: Add Ivy carrier board
> > > > config: arm64-randconfig-052-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/config)
> > > > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
> > > > dtschema version: 2024.10.dev6+g12c3cd5
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202410190235.VogdBzI8-lkp@intel.com/
> > > > 
> > > > dtcheck warnings: (new ones prefixed by >>)
> > > >    	'tq,imx6dl-tqma6dl-b' was expected
> > > >    	'phytec,imx6ul-pcl063' was expected
> > > >    	'phytec,imx6ull-pcl063' was expected
> > > >    	'fsl,imx6ulz' was expected
> > > >    	'avnet,sm2s-imx8mp' was expected
> > > >    	'toradex,verdin-imx8mp' was expected
> > > >    	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
> > > >    	'fsl,vf500' was expected
> > > >    	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
> > > >    arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-nonwifi-ivy', 'toradex,verdin-imx8mm-nonwifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
> > > > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
> > > >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > > > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
> > > >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > > > --
> > > >    	'tq,imx6dl-tqma6dl-b' was expected
> > > >    	'phytec,imx6ul-pcl063' was expected
> > > >    	'phytec,imx6ull-pcl063' was expected
> > > >    	'fsl,imx6ulz' was expected
> > > >    	'avnet,sm2s-imx8mp' was expected
> > > >    	'toradex,verdin-imx8mp' was expected
> > > >    	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
> > > >    	'fsl,vf500' was expected
> > > >    	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
> > > >    arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-wifi-ivy', 'toradex,verdin-imx8mm-wifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
> > > > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
> > > >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > > > >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
> > > >    	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > > 
> > > João,
> > > 
> > > Could you check these issues?
> > 
> > The issue is not about Ivy, but about the SOM dtsi that it includes.
> > No immediate solution, discussion in progress here
> > https://lore.kernel.org/all/ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810/
> 
> It seems a compatible for the panel used on toradex verdin-imx8mm device
> should be added in the beginning?
> 
> And the first warning against fsl.yaml seems about Ivy?

Not sure where this one is coming from. I just tested it again on
next-20241022 and I have just the known issue with the panel.

$ git log -1 
commit 7436324ebd147598f940dde1335b7979dbccc339 (HEAD -> next, tag: next-20241022, kernel.org/linux-next/master)
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue Oct 22 18:34:36 2024 +1100

    Add linux-next specific files for 20241022
    
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

$ make defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'defconfig'
#
# configuration written to .config
#

$ make  CHECK_DTBS=y W=1  freescale/imx8mm-verdin-wifi-ivy.dtb
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  HOSTLD  scripts/dtc/fdtoverlay
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  UPD     include/config/kernel.release
  DTC [C] arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb
/home/francesco/Toradex/sources/linux/arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
/home/francesco/Toradex/sources/linux/arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#


Francesco

