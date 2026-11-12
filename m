Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492654;
	b=avkWzKqjXuGYX4OOos/I49Ov1Reh6QfrquVCM2y62CCeJAV53+Rvm8oiwBtTxOuiUUkP
	 34TxbJ/ejh/1kAqTZABGjNus/RwgqtlqNev3qvnZnNBu0Wc2GuyDtjlxUcS74H9zl86m/
	 tEPesDKu0NcvHhh7yRPc8X+tbZgUBiX2YPXbslvcKV/gHUrP+oB1v/e3JUX+ac1XxkqLe
	 iGk+KHUgucCwupSUsaOaAj480Eo1wFpMi0qQAZgrefGGlS+WVsccbfIsCbBiHvxi4TmmT
	 E7n1TqHdK5DhAeHloc8+KAd4cecaAerf+mVG9IdfKBdB/PRMpBhTAdBnBPM15v2W5DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492654;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dfr0szhXgq6mrwD6GSRebi3jSykqIn0Ydhm1F2OF7xc=;
	b=r6ZhlLiOWNIMpEHn1PbtPRYqEkz/1LagjDhwOXLGcTf8PpPlzqgSzt20Fgig9PLd6Lfy
	 kSdbP/SPxSZXABzFjuhEfFxD/N89H9gWwqrJKep2+vkgoEemv1+66GlqeFiYYLlPwp++X
	 GRC3rlL7arSkPM2wYmxjmluTF1ELxrMymrcKqqUOYy6liSrnGmOvZZwrdPVZ+WrIe3SGR
	 7Pig0XKLhA1bgNXaTngQ7sTS4/+cKymhSxdfppHlucnPxbp3RQWoYHz5XTsjs9Y7Rru9R
	 4DTObI9tI2vWeopo8OgtCex8sTKIIS6wR6IYB4MFDzThlBhWOIHYNvuQyGA+dZkJ/QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Po9nR+OY;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4AB606A889
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 14:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4AB606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Po9nR+OY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794492653; x=1826028653;
  h=date:from:to:cc:subject:message-id;
  bh=KIapVqgbXiUeZCQ+K9B+WVEIjDh+KOkgYYoqnXJLAfo=;
  b=Po9nR+OYVeHjNAr3Gx3XwmNA7bcG26NIEIbBBSj1DwTzVwgoIE5ZjUsV
   75Zx7TvsoJmvSFIKIuSiOlhaNc7r59POVQosDL19MM8bbDxHuVekHqSNe
   UsEn+3vxyx6Tsg8qVFPnrJjOZHJ+eviuVsZXflCnte3u69W9J3XWvQNAm
   imKD9n/n3/+H+U2tZZUN7eN8vma671QDEFldXsx4vMpFz3e/9ZA+geFoj
   pbH6F4cgsTfG1v8u/R9Zb4xlpep+PVkcQlKEGny0RotEdBwarq9IzloI9
   Ge6FZABlrp9z7Qnqiyce6weUccXXJPUxBlJA7HVjLu/IPdnDfIB822ToU
   g==;
X-CSE-ConnectionGUID: 1xMVleyMQ56l9bvt2Qdueg==
X-CSE-MsgGUID: oFGJpKFMRY6Hsfrf1Eo6Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3180121"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3180121"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:10:53 -0800
X-CSE-ConnectionGUID: 0e0KV/cYQQe3SpnpkcoCiQ==
X-CSE-MsgGUID: Ht3v/PacR3qxIY8uSYU4qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10397424"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 12 Nov 2026 06:10:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRVVo-000000000tT-21he;
	Thu, 12 Nov 2026 14:10:48 +0000
Date: Thu, 12 Nov 2026 15:09:57 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
 Ivan Vecera <ivecera@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 1597/2847]
 arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: timer@4c00a000
 (st,stm32-timers): 'timer@14' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
Message-ID: <202611121546.JC3i4FuM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   630059a5a632377b9b7b487baccde92b7ae1dd47
commit: 17c58242988d2b4363fe9d506d387d7d13d50842 [1597/2847] dt-bindings: Use hex unit address patterns
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611121546.JC3i4FuM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611121546.JC3i4FuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611121546.JC3i4FuM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: timer@4c00b000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: timer@4c00c000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
--
   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: timer@4c00b000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: timer@4c00c000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
--
   arch/arm/boot/dts/st/stm32mp135f-dk.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: timer@4c00b000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: timer@4c00c000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp135f-dk.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
--
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: mmc@1 (prt,prtt1c-wfm200): $nodename:0: 'mmc@1' does not match '^wifi(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/silabs,wfx.yaml
--
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): False schema does not allow [[44, 15, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): False schema does not allow [[45, 0, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): Unevaluated properties are not allowed ('bluetooth', 'uart-has-rtscts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): False schema does not allow [[44, 15, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/serial.yaml
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): False schema does not allow [[45, 0, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/serial.yaml
>> arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: m4@10000000 (st,stm32mp1-m4): 'interrupt-names', 'recovery' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
   arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: /soc/bus@5c007000/i2c@40015000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
   	from schema $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml
--
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
