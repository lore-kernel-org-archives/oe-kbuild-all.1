Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19517EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 00:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719535992; cv=none; b=mCFSXtEYrEnjeTvQLFRdzW5Hi1UC4opQc1ZPm6lnZ1bnBtLP5XBZsecvcLoWD/Dxj+o7LPXR0t0FKZe6MozinUeLTeOEYylCtNxVviabPiUQ0L/Xn9f0Oqory3sUux7QijnS1vsgmi63Ysi58ePb8pARZQJVLp/UOoaiScuIsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719535992; c=relaxed/simple;
	bh=5cVdrpAANUEP47ZAxGml5/7hKR2zolZ5yuwheEqiFgw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OzwGAtdfDCeAnXzrKfmVSVAfprrzVHpAcpgia6YDxOMujgh2HbEN+V6XyHzsmP0Ni3vixHF7J2l1oNUCFiga+RPtA3WFKefjkNrQOJULuqTsNb4+TzpC9H+8C60TbFZFAZ5C8u60fcjRZkBvhkCg8pqoC0M3NSIUkLsjL8XXu2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RPvRcJJD; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RPvRcJJD"
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 130C52013B;
	Fri, 28 Jun 2024 08:53:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719535986;
	bh=QcUzfBUr7zlKcE3CXH1OF6NvrAQ2YYKEKBUYEz5F0v4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RPvRcJJDdxm/UKTCX6oMeuVJ4pDXVm1UWlpVboUZ3+3eJB95DzRO3v/N0IcVxVP8N
	 qW7/qoswz4SoDsvTxGqYwWXbsvkpOdnJ9ARSWfH/e990esxyaTrSnSUPHWxpc1b9mv
	 asEX2ou+xwNUZJam2QASXjUd8EGsJgZ43i3lezgSvBVk+6xbKzTWafTRWY8qVJwXYD
	 yvBKmKGn/VwxOkSArYiZSPBmRYwJC9ks1UnwWMl5W2HRP1JOIBgNFWac+hvnKKhime
	 BlEMcfDCBAIk1iL0m7HRDDbTRAEPKt89OHvgY3PS1xlAuzEGsovnyIqx81K1rXynve
	 QAoRgzc6GC1tA==
Message-ID: <a9372def1c8f30614a42b5a92a1964987ed2f102.camel@codeconstruct.com.au>
Subject: Re: [linux-next:master 2742/8232]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb:
 /ahb/apb/fsi@1e79b000/cfam@0,0/scom@1000: failed to match any schema with
 compatible: ['ibm,p9-scom']
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: kernel test robot <lkp@intel.com>, Eddie James <eajames@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
	 <linux-mm@kvack.org>, Ninad Palsule <ninad@linux.ibm.com>
Date: Fri, 28 Jun 2024 10:23:04 +0930
In-Reply-To: <202406272002.EnrSjYcT-lkp@intel.com>
References: <202406272002.EnrSjYcT-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2024-06-27 at 20:20 +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> commit: 26e67f6ba292b41c6cf297194a3f2941688cad0f [2742/8232] ARM: dts: as=
peed: Add IBM P11 Blueridge BMC system
> config: arm-randconfig-051-20240625 (https://download.01.org/0day-ci/arch=
ive/20240627/202406272002.EnrSjYcT-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a=
d79a14c9e5ec4a369eed4adf567c22cc029863f)
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240627/202406272002.EnrSjYcT-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202406272002.EnrSjYcT-lkp=
@intel.com/
>=20
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: pressure-sensor=
@76: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+=
'
>    	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e=
78a000/i2c-bus@480/led-controller@60: failed to match any schema with compa=
tible: ['nxp,pca9552']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e=
78a000/i2c-bus@480/led-controller@61: failed to match any schema with compa=
tible: ['nxp,pca9552']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e=
78a000/i2c-bus@600/i2c-mux@70/i2c@0/led-controller@60: failed to match any =
schema with compatible: ['nxp,pca9551']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e=
78a000/i2c-bus@700/led-controller@60: failed to match any schema with compa=
tible: ['nxp,pca9552']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e=
78a000/i2c-bus@780/led-controller@60: failed to match any schema with compa=
tible: ['nxp,pca9552']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e=
78a000/i2c-bus@800/led-controller@60: failed to match any schema with compa=
tible: ['nxp,pca9552']

The PCA955x binding hasn't yet been converted to dt-schema

>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-ma=
ster', 'fsi-master']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-ma=
ster', 'fsi-master']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/scom@1000: failed to match any schema with compatible: ['i=
bm,p9-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ib=
m,i2c-fsi']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@0/fsi@20/cfam@0,0/scom@1000: failed to ma=
tch any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@0/fsi@20/cfam@0,0/sbefifo@2400: failed to=
 match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/i2c@1800/i2c-bus@1/fsi@20/cfam@0,0/scom@1000: failed to mat=
ch any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/i2c@1800/i2c-bus@1/fsi@20/cfam@0,0/sbefifo@2400: failed to =
match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/scom@1000: failed to ma=
tch any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/sbefifo@2400: failed to=
 match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/scom@1000: failed to ma=
tch any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/sbefifo@2400: failed to=
 match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@c/fsi@20/cfam@0,0/scom@1000: failed to ma=
tch any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@c/fsi@20/cfam@0,0/sbefifo@2400: failed to=
 match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@d/fsi@20/cfam@0,0/scom@1000: failed to ma=
tch any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@d/fsi@20/cfam@0,0/sbefifo@2400: failed to=
 match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/scom@1000: failed to ma=
tch any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/sbefifo@2400: failed to=
 match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/scom@1000: failed to ma=
tch any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/sbefifo@2400: failed to=
 match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi2spi@1c00: =
'#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do n=
ot match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi2spi@1c00/spi@0: failed to match any schema with compati=
ble: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi2spi@1c00/spi@20: failed to match any schema with compat=
ible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi2spi@1c00/spi@40: failed to match any schema with compat=
ible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi2spi@1c00/spi@60: failed to match any schema with compat=
ible: ['ibm,spi-fsi']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: =
['ibm,p9-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/sbefifo@2400/occ: failed to match any schema with compatib=
le: ['ibm,p10-occ']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400: failed to match any schema with compatible: ['ib=
m,p9-fsi-controller']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/scom@1000: failed to match any schema wi=
th compatible: ['ibm,p9-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800: failed to match any schema wit=
h compatible: ['ibm,i2c-fsi']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@2/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@2/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@3/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@3/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@10/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@10/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@11/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@11/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi2spi@1c00: =
'#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do n=
ot match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi2spi@1c00/spi@0: failed to match any s=
chema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi2spi@1c00/spi@20: failed to match any =
schema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi2spi@1c00/spi@40: failed to match any =
schema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi2spi@1c00/spi@60: failed to match any =
schema with compatible: ['ibm,spi-fsi']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/sbefifo@2400: failed to match any schema=
 with compatible: ['ibm,p9-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/sbefifo@2400/occ: failed to match any sc=
hema with compatible: ['ibm,p10-occ']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi@3400: failed to match any schema wit=
h compatible: ['ibm,p9-fsi-controller']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/scom@1000: failed to match any schema wit=
h compatible: ['ibm,p9-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800: failed to match any schema with=
 compatible: ['ibm,i2c-fsi']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@0/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@0/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@1/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@1/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@c/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@c/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@d/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@d/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi2spi@1c00: =
'#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do n=
ot match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi2spi@1c00/spi@0: failed to match any s=
chema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi2spi@1c00/spi@20: failed to match any =
schema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi2spi@1c00/spi@40: failed to match any =
schema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi2spi@1c00/spi@60: failed to match any =
schema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/sbefifo@2400: failed to match any schema =
with compatible: ['ibm,p9-sbefifo']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/sbefifo@2400/occ: failed to match any sch=
ema with compatible: ['ibm,p10-occ']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi@3400: failed to match any schema with=
 compatible: ['ibm,p9-fsi-controller']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/scom@1000: failed to match any schema wit=
h compatible: ['ibm,p9-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800: failed to match any schema with=
 compatible: ['ibm,i2c-fsi']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@2/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@2/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@3/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@3/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/scom@1=
000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/sbefif=
o@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@10/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@10/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#addr=
ess-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-maste=
r.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@11/fsi@20/cfam@0,0/scom@=
1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@11/fsi@20/cfam@0,0/sbefi=
fo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo'=
]
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi2spi@1c00: =
'#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do n=
ot match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@0: failed to match any s=
chema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@20: failed to match any =
schema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@40: failed to match any =
schema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@60: failed to match any =
schema with compatible: ['ibm,spi-fsi']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/sbefifo@2400: failed to match any schema =
with compatible: ['ibm,p9-sbefifo']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/sbefifo@2400/occ: failed to match any sch=
ema with compatible: ['ibm,p10-occ']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi@3400: failed to match any schema with=
 compatible: ['ibm,p9-fsi-controller']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-ma=
ster', 'fsi-master']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e=
79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-ma=
ster', 'fsi-master']
>=20

Most of the rest of this should go away with Eddie's FSI binding
patches found in the series here:

https://lore.kernel.org/linux-devicetree/20240522192524.3286237-1-eajames@l=
inux.ibm.com/

I'm hoping we can get FSI patches merged despite the mix of subsystems
involved in the series.

Andrew

