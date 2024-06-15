Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5678F48
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718487163; cv=none; b=YQHUZYmnkrX+O9aJ9mQc9U7USawRwvutaSmxzmmVwAznIelcv8ncLrwPKfaexDZbMyAHCndNfvfSBoTLxMGeUKw6vxOyLihLt+hBjjXcsKKqO3GuJpptk7S91rdcaFiQUsz9B9ckplCQfja4y0fFu3235lUOA4o18IdrJPA8sEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718487163; c=relaxed/simple;
	bh=HS/lnGgylVv1Om5+x7Qd31jiEA26xfZWgIamPGJ1Jc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=To5YprXRf1ZKaE54NDoP/+/FuYjS/UGvInYuklkRTxR2YiH8MaQZTGPK0jAy8h+ChOhgntWn/8D1fc5gYi8GFOCNe0lFj/pARtFbPICyJPC9W68/k9y/fNF/ZAep94yX6Un/aWxhmc26HQ5NJm6i1rnWQ24mnpBLUhn75yf8jQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dN8J8At2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dN8J8At2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718487161; x=1750023161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HS/lnGgylVv1Om5+x7Qd31jiEA26xfZWgIamPGJ1Jc0=;
  b=dN8J8At2/nulgJtlhwdYbYaA2z8SLglt825eh6BErr41gBApTnpZMN79
   9WXkmx9kR+yuqGF45S5un1R5Rhiy+n9Z2WTNS2S1ex9e+/i5RoerbWDJs
   658wpq13/kNVw+PJ8IZObUb04luGPJZaxrYrTQHJ2IIDgXUkyeoZs7Txc
   nadhLQSNHPu5oGaKRkf/+YAe5RtCRPusPneaGbtLmcX7BfzCfiKZOH6WK
   N8xwvFA8LjP098URGS3CfCPHXRBlcjwtWwOU4a5eMc7ORe07NMtNFur2y
   qI1SfBkohMV/4EbWhLhIMaC4lf51vnkBBc5O4ED6DJRktTIBuFduGdy5a
   Q==;
X-CSE-ConnectionGUID: v2Ca0q1OTx+NI2Rgc+lflw==
X-CSE-MsgGUID: MQtmAF36S/SL4gVSRooBzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15232187"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15232187"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 14:32:41 -0700
X-CSE-ConnectionGUID: /vI0ZxLJSS+q0o1VOp98lg==
X-CSE-MsgGUID: k//wrxanQneXN+VFBIhlHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45369906"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jun 2024 14:32:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIb0o-0000Ww-13;
	Sat, 15 Jun 2024 21:32:38 +0000
Date: Sun, 16 Jun 2024 05:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-rc 4/18]
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb:
 thermal@1100c800: clocks: [[4, 27], [4, 44], [4, 45]] is too long
Message-ID: <202406160503.RX25DrrC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-rc
head:   7ac5df1cf4f8eb850cc08b207445dc351ecb8943
commit: 24799d4f3f3b0665ff10e63ebff88d019ad5f619 [4/18] arm64: dts: add r3mini
config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240616/202406160503.RX25DrrC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160503.RX25DrrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160503.RX25DrrC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:432.19-446.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r3mini', 'mediatek,mt7986a']
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: eeprom@50: Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: thermal@1100c800: clocks: [[4, 27], [4, 44], [4, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: thermal@1100c800: clock-names: ['therm', 'auxadc', 'adc_32k'] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: thermal@1100c800: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: syscon@15000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15100000: Unevaluated properties are not allowed ('#reset-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet-phy@14: leds:led@0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'netdev' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'netdev' does not match '^cpu[0-9]*$'
   	'netdev' does not match '^hci[0-9]+-power$'
   	'netdev' does not match '^mmc[0-9]+$'
   	'netdev' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet-phy@14: leds:led@0: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
