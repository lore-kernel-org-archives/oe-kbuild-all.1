Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5D038DE9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 11:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718450789; cv=none; b=qhYMO6fghZLkDQvMElltyLuVNVv2Ns7GQf3zXQ+59XJHt4GNd7Uaufu/D3v+4vmDhs9Xcv5jRfwtkIbYGPamsvGtAhTjxgwiFSqsznCiEjeWELDFVq3S79k4pFGdogZKLAW99sDWIJb3k0pzAUDlE18qXHt+7ksaGfO5atKU0tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718450789; c=relaxed/simple;
	bh=l+XDqno+GJ4+njapzTI00VNNYnEut801be9LEmNZSwg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l7v0zdz+8mYSB9tA4Egzo1uNNhVV8ivasHrPKmPPuRej3Pc2zgMre7NGZJopTI708tOJEDKT/LvX0fW3u3vr1r9qo+N/Kts8aFz/bMGA8LdqKxSsD38a40s6I/QDZbB3PA0+gmCaeevNwqjvROTzqiMEZ0Pa3JgsFSEXE4NRBzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoqBMR8Q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoqBMR8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718450787; x=1749986787;
  h=date:from:cc:subject:message-id:mime-version;
  bh=l+XDqno+GJ4+njapzTI00VNNYnEut801be9LEmNZSwg=;
  b=HoqBMR8QH2kT+ktwjn/uGr4WR5tdqHERtGuE7oxKuTwG+59436JlQhUk
   sIinWbGrM9oPE23Bd3M1xazksx/IYQSVMSBMagflO4AyRwTBkY7JsMcO6
   EBuUqDraOXsEKiXdM8Z3cxPRYwq+XSd12Mal36HYtUNVDP1JwFGFV8Ubo
   qshzdkCgTGGGSXUZLLJi/ogd1pXBA0THOs2Ck7w3J7Ru27yOBG3qdmEVn
   CrQ59OY3rkWbSHuvPQwyg//JY93hUmtDWqXuMmFf8/6amEt+ZANXDNM2S
   BKAI/gqWxjVox2A8LNF/+Yrb+HIi4CJaDkbnPdjSq7dWVg0oznp6ImWxo
   w==;
X-CSE-ConnectionGUID: wKfWNixiTDaSmDQhExqNuA==
X-CSE-MsgGUID: 8ifeW0ADR5uGVli+CgMQVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15067645"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="15067645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 04:26:26 -0700
X-CSE-ConnectionGUID: 9F0smm4QSSy2LZHJd1bI/w==
X-CSE-MsgGUID: d7fvAqU0Qeq1ZVnxALAibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40855869"
Received: from lkp-server01.sh.intel.com (HELO 0bcb674f05cd) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jun 2024 04:26:24 -0700
Received: from kbuild by 0bcb674f05cd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIRY6-00007e-1l;
	Sat, 15 Jun 2024 11:26:22 +0000
Date: Sat, 15 Jun 2024 19:26:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 43/137]
 arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400e000:
 pinctrl-names:1: 'wakeup' was expected
Message-ID: <202406151937.RIkeOwyj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   8086474caf5dc2570a947669acf226d319cd0651
commit: 86985fb2cb7b7ec9a7f06c23f83264a40f8f2fc6 [43/137] dt-bindings: can: m_can: Add wakeup pinctrl state
config: arm-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151937.RIkeOwyj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151937.RIkeOwyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151937.RIkeOwyj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   	'st,stm32mp157c-ed1' was expected
   	from schema $id: http://devicetree.org/schemas/arm/stm32/stm32.yaml#
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: touch@44: touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: /soc/sai@4400c000/audio-controller@4400c004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: /soc/sai@4400c000/audio-controller@4400c024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: /soc/sai@50027000/audio-controller@50027004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: /soc/sai@50027000/audio-controller@50027024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
