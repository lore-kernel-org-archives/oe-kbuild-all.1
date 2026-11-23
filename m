Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476351;
	b=TGgOD3a3GLdD36qiaCfkPKITZFOzkcaSQdicpDE4KKnC4Q834uqKnkd9zm/2zNrraTmX
	 ns9uiEtklfiM06HPXObEj2o4I3Y6IjwHtNzVi39PqMwjy1tn7DFhAhU8zXmrI4qw5GOsd
	 u8kxkFHXMVqulSj31BPKeIJwrZ23qFhWz8avvmrp5cmjCm8YolHSQblw/Z7ELsXx+0+9K
	 Imdr9Z3K6aUQegPv+YyLtUQ/JJowx8CLoAw73/MiVFp0LKmGet7ycMnwcF4TXpVeEzws7
	 O1JlJjEhgyrwjVYJy0PN1swHrpOVIwjHNnfbOmz6I+KGSw9W5rQDdhKs2uprimKAltA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476351;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gtSHOiFE2tkvA/d/fkihNimtVBrTbrPSmkhc7t/BHOI=;
	b=RJj8vE71b17P/cOVl9QGv0f1l5Q/d+kI64LDiwmpIXSJcFpDuOcDrDz5LGMSZjddvQHZ
	 GYkJJyzZUa1ZEdnRPpK0Sg1dXBxEhZjYUOASC6O3d97yt88e1CVojPWL2XfAT7Hw78g9O
	 sbd8tADtN7bvU8OFIRRm9YpWsNnXf6sBBjhkWnc5G6HaRqwxfJkGlsjRHZ2QwmeI94k/a
	 ksjDOnpps1xo6dqOEVAvNtYmmQL6VJKp29ZApYyZFa++/tx7mcn9WGaULKFPBD1+6h+VP
	 o0rtGfyIzuvj03ZsI5Sq4WSjOjdz0ayYLTIKY7hizTruROdo72t7pegvpyWtjYaoAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oCrdvsrN;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAB1606A31E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 23:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACAB1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oCrdvsrN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795476351; x=1827012351;
  h=date:from:to:cc:subject:message-id;
  bh=abLq59GQy2fcYgb7QrJFuObXn1YxtON3T6i2SbjGomM=;
  b=oCrdvsrNHnrlwa47QW0xvz71XNjByio8ZOP0JzbzAZmg4vtSvWrApM9d
   idCEDEKddpeck+/ww3or9KSzz4xDnhPVuWzhlcgsVwLWxLaszbLxVi7ph
   uCGKf1LiNhOqT84g1mr19RYPT/xUc5Zyzf9eL4VJ1Vmem8sGFXNF48OJX
   aLvD9oB3gNT2M3lbWqQggaBPorHaUHH3TK7+E1fi3V43qwyiy3jkrAhhP
   OrOP4AyXXgbdgsok00kMXqLcYyLl7HFTz/Zapk3RqLIaBtka+dRKkK19H
   A4NatbrYlKZC+rPeVdCxIMOy1ZqmBfJr5qF1ulcHuf2bwhZsMq9s7mgtC
   g==;
X-CSE-ConnectionGUID: 6eJQepYZTq+PGgCsRnLrvA==
X-CSE-MsgGUID: POhCv6B4TDa8wj+7m0+q2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4200499"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4200499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 15:25:50 -0800
X-CSE-ConnectionGUID: cGxVWEBnQZKV6UEgVwQBJg==
X-CSE-MsgGUID: eGHNCgd2S2GIkrj0lbFLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11531300"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Nov 2026 15:25:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVdPu-000000004xt-3wQN;
	Mon, 23 Nov 2026 23:25:46 +0000
Date: Tue, 24 Nov 2026 00:25:34 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 318/318]
 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: /
 (asus,zenbook-a14-ux3407qa-oled): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <20261124002346.PaLyfZmS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   17b8bfe5ce7568445def263dc609f839f3b469f6
commit: 1e2b408c1a7695f4044f758a5f4dca76d5b3eb91 [318/318] arm64: dts: qcom: Rework X1-based Asus Zenbook A14's displays
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261124/20261124002346.PaLyfZmS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124002346.PaLyfZmS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124002346.PaLyfZmS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: / (asus,zenbook-a14-ux3407qa-oled): compatible: 'oneOf' conditional failed, one must be fixed:
   	['asus,zenbook-a14-ux3407qa-oled', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100'] is too long
   	['asus,zenbook-a14-ux3407qa-oled', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100'] is too short
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['qcom,apq8074-dragonboard']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
--
   	'google,lazor-rev5-sku0' was expected
   	'google,lazor-rev6-sku4' was expected
   	'google,lazor-rev6-sku6' was expected
   	'google,hoglin-rev4' was expected
   	'google,zombie-sku515' was expected
   	'qcom,qcs404' was expected
   	'qcom,sm6150' was expected
   	'qcom,qcs8550' was expected
   	'qcom,x1e78100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: /: failed to match any schema with compatible: ['asus,zenbook-a14-ux3407qa-oled', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100']
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: / (asus,zenbook-a14-ux3407qa-lcd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['asus,zenbook-a14-ux3407qa-lcd', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100'] is too long
   	['asus,zenbook-a14-ux3407qa-lcd', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100'] is too short
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['qcom,apq8074-dragonboard']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
--
   	'google,lazor-rev5-sku0' was expected
   	'google,lazor-rev6-sku4' was expected
   	'google,lazor-rev6-sku6' was expected
   	'google,hoglin-rev4' was expected
   	'google,zombie-sku515' was expected
   	'qcom,qcs404' was expected
   	'qcom,sm6150' was expected
   	'qcom,qcs8550' was expected
   	'qcom,x1e78100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: /: failed to match any schema with compatible: ['asus,zenbook-a14-ux3407qa-lcd', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100']
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: / (asus,zenbook-a14-ux3407qa-oled): compatible: 'oneOf' conditional failed, one must be fixed:
   	['asus,zenbook-a14-ux3407qa-oled', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100'] is too long
   	['asus,zenbook-a14-ux3407qa-oled', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100'] is too short
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['qcom,apq8074-dragonboard']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'asus,zenbook-a14-ux3407qa-oled' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
--
   	'google,lazor-rev5-sku0' was expected
   	'google,lazor-rev6-sku4' was expected
   	'google,lazor-rev6-sku6' was expected
   	'google,hoglin-rev4' was expected
   	'google,zombie-sku515' was expected
   	'qcom,qcs404' was expected
   	'qcom,sm6150' was expected
   	'qcom,qcs8550' was expected
   	'qcom,x1e78100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: /: failed to match any schema with compatible: ['asus,zenbook-a14-ux3407qa-oled', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100']
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: / (asus,zenbook-a14-ux3407qa-lcd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['asus,zenbook-a14-ux3407qa-lcd', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100'] is too long
   	['asus,zenbook-a14-ux3407qa-lcd', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100'] is too short
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['qcom,apq8074-dragonboard']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'asus,zenbook-a14-ux3407qa-lcd' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
--
   	'google,lazor-rev5-sku0' was expected
   	'google,lazor-rev6-sku4' was expected
   	'google,lazor-rev6-sku6' was expected
   	'google,hoglin-rev4' was expected
   	'google,zombie-sku515' was expected
   	'qcom,qcs404' was expected
   	'qcom,sm6150' was expected
   	'qcom,qcs8550' was expected
   	'qcom,x1e78100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: /: failed to match any schema with compatible: ['asus,zenbook-a14-ux3407qa-lcd', 'asus,zenbook-a14-ux3407qa', 'qcom,x1p42100']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
