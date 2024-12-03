Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F6B2500A0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 00:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733184714; cv=none; b=YM1X7jKWryLLMNwsyFQBgOAQgfTVWk7Tg1/LdEQxdbWnkIjgcOj7RGE//fqmTAw4MbvnkoHJvYa+RnWSmc6S3SQYuvd+xEgiT7HczP+f2vCQXIyiQn8ScIcORYdo1Yjnu3TWBtwOmfbNZPZgn0x1ZcIRqG/QnknAwTQQZOPclEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733184714; c=relaxed/simple;
	bh=HWQ5Pf7eI46icWKeQyXJNcR1mlnXq6EXsdRqbuD5PtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJo+aPh9Kan37TMf+B2KRReyTqK08uRGotnMs4hYpD/qCf1Jwnt6Z6H4WCLaTC3ZlxQFb5cWAyqirD9Q5cRr4pVEUezag/B5MTSfGS1RWED8oiFfUaTfuVtVyTF3cORuqDTHVDJEM1wa+JsRFozDRkAJ7pfP2GDtsN3YpP8ziEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0mW2Atr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0mW2Atr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733184712; x=1764720712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HWQ5Pf7eI46icWKeQyXJNcR1mlnXq6EXsdRqbuD5PtQ=;
  b=d0mW2AtrmwPJydw/V/MG7nM6G5HiZDQ2eLkulyPKfaUKc9SGWYCsbRfK
   UuSfncWzamsI4A2kgDrCH0oey8cpc/FFkGJCMYpeNU0nK1nxbayXEoypb
   mwiCbo6PrPBPGo2V3EZMLxsqP54JpS8HVS3LcHd+lpv2MLxSvupDKklyy
   JiRPMG2ZPexgoXM98R/v6BAfXhwfzh6/kmAzG7O3rHgEnSRWHMp03umpj
   +giP4dCaYjduVFDlIf8QzPM/bPDjqxOHjBZM7i9nHT+l3RVh3AmOJMqYW
   h+4ylJ0ramlnLQbqq6aHaeJMYRwySn/A7KzBi79BHqHYdv/plv/fel3J9
   w==;
X-CSE-ConnectionGUID: 7gniQ/YdSgSVXnXgxujq/Q==
X-CSE-MsgGUID: LydsoEBNRp2D6zDmirI1rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="36233195"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="36233195"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 16:11:51 -0800
X-CSE-ConnectionGUID: nF2MHO9+TBOa4ozHYR8/yA==
X-CSE-MsgGUID: GymC5iFRQaSEqEDM+fO58A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="98278111"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2024 16:11:50 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIGVy-00033s-1o;
	Tue, 03 Dec 2024 00:11:44 +0000
Date: Tue, 3 Dec 2024 08:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 3/3]
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: mutex@1c101000:
 False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'],
 'reg': [[0, 470814720, 0, 4096]], 'interrupts': [[0, 494, 4, 0]],
 'power-domains': [[45, 18]], 'clocks': [...
Message-ID: <202412030827.PnAQC8bS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   63100bdb333adae1618a0bc1513bd90d57383c9b
commit: 63100bdb333adae1618a0bc1513bd90d57383c9b [3/3] UPSTREAM: arm64: dts: mt8195: Fix dtbs_check error for mutex node
config: arm64-randconfig-052-20241202 (https://download.01.org/0day-ci/archive/20241203/202412030827.PnAQC8bS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030827.PnAQC8bS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030827.PnAQC8bS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi'] is too long
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt2701-dsi', 'mediatek,mt7623-dsi', 'mediatek,mt8167-dsi', 'mediatek,mt8173-dsi', 'mediatek,mt8183-dsi', 'mediatek,mt8186-dsi', 'mediatek,mt8188-dsi']
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt6795-dsi']
   	'mediatek,mt8173-dsi' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/dsi@1c012000: failed to match any schema with compatible: ['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: mutex@1c016000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 469852160, 0, 4096]], 'interrupts': [[0, 658, 4, 0]], 'power-domains': [[45, 16]], 'clocks': [[30, 21]], 'mediatek,gce-client-reg': [[142, 4, 24576, 4096]], 'mediatek,gce-events': [597], '$nodename': ['mutex@1c016000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: mutex@1c016000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: mutex@1c101000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 470814720, 0, 4096]], 'interrupts': [[0, 494, 4, 0]], 'power-domains': [[45, 18]], 'clocks': [[36, 16]], 'mediatek,gce-client-reg': [[142, 6, 4096, 4096]], 'mediatek,gce-events': [704], '$nodename': ['mutex@1c101000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: mutex@1c101000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dma-controller@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dma-controller@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dma-controller@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dma-controller@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dma-controller@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi'] is too long
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt2701-dsi', 'mediatek,mt7623-dsi', 'mediatek,mt8167-dsi', 'mediatek,mt8173-dsi', 'mediatek,mt8183-dsi', 'mediatek,mt8186-dsi', 'mediatek,mt8188-dsi']
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt6795-dsi']
   	'mediatek,mt8173-dsi' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/dsi@1c012000: failed to match any schema with compatible: ['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: mutex@1c016000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 469852160, 0, 4096]], 'interrupts': [[0, 658, 4, 0]], 'power-domains': [[45, 16]], 'clocks': [[30, 21]], 'mediatek,gce-client-reg': [[142, 4, 24576, 4096]], 'mediatek,gce-events': [597], '$nodename': ['mutex@1c016000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: mutex@1c016000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: mutex@1c101000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 470814720, 0, 4096]], 'interrupts': [[0, 494, 4, 0]], 'power-domains': [[45, 18]], 'clocks': [[36, 16]], 'mediatek,gce-client-reg': [[142, 6, 4096, 4096]], 'mediatek,gce-events': [704], '$nodename': ['mutex@1c101000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: mutex@1c101000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dma-controller@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dma-controller@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dma-controller@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dma-controller@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dma-controller@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi'] is too long
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt2701-dsi', 'mediatek,mt7623-dsi', 'mediatek,mt8167-dsi', 'mediatek,mt8173-dsi', 'mediatek,mt8183-dsi', 'mediatek,mt8186-dsi', 'mediatek,mt8188-dsi']
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt6795-dsi']
   	'mediatek,mt8173-dsi' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/dsi@1c012000: failed to match any schema with compatible: ['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: mutex@1c016000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 469852160, 0, 4096]], 'interrupts': [[0, 658, 4, 0]], 'power-domains': [[45, 16]], 'clocks': [[30, 21]], 'mediatek,gce-client-reg': [[142, 4, 24576, 4096]], 'mediatek,gce-events': [597], '$nodename': ['mutex@1c016000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: mutex@1c016000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: mutex@1c101000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 470814720, 0, 4096]], 'interrupts': [[0, 494, 4, 0]], 'power-domains': [[45, 18]], 'clocks': [[36, 16]], 'mediatek,gce-client-reg': [[142, 6, 4096, 4096]], 'mediatek,gce-events': [704], '$nodename': ['mutex@1c101000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: mutex@1c101000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dma-controller@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dma-controller@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dma-controller@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dma-controller@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dma-controller@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi'] is too long
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt2701-dsi', 'mediatek,mt7623-dsi', 'mediatek,mt8167-dsi', 'mediatek,mt8173-dsi', 'mediatek,mt8183-dsi', 'mediatek,mt8186-dsi', 'mediatek,mt8188-dsi']
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt6795-dsi']
   	'mediatek,mt8173-dsi' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/dsi@1c012000: failed to match any schema with compatible: ['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: mutex@1c016000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 469852160, 0, 4096]], 'interrupts': [[0, 658, 4, 0]], 'power-domains': [[42, 16]], 'clocks': [[29, 21]], 'mediatek,gce-client-reg': [[131, 4, 24576, 4096]], 'mediatek,gce-events': [597], '$nodename': ['mutex@1c016000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: mutex@1c016000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: mutex@1c101000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 470814720, 0, 4096]], 'interrupts': [[0, 494, 4, 0]], 'power-domains': [[42, 18]], 'clocks': [[35, 16]], 'mediatek,gce-client-reg': [[131, 6, 4096, 4096]], 'mediatek,gce-events': [704], '$nodename': ['mutex@1c101000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: mutex@1c101000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dma-controller@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dma-controller@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dma-controller@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dma-controller@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dma-controller@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi'] is too long
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt2701-dsi', 'mediatek,mt7623-dsi', 'mediatek,mt8167-dsi', 'mediatek,mt8173-dsi', 'mediatek,mt8183-dsi', 'mediatek,mt8186-dsi', 'mediatek,mt8188-dsi']
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt6795-dsi']
   	'mediatek,mt8173-dsi' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: /soc/dsi@1c012000: failed to match any schema with compatible: ['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi']
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: mutex@1c016000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 469852160, 0, 4096]], 'interrupts': [[0, 658, 4, 0]], 'power-domains': [[42, 16]], 'clocks': [[29, 21]], 'mediatek,gce-client-reg': [[120, 4, 24576, 4096]], 'mediatek,gce-events': [597], '$nodename': ['mutex@1c016000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: mutex@1c016000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: mutex@1c101000: False schema does not allow {'compatible': ['mediatek,mt8195-disp-mutex'], 'reg': [[0, 470814720, 0, 4096]], 'interrupts': [[0, 494, 4, 0]], 'power-domains': [[42, 18]], 'clocks': [[35, 16]], 'mediatek,gce-client-reg': [[120, 6, 4096, 4096]], 'mediatek,gce-events': [704], '$nodename': ['mutex@1c101000']}
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: mutex@1c101000: Unevaluated properties are not allowed ('mediatek,gce-events' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dma-controller@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dma-controller@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dma-controller@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dma-controller@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dma-controller@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
