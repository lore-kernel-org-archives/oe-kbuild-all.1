Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7989219A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 00:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725062627; cv=none; b=Ios+WUPSWtuYe/mkqWUI7RNvUVe7L+sg62bpOt97JOQpTxasJIVK7HEKmuZUbPZ0dmcKJ2PlDiU5LKjiTbWYu0l95IzLIuA9mGqT4OG8gWVbw2Kb6/Q6H9a0ZkyTiffUDjboR+nty3JNkBR0fKv+OY08+GzhGu09JS2AUQQjdKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725062627; c=relaxed/simple;
	bh=CSG98qYBRHLQgIDicop4eyWS+z4wwtTD69AfaCa9Gro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tuAFa7tFeaqz/wVam/e4lhJKiVMvfhOeNRramfAiu/bAA6URH0cIDHH6jnLUEYpnJfb//Iud+kk/DloeWQFOWLMAqoZJaqvbPC2Yl53kRrXJ5DqtDWvenHR9YqsoRhfWyDWYMnoAQVXExsotSL0GZsK8HvbyGWSsyEl0JINe6kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nX4vOgPu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nX4vOgPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725062625; x=1756598625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSG98qYBRHLQgIDicop4eyWS+z4wwtTD69AfaCa9Gro=;
  b=nX4vOgPuDnt9/jHrQuMwg+bN2qqCJSTsG7ZNd9rlE5QF/NDNF+ipFiWQ
   QbJb/BUlbx2P2VidHeoimvQqyePySk1zh6af+K/FSM/U0oMlXaqClcs6V
   c3WcmxaYsoBUsDLRyvZfm5I/1wR2yCgPgdOfjrZppP/5nl5qs6VZg+okm
   aztyCLaR0XGCvdcW6GWaOTUBBScXlnyFMiw/Zx7C6uR/lwL3SbIX9xR9n
   HarsNeEyRWeh6CY/ejEoJfLg/gfJaIivTbXzojjBD9oi4Utgzu5InbGm4
   F9VuA7rXN6l3zOy08Y2Ivg8qwoWXqGNrfHuMqpL5vd8oyGEq3Fz8HmrcG
   w==;
X-CSE-ConnectionGUID: 7Y+PVfU7Q7+DEkocr6LkGw==
X-CSE-MsgGUID: ST6ko7msRzuer3J6wByrhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34293238"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="34293238"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 17:03:44 -0700
X-CSE-ConnectionGUID: vJWpeB3OSV2YX8PDAa8Www==
X-CSE-MsgGUID: PiLkH86rRZqL3ZC99ToA2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="94848956"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Aug 2024 17:03:42 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skBae-0002Dq-0e;
	Sat, 31 Aug 2024 00:03:40 +0000
Date: Sat, 31 Aug 2024 08:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [linux-next:master 6740/8126]
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdba0000:
 failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
Message-ID: <202408310737.mLgGnmfv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: cc0a05865cd5ff2a12479ab85093ed203af10520 [6740/8126] arm64: dts: rockchip: Add VEPU121 to RK3588
config: arm64-randconfig-052-20240829 (https://download.01.org/0day-ci/archive/20240831/202408310737.mLgGnmfv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310737.mLgGnmfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310737.mLgGnmfv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1244.7-1252.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: regulator@42: Unevaluated properties are not allowed ('rockchip,suspend-voltage-selector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: pmic@0: Unevaluated properties are not allowed ('regulators' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: codec@1b: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5616.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: sound: 'simple-audio-card,hp-pin-name' does not match any of the regexes: '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1115.7-1123.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /extcon-usb3: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: pmic@0: Unevaluated properties are not allowed ('regulators' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: audio-codec@11: 'clock-names', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: gpio-func: leds-gpio: {'rockchip,pins': [[0, 2, 0, 245]], 'phandle': 253} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: vcc-3v3-sd-s0-regulator: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
