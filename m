Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798AF1E5B6F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047115; cv=none; b=rsKmDEh0bpdS4R25IqBBFWsLBP+ZBmjKCMCnA4l6uqViNO0/7MbUziXsSL6ElRE6wifeYZd/V1kiJ+YXc+8/SXLbPpPIgdvD7X7QcmKsx3O1kz0Pm3TSzRwntUUWKaZoyzbpByhrbr70ciIhMizWDoJ41PHoOO8wvQM+yxxk0v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047115; c=relaxed/simple;
	bh=W/aBfIwRRnHN/Ar72h8TyOYiYS7EXEnY7VHZQJWq6JU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mH7awxKHwb1hUpdD4EiXxgXciMnQdmcYCSe/ftZ87kSaw6oZJGW7t2AJOB+XCBJ5ZoWXw6XF9KYPaO0Oy2I/NRU75kWj1fkErQN4EeRskmF6UnF3mS061X+i1JZIJb3bj5uROskhALJ1AlEHr+qHHJdLg4y914H1fewdeWsbw7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBeP/0KX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBeP/0KX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740047107; x=1771583107;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W/aBfIwRRnHN/Ar72h8TyOYiYS7EXEnY7VHZQJWq6JU=;
  b=ZBeP/0KXtDcIV7553hd/bSaVOT5HZZOaAoGEjbkR1KGzS51YyyUGqAPq
   Oyj4QPCpKiQSrajCirOvhKehcgxAufel/1Mcmy5vNNj/5ey8ahX3grQoC
   SZmIDqipqQ7XVU5r4Wyes3cOUKbBrpVknHnRpvRkkXivui8NguwGiDL5U
   PCOkDSZf+dcdYndm+tKwS33XH07o5akXe1/nrj87xXSmDsu6zF93nYTYJ
   6Ujj4A219yv5YcrlC2eLkK+RigOBRq9MI553V8Ng2+GBwBP9GICPApjhr
   CqMRZk+V7a7s3Nf+9JXK4h9KbpletxikJiGuOGHOkQkwYeA0TbDltvHZQ
   Q==;
X-CSE-ConnectionGUID: 8P9sC+qQRLKT5/v8+0MjgQ==
X-CSE-MsgGUID: Pi/9Rn1pSy21iv37QKNpIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="66177816"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="66177816"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:25:05 -0800
X-CSE-ConnectionGUID: ZCoVwOVjSx6uPcIKuxlE1g==
X-CSE-MsgGUID: keK/xtcVTpi30Il4HlKyDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="114731919"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Feb 2025 02:25:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl3jj-00049j-1Z;
	Thu, 20 Feb 2025 10:24:58 +0000
Date: Thu, 20 Feb 2025 18:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lukasz Majewski <lukma@denx.de>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 3735/5164]
 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:63.32-77.5: Warning
 (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit
 name, but no reg or ranges property
Message-ID: <202502201852.Qrlri4Fj-lkp@intel.com>
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
head:   50a0c754714aa3ea0b0e62f3765eb666a1579f24
commit: 0335256a6b78e33e88e3b297edcbf14402957d06 [3735/5164] ARM: dts: mxs:=
 Add descriptions for imx287 based btt3-[012] devices
config: arm-randconfig-052-20250219 (https://download.01.org/0day-ci/archiv=
e/20250220/202502201852.Qrlri4Fj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.2
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250220/202502201852.Qrlri4Fj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201852.Qrlri4Fj-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:63.32-77.5: Warning (unit_addr=
ess_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but=
 no reg or ranges property
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-status-cfg@0)
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:227.27-236.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:344.36-353.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:392.36-401.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:414.30-423.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:180.22-191.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@1)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
ssp1-sdio@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /: compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['lwn,imx28-btt3', 'fsl,imx28'] is too short
   	arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /: compatible: 'oneOf' cond=
itional failed, one must be fixed:
   		['lwn,imx28-btt3', 'fsl,imx28'] is too short
   		'lwn,imx28-btt3' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'lwn,imx28-btt3' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   	['lwn,imx28-btt3', 'fsl,imx28'] is too long
   	'lwn,imx28-btt3' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
--
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /: failed to match any schem=
a with compatible: ['lwn,imx28-btt3', 'fsl,imx28']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80010000: $nodename:0: '=
spi@80010000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80010000: Unevaluated pr=
operties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cl=
ocks', 'non-removable', 'vmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80012000: $nodename:0: '=
spi@80012000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80012000: Unevaluated pr=
operties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cl=
ocks', 'keep-power-in-suspend', 'mmc-pwrseq', 'no-1-8-v', 'non-removable', =
'vmmc-supply', 'wlan@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80014000: Unevaluated pr=
operties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80016000: Unevaluated pr=
operties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: pinctrl@80018000: compatible=
: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: pinctrl@80018000: 'auart0-2p=
ins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2=
-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0',=
 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'd=
uart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'hog@1', 'i2c0@0', 'i=
2c0@1', 'i2c1@0', 'i2c1@1', 'keypad-bttc@0', 'lcdif-16bit@0', 'lcdif-18bit@=
0', 'lcdif-24bit@0', 'lcdif-bttc@0', 'lcdif-bttc@1', 'lcdif-sync@0', 'mac0@=
0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc=
0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@=
0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pw=
m0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'saif0@0', 'saif0@1', 'saif1=
@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssp1-sdio@0', 'usb0@0', 'usb0@1', 'usb0=
id1@0', 'usb0id@0', 'usb1@0', 'usb1@1', 'wifi-en-pin@0' do not match any of=
 the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx2=
8-digctl', 'fsl,imx23-digctl']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx2=
8-digctl', 'fsl,imx23-digctl']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbx-bus@80040=
000/lradc@80050000: failed to match any schema with compatible: ['fsl,imx28=
-lradc']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbx-bus@80040=
000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx2=
8-timrot', 'fsl,timrot']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbx-bus@80040=
000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx2=
8-timrot', 'fsl,timrot']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /panel: failed to match any =
schema with compatible: ['powertip,hx8238a', 'panel-dpi']
--
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:63.32-77.5: Warning (unit_addr=
ess_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but=
 no reg or ranges property
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-status-cfg@0)
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:227.27-236.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:344.36-353.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:392.36-401.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:414.30-423.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:180.22-191.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@1)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
ssp1-sdio@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: /: compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['lwn,imx28-btt3', 'fsl,imx28'] is too short
   	arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: /: compatible: 'oneOf' cond=
itional failed, one must be fixed:
   		['lwn,imx28-btt3', 'fsl,imx28'] is too short
   		'lwn,imx28-btt3' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'lwn,imx28-btt3' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   	['lwn,imx28-btt3', 'fsl,imx28'] is too long
   	'lwn,imx28-btt3' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
--
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:63.32-77.5: Warning (unit_addr=
ess_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but=
 no reg or ranges property
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-status-cfg@0)
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:227.27-236.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:344.36-353.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:392.36-401.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:414.30-423.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:180.22-191.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@1)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
ssp1-sdio@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: /: compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['lwn,imx28-btt3', 'fsl,imx28'] is too short
   	arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: /: compatible: 'oneOf' cond=
itional failed, one must be fixed:
   		['lwn,imx28-btt3', 'fsl,imx28'] is too short
   		'lwn,imx28-btt3' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'lwn,imx28-btt3' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   	['lwn,imx28-btt3', 'fsl,imx28'] is too long
   	'lwn,imx28-btt3' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']

vim +63 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi

     8=09
     9	/ {
    10		model =3D "BTT3";
    11=09
    12		compatible =3D "lwn,imx28-btt3", "fsl,imx28";
    13=09
    14		chosen {
    15		       bootargs =3D "root=3D/dev/mmcblk0p2 rootfstype=3Dext4 ro roo=
twait console=3DttyAMA0,115200 panic=3D1 quiet";
    16		};
    17=09
    18		memory@40000000 {
    19			reg =3D <0x40000000 0x10000000>;
    20			device_type =3D "memory";
    21		};
    22=09
    23		panel {
    24			compatible =3D "powertip,hx8238a", "panel-dpi";
    25			power-supply =3D <&reg_3v3>;
    26			width-mm =3D <70>;
    27			height-mm =3D <52>;
    28=09
    29			panel-timing {
    30				clock-frequency =3D <6500000>;
    31				hactive =3D <320>;
    32				vactive =3D <240>;
    33				hfront-porch =3D <20>;
    34				hback-porch =3D <38>;
    35				hsync-len =3D <30>;
    36				vfront-porch =3D <4>;
    37				vback-porch =3D <14>;
    38				vsync-len =3D <4>;
    39				hsync-active =3D <0>;
    40				vsync-active =3D <0>;
    41				de-active =3D <0>;
    42				pixelclk-active =3D <1>;
    43			};
    44=09
    45			port {
    46				panel_in: endpoint {
    47					remote-endpoint =3D <&display_out>;
    48				};
    49			};
    50		};
    51=09
    52		poweroff {
    53			compatible =3D "gpio-poweroff";
    54			gpios =3D <&gpio0 24 GPIO_ACTIVE_HIGH>;
    55		};
    56=09
    57		sound {
    58			compatible =3D "simple-audio-card";
    59			simple-audio-card,name =3D "BTTC Audio";
    60			simple-audio-card,widgets =3D "Speaker", "BTTC Speaker";
    61			simple-audio-card,routing =3D "BTTC Speaker", "SPKOUTN", "BTTC Spe=
aker", "SPKOUTP";
    62=09
  > 63			simple-audio-card,dai-link@0 {
    64				format =3D "left_j";
    65				bitclock-master =3D <&dai0_master>;
    66				frame-master =3D <&dai0_master>;
    67				mclk-fs =3D <256>;
    68=09
    69				dai0_master: cpu {
    70					sound-dai =3D <&saif0>;
    71				};
    72=09
    73				codec {
    74					sound-dai =3D <&wm89xx>;
    75					clocks =3D <&saif0>;
    76				};
    77			};
    78		};
    79=09
    80		wifi_pwrseq: sdio-pwrseq {
    81			compatible =3D "mmc-pwrseq-simple";
    82			pinctrl-names =3D "default";
    83			pinctrl-0 =3D <&wifi_en_pin_bttc>;
    84			reset-gpios =3D <&gpio0 27 GPIO_ACTIVE_LOW>;
    85			/* W1-163 needs 60us for WL_EN to be low and */
    86			/* 150ms after high before downloading FW is possible */
    87			post-power-on-delay-ms =3D <200>;
    88			power-off-delay-us =3D <100>;
    89		};
    90	};
    91=09
    92	&auart0 {
    93		pinctrl-names =3D "default";
    94		pinctrl-0 =3D <&auart0_2pins_a>;
    95		status =3D "okay";
    96	};
    97=09
    98	&auart3 {
    99		pinctrl-names =3D "default";
   100		pinctrl-0 =3D <&auart3_pins_a>;
   101		uart-has-rtscts;
   102		status =3D "okay";
   103	};
   104=09
   105	&i2c0 {
   106		wm89xx: audio-codec@1a {
   107			compatible =3D "wlf,wm8940";
   108			reg =3D <0x1a>;
   109			#sound-dai-cells =3D <0>;
   110		};
   111	};
   112=09
   113	&lcdif {
   114		pinctrl-names =3D "default";
   115		pinctrl-0 =3D <&lcdif_24bit_pins_a>, <&lcdif_sync_pins_bttc>,
   116			    <&lcdif_reset_pins_bttc>;
   117		status =3D "okay";
   118=09
   119		port {
   120			display_out: endpoint {
   121				remote-endpoint =3D <&panel_in>;
   122			};
   123		};
   124	};
   125=09
   126	&mac0 {
   127		clocks =3D <&clks 57>, <&clks 57>, <&clks 64>;
   128		clock-names =3D "ipg", "ahb", "enet_out";
   129		phy-handle =3D <&mac0_phy>;
   130		phy-mode =3D "rmii";
   131		phy-supply =3D <&reg_3v3>;
   132		/*
   133		 * This MAC address is adjusted during production.
   134		 * Value specified below is used as a fallback during recovery.
   135		 */
   136		local-mac-address =3D [ 00 11 B8 00 BF 8A ];
   137		status =3D "okay";
   138=09
   139		mdio {
   140			#address-cells =3D <1>;
   141			#size-cells =3D <0>;
   142=09
   143			mac0_phy: ethernet-phy@0 {
   144				/* LAN8720Ai - PHY ID */
   145				compatible =3D "ethernet-phy-id0007.c0f0","ethernet-phy-ieee802.3=
-c22";
   146				reg =3D <0>;
   147				smsc,disable-energy-detect;
   148				max-speed =3D <100>;
   149				reset-gpios =3D <&gpio4 12 GPIO_ACTIVE_LOW>;
   150				reset-assert-us =3D <1000>;
   151				reset-deassert-us =3D <1000>;
   152			};
   153		};
   154	};
   155=09
   156	&pinctrl {
   157		pinctrl-names =3D "default";
   158		pinctrl-0 =3D <&hog_pins_a>, <&hog_pins_rev>;
   159=09
 > 160		hog_pins_a: hog@0 {
   161			reg =3D <0>;
   162			fsl,pinmux-ids =3D <
   163				MX28_PAD_GPMI_RDY2__GPIO_0_22
   164				MX28_PAD_GPMI_RDY3__GPIO_0_23
   165				MX28_PAD_GPMI_RDN__GPIO_0_24
   166				MX28_PAD_LCD_VSYNC__GPIO_1_28
   167				MX28_PAD_SSP2_SS1__GPIO_2_20
   168				MX28_PAD_SSP2_SS2__GPIO_2_21
   169				MX28_PAD_AUART2_CTS__GPIO_3_10
   170				MX28_PAD_AUART2_RTS__GPIO_3_11
   171				MX28_PAD_GPMI_WRN__GPIO_0_25
   172				MX28_PAD_ENET0_RXD2__GPIO_4_9
   173				MX28_PAD_ENET0_TXD2__GPIO_4_11
   174			>;
   175			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   176			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   177			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   178		};
   179=09
   180		hog_pins_rev: hog@1 {
   181			reg =3D <1>;
   182			fsl,pinmux-ids =3D <
   183				MX28_PAD_ENET0_RXD3__GPIO_4_10
   184				MX28_PAD_ENET0_TX_CLK__GPIO_4_5
   185				MX28_PAD_ENET0_COL__GPIO_4_14
   186				MX28_PAD_ENET0_CRS__GPIO_4_15
   187			>;
   188			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   189			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   190			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   191		};
   192=09
 > 193		keypad_pins_bttc: keypad-bttc@0 {
   194			reg =3D <0>;
   195			fsl,pinmux-ids =3D <
   196				MX28_PAD_GPMI_D00__GPIO_0_0
   197				MX28_PAD_AUART0_CTS__GPIO_3_2
   198				MX28_PAD_AUART0_RTS__GPIO_3_3
   199				MX28_PAD_GPMI_D03__GPIO_0_3
   200				MX28_PAD_GPMI_D04__GPIO_0_4
   201				MX28_PAD_GPMI_D05__GPIO_0_5
   202				MX28_PAD_GPMI_D06__GPIO_0_6
   203				MX28_PAD_GPMI_D07__GPIO_0_7
   204				MX28_PAD_GPMI_CE1N__GPIO_0_17
   205				MX28_PAD_GPMI_CE2N__GPIO_0_18
   206				MX28_PAD_GPMI_CE3N__GPIO_0_19
   207				MX28_PAD_GPMI_RDY0__GPIO_0_20
   208			>;
   209			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   210			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   211			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   212		};
   213=09
 > 214		lcdif_sync_pins_bttc: lcdif-bttc@0 {
   215			reg =3D <0>;
   216			fsl,pinmux-ids =3D <
   217				MX28_PAD_LCD_DOTCLK__LCD_DOTCLK
   218				MX28_PAD_LCD_ENABLE__LCD_ENABLE
   219				MX28_PAD_LCD_HSYNC__LCD_HSYNC
   220				MX28_PAD_LCD_RD_E__LCD_VSYNC
   221			>;
   222			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   223			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   224			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   225		};
   226=09
   227		lcdif_reset_pins_bttc: lcdif-bttc@1 {
   228			reg =3D <1>;
   229			fsl,pinmux-ids =3D <
   230				MX28_PAD_LCD_RESET__GPIO_3_30
   231			>;
   232			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   233			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   234			fsl,pull-up =3D <MXS_PULL_ENABLE>;
   235		};
   236=09
 > 237		ssp1_sdio_pins_a: ssp1-sdio@0 {
   238			reg =3D <0>;
   239			fsl,pinmux-ids =3D <
   240				MX28_PAD_SSP1_DATA0__SSP1_D0
   241				MX28_PAD_GPMI_D01__SSP1_D1
   242				MX28_PAD_GPMI_D02__SSP1_D2
   243				MX28_PAD_SSP1_DATA3__SSP1_D3
   244				MX28_PAD_SSP1_CMD__SSP1_CMD
   245				MX28_PAD_SSP1_SCK__SSP1_SCK
   246			>;
   247			fsl,drive-strength =3D <MXS_DRIVE_8mA>;
   248			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   249			fsl,pull-up =3D <MXS_PULL_ENABLE>;
   250		};
   251=09
   252		wifi_en_pin_bttc: wifi-en-pin@0 {
   253			reg =3D <0>;
   254			fsl,pinmux-ids =3D <
   255				MX28_PAD_GPMI_CLE__GPIO_0_27
   256			>;
   257			fsl,drive-strength =3D <MXS_DRIVE_8mA>;
   258			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   259			fsl,pull-up =3D <MXS_PULL_ENABLE>;
   260		};
   261	};
   262=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
