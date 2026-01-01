Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619CA1607A4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 03:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767236698; cv=none; b=fqpMieI/FX5lpnbTwcCqYmkT7oJYh3T8exNJni6CcKGPP4pugBhECa5DtMjMtYSswYuit7VSq3ulr66DZCKcsK5F4jLFQjCTTKNuF/B0RjSuyhPPStqdpYai2Ctzoflrjkinbl8RuksK7qzrSafjRWUvuqL0sT0tYBbQY3zAOIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767236698; c=relaxed/simple;
	bh=hkwwjvjRKjU/zL5V9xXpHK8xaG37zjPEKWcf38MwMy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mNRnpiNdxkeN6ENS7LZ+q4hzl6dtHGNo+ZkUyWcK+I9OP2EohI6/4baOGqiteXYlv68hWs6n8f3EqB15KNMj3tjgeuvnxiyP/1kBcTk8RBOY2vwGoGiu/nmyKxWAUCRAYOQmiwuSrV9NsMjs5czhy2LcYvL7N1VylP9AhPO+w/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aapoZBdo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aapoZBdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767236696; x=1798772696;
  h=date:from:to:cc:subject:message-id;
  bh=hkwwjvjRKjU/zL5V9xXpHK8xaG37zjPEKWcf38MwMy4=;
  b=aapoZBdo+P/Jvw2dsOQ4cciv1xVogrKeEjNRRMe1JCoA/axsWqLmTL7e
   ZI+73V3GSNLObBzXeOaWhJkZTRHtbL9NQaI07XMfxUTPdDru9i35BQ22n
   H54cMrovEoNyk7mrXYtpYhXu5v7WBl1OCL+wWOEIc8QVFfm/uctLl9lYI
   4O0vjxjuRiup6l3yz+h+fLutp6Qer9cB4gl6LeMF+DC/YW94Wdoh2HgVI
   MAy08Tg1F6+oq9cviO5XHC8hnmH56cZ5jw6FtaPnTiBjNhDm7ot3g8EdO
   NN8UxQ3wuKqh4ncin4DCdif+058Mk441cLSF8mL5EUn7z3O3oe8lI1mxO
   w==;
X-CSE-ConnectionGUID: t0VTcxbUSSKKDNdqcpkNiw==
X-CSE-MsgGUID: 8XNSBobISL2zGwkNQQHmUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94259706"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="94259706"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 19:04:55 -0800
X-CSE-ConnectionGUID: a6vswT8jQkqpR8dkbT7enw==
X-CSE-MsgGUID: jrejmsECSlGMQNVgPfEvGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="202510884"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 31 Dec 2025 19:04:55 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb8zc-000000000BJ-20BX;
	Thu, 01 Jan 2026 03:04:52 +0000
Date: Thu, 01 Jan 2026 04:04:47 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000
 (marvell,armada-8k-xhci): Unevaluated properties are not allowed
 ('vbus-supply' was unexpected)
Message-ID: <202601010419.yQNQeKwx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 978719f90256ebee945562e82613ab6eb03fdaca dt-bindings: usb: xhci: Allow "iommus" and "dr_mode" properties
date:   3 months ago
config: arm64-randconfig-2055-20251230 (https://download.01.org/0day-ci/archive/20260101/202601010419.yQNQeKwx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010419.yQNQeKwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010419.yQNQeKwx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('vbus-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml
--
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('vbus-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
