Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77FA4C80
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718496612; cv=none; b=CViPLBplrr3qGBTyHZaOzhVzVqESd1VwRVbykBWtashpon38WKvs0U0BUvhu8pPBZ5cp+cjjoLJ8e74Zhzzxny1sQ+UzsZ9wQU2C8w6F9fY7i0SUYjNjSEOduNXtpry3bZzmDK+Q9RX07vu7o1i40tm0QNMBMcTyoCGuxB842QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718496612; c=relaxed/simple;
	bh=Cdy1Q8AaPiujhXX5zjrfuXbLiPsI8OLLs1XofS1VJ6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fw/ssts/dSvanMFF2gmUAVDlhsxOd7YrwCtKStcrkyeNnlPnootfdGxBnP+Gc7X7hjhY1XqjqNeNjsiGfs5mmEQjgdg0dh2kLZSWcIZm8s+mxdYyYYzAnIRh05WaZvejmI+I6DWZl0Vkm/zYpTV/885UOrI4aIPYoHE9lcZDDQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bm/qVgKv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bm/qVgKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718496607; x=1750032607;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Cdy1Q8AaPiujhXX5zjrfuXbLiPsI8OLLs1XofS1VJ6k=;
  b=Bm/qVgKvBwEY4htUqKS2mjaSwWdw3VboVi81fR/Ae5WM+ubJdJcEZmaM
   u/hRKIOjRh0KWqlZxvktjwRV1nOW5XvXdtNOSNWHXFZdhC+MlN6MUWF+e
   U9opO7URUGrPUdkMxxj85LuGnU2XUo4KM8ukTx/71EZi72JL/CAxpcVSi
   r3/jcx4/qbCcqIXC4KSwvlIupWrCwL+KjdMbcT0wb3Pny5IHt4R5bBPPP
   /beJrdBH6EDmkeYFiIdxZaEidJXRsjlYB2x0Wp/5CHBWYU4OB/oSIjeLT
   J9i6bCqWQjwo9q4BjfZeX/KAx+E9R/YO5zN3IBZWLNAajRZrBrwjIE4mf
   g==;
X-CSE-ConnectionGUID: qxizRL0zQIOidM+jOso8mg==
X-CSE-MsgGUID: JOiV+rLSR32nFkZH709WjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="37885857"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="37885857"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 17:10:06 -0700
X-CSE-ConnectionGUID: TFAMzOifTu2YTh7YLrdzvg==
X-CSE-MsgGUID: NB7yuz9ERQiHnKn1L/MHYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40995775"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jun 2024 17:10:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIdT7-0000de-2P;
	Sun, 16 Jun 2024 00:10:01 +0000
Date: Sun, 16 Jun 2024 08:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 175/199]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000:
 vcodec-lat@10000:compatible:0: 'mediatek,mtk-vcodec-lat-mt8188' is not one
 of ['mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-lat-soc']
Message-ID: <202406160855.7xqGF97k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-6.1
head:   b16825740f3f827da82b8dcfa7807f141438e560
commit: fe8d47472e11388fc227cb58f8852ff84bc10480 [175/199] CHROMIUM: arm64:=
 dts: mediatek: mt8188: Use mt8188 vcodec drivers
config: arm64-randconfig-051-20240613 (https://download.01.org/0day-ci/arch=
ive/20240616/202406160855.7xqGF97k-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240616/202406160855.7xqGF97k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160855.7xqGF97k-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: cam-yuv-b@16090000: 'assign=
ed-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'interrupts'=
, 'mediatek,cam-id', 'mediatek,larbs', 'reg', 'reg-names' do not match any =
of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,cam-yuv.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@17201000: 'mediatek,sm=
i-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes=
: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/media=
tek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: reg: =
[[0, 402653184, 0, 4096], [0, 402669568, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: #addr=
ess-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: #size=
-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-lat@10000:compatible:0: 'mediatek,mtk-vcodec-lat-mt8188' is not one of ['=
mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-lat-soc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-lat@10000:clocks: [[31, 4], [31, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-lat@10000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-lat@10000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-lat@10000:clock-names: ['vdec-soc-vdec', 'vdec-soc-lat'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-lat@10000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-lat@10000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-core@25000:compatible:0: 'mediatek,mtk-vcodec-core' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-core@25000:clocks: [[32, 2], [32, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-core@25000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-core@25000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-core@25000:clock-names: ['vdec-vdec', 'vdec-lat'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-core@25000: 'assigned-clocks' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: vcode=
c-core@25000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: 'dma-=
ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: 'assi=
gned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^v=
codec-core@[0-9a-f]+$', '^vcodec-lat@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: video-codec@18000000: 'anyO=
f' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/video-codec@18000000/v=
codec-lat@10000: failed to match any schema with compatible: ['mediatek,mtk=
-vcodec-lat-mt8188']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/video-codec@18000000/v=
codec-core@25000: failed to match any schema with compatible: ['mediatek,mt=
k-vcodec-core-mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/remoteproc@19001000: f=
ailed to match any schema with compatible: ['mediatek,mt8188-apusys-rv']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/remoteproc@19001000/ap=
u-ctrl: failed to match any schema with compatible: ['mediatek,apu-ctrl-rpm=
sg']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/remoteproc@19001000/ap=
u-pwr-tx: failed to match any schema with compatible: ['mediatek,apupwr-tx-=
rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: apu-pwr-rx: 'apusys,thermal=
-zones' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap=
|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keyp=
ad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-singl=
e|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.=
*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,=
=2E*', '^8dev,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a=
-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', =
'^abilis,.*', '^abracon,.*', '^abt,.*', '^acer,.*', '^acme,.*', '^actions,.=
*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum=
,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop=
,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^allegro,.*', '^allo,.*', '^a=
llwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarul=
a,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*'=
, '^ampere,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^a=
nbernic,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^apple,.*', '^aptina,=
=2E*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*', '^aries,.*=
', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*'=
, '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asus,.*', '^atheros,=
=2E*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', =
'^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beag=
le,.*', '^bhf,.*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^b=
oundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffa=
lo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cata=
lyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*=
', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipsp=
ark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chu=
wi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cloudengines,.*', '^cnm,.*=
', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*', '^coreriver,=
=2E*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.=
*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cu=
bietech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*'=
, '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^densitron,.*',=
 '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.*', '^digi,.*=
', '^digilent,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,=
=2E*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^drag=
ino,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^=
ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edimax,.*', '^ed=
t,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*=
', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embest,.*', '^eml=
id,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,=
=2E*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engled=
er,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus=
,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar=
,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairphone=
,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*',=
 '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^frida,.*', '^f=
riendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gardena,.*', '^gat=
eworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gemei,.*', =
'^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^goodix,.*', '^google,.*', '^grinn,.*'=
, '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '=
^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^=
hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt=
,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperun,.*', '^hp,.*=
', '^hpe,.*', '^hsg,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*=
', '^hycon,.*', '^hydis,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,=
=2E*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^im=
g,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^inet-tek,.*', '^infineon=
,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innol=
ux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^i=
ntercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom=
,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.=
*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec=
,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^joz,.*', '^kam,.*', '^k=
aro,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', =
'^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*'=
, '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*'=
, '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^le=
adtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '=
^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^linksprite=
,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,.*=
', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.=
*', '^lontium,.*', '^loongson,.*', '^lsi,.*', '^lwn,.*', '^lxa,.*', '^m5sta=
ck,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marvell,.*', '^max=
botix,.*', '^maxim,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '=
^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^=
mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^=
meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^m=
icrocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^mikroe,.*=
', '^mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*', '^mitsubishi=
,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^modtronix,.*', '^moortec,.*'=
, '^mosaixtech,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqm=
aker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^mult=
i-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myi=
r,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*', '^netlogic,=
=2E*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^new=
haven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novtech,.*', '^nutsboard,=
=2E*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^=
ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^one=
plus,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openaila=
b,.*', '^opencores,.*', '^openembed,.*', '^openrisc,.*', '^option,.*', '^or=
anth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', =
'^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^pana=
sonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervas=
ive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^piner=
iver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,=
=2E*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^portwell,.=
*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^primux,.*', '=
^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom=
,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*',=
 '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ra=
mtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^re=
markable,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^=
richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockc=
hip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseappl=
epi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^sato=
z,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^seirobotic=
s,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^s=
ercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^=
shift,.*', '^shimafuji,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '=
^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*'=
, '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconf=
ile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^=
sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitr=
onix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc,.*', '^snps,.=
*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*=
', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^ssi,.*', =
'^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^star=
ry,.*', '^startek,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm=
,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunpl=
us,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synopsy=
s,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^=
tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*', '^=
techstar,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.*', '^t=
fc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^ti,.=
*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^toppol=
y,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*'=
, '^tplink,.*', '^tpo,.*', '^tq,.*', '^traverse,.*', '^tronfy,.*', '^tronsm=
art,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*', '^u-boot,.*', '^=
ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ugoos,.*', '^uniwest,.*', '^upise=
mi,.*', '^urt,.*', '^usi,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,=
=2E*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vicor,.*',=
 '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.=
*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', =
'^vot,.*', '^vxt,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd=
,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^=
wi2wi,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '=
^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm=
,.*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xil=
lybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xn=
ano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoe=
lectronics,.*', '^yic,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,=
=2E*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', =
'^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*', 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/remoteproc@19001000/ap=
u-pwr-rx: failed to match any schema with compatible: ['mediatek,apupwr-rx-=
rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/remoteproc@19001000/ap=
u-mdw: failed to match any schema with compatible: ['mediatek,apu-mdw-rpmsg=
']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/remoteproc@19001000/ap=
u-reviser: failed to match any schema with compatible: ['mediatek,apu-revis=
er-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/remoteproc@19001000/ap=
u-edma: failed to match any schema with compatible: ['mediatek,apu-edma-rpm=
sg']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/remoteproc@19001000/ap=
u-mnoc: failed to match any schema with compatible: ['mediatek,apu-mnoc-rpm=
sg']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: cam-yuv-b@16090000: 'ass=
igned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'interrup=
ts', 'mediatek,cam-id', 'mediatek,larbs', 'reg', 'reg-names' do not match a=
ny of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,cam-yuv.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@17201000: 'mediatek=
,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the rege=
xes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/media=
tek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: re=
g: [[0, 402653184, 0, 4096], [0, 402669568, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: #a=
ddress-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: #s=
ize-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-lat@10000:compatible:0: 'mediatek,mtk-vcodec-lat-mt8188' is not one of=
 ['mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-lat-soc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-lat@10000:clocks: [[45, 4], [45, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-lat@10000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-lat@10000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-lat@10000:clock-names: ['vdec-soc-vdec', 'vdec-soc-lat'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-lat@10000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-lat@10000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-core@25000:compatible:0: 'mediatek,mtk-vcodec-core' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-core@25000:clocks: [[46, 2], [46, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-core@25000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-core@25000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-core@25000:clock-names: ['vdec-vdec', 'vdec-lat'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-core@25000: 'assigned-clocks' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: vc=
odec-core@25000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: 'd=
ma-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: 'a=
ssigned-clock-parents', 'assigned-clocks' do not match any of the regexes: =
'^vcodec-core@[0-9a-f]+$', '^vcodec-lat@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: video-codec@18000000: 'a=
nyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/video-codec@1800000=
0/vcodec-lat@10000: failed to match any schema with compatible: ['mediatek,=
mtk-vcodec-lat-mt8188']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/video-codec@1800000=
0/vcodec-core@25000: failed to match any schema with compatible: ['mediatek=
,mtk-vcodec-core-mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/remoteproc@19001000=
: failed to match any schema with compatible: ['mediatek,mt8188-apusys-rv']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/remoteproc@19001000=
/apu-ctrl: failed to match any schema with compatible: ['mediatek,apu-ctrl-=
rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/remoteproc@19001000=
/apu-pwr-tx: failed to match any schema with compatible: ['mediatek,apupwr-=
tx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: apu-pwr-rx: 'apusys,ther=
mal-zones' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|dma=
cap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(k=
eypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-si=
ngle|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci=
),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70m=
ai,.*', '^8dev,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][=
a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*',=
 '^abilis,.*', '^abracon,.*', '^abt,.*', '^acer,.*', '^acme,.*', '^actions,=
=2E*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adapt=
rum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^allegro,.*', '^allo,.*', =
'^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^ama=
rula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,=
=2E*', '^ampere,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*'=
, '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^apple,.*', '^ap=
tina,.*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*', '^aries=
,.*', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,=
=2E*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asus,.*', '^ath=
eros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', =
'^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*=
', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^b=
eagle,.*', '^bhf,.*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', =
'^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^bu=
ffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calaosystems,.*', '^=
calxeda,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^c=
atalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva=
,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chi=
pspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^=
chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cloudengines,.*', '^cnm=
,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*', '^coreriv=
er,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,=
=2E*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '=
^cubietech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,=
=2E*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^densitron=
,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.*', '^di=
gi,.*', '^digilent,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^d=
link,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^d=
ragino,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*',=
 '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edimax,.*', '=
^edt,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14=
,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embest,.*', '^=
emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclust=
ra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engle=
der,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettu=
s,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exa=
r,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairphon=
e,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*'=
, '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^frida,.*', '^=
friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gardena,.*', '^ga=
teworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gemei,.*',=
 '^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^globalsc=
ale,.*', '^globaltop,.*', '^gmt,.*', '^goodix,.*', '^google,.*', '^grinn,.*=
', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', =
'^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '=
^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hol=
t,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperun,.*', '^hp,.=
*', '^hpe,.*', '^hsg,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.=
*', '^hycon,.*', '^hydis,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm=
,.*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img=
,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^inet-tek,.*', '^infineon,=
=2E*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,=
=2E*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^je=
dec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^joz,.*', '^kam,.*', =
'^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*=
', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,=
=2E*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^ky=
o,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*',=
 '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.=
*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^links=
prite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongson,.*', '^lsi,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.=
*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*=
', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*=
', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*'=
, '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^mikr=
oe,.*', '^mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*', '^mitsu=
bishi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^modtronix,.*', '^moorte=
c,.*', '^mosaixtech,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', =
'^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '=
^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', =
'^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*', '^netl=
ogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^=
newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^n=
intendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novtech,.*', '^nutsboa=
rd,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '=
^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^on=
eplus,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openail=
ab,.*', '^opencores,.*', '^openembed,.*', '^openrisc,.*', '^option,.*', '^o=
ranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*',=
 '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^pan=
asonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^perva=
sive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pine=
river,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx=
,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^portwell,.*=
', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^primux,.*', '^=
probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,=
=2E*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*'=
, '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^r=
amtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^r=
emarkable,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '=
^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rock=
chip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapp=
lepi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^sat=
oz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^seiroboti=
cs,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^=
sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '=
^shift,.*', '^shimafuji,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', =
'^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*=
', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^silicon=
file,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '=
^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sit=
ronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc,.*', '^snps,=
=2E*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony=
,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^ssi,.*=
', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^s=
tarry,.*', '^startek,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^st=
orm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^su=
nplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^syno=
psys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*',=
 '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*',=
 '^techstar,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.*', =
'^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^t=
i,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^top=
poly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,=
=2E*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*', '^u-boot,.*=
', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ugoos,.*', '^uniwest,.*', '^=
upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^v=
amrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vicor,.=
*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visiono=
x,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*=
', '^vot,.*', '^vxt,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '=
^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*',=
 '^wi2wi,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*'=
, '^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '=
^wm,.*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^=
xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '=
^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-op=
toelectronics,.*', '^yic,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^=
ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*',=
 '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*', 'pinctrl-=
[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/remoteproc@19001000=
/apu-pwr-rx: failed to match any schema with compatible: ['mediatek,apupwr-=
rx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/remoteproc@19001000=
/apu-mdw: failed to match any schema with compatible: ['mediatek,apu-mdw-rp=
msg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/remoteproc@19001000=
/apu-reviser: failed to match any schema with compatible: ['mediatek,apu-re=
viser-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/remoteproc@19001000=
/apu-edma: failed to match any schema with compatible: ['mediatek,apu-edma-=
rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/remoteproc@19001000=
/apu-mnoc: failed to match any schema with compatible: ['mediatek,apu-mnoc-=
rpmsg']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: cam-yuv-b@1609=
0000: 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks',=
 'interrupts', 'mediatek,cam-id', 'mediatek,larbs', 'reg', 'reg-names' do n=
ot match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,cam-yuv.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@17201000:=
 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any o=
f the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/media=
tek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: reg: [[0, 402653184, 0, 4096], [0, 402669568, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: #address-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: #size-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-lat@10000:compatible:0: 'mediatek,mtk-vcodec-lat-mt8188' is =
not one of ['mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-lat-soc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-lat@10000:clocks: [[43, 4], [43, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names: ['vdec-soc-vdec', 'vdec-soc-lat'] is =
too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-lat@10000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-lat@10000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-core@25000:compatible:0: 'mediatek,mtk-vcodec-core' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-core@25000:clocks: [[44, 2], [44, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names: ['vdec-vdec', 'vdec-lat'] is too sho=
rt
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-core@25000: 'assigned-clocks' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: vcodec-core@25000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: 'dma-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: 'assigned-clock-parents', 'assigned-clocks' do not match any of the=
 regexes: '^vcodec-core@[0-9a-f]+$', '^vcodec-lat@[0-9a-f]+$', 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: video-codec@18=
000000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/video-cod=
ec@18000000/vcodec-lat@10000: failed to match any schema with compatible: [=
'mediatek,mtk-vcodec-lat-mt8188']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/video-cod=
ec@18000000/vcodec-core@25000: failed to match any schema with compatible: =
['mediatek,mtk-vcodec-core-mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/remotepro=
c@19001000: failed to match any schema with compatible: ['mediatek,mt8188-a=
pusys-rv']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/remotepro=
c@19001000/apu-ctrl: failed to match any schema with compatible: ['mediatek=
,apu-ctrl-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/remotepro=
c@19001000/apu-pwr-tx: failed to match any schema with compatible: ['mediat=
ek,apupwr-tx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: apu-pwr-rx: 'a=
pusys,thermal-zones' does not match any of the regexes: '^#.*', '^(at25|bm|=
devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio)=
,.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#=
pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m=
8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,=
=2E*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a=
-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$'=
, '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acer,.*', '^acme,.*'=
, '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*=
', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgaisler=
,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^allegro,.*', '^=
allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,=
=2E*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*'=
, '^amlogic,.*', '^ampere,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^an=
alogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^apple=
,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*=
', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^as=
ahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asus,.*=
', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^ava=
go,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '=
^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,=
=2E*', '^beagle,.*', '^bhf,.*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^b=
osch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino=
,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calaosyste=
ms,.*', '^calxeda,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.=
*', '^ceva,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,=
=2E*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chun=
ghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cloudengine=
s,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*=
', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*',=
 '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^=
ctu,.*', '^cubietech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^d=
ensitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.=
*', '^digi,.*', '^digilent,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,=
=2E*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnic=
s,.*', '^dragino,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^=
ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edi=
max,.*', '^edt,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '=
^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embe=
st,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*',=
 '^enclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*=
', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.=
*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,=
=2E*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*'=
, '^fairphone,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '=
^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^f=
rida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^garde=
na,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', =
'^gemei,.*', '^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*'=
, '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goodix,.*', '^google,.*'=
, '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoch=
uangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^=
himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hite=
x,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,=
=2E*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynix,.*', '^hyundai,.*', '^i=
2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^ima=
gis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^inet-tek,.*=
', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.=
*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi=
,.*', '^jedec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^joz,.*', '=
^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kieba=
ckpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*=
', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.=
*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^latt=
ice,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*'=
, '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongson,.*', '^lsi,.*', '^lwn,.*', '^lxa=
,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marve=
ll,.*', '^maxbotix,.*', '^maxim,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '=
^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^m=
elfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^m=
entor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^micro=
chip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*',=
 '^mitsubishi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^modtronix,.*', =
'^moortec,.*', '^mosaixtech,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^m=
ps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mt=
i,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxi=
cy,.*', '^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*'=
, '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast=
,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,=
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novtech,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*',=
 '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openrisc,.*', '^optio=
n,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,=
=2E*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine=
64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^p=
lda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qc=
a,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qis=
henglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ral=
ink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^real=
tek,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', =
'^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv=
,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*=
', '^roseapplepi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandis=
k,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*',=
 '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^senso=
rtek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^=
sharp,.*', '^shift,.*', '^shimafuji,.*', '^shiratech,.*', '^si-en,.*', '^si=
-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*',=
 '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*=
', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^si=
nlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^si=
s,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc,=
=2E*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon=
,.*', '^sony,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starf=
ive,.*', '^starry,.*', '^startek,.*', '^ste,.*', '^stericsson,.*', '^storli=
nk,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundan=
ce,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology=
,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^tech=
nologic,.*', '^techstar,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '=
^tesla,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunderc=
omm,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topi=
c,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz=
,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^traverse,.*', '^tronf=
y,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*', '=
^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ugoos,.*', '^uniwe=
st,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*', '^v3,.*', '^vaisal=
a,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^vot,.*', '^vxt,.*', '^wanchanglong,.*', '^wand,.*', '^wavesh=
are,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^w=
hwave,.*', '^wi2wi,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wi=
ngtech,.*', '^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^=
wlf,.*', '^wm,.*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiao=
mi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^ylm,.*', '^yna,.*', '^yones-topte=
ch,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*',=
 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/remotepro=
c@19001000/apu-pwr-rx: failed to match any schema with compatible: ['mediat=
ek,apupwr-rx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/remotepro=
c@19001000/apu-mdw: failed to match any schema with compatible: ['mediatek,=
apu-mdw-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/remotepro=
c@19001000/apu-reviser: failed to match any schema with compatible: ['media=
tek,apu-reviser-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/remotepro=
c@19001000/apu-edma: failed to match any schema with compatible: ['mediatek=
,apu-edma-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/remotepro=
c@19001000/apu-mnoc: failed to match any schema with compatible: ['mediatek=
,apu-mnoc-rpmsg']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: cam-yuv-b@1609=
0000: 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks',=
 'interrupts', 'mediatek,cam-id', 'mediatek,larbs', 'reg', 'reg-names' do n=
ot match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,cam-yuv.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@17201000:=
 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any o=
f the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/media=
tek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: reg: [[0, 402653184, 0, 4096], [0, 402669568, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: #address-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: #size-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-lat@10000:compatible:0: 'mediatek,mtk-vcodec-lat-mt8188' is =
not one of ['mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-lat-soc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-lat@10000:clocks: [[43, 4], [43, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names: ['vdec-soc-vdec', 'vdec-soc-lat'] is =
too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-lat@10000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-lat@10000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-core@25000:compatible:0: 'mediatek,mtk-vcodec-core' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-core@25000:clocks: [[44, 2], [44, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names: ['vdec-vdec', 'vdec-lat'] is too sho=
rt
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-core@25000: 'assigned-clocks' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: vcodec-core@25000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: 'dma-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: 'assigned-clock-parents', 'assigned-clocks' do not match any of the=
 regexes: '^vcodec-core@[0-9a-f]+$', '^vcodec-lat@[0-9a-f]+$', 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: video-codec@18=
000000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/video-cod=
ec@18000000/vcodec-lat@10000: failed to match any schema with compatible: [=
'mediatek,mtk-vcodec-lat-mt8188']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/video-cod=
ec@18000000/vcodec-core@25000: failed to match any schema with compatible: =
['mediatek,mtk-vcodec-core-mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/remotepro=
c@19001000: failed to match any schema with compatible: ['mediatek,mt8188-a=
pusys-rv']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/remotepro=
c@19001000/apu-ctrl: failed to match any schema with compatible: ['mediatek=
,apu-ctrl-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/remotepro=
c@19001000/apu-pwr-tx: failed to match any schema with compatible: ['mediat=
ek,apupwr-tx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: apu-pwr-rx: 'a=
pusys,thermal-zones' does not match any of the regexes: '^#.*', '^(at25|bm|=
devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio)=
,.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#=
pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m=
8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,=
=2E*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a=
-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$'=
, '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acer,.*', '^acme,.*'=
, '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*=
', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgaisler=
,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^allegro,.*', '^=
allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,=
=2E*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*'=
, '^amlogic,.*', '^ampere,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^an=
alogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^apple=
,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*=
', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^as=
ahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asus,.*=
', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^ava=
go,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '=
^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,=
=2E*', '^beagle,.*', '^bhf,.*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^b=
osch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino=
,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calaosyste=
ms,.*', '^calxeda,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.=
*', '^ceva,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,=
=2E*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chun=
ghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cloudengine=
s,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*=
', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*',=
 '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^=
ctu,.*', '^cubietech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^d=
ensitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.=
*', '^digi,.*', '^digilent,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,=
=2E*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnic=
s,.*', '^dragino,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^=
ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edi=
max,.*', '^edt,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '=
^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embe=
st,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*',=
 '^enclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*=
', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.=
*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,=
=2E*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*'=
, '^fairphone,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '=
^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^f=
rida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^garde=
na,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', =
'^gemei,.*', '^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*'=
, '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goodix,.*', '^google,.*'=
, '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoch=
uangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^=
himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hite=
x,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,=
=2E*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynix,.*', '^hyundai,.*', '^i=
2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^ima=
gis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^inet-tek,.*=
', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.=
*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi=
,.*', '^jedec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^joz,.*', '=
^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kieba=
ckpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*=
', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.=
*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^latt=
ice,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*'=
, '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongson,.*', '^lsi,.*', '^lwn,.*', '^lxa=
,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marve=
ll,.*', '^maxbotix,.*', '^maxim,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '=
^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^m=
elfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^m=
entor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^micro=
chip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*',=
 '^mitsubishi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^modtronix,.*', =
'^moortec,.*', '^mosaixtech,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^m=
ps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mt=
i,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxi=
cy,.*', '^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*'=
, '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast=
,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,=
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novtech,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*',=
 '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openrisc,.*', '^optio=
n,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,=
=2E*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine=
64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^p=
lda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qc=
a,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qis=
henglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ral=
ink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^real=
tek,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', =
'^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv=
,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*=
', '^roseapplepi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandis=
k,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*',=
 '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^senso=
rtek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^=
sharp,.*', '^shift,.*', '^shimafuji,.*', '^shiratech,.*', '^si-en,.*', '^si=
-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*',=
 '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*=
', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^si=
nlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^si=
s,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc,=
=2E*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon=
,.*', '^sony,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starf=
ive,.*', '^starry,.*', '^startek,.*', '^ste,.*', '^stericsson,.*', '^storli=
nk,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundan=
ce,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology=
,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^tech=
nologic,.*', '^techstar,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '=
^tesla,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunderc=
omm,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topi=
c,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz=
,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^traverse,.*', '^tronf=
y,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*', '=
^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ugoos,.*', '^uniwe=
st,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*', '^v3,.*', '^vaisal=
a,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^vot,.*', '^vxt,.*', '^wanchanglong,.*', '^wand,.*', '^wavesh=
are,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^w=
hwave,.*', '^wi2wi,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wi=
ngtech,.*', '^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^=
wlf,.*', '^wm,.*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiao=
mi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^ylm,.*', '^yna,.*', '^yones-topte=
ch,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*',=
 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/remotepro=
c@19001000/apu-pwr-rx: failed to match any schema with compatible: ['mediat=
ek,apupwr-rx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/remotepro=
c@19001000/apu-mdw: failed to match any schema with compatible: ['mediatek,=
apu-mdw-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/remotepro=
c@19001000/apu-reviser: failed to match any schema with compatible: ['media=
tek,apu-reviser-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/remotepro=
c@19001000/apu-edma: failed to match any schema with compatible: ['mediatek=
,apu-edma-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/remotepro=
c@19001000/apu-mnoc: failed to match any schema with compatible: ['mediatek=
,apu-mnoc-rpmsg']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: cam-yuv-b@1609=
0000: 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks',=
 'interrupts', 'mediatek,cam-id', 'mediatek,larbs', 'reg', 'reg-names' do n=
ot match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,cam-yuv.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@17201000:=
 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any o=
f the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/media=
tek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: reg: [[0, 402653184, 0, 4096], [0, 402669568, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: #address-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: #size-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-lat@10000:compatible:0: 'mediatek,mtk-vcodec-lat-mt8188' is =
not one of ['mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-lat-soc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-lat@10000:clocks: [[43, 4], [43, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names: ['vdec-soc-vdec', 'vdec-soc-lat'] is =
too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-lat@10000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-lat@10000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-core@25000:compatible:0: 'mediatek,mtk-vcodec-core' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-core@25000:clocks: [[44, 2], [44, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names: ['vdec-vdec', 'vdec-lat'] is too sho=
rt
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-core@25000: 'assigned-clocks' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: vcodec-core@25000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: 'dma-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: 'assigned-clock-parents', 'assigned-clocks' do not match any of the=
 regexes: '^vcodec-core@[0-9a-f]+$', '^vcodec-lat@[0-9a-f]+$', 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: video-codec@18=
000000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/video-cod=
ec@18000000/vcodec-lat@10000: failed to match any schema with compatible: [=
'mediatek,mtk-vcodec-lat-mt8188']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/video-cod=
ec@18000000/vcodec-core@25000: failed to match any schema with compatible: =
['mediatek,mtk-vcodec-core-mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/remotepro=
c@19001000: failed to match any schema with compatible: ['mediatek,mt8188-a=
pusys-rv']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/remotepro=
c@19001000/apu-ctrl: failed to match any schema with compatible: ['mediatek=
,apu-ctrl-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/remotepro=
c@19001000/apu-pwr-tx: failed to match any schema with compatible: ['mediat=
ek,apupwr-tx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: apu-pwr-rx: 'a=
pusys,thermal-zones' does not match any of the regexes: '^#.*', '^(at25|bm|=
devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio)=
,.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#=
pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m=
8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,=
=2E*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a=
-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$'=
, '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acer,.*', '^acme,.*'=
, '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*=
', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgaisler=
,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^allegro,.*', '^=
allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,=
=2E*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*'=
, '^amlogic,.*', '^ampere,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^an=
alogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^apple=
,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*=
', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^as=
ahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asus,.*=
', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^ava=
go,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '=
^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,=
=2E*', '^beagle,.*', '^bhf,.*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^b=
osch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino=
,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calaosyste=
ms,.*', '^calxeda,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.=
*', '^ceva,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,=
=2E*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chun=
ghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cloudengine=
s,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*=
', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*',=
 '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^=
ctu,.*', '^cubietech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^d=
ensitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.=
*', '^digi,.*', '^digilent,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,=
=2E*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnic=
s,.*', '^dragino,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^=
ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edi=
max,.*', '^edt,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '=
^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embe=
st,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*',=
 '^enclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*=
', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.=
*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,=
=2E*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*'=
, '^fairphone,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '=
^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^f=
rida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^garde=
na,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', =
'^gemei,.*', '^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*'=
, '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goodix,.*', '^google,.*'=
, '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoch=
uangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^=
himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hite=
x,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,=
=2E*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynix,.*', '^hyundai,.*', '^i=
2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^ima=
gis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^inet-tek,.*=
', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.=
*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi=
,.*', '^jedec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^joz,.*', '=
^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kieba=
ckpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*=
', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.=
*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^latt=
ice,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*'=
, '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongson,.*', '^lsi,.*', '^lwn,.*', '^lxa=
,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marve=
ll,.*', '^maxbotix,.*', '^maxim,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '=
^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^m=
elfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^m=
entor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^micro=
chip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*',=
 '^mitsubishi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^modtronix,.*', =
'^moortec,.*', '^mosaixtech,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^m=
ps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mt=
i,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxi=
cy,.*', '^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*'=
, '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast=
,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,=
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novtech,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*',=
 '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openrisc,.*', '^optio=
n,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,=
=2E*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine=
64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^p=
lda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qc=
a,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qis=
henglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ral=
ink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^real=
tek,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', =
'^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv=
,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*=
', '^roseapplepi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandis=
k,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*',=
 '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^senso=
rtek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^=
sharp,.*', '^shift,.*', '^shimafuji,.*', '^shiratech,.*', '^si-en,.*', '^si=
-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*',=
 '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*=
', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^si=
nlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^si=
s,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc,=
=2E*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon=
,.*', '^sony,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starf=
ive,.*', '^starry,.*', '^startek,.*', '^ste,.*', '^stericsson,.*', '^storli=
nk,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundan=
ce,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology=
,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^tech=
nologic,.*', '^techstar,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '=
^tesla,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunderc=
omm,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topi=
c,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz=
,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^traverse,.*', '^tronf=
y,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*', '=
^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ugoos,.*', '^uniwe=
st,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*', '^v3,.*', '^vaisal=
a,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^vot,.*', '^vxt,.*', '^wanchanglong,.*', '^wand,.*', '^wavesh=
are,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^w=
hwave,.*', '^wi2wi,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wi=
ngtech,.*', '^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^=
wlf,.*', '^wm,.*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiao=
mi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^ylm,.*', '^yna,.*', '^yones-topte=
ch,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*',=
 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/remotepro=
c@19001000/apu-pwr-rx: failed to match any schema with compatible: ['mediat=
ek,apupwr-rx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/remotepro=
c@19001000/apu-mdw: failed to match any schema with compatible: ['mediatek,=
apu-mdw-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/remotepro=
c@19001000/apu-reviser: failed to match any schema with compatible: ['media=
tek,apu-reviser-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/remotepro=
c@19001000/apu-edma: failed to match any schema with compatible: ['mediatek=
,apu-edma-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/remotepro=
c@19001000/apu-mnoc: failed to match any schema with compatible: ['mediatek=
,apu-mnoc-rpmsg']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: cam-yuv-b@1609=
0000: 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks',=
 'interrupts', 'mediatek,cam-id', 'mediatek,larbs', 'reg', 'reg-names' do n=
ot match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,cam-yuv.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@17201000:=
 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any o=
f the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/media=
tek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: reg: [[0, 402653184, 0, 4096], [0, 402669568, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: #address-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: #size-cells:0:0: 2 was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-lat@10000:compatible:0: 'mediatek,mtk-vcodec-lat-mt8188' is =
not one of ['mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-lat-soc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-lat@10000:clocks: [[43, 4], [43, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-lat@10000:clock-names: ['vdec-soc-vdec', 'vdec-soc-lat'] is =
too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-lat@10000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-lat@10000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-core@25000:compatible:0: 'mediatek,mtk-vcodec-core' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-core@25000:clocks: [[44, 2], [44, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names:0: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names:1: 'soc-vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-core@25000:clock-names: ['vdec-vdec', 'vdec-lat'] is too sho=
rt
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-core@25000: 'assigned-clocks' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: vcodec-core@25000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: 'dma-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: 'assigned-clock-parents', 'assigned-clocks' do not match any of the=
 regexes: '^vcodec-core@[0-9a-f]+$', '^vcodec-lat@[0-9a-f]+$', 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-su=
bdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: video-codec@18=
000000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/video-cod=
ec@18000000/vcodec-lat@10000: failed to match any schema with compatible: [=
'mediatek,mtk-vcodec-lat-mt8188']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/video-cod=
ec@18000000/vcodec-core@25000: failed to match any schema with compatible: =
['mediatek,mtk-vcodec-core-mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/remotepro=
c@19001000: failed to match any schema with compatible: ['mediatek,mt8188-a=
pusys-rv']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/remotepro=
c@19001000/apu-ctrl: failed to match any schema with compatible: ['mediatek=
,apu-ctrl-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/remotepro=
c@19001000/apu-pwr-tx: failed to match any schema with compatible: ['mediat=
ek,apupwr-tx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: apu-pwr-rx: 'a=
pusys,thermal-zones' does not match any of the regexes: '^#.*', '^(at25|bm|=
devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio)=
,.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#=
pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m=
8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,=
=2E*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a=
-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$'=
, '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acer,.*', '^acme,.*'=
, '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*=
', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgaisler=
,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^allegro,.*', '^=
allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,=
=2E*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*'=
, '^amlogic,.*', '^ampere,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^an=
alogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^apple=
,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*=
', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^as=
ahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asus,.*=
', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^ava=
go,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '=
^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,=
=2E*', '^beagle,.*', '^bhf,.*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^b=
osch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino=
,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calaosyste=
ms,.*', '^calxeda,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.=
*', '^ceva,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,=
=2E*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chun=
ghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cloudengine=
s,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*=
', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*',=
 '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^=
ctu,.*', '^cubietech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^d=
ensitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.=
*', '^digi,.*', '^digilent,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,=
=2E*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnic=
s,.*', '^dragino,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^=
ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edi=
max,.*', '^edt,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '=
^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embe=
st,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*',=
 '^enclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*=
', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.=
*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,=
=2E*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*'=
, '^fairphone,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '=
^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^f=
rida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^garde=
na,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', =
'^gemei,.*', '^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*'=
, '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goodix,.*', '^google,.*'=
, '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoch=
uangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^=
himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hite=
x,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,=
=2E*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynix,.*', '^hyundai,.*', '^i=
2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^ima=
gis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^inet-tek,.*=
', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.=
*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi=
,.*', '^jedec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^joz,.*', '=
^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kieba=
ckpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*=
', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.=
*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^latt=
ice,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*'=
, '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongson,.*', '^lsi,.*', '^lwn,.*', '^lxa=
,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marve=
ll,.*', '^maxbotix,.*', '^maxim,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '=
^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^m=
elfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^m=
entor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^micro=
chip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*',=
 '^mitsubishi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^modtronix,.*', =
'^moortec,.*', '^mosaixtech,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^m=
ps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mt=
i,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxi=
cy,.*', '^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*'=
, '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast=
,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,=
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novtech,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*',=
 '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openrisc,.*', '^optio=
n,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,=
=2E*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine=
64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^p=
lda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qc=
a,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qis=
henglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ral=
ink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^real=
tek,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', =
'^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv=
,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*=
', '^roseapplepi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandis=
k,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*',=
 '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^senso=
rtek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^=
sharp,.*', '^shift,.*', '^shimafuji,.*', '^shiratech,.*', '^si-en,.*', '^si=
-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*',=
 '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*=
', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^si=
nlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^si=
s,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc,=
=2E*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon=
,.*', '^sony,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starf=
ive,.*', '^starry,.*', '^startek,.*', '^ste,.*', '^stericsson,.*', '^storli=
nk,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundan=
ce,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology=
,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^tech=
nologic,.*', '^techstar,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '=
^tesla,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunderc=
omm,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topi=
c,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz=
,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^traverse,.*', '^tronf=
y,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*', '=
^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ugoos,.*', '^uniwe=
st,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*', '^v3,.*', '^vaisal=
a,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^vot,.*', '^vxt,.*', '^wanchanglong,.*', '^wand,.*', '^wavesh=
are,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^w=
hwave,.*', '^wi2wi,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wi=
ngtech,.*', '^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^=
wlf,.*', '^wm,.*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiao=
mi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^ylm,.*', '^yna,.*', '^yones-topte=
ch,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*',=
 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/remotepro=
c@19001000/apu-pwr-rx: failed to match any schema with compatible: ['mediat=
ek,apupwr-rx-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/remotepro=
c@19001000/apu-mdw: failed to match any schema with compatible: ['mediatek,=
apu-mdw-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/remotepro=
c@19001000/apu-reviser: failed to match any schema with compatible: ['media=
tek,apu-reviser-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/remotepro=
c@19001000/apu-edma: failed to match any schema with compatible: ['mediatek=
,apu-edma-rpmsg']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/remotepro=
c@19001000/apu-mnoc: failed to match any schema with compatible: ['mediatek=
,apu-mnoc-rpmsg']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
