Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD51283FDD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 23:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779752971; cv=none; b=TDDM58YZ3cBkMITQVQ9OFW3LBb26Q9h/r/1OUU7LTN6B0BFjg6nbDwud2bla1z2HHFmVK/aOz28/u+HjPd3/OXQBSEGe081waAOnZkjUCshbt66D0RRQn4MzmbDNJdKrGbfCxgAflXvwEP3KpAk6KitIJPUQ1ki/wbfLmSpdDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779752971; c=relaxed/simple;
	bh=QL8d9Mvs4/mvrCKV98YH61B/4uopUTjj7Z+jbk4MIE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HHXP/rLkNLnDJtDoLaRkNVqTVUalIpatVX0aaE8wgBYtqH0cXCvo56KlwzteTPGL7jFVSN6nZU9rQmsJnzkx7eQI40NC/8oewhmf4+lm1rm3HapRNWvtHf8EdaROHWEUuyb0UdhOp+cG+pLZ0mBlx8zhUtE07/NVldxoofwz+b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mihJvDG3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mihJvDG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779752967; x=1811288967;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QL8d9Mvs4/mvrCKV98YH61B/4uopUTjj7Z+jbk4MIE0=;
  b=mihJvDG3JZBRjUT700LkcMjcvl8B3qQ0rHbV4yAberDUxf23vyUtrwHG
   pA+ugtRJ6z6B46GkseBUjcff72iQCOyiPBpc/iS1rFk7gtkTfRUmcb4xw
   2JaUYLDMJguI7TyTzSXrKA3hoxmxnfWAqlV1RkSHlqBp4Hgw9wQ9ipv1L
   sew1BzL6si2QWQ36tgdGvT1t7w6t3XIqSWk1xVpy6iDlLM0gnrYL+Hvuv
   AorIMVQPlGw6kcfq+Y/Yo5jnm3+mhsPNEYBsMfr1nYkHhOJt3nFf57p2z
   PB7GWrzY65xmE5jZ87CsKhGSABZp4t9bl9EWuoqfwV5xSK1KFbbzVM6Up
   Q==;
X-CSE-ConnectionGUID: tDFeGyZtTMShuJNWOYK/Yw==
X-CSE-MsgGUID: 2/eQ/28rQ+iOagYEKqkA6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91671550"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="91671550"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 16:49:26 -0700
X-CSE-ConnectionGUID: bdIx9VTaS1uiIfbBi5oRpA==
X-CSE-MsgGUID: g7Xyf8tETiOx53z35TnwZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="241587919"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 25 May 2026 16:49:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRf2v-00000000CHR-2P4M;
	Mon, 25 May 2026 23:49:21 +0000
Date: Tue, 26 May 2026 01:49:01 +0200
From: kernel test robot <lkp@intel.com>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 5506/7547]
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb:
 /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compatible:
 ['aspeed,ast2600-i3c-global', 'syscon']
Message-ID: <202605260147.gKkemBrR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   550604d6c9b9efc8d068aff94dc301694a7afdee
commit: 91b9aed7381c898758d70fac5aaa4bfa6173761a [5506/7547] ARM: dts: aspe=
ed-g6: Add nodes for i3c controllers
config: arm-randconfig-2055-20260518 (https://download.01.org/0day-ci/archi=
ve/20260526/202605260147.gKkemBrR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260526/202605260147.gKkemBrR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605260147.gKkemBrR-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: / (aspeed,ast2600-ev=
b-a1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['aspeed,ast2600-evb-a1', 'aspeed,ast2600-evb', 'aspeed,ast2600'] is to=
o long
   	'aspeed,ast2600-evb-a1' is not one of ['delta,ahe50dc-bmc', 'facebook,g=
alaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,=
olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
   	'aspeed,ast2600-evb-a1' is not one of ['amd,daytonax-bmc', 'amd,ethanol=
x-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,altrad8-bmc', 'a=
srock,ast2500-paul-ipmi-card', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4i-bm=
c', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-bmc',=
 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'faceb=
ook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'facebo=
ok,wedge400-bmc', 'facebook,wedge400-data64-bmc', 'hxt,stardragon4800-rep2-=
bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc=
', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'ins=
pur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,la=
nyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bm=
c', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', =
'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegma=
n-rx20-bmc', 'yadro,vegman-sx20-bmc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	'aspeed,ast2600' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/lpc@1e78900=
0/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/bus@1e7a000=
0/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3=
c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/lpc@1e789000/l=
hc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/bus@1e7a0000/s=
yscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3c-g=
lobal', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/bus=
@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,as=
t2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:672.10-692.4: =
Warning (avoid_unnecessary_addr_size): /ahb/apb/bus@1e78a000/i2c@480/gpio@7=
7: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or=
 child "reg" or "ranges" property
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/lpc@=
1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast26=
00-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@=
1e78a000/i2c@180/psu@58: failed to match any schema with compatible: ['pmbu=
s']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@=
1e78a000/i2c@180/psu@59: failed to match any schema with compatible: ['pmbu=
s']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@=
1e78a000/i2c@280/i2c-mux@70/i2c@3/temperature-sensor@7c: failed to match an=
y schema with compatible: ['microchip,emc1413']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@=
1e78a000/i2c@280/i2c-mux@70/i2c@3/temperature-sensor@4c: failed to match an=
y schema with compatible: ['microchip,emc1413']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: gpio@77 (nxp,=
pca9539): '#address-cells', '#size-cells' do not match any of the regexes: =
'^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@=
1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast=
2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dtb: /ahb/ap=
b/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed=
,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dtb: /ahb/ap=
b/bus@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspe=
ed,ast2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9000 (aspeed,=
ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9100 (aspeed,=
ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/lpc@1e789000=
/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/bus@1e7a0000=
/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3c=
-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/bus@1=
e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2=
600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus=
@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,as=
t2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/lpc@=
1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast26=
00-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@=
1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast=
2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/lpc@=
1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast26=
00-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/bus@=
1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast=
2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/lpc@1e=
789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600=
-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/bus@1e=
7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast26=
00-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/apb/lpc@1e=
789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600=
-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/apb/bus@1e=
7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast26=
00-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: /ahb/apb/l=
pc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,as=
t2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: /ahb/apb/b=
us@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,=
ast2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/apb/lpc@1e78=
9000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-l=
hc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/apb/bus@1e7a=
0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600=
-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('mella=
nox,multi-host', 'ncsi-channel', 'ncsi-ctrl,no-channel-monitor', 'ncsi-ctrl=
,start-redo-probe', 'ncsi-package', 'ncsi-rexmit', 'ncsi-timeout' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000 (aspeed,ast2600-mac): 'ncsi-ctrl,no-channel-monitor', 'ncsi-ctrl,sta=
rt-redo-probe' do not match any of the regexes: '^#.*', '^(at25|bm|devbus|d=
macap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^=
(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-single|=
#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5=
m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts|vsc8531),.*', =
'^100ask,.*', '^70mai,.*', '^8dev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,=
.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^=
[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*',=
 '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,.=
*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adaptev=
a,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '=
^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*',=
 '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^algoltek,.*', '^allegro,=
.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*=
', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^=
amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlog=
ic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*=
', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anlogic,.*', '^anvo,.=
*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasa=
n,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^arduino,.=
*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*',=
 '^armchina,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*=
', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^aste=
ralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*',=
 '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,=
.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '=
^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belli=
ng,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize=
,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*',=
 '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffal=
o,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*'=
, '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.=
*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', =
'^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^c=
heckpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*=
', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*'=
, '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloo=
s,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,=
.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^corech=
ips,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^cran=
e,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*=
', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*=
', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^=
davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*',=
 '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce=
,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*',=
 '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^=
domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*'=
, '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*=
', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.=
*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfoch=
ips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*',=
 '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '=
^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.=
*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,=
.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '=
^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*=
', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*=
', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*=
', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*=
', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', =
'^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.=
*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*'=
, '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,=
.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*',=
 '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis=
,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^glob=
alscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*',=
 '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn=
,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.=
*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hid=
eep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisili=
con,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*', =
'^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*',=
 '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^h=
uiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis=
,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*=
', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingen=
ic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^in=
side-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,=
.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iron=
device,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^i=
tian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '=
^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jid=
e,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithk=
oep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^=
kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^=
koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^=
laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech=
,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '=
^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^=
lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', =
'^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '=
^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^l=
ongcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', =
'^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^lxd,.*', '=
^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*'=
, '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*'=
, '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^media=
tek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas=
,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor=
,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,=
.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^m=
icrotips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^=
miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^m=
itsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtro=
nix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', =
'^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^=
msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^mur=
ata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*',=
 '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*',=
 '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,=
.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.=
*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^n=
othing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^n=
umonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,=
.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,=
.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*', '^onion,.*', '^=
onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '=
^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,=
.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^o=
smc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*=
', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*'=
, '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech=
,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pin=
eriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^pl=
x,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*=
', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*'=
, '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', =
'^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qc=
a,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qis=
henglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ral=
ink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '=
^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^r=
enesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^r=
fdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^ri=
scv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix=
,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.=
*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*'=
, '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulercontrol,.*', '^scio=
sense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^sem=
tech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', =
'^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '=
^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,=
.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*=
', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy=
,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco=
,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipe=
ed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', =
'^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^=
snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^s=
omfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^sp=
ansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ss=
i,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*',=
 '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*'=
, '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*'=
, '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', =
'^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taiguanck,.*', '^taos,.*=
', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,=
.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,=
.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo=
,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*', '^test,.*=
', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', =
'^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^t=
opic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^tos=
hiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^tra=
nspeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^t=
sd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '=
^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ug=
oos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*',=
 '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*',=
 '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,=
.*', '^verisilicon,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.=
*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visiono=
x,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*=
', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanc=
hanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.=
*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^w=
iko,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^w=
inlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^w=
lf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', =
'^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^x=
inpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,=
.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yim=
ing,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', =
'^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', =
'^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/lp=
c@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast=
2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/bu=
s@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,a=
st2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: gpio@1e780000 (a=
speed,ast2600-gpio): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer=
.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/lpc@1e7=
89000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-=
lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: serial@1e78d000 =
(ns16550a): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer=
.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: serial@1e78f000 =
(ns16550a): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer=
.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e7=
8a000/i2c@280/power-monitor@69: failed to match any schema with compatible:=
 ['pmbus']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e7=
a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast260=
0-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/bus@1=
e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2=
600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb/=
lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,a=
st2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb/=
bus@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed=
,ast2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: ethernet@1e6=
70000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('mellan=
ox,multi-host' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: ethernet@1e6=
90000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('mellan=
ox,multi-host' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus=
@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,as=
t2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/bus=
@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,as=
t2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/lpc@1e789=
000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lh=
c']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/bus@1e7a0=
000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-=
i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/lpc@1e78=
9000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-l=
hc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e7a=
0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600=
-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:86.19-103.4: Warning=
 (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cel=
ls/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" pr=
operty
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/lpc@1e7890=
00/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: tca9554@20 (ti,tca9=
554): '#address-cells', '#size-cells' do not match any of the regexes: '^(h=
og-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: tca9554@20 (ti,tca9=
554): '#address-cells', '#size-cells' do not match any of the regexes: '^(h=
og-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: pca9849@75 (nxp,pca=
9849): $nodename:0: 'pca9849@75' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: pca9849@75 (nxp,pca=
9849): Unevaluated properties are not allowed ('#address-cells', '#size-cel=
ls', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/bus@1e7a00=
00/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i=
3c-global', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b0=
00/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi=
-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b0=
00/cfam@0,0/i2c@1800/i2c-bus@a/eeprom@50: failed to match any schema with c=
ompatible: ['atmel,at30tse004a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b0=
00/cfam@0,0/i2c@1800/i2c-bus@b/eeprom@50: failed to match any schema with c=
ompatible: ['atmel,at30tse004a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b0=
00/cfam@0,0/i2c@1800/i2c-bus@c/eeprom@50: failed to match any schema with c=
ompatible: ['atmel,at30tse004a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b0=
00/cfam@0,0/i2c@1800/i2c-bus@d/eeprom@50: failed to match any schema with c=
ompatible: ['atmel,at30tse004a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): occ: 'occ-hwmon', 'reg' do not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: occ (ibm,p10-occ): =
'occ-hwmon', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@33 (ibm,pca=
9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not ma=
tch any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@30 (ibm,pca=
9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not ma=
tch any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@34 (ibm,pca=
9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not ma=
tch any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@35 (ibm,pca=
9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not ma=
tch any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@60 (nxp,pca=
9552): 'led@10', 'led@11', 'led@12', 'led@13' do not match any of the regex=
es: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e7a00=
00/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i=
3c-global', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b0=
00/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi=
-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/lpc@1e789000/=
lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c-mux@70 (nxp,pca954=
6): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e7a0000/=
syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3c-=
global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/lpc@1e7890=
00/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: tca9554@20 (ti,tca9=
554): '#address-cells', '#size-cells' do not match any of the regexes: '^(h=
og-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: pca9552@31 (ibm,pca=
9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not ma=
tch any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: pca9552@32 (ibm,pca=
9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not ma=
tch any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: pca9552@33 (ibm,pca=
9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not ma=
tch any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e7a00=
00/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i=
3c-global', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b0=
00/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi=
-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sbefifo@2400 (ibm,p=
9-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: tca9554@20 (ti=
,tca9554): '#address-cells', '#size-cells' do not match any of the regexes:=
 '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: pca9552@31 (ib=
m,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do n=
ot match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: pca9552@32 (ib=
m,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do n=
ot match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: pca9552@33 (ib=
m,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do n=
ot match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1=
e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2=
600-i3c-global', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ib=
m,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sbefifo@2400 (=
ibm,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sbefifo@2400 (=
ibm,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sbefifo@2400 (=
ibm,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sbefifo@2400 (=
ibm,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sbefifo@2400 (=
ibm,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/lpc@1e7=
89000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-=
lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: tca9554@20 (ti,t=
ca9554): '#address-cells', '#size-cells' do not match any of the regexes: '=
^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: pca9552@31 (ibm,=
pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not=
 match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: pca9552@32 (ibm,=
pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not=
 match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: pca9552@33 (ibm,=
pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not=
 match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e7=
a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast260=
0-i3c-global', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e7=
9b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,=
fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sbefifo@2400 (ib=
m,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sbefifo@2400 (ib=
m,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sbefifo@2400 (ib=
m,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sbefifo@2400 (ib=
m,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sbefifo@2400 (ib=
m,p9-sbefifo): '#address-cells', '#size-cells' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb/lpc@1e789000/=
lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb/bus@1e7a0000/=
syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3c-=
global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/lpc@1e7890=
00/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: led-controller@60 (=
nxp,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do=
 not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: tpm@2e (tcg,tpm-tis=
-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['tcg,tpm-tis-i2c'] is too short
   	'tcg,tpm-tis-i2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x',=
 'st,st33ktpm2xi2c', 'st,st33tphf2ei2c']
   	'tcg,tpm-tis-i2c' is not one of ['atmel,at97sc3204t', 'infineon,slb9635=
tt', 'infineon,slb9645tt', 'infineon,tpm_i2c_infineon', 'nuvoton,npct501', =
'nuvoton,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: led-controller@61 (=
nxp,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do=
 not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e7a00=
00/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i=
3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/lp=
c@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast=
2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/bu=
s@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,a=
st2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/lpc@1e=
789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600=
-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/bus@1e=
7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast26=
00-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: bmp280@77 (bosch,bmp=
280): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: bmp280@77 (bosch,bmp=
280): 'vddd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: bmp280@77 (bosch,bmp=
280): 'vdda-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: pca9552@60 (nxp,pca9=
552): 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio=
@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7'=
, 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: pca9552@60 (nxp,pca9=
552): 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio=
@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7'=
, 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e7a000=
0/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3=
c-global', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/fsi@1e79b00=
0/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-=
i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: sbefifo@2400 (ibm,p9=
-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: sbefifo@2400 (ibm,p9=
-sbefifo): occ: 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: occ (ibm,p9-occ): 'r=
eg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/fsi@1e79b00=
0/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-mast=
er-hub']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/fsi@1e79b00=
0/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with comp=
atible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: sbefifo@2400 (ibm,p9=
-sbefifo): '#address-cells', '#size-cells' do not match any of the regexes:=
 '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: gpio@1e780000 (a=
speed,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '', 'BMC=
_FLASH_MUX_SEL', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', 'BMC_FWSPI_RST_N', '', 'GPIO_1_BMC_3V3', '', '', '', =
'', '', 'JTAG_MUX_A', 'JTAG_MUX_B', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', 'SCMFPGA_SPARE_GPIO1_3V3', 'SCMFPGA_=
SPARE_GPIO2_3V3', 'SCMFPGA_SPARE_GPIO3_3V3', 'SCMFPGA_SPARE_GPIO4_3V3', 'SC=
MFPGA_SPARE_GPIO5_3V3', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/apb/lpc@1e7=
89000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-=
lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/apb/bus@1e7=
a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast260=
0-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9000 (aspeed=
,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9100 (aspeed=
,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: gpio@1e780000 (aspee=
d,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', 'PLTRST_N', '', 'PWR_DEBUG_N',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', 'PREQ_N', 'TCK_MUX_SEL', '',=
 '', '', '', '', 'PWRGD_SYS_PWROK', '', 'PRDY_N', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', 'SYS_BMC_PWRBTN_R_N', 'SYS_P=
WRBTN_N', 'FM_MB_RST_BTN', 'RST_BMC_RSTBTN_OUT_N', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'FP_ID_=
BTN_SCM_N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', 'SMI', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'F=
M_BMC_READY_N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/apb/lpc@1e78900=
0/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/apb/bus@1e7a000=
0/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3=
c-global', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: leds (gpio-leds): 'B=
MC_HEARTBEAT_N', 'BMC_LED_STATUS_AMBER_N', 'FM_ID_LED_N' do not match any o=
f the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: gpio@1e7800=
00 (aspeed,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '',=
 'alert-psu0-smb-r-n', 'bmc-ready', '', 'assert-cpu0-prochot-r-n', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', 'reset-sgpio-r-n', '', '', '',=
 '', '', 'scm-jtag-mux-select', '', '', '', '', '', '', '', '', '', 'reset-=
out', 'power-out', '', '', '', '', '', '', '', '', 'irq-bmc-cpu0-buf-nmi-n'=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ncsi-oc=
p-clk-en-n', '', '', '', '', '', '', '', '', '', '', '', 'cpu1-thermal-trip=
-n', '', '', '', '', '', '', '', '', '', 'cpu0-prochot-n', '', 'cpu1-procho=
t-n', '', 'cpu0-pe-rst0', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', 'PCH_SLP_S4_BMC_N', 'cpu0-thermtrip-n', 'alert-psu1-smb-r-n'=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'bios-rec=
overy-buf-n', '', 'assert-cpu1-prochot-r-n', '', 'power-chassis-good', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', 'platform-type', ''=
, '', '', '', '', '', '', '', '', '', '', '', 'cpld-power-break-n', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/apb/lp=
c@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast=
2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/apb/bu=
s@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,a=
st2600-i3c-global', 'syscon']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: gpio@1e78=
0000 (aspeed,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '=
', 'presence-ps0', 'power-chassis-good', '', '', '', '', 'presence-ps1', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', 'power-chassis-control', '', '', '',=
 '', '', 'jtag-mux', '', '', '', '', '', '', '', '', '', 'reset-button', 'p=
ower-button', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', 'tck-mux', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', 'nmi-button', '', '', '', '', '',=
 '', '', '', '', '', 'power-config-full-load', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/=
lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,a=
st2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/=
bus@1e78a000/i2c@680/psu0@58: failed to match any schema with compatible: [=
'pmbus']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/=
bus@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed=
,ast2600-i3c-global', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: leds (gpi=
o-leds): 'heartbeat', 'uid' do not match any of the regexes: '(^led-[0-9a-f=
]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9000 (=
aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9100 (=
aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: pca9535@20 (nx=
p,pca9535): '#address-cells', '#size-cells' do not match any of the regexes=
: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/bus@1=
e78a000/i2c@280/psu@58: failed to match any schema with compatible: ['pmbus=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/bus@1=
e78a000/i2c@300/psu@58: failed to match any schema with compatible: ['pmbus=
']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/bus@1=
e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2=
600-i3c-global', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: gpio-keys (gpi=
o-keys): 'allpwr-good', 'cpu-caterr-l', 'cpu-thermtrip-l', 'fan-status-int-=
l', 'int-thermal-alert', 'psu0-alert-n', 'psu0-power-ok', 'psu0-presence-l'=
, 'psu1-alert-n', 'psu1-power-ok', 'psu1-presence-l' do not match any of th=
e regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|=
[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: gpio-keys-poll=
ed (gpio-keys-polled): '#address-cells', '#size-cells', 'fan0-presence', 'f=
an1-presence', 'fan2-presence', 'fan3-presence' do not match any of the reg=
exes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0=
-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
