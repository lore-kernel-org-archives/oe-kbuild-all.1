Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0C91862
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 00:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735000147; cv=none; b=muJnSBHjehdPtTolcM412eg6+ACqaG/SG8k+/PyxpyVjmONyb5CzNUzhVZecvEJ/zZAKMd0FXKPZ6FBCa4fspWXCsynZdvwURZHYmHbvh3ekpyyCb3+WKNC9X9rvkxQJGMqRWYeDeYioBDRn/jvkkQvLArk/RoON66BRP1/yID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735000147; c=relaxed/simple;
	bh=wE3i9gIio4rqOa2tpaexTUOEWEH3tCFbsxP97JapxIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDRMYAbKxjDUaUitx7CDz3WevfZuhArS3CvDlHGqzGPbWWi2xH/qUHzwXgVb++8BT/15xwnC8IH1Qsfkl3zFCTiWojcdsF8MAikwUdVC8fxEQqIIz7gF0n3MLpFajfc2dgJU/DkZanu2zhngWFLT7yv3C0P6s5SoJnm9Z3t9t1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkKHI+hk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkKHI+hk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735000145; x=1766536145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wE3i9gIio4rqOa2tpaexTUOEWEH3tCFbsxP97JapxIU=;
  b=EkKHI+hkzUkY9S4kjy30LQiy6daVZfEiL3QZfqSPjpWwycRx+aABT2Rw
   U3eG08KVK8MCrg2hNCthA4sAaht46qZ451/f4O9btqTzow46AuLfvPaUo
   g84p56fpf+X5RFo9qKrWCRQZEQUZHG8KuTmp+r19v2jQRVGBPTp00x1ej
   Zqp+aB96Nh+6NxaXPxgv91qTiXw7tMdofAFfIDpEIoeHeCo9QIaPsbB6W
   jUMW+hK6/HBESvy02Uxm7533Fs52OnCSpAHazc0wPFDQGI74Ken41SD0z
   990qqHph7qg7lD0FYTvf13ZncYwXyBpjBDXlfbKuWYDk0RMvfLRcrrquK
   Q==;
X-CSE-ConnectionGUID: h5llTsfORcuIqUvnpCRA4g==
X-CSE-MsgGUID: QZPlI0cwRF2UFg93+emYtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35688597"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="35688597"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 16:29:02 -0800
X-CSE-ConnectionGUID: 00aoItSbSLqwqJiOFhEEUw==
X-CSE-MsgGUID: xY15b6dETHquwtb/HPJMNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100175038"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Dec 2024 16:29:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPsnD-0000j7-1u;
	Tue, 24 Dec 2024 00:28:59 +0000
Date: Tue, 24 Dec 2024 08:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: i2c@11009000:
 Unevaluated properties are not allowed ('mediatek,default-timing-adjust' was
 unexpected)
Message-ID: <202412240809.GzMaXAZK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   8decd833dcf6e8e368c99562c3437b9113fcffad
commit: a3e7c6a8ccc078fdf3ce4f6d4901016fa85972d7 [4/4] CHROMIUM: arm64: dts: mt8183: kenzo: Enable G2 touchscreen support
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241224/202412240809.GzMaXAZK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240809.GzMaXAZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240809.GzMaXAZK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: i2c@11009000: Unevaluated properties are not allowed ('mediatek,default-timing-adjust' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
