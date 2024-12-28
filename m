Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3258C70806
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 23:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735427315; cv=none; b=sQtHYwv/OlDla0a+u6K6MuFooixwgjy0zOmZyt7XvQ/SsdFMqQxYjsmp6gSdxdzZaH3bBa6d/Szd5jnLqBsVrmmMxw9m/nI/TWgjW63rkhKR7og2dygGbYowxEkPZ4btGEBTUCE2aH+NbrbIzFxf9IZuAyCfrDqXdGiREmbaQvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735427315; c=relaxed/simple;
	bh=bZvEqkAy5v/uuyXIIZ5hSqiQOgBsqtSMGllM3dD5VzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=laoMJufu/G8qdbMFljeg2bLlc0Rrh1Y/007nqQhAo7Jc2jHyKMlVhxqnGajm866OsuRA8y3ZdHrfMmP6siefZ6txZ71fYR8baDbaDnzEGNbYhEfwBPSPmPWJkgyiP1dIez/EtchSqfPx2fHDkCSDmGsTsUZ0t7LyS6opcgcsxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrKb3hxv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrKb3hxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735427313; x=1766963313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZvEqkAy5v/uuyXIIZ5hSqiQOgBsqtSMGllM3dD5VzY=;
  b=FrKb3hxvMFtjpUGgc9zdSDEHgthLDT0YUeoqUnG1F981ouguL43kjlTJ
   mmD+kWxQIFj4kOKCViZTBz3j/hiQK594d7s/RBaHwhLdqk3dNwq9zagoT
   fQkG1xGJITUBq/P5mEnKLbxFwYR1TuWgtIJ5Z6i3Pc17AOfXNDm5k2zuv
   sBsN+e4B9PbfOYDsuNRLC9by67JfXC6HZ4q74oXwYV6EDzbnbG3c9CAND
   zn5u4yZBhtDSMi882LIJ9tKC5zjshal6/pju2GA33oEd4NOyLj6QvbezN
   AI+U8NUu77MJQ1FAG1A1PxUyMe7bBlIFKAPQI3HT724l+OfoU8CrrX/CR
   Q==;
X-CSE-ConnectionGUID: D13TBb1RSNGd+fgkZLUsGQ==
X-CSE-MsgGUID: wRzdtBXfR5qcnF7eXwFiiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46353959"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="46353959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 15:08:32 -0800
X-CSE-ConnectionGUID: LwhhffjQTkCL5mMh4dD5Kg==
X-CSE-MsgGUID: EXUT2QudTOKB3redq6uT9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100200099"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Dec 2024 15:08:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRfv3-0004Ms-25;
	Sat, 28 Dec 2024 23:08:29 +0000
Date: Sun, 29 Dec 2024 07:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: dp-bridge@5c:
 switches:switch@0: 'port' is a required property
Message-ID: <202412290737.87gHV6kR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   ca8e7ba4cbf9fe4c8fe507bf6d5f91c4f6d0b173
commit: fd5947156b5d396329c0e3d28f0a517df2637a76 [4/4] CHROMIUM: arm64: dts: mt8186: Update Squirtle sound card configuration
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241229/202412290737.87gHV6kR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290737.87gHV6kR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290737.87gHV6kR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: touchscreen@16: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: touchpad@68: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: dp-bridge@5c: switches:switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: dp-bridge@5c: switches:switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: dp-bridge@5c: switches:switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: dp-bridge@5c: switches:switch@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: dp-bridge@5c: Unevaluated properties are not allowed ('switches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: rt5650@1a: 'cpvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5645.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: rt5650@1a: Unevaluated properties are not allowed ('cbj-sleeve-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5645.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: ec@0: typec:connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: typec: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
