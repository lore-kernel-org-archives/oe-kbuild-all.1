Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E2225949E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735567073; cv=none; b=L7UnmC7CfxIblv5H1hSZcru42GvrX092SblnCJXB2ezK7LiuLpvmE40Fzk5SuEszOqeoMSfk8eDfpat2MTWymqUw1BPfYu+FafLc6gUGvS6v8yVJ4xRaBedRu1b9vV75o4xKaUxiiUx4Wueicxi9URcQqLqEHTBt99TjI+L+uiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735567073; c=relaxed/simple;
	bh=H/8KSUUqd9Owrl9vLk8gvNjufSYrPqczMnznKwraZVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jR79xb0DKgzYa0CPsg5HovCjMTjXttYkFDZkl/DrHAXoFJ5WlhV8GxjYcmwHF/Y3iDJ0aztG5H9DKX1lthZp9zvz99VlXPi7T6CWvNzubrjji8JVBGKm50RzyVsIDrhAdkcJD0mGR8qsft0BmQlMNkD0ReHSubGP7XtHjckzR1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5wbpDdU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5wbpDdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735567072; x=1767103072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H/8KSUUqd9Owrl9vLk8gvNjufSYrPqczMnznKwraZVs=;
  b=d5wbpDdUZCLgH2V3AXU0EKiKopVz0EjokpRrSDsO9JHj2yN6vpeRBXHu
   DQFX+ZnEKOOY1+w2GKsd0/iK/1tSMhyZd8hHBUo8iS/t9lN7daLScgbPy
   C1H8lO/FXWKrTOk7kyhIsmUMUmC57fP7GVXjrklVmzCMQ1Kd2VoRLt/c4
   Ba5Oe02lzUTZERSdDHpsYTe1QOXNL3i+1K5zBHNlvYsVQLeyF4XBJORcv
   QCzVVKKeyvX++Mzw9vw2ZpbXC2mONqdyxuvCRIRi2nMV2OZQjgiCn243w
   buw0PEuF7ItoLvneOXCsonKvf1ApAyerDNn63Qr7u5uE3oG/yZ4MkvZ8w
   w==;
X-CSE-ConnectionGUID: Ajpbg4cKTzKbqtg6zyUb6g==
X-CSE-MsgGUID: OicNy0nSSnmdWawsGMNarw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35994995"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="35994995"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 05:57:51 -0800
X-CSE-ConnectionGUID: tVDD4c9pT6G1q/XPG0/mqw==
X-CSE-MsgGUID: Fn5rh0u9SEmviJrPYQE1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="100660554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Dec 2024 05:57:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSGHD-0005pg-1x;
	Mon, 30 Dec 2024 13:57:47 +0000
Date: Mon, 30 Dec 2024 21:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb:
 dp-bridge@5c: switches:switch@0: 'port' is a required property
Message-ID: <202412302102.BmhkgjRL-lkp@intel.com>
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
commit: 5be59f93dfd0b5bc72bfd7519ba494189af99f5a [4/4] CHROMIUM: arm64: dts: mt8186: Add new sku for Veluza
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241230/202412302102.BmhkgjRL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412302102.BmhkgjRL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412302102.BmhkgjRL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131082', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131082', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: touchpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: dp-bridge@5c: switches:switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: dp-bridge@5c: switches:switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: dp-bridge@5c: switches:switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: dp-bridge@5c: switches:switch@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: dp-bridge@5c: Unevaluated properties are not allowed ('switches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131082.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
