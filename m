Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414978633A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 02:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741747443; cv=none; b=VCxYeRNO2rPJfP9hAo3d6vPuVt3VOKnCM1XAUhCtnlHFgiun2TbNoHc7YRuBMxgk02DmEDy5n4MLvGcfKgHhJU+Vn1FrPctCiBAMjXCKGv11QnOjZkHoKKFekE7Rf89q/i7T0PjtM5MJdcDtLvohg+89+lY8YC3xR3Bwk44zIRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741747443; c=relaxed/simple;
	bh=KTgONew6Om/PTcOcB5IpQiJqAiSGgfSxcFVTVUXpftg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eX83Br+C0aPexPa/PJBXjKDFUX0C2DZULik8JfU24rf3GDziEPwwKo4A862pTQAWTF8y2hkUMGHRcid5ypE4NGg+5p8m6CWx8w8f6U5BXWuzn5VWxdrcBJgRqiBfcogjTWzEwPMzvdU6qcoEYANmLBW72EkruDIMCXOiRnxRY+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSpz1WSA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSpz1WSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741747441; x=1773283441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTgONew6Om/PTcOcB5IpQiJqAiSGgfSxcFVTVUXpftg=;
  b=DSpz1WSA0u/vk9YdzQ2s2Jbl18bvhHlCCYjBiOlH+XDq0iLVz2jFF/PI
   LjigE3Lb94FQSZbmvQVye6plmGnky8fs1wIiBVgyAKCCwC0xXHQk6vECh
   ifYrqBEHqc8rYWeKiCsLMKwuRKIFbW9inI5a+tg2QFS3GxOSWghEdrS0C
   h8pqDbOAw9V4DTfPl3QjEJhr7Xg+7bpwlWaSDOEwu9AGd7e2ehyr6C64P
   BZirCl010SltQXCX1rL+mO5b9ZCsGYuPLS7J1zJgovBvqsgiiW95PTI5Q
   L2/6H2f8239QJ09KFOXU5kg2uf5Td22lbiOXKkIfFfFvYFBEsyv9vLR6r
   Q==;
X-CSE-ConnectionGUID: hC575FJnTBSZ8ITK9Zi0Lw==
X-CSE-MsgGUID: K8g3T1ZlS/Gy23X+tIRbyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46457978"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="46457978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 19:44:00 -0700
X-CSE-ConnectionGUID: JuHRkaqCSvqlNXwH06U89w==
X-CSE-MsgGUID: QRxIF1gcSeGu+Gnx9f5dqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125123235"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2025 19:43:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsC4a-000840-0I;
	Wed, 12 Mar 2025 02:43:56 +0000
Date: Wed, 12 Mar 2025 10:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/1]
 arch/arm64/boot/dts/mediatek/mt8173-evb.dtb:
 /soc/pwrap@1000d000/mt6397/regulators: failed to match any schema with
 compatible: ['mediatek,mt6397-regulator']
Message-ID: <202503121010.ou479rxM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   3e7a6629f398fbc9d78216def76bbf6b860ff58f
commit: ac8ab6287a3b8769241d32a2ef0859c2a54aacbf [1/1] arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
config: arm64-randconfig-052-20250310 (https://download.01.org/0day-ci/archive/20250312/202503121010.ou479rxM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121010.ou479rxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121010.ou479rxM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/syscfg_pctl_a@10005000: failed to match any schema with compatible: ['mediatek,mt8173-pctl-a-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pinctrl@1000b000: 'disp_pwm0_pins', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'spi0', 'usb_iddig_pull_down', 'usb_iddig_pull_up', 'xxx' do not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt8173-pwrap']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/mt6397: failed to match any schema with compatible: ['mediatek,mt6397']
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/mt6397/regulators: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8173-thermal']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: syscon@14000000: 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
