Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE4483CC8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725530387; cv=none; b=UR9jZKpKNSY1UMcS8khydpba2FiKKvvc/2q2LVmbZ3qKdSTPax4IWwjsvUehJ39ueYCbEK4v+a/PJKXHrMCnkx5TbbWlTyfMn3In/4jGSF4xBbSI7jSRI/TRp7DpgD/f7ZiAuu8I5S1oTDbQ0yuHYZI2FwBnzfPPu/APK2i2FJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725530387; c=relaxed/simple;
	bh=Eodmu75+XuEr3W/HICK+TMv0O0vNw3dwe/8NCNmobu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AiucSpXu9Mb1L558puWGvlun8EvKYBZ5HGDzpk8fGyMX72ukBLh31Aqb/xAFT0It5+RaiIZHoQo+z0QW2PCswwguKtH8MiKzO/SAxuhvtNJIYEIMgeB6YE470Ro67kjvYNzabRT6EcODL709snxAAv8ZR4tT3zhlVYOuXM8H9Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4xcxUrE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4xcxUrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725530385; x=1757066385;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Eodmu75+XuEr3W/HICK+TMv0O0vNw3dwe/8NCNmobu0=;
  b=P4xcxUrElCziY3Rb9X/sCm6A0h/nsiBFPnX4dn7qhPqMxGNzU7JjM7zB
   faPwvvX6PGY54bnbcmp9Ig2hMMt8Q1tvXghDJskshbN4dwJPwJkKSUC2M
   4bU6irW14VyXOvHW77LK/WvEK2pqWiA6Vkxa1egno9iykxYtNQ4UqvCom
   VkcowYR8NUzNxiK69BBCNl4ZeOUTx3kGShUOiC1cjPz8w/asEhBhCBkR5
   oD4MLV7EArK2h+/NW3TsVMfQU9F2MMAlj9Z2pfsPNvTp2cqgYiTKcG7S0
   Ad4LwqEog7gHBTnUkMjUry4s6TTKSBrkfOEQWbIm+ILvUUnDImj9IeHsY
   Q==;
X-CSE-ConnectionGUID: VYCEIlAeSl+ykq2CTCj9Yg==
X-CSE-MsgGUID: 66nmvqtBSDWJlA3WbMD4Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="46767278"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="46767278"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 02:59:45 -0700
X-CSE-ConnectionGUID: 6a3zcqtuTWu+NLUd6CiOiQ==
X-CSE-MsgGUID: diU0Qd78TH+bBGcN7QLkSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="103032355"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Sep 2024 02:59:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm9HB-0009Vv-1H;
	Thu, 05 Sep 2024 09:59:41 +0000
Date: Thu, 5 Sep 2024 17:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kalle Valo <kvalo@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 8636/9291]
 arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: wifi@1:
 marvell,caldata-txpwrlimit-2g: [1, 0, 6, 0, 8, 2, 137, 1, 36, 0, 103, 9, 20,
 1, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10,
 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137...
Message-ID: <202409051754.CkMRYhcd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   fdadd93817f124fd0ea6ef251d4a1068b7feceba
commit: 25f855413885bbce8a0dd5d7dea670a0da1cdbe5 [8636/9291] dt-bindings: n=
et: wireless: convert marvel-8xxx.txt to yaml format
config: arm-randconfig-052-20240904 (https://download.01.org/0day-ci/archiv=
e/20240905/202409051754.CkMRYhcd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240905/202409051754.CkMRYhcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051754.CkMRYhcd-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1233.20-1235.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: /: memory: False sch=
ema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648=
]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: wifi@1: marvell,cald=
ata-txpwrlimit-2g: [1, 0, 6, 0, 8, 2, 137, 1, 36, 0, 103, 9, 20, 1, 0, 15, =
1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12,=
 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 2, 0, 15, 1, 12, 2=
, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12,=
 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 3, 0, 15, 1, 12, 2, 12, 3,=
 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, =
14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 4, 0, 15, 1, 12, 2, 12, 3, 12, 4, =
12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 1=
5, 9, 137, 1, 36, 0, 103, 9, 20, 5, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 1=
2, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 13=
7, 1, 36, 0, 103, 9, 20, 6, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12=
, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36=
, 0, 103, 9, 20, 7, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, =
8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103=
, 9, 20, 8, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9,=
 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20,=
 9, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, =
12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 10, 0, =
15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11,=
 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 11, 0, 15, 1, =
12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12=
, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 12, 0, 15, 1, 12, 2, =
12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 1=
3, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 13, 0, 15, 1, 12, 2, 12, 3, =
12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 1=
4, 9, 15, 9] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/marvell,sd8=
787.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: wifi@1: marvell,cald=
ata-txpwrlimit-5g-sub2: [1, 0, 6, 0, 54, 1, 137, 1, 58, 0, 136, 19, 20, 149=
, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10, 10, 11, 1=
0, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, 5, 21, 5, 2=
2, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, 19, 20, 153, 1=
, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10, 10, 11, 10, =
12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, 5, 21, 5, 22, =
4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, 19, 20, 157, 1, 1=
1, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10, 10, 11, 10, 12,=
 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, 5, 21, 5, 22, 4, =
23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, 19, 20, 161, 1, 11, =
2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10, 10, 11, 10, 12, 10=
, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, 5, 21, 5, 22, 4, 23,=
 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, 19, 20, 165, 1, 11, 2, =
11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10, 10, 11, 10, 12, 10, 1=
3, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, 5, 21, 5, 22, 4, 23, 4,=
 24, 5, 25, 5, 26, 5, 27, 5] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/marvell,sd8=
787.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: trackpad@2c: 'vcc-su=
pply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: power-controller: 'a=
ssigned-clock-parents', 'assigned-clocks' do not match any of the regexes: =
'^power-domain@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: power-controller: 'a=
nyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: /sound: failed to ma=
tch any schema with compatible: ['rockchip,rockchip-audio-max98090']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
