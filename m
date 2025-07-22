Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B66190477
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 05:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753162819; cv=none; b=n+hv7TOG+8Lu/0AVJQ2TpOv4x3GG9I8uQw04LOcdMuTCGrCn8QXqovhxYOmx6dHBbCK+mEb+N/Ejiy+Opa1PcDbn292GUONg3gorGFw0wkq6LtMwH4uwVadT2oHwf26jG4yk+s2XnqG9w4TJBJVxZW/9ftp5HUr/j98bXDXTu3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753162819; c=relaxed/simple;
	bh=MTO69v3O+tqLyfNo5hW4MBWqb2FS7/Nriftk7iHNPlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3eaOIKu86EqD9qYkmx4s+igwa9BPqxaDsAPHLzMOMpWXXv0eVtyvbuAMckUy+Dp7t6v7hDM9d3LXpNQFxhG49lt+198qRN+LC3sZ7VnQREHWUpPdZye1HWDhim44GFQJe+VHbFzoXUthlI5wIwdYXTzHo3p4+nIgS3iWTBA2rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=df3cLaFH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="df3cLaFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753162815; x=1784698815;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MTO69v3O+tqLyfNo5hW4MBWqb2FS7/Nriftk7iHNPlk=;
  b=df3cLaFHKB2g9JifdQFkegqyKxJRPxzIqZnNMwuy3fA6YlxT2L2RlDrm
   AKN8Cx3vwsdE2GcqLcDxpRCzkh8dj1NV+FcCx2Se5kmp5IB1uAGREI7/f
   yoSYFQ8dNmYDTJXyueW0lvNGj2iPQyT30cZDpfW8ulZkAM48S/cU9YKvs
   s52jqGYZpdK8+mDJJZZr8XnU08vBbDCM8hZHTIpOcqQkkwRvZi+RansGH
   pJtJjS9HDd5hvI+mSnvFHzC8x0wDq/w5KSuPxKHrz9+8tGwcSuK6sc3+x
   FM5dfpJHuq+jPyYOQCz4uD3c9QKM7Is/jQw1NS6jBILqP3GKz0ttHnWJI
   g==;
X-CSE-ConnectionGUID: 1gRr1rNWT6WHOFQe9OpzWA==
X-CSE-MsgGUID: dXQ9OW35SeeNoR40NXj7wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55355501"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="55355501"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 22:40:14 -0700
X-CSE-ConnectionGUID: YR509/OEQ0yU9e6lJq4pVA==
X-CSE-MsgGUID: /t2MZM0wSduveuI7tcmzug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="163088614"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jul 2025 22:40:11 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue5jU-0001UD-2M;
	Tue, 22 Jul 2025 05:40:08 +0000
Date: Tue, 22 Jul 2025 07:39:29 +0200
From: kernel test robot <lkp@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 5257/11398]
 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:200.32-209.4: Warning
 (unique_unit_address_if_enabled):
 /apb@80000000/apbh-bus@80000000/pinctrl@80018000/edt-ft5x06@0: duplicate
 unit-address (also used in node
 /apb@80000000/apbh-bus@80000000/pinctrl@800180...
Message-ID: <202507220739.KUkGghsE-lkp@intel.com>
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
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: ad296c411452d1b490bf4742c2eb7e5e4a400561 [5257/11398] ARM: dts: mxs=
: support i.MX28 Amarula rmm board
config: arm-randconfig-2051-20250717 (https://download.01.org/0day-ci/archi=
ve/20250722/202507220739.KUkGghsE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250722/202507220739.KUkGghsE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220739.KUkGghsE-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:801.39-826.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0id1@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:828.39-851.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0id1@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:853.37-864.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/usb0id1@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:866.25-875.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0id1@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:877.25-886.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0id1@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:888.25-899.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0id1@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:901.25-914.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0id1@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0id1@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0id1@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.30-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb0id1@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.25-766.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm7@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:768.39-799.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:801.39-826.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:828.39-851.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:853.37-864.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:866.25-875.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:877.25-886.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:888.25-899.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:901.25-914.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.30-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:979.31-987.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/edt-ft5x06@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.25-766.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm7@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:768.39-799.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:801.39-826.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:828.39-851.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:853.37-864.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:866.25-875.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:877.25-886.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:888.25-899.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:901.25-914.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.30-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:979.31-987.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:200.32-209.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06@0: duplicate unit-address (also used in node /apb@80000000=
/apbh-bus@80000000/pinctrl@80018000/edt-ft5x06-wake@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.25-766.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm7@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:768.39-799.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:801.39-826.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:828.39-851.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:853.37-864.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:866.25-875.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:877.25-886.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:888.25-899.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:901.25-914.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.30-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:979.31-987.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:200.32-209.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06@0: duplicate unit-address (also used in node /apb@80000000=
/apbh-bus@80000000/pinctrl@80018000/fec-3v3-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:211.41-217.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06-wake@0: duplicate unit-address (also used in node /apb@800=
00000/apbh-bus@80000000/pinctrl@80018000/fec-3v3-enable@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/hog@0)
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:828.39-851.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:853.37-864.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:866.25-875.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:877.25-886.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:888.25-899.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:901.25-914.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.30-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:979.31-987.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/hog@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:200.32-209.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06@0: duplicate unit-address (also used in node /apb@80000000=
/apbh-bus@80000000/pinctrl@80018000/hog@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:211.41-217.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06-wake@0: duplicate unit-address (also used in node /apb@800=
00000/apbh-bus@80000000/pinctrl@80018000/hog@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:219.39-225.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/fec-3v3-enable@0: duplicate unit-address (also used in node /apb@8000=
0000/apbh-bus@80000000/pinctrl@80018000/hog@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/leds@0)
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:828.39-851.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:853.37-864.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:866.25-875.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:877.25-886.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:888.25-899.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:901.25-914.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.30-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/leds@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:979.31-987.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/leds@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:200.32-209.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06@0: duplicate unit-address (also used in node /apb@80000000=
/apbh-bus@80000000/pinctrl@80018000/leds@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:211.41-217.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06-wake@0: duplicate unit-address (also used in node /apb@800=
00000/apbh-bus@80000000/pinctrl@80018000/leds@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:219.39-225.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/fec-3v3-enable@0: duplicate unit-address (also used in node /apb@8000=
0000/apbh-bus@80000000/pinctrl@80018000/leds@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:227.20-235.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/leds@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.25-766.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm7@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:768.39-799.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:801.39-826.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:828.39-851.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:853.37-864.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:866.25-875.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:877.25-886.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:888.25-899.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:901.25-914.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.30-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:979.31-987.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:200.32-209.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06@0: duplicate unit-address (also used in node /apb@80000000=
/apbh-bus@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:211.41-217.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06-wake@0: duplicate unit-address (also used in node /apb@800=
00000/apbh-bus@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:219.39-225.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/fec-3v3-enable@0: duplicate unit-address (also used in node /apb@8000=
0000/apbh-bus@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:227.20-235.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:237.20-247.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/leds@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/usb0-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.25-766.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm7@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:768.39-799.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:801.39-826.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:828.39-851.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:853.37-864.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:866.25-875.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:877.25-886.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:888.25-899.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:901.25-914.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.30-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:979.31-987.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:200.32-209.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06@0: duplicate unit-address (also used in node /apb@80000000=
/apbh-bus@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:211.41-217.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/edt-ft5x06-wake@0: duplicate unit-address (also used in node /apb@800=
00000/apbh-bus@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:219.39-225.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/fec-3v3-enable@0: duplicate unit-address (also used in node /apb@8000=
0000/apbh-bus@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:227.20-235.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:237.20-247.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/leds@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/usb1-vbus-enable@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:249.43-255.4: Warning (u=
nique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@800=
18000/usb0-vbus-enable@0: duplicate unit-address (also used in node /apb@80=
000000/apbh-bus@80000000/pinctrl@80018000/usb1-vbus-enable@0)
   arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: / (amarula,imx28-rmm): =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['amarula,imx28-rmm', 'fsl,imx28'] is too short
   	arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: / (amarula,imx28-rmm):=
 compatible: 'oneOf' conditional failed, one must be fixed:
   		['amarula,imx28-rmm', 'fsl,imx28'] is too short
   		'amarula,imx28-rmm' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'amarula,imx28-rmm' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   	arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: / (amarula,imx28-rmm):=
 compatible: 'oneOf' conditional failed, one must be fixed:
   		['amarula,imx28-rmm', 'fsl,imx28'] is too short
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
   arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /: failed to match any =
schema with compatible: ['amarula,imx28-rmm', 'fsl,imx28']
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@=
80000000/interrupt-controller@80000000: failed to match any schema with com=
patible: ['fsl,imx28-icoll', 'fsl,icoll']
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@=
80000000/interrupt-controller@80000000: failed to match any schema with com=
patible: ['fsl,imx28-icoll', 'fsl,icoll']
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: spi@80010000 (fsl,imx28=
-mmc): $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: spi@80010000 (fsl,imx28=
-mmc): Unevaluated properties are not allowed ('#address-cells', '#size-cel=
ls', 'broken-cd', 'bus-width', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: pinctrl@80018000 (fsl,i=
mx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', =
'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'aua=
rt3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duar=
t-4pins@0', 'duart@0', 'duart@1', 'edt-ft5x06-wake@0', 'edt-ft5x06@0', 'fec=
-3v3-enable@0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c=
0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0'=
, 'lcdif-sync@0', 'leds@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'm=
mc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg=
@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2=
-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm=
4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@=
1', 'usb0-vbus-enable@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb=
1-vbus-enable@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pin=
ctrl-[0-9]+$', 'gpio@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: pinctrl@80018000 (fsl,i=
mx28-pinctrl): compatible: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@=
80000000/digctl@8001c000: failed to match any schema with compatible: ['fsl=
,imx28-digctl', 'fsl,imx23-digctl']
   arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@=
80000000/digctl@8001c000: failed to match any schema with compatible: ['fsl=
,imx28-digctl', 'fsl,imx23-digctl']
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@=
80040000/lradc@80050000: failed to match any schema with compatible: ['fsl,=
imx28-lradc']
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@=
80040000/timrot@80068000: failed to match any schema with compatible: ['fsl=
,imx28-timrot', 'fsl,timrot']
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@=
80040000/timrot@80068000: failed to match any schema with compatible: ['fsl=
,imx28-timrot', 'fsl,timrot']

vim +200 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

   195=09
   196	&pinctrl {
   197		pinctrl-names =3D "default";
   198		pinctrl-0 =3D <&hog_pins_a>;
   199=09
 > 200		edt_ft5x06_pins: edt-ft5x06@0 {
   201			reg =3D <0>;
   202			fsl,pinmux-ids =3D <
   203				MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
   204				MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
   205			>;
   206			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   207			fsl,pull-up =3D <MXS_PULL_ENABLE>;
   208			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   209		};
   210=09
 > 211		edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
   212			reg =3D <0>;
   213			fsl,pinmux-ids =3D <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
   214			fsl,drive-strength =3D <MXS_DRIVE_16mA>;
   215			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   216			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   217		};
   218=09
 > 219		fec_3v3_enable_pin: fec-3v3-enable@0 {
   220			reg =3D <0>;
   221			fsl,pinmux-ids =3D <MX28_PAD_SPDIF__GPIO_3_27>;
   222			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   223			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   224			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   225		};
   226=09
 > 227		hog_pins_a: hog@0 {
   228			reg =3D <0>;
   229			fsl,pinmux-ids =3D <
   230				MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
   231			>;
   232			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   233			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   234			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   235		};
   236=09
 > 237		leds_pins: leds@0 {
   238			reg =3D <0>;
   239			fsl,pinmux-ids =3D <
   240				MX28_PAD_SSP0_DATA7__GPIO_2_7
   241				MX28_PAD_PWM0__GPIO_3_16
   242				MX28_PAD_PWM1__GPIO_3_17
   243			>;
   244			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   245			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   246			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   247		};
   248=09
 > 249		usb0_vbus_enable_pin: usb0-vbus-enable@0 {
   250			reg =3D <0>;
   251			fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
   252			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   253			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   254			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   255		};
   256=09
   257		usb1_vbus_enable_pin: usb1-vbus-enable@0 {
   258			reg =3D <0>;
   259			fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
   260			fsl,drive-strength =3D <MXS_DRIVE_4mA>;
   261			fsl,pull-up =3D <MXS_PULL_DISABLE>;
   262			fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
   263		};
   264	};
   265=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
