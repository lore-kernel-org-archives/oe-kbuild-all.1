Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30229B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755940665; cv=none; b=VQjVxwOzG/Ska/eOOY685SVdgVEpJ7UGDH7J6fSQKeFMv+W1x01v7/GXGbE0aPnp577L2u2sAyLB+UuDawuusGnNIJsZ0pxK0DfJxPSS/ZWNUXTz/O3k8zZ6dDG1KOdN6b4pmkTrUbXjSCjSy3Ieon1F54cVuMvHSWENBMd8Dp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755940665; c=relaxed/simple;
	bh=kxajtW1G48CYEPxij+eblpvuCDDuOD45vFG05A0uVOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOBqKaXNtgM3C7Url0CogrAwAXXc9NHdzHHgqBecNZqgp3TpG7d7gv5LdWH9Sr/jmCxbUumUZm5KwJaR9P+cbFL1aFRhmCItQqaIJZ1GrR64fsZneapJuQqiQuIWgkAcTvxbhxnTyoeqK2Fk1DAAg0CYPdoLMItwVbMsnutYlRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFKYxk1X; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFKYxk1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755940664; x=1787476664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kxajtW1G48CYEPxij+eblpvuCDDuOD45vFG05A0uVOw=;
  b=IFKYxk1X2K8XrEPPHQSUgsH9yMeW+0fUtokIafSqWValMnRPPEa10XDC
   n2JTz7imAOAJyA7l4b0cyPC+bF1Fptf35Iaa0mWHwijIiHn2BmijTVwsg
   IX2gKlqYNK5PG2rU704+tCJ193WZ1YAZwU2t1ZbkbTw7lVsl817FK4DiK
   wOSbs4bzdX67Vh7vHpTVBn1Hb+CN3xtpHOVRV8eGHFsJz2FYfKXwMWqyB
   BsbjKagxIPSQ4Xgh+Hkl3l4iGZu60Jd4bVdPJukjEGGSvLyD2RDYF2EkJ
   Uk5ZylXfwoMpRxbcrn+scMZuPKikD6ZC1Yd+BPvlcr4wfZ6G0bHlYUt5A
   A==;
X-CSE-ConnectionGUID: BT4BPLlUS/+IRJsde8+tew==
X-CSE-MsgGUID: QRtQp4sXT7GkmWauQV1BNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58380089"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58380089"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 02:17:43 -0700
X-CSE-ConnectionGUID: BMoOgT6jQYyNV8D9n/SF3A==
X-CSE-MsgGUID: inUcXpEkQCec8VEFwswsTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169244488"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Aug 2025 02:17:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upkNW-000MEF-15;
	Sat, 23 Aug 2025 09:17:38 +0000
Date: Sat, 23 Aug 2025 17:16:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb:
 /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible:
 ['mediatek,mt6358-rtc']
Message-ID: <202508231745.kLY0U3to-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   12cacc6855c36b7b2ce4a8f020b4a40a6433357b
commit: 32e731ebbc523a0dc0ff53fb7027c7da2af8054b [443/443] CHROMIUM: arm64: dts: mt6359: add rtc node config
config: arm64-randconfig-051-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231745.kLY0U3to-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231745.kLY0U3to-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231745.kLY0U3to-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pwrap@10024000 (mediatek,mt8188-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: spmi@10027000 (mediatek,mt8188-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pwrap@10024000 (mediatek,mt8188-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: spmi@10027000 (mediatek,mt8188-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pwrap@10024000 (mediatek,mt8188-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: spmi@10027000 (mediatek,mt8188-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pwrap@10024000 (mediatek,mt8188-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: spmi@10027000 (mediatek,mt8188-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pwrap@10024000 (mediatek,mt8188-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: spmi@10027000 (mediatek,mt8188-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pwrap@10024000 (mediatek,mt8188-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: spmi@10027000 (mediatek,mt8188-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pwrap@10024000 (mediatek,mt8188-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: spmi@10027000 (mediatek,mt8188-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pwrap@10024000 (mediatek,mt8188-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/pwrap@10024000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/pwrap@10024000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: spmi@10027000 (mediatek,mt8188-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
