Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33452541E6D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995139; cv=none; b=LQFei8f0X1BMroyBqb0DJ/xV+HbBYIsPLZ7yztDF1NDZD55JVXnTZHt+5RT88f6yS0X+OZ2GApZkg45QfrN4GmhQzduDy61cnPjQzK1mmCg29XiN8YOIGG7GKmfXW5q6AHY5O3xO+g9nqhLK04jqzM7tlGWOEyxw9IlRivHDzcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995139; c=relaxed/simple;
	bh=ykSqiRCaab1yIgqX3h+4+s3g46Ii3yuaeyrc7vaondw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L9Ai8S/T4GL2Dy1RuZk1S3rvKrh03kANf5YYpn4NbqxLj4JbOV6sUGitPPwVT+BxVVtFyjLk6BOeQZw8FRn1gUaOvpc8KoXHju5E4NVsYCB1shXHm5ve2u/uJdSCJ2nSDwf7BRvTm28f4vWDxTunkq3kURVjTkF8/ztlyi98iv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWTNqIfR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWTNqIfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791995134; x=1823531134;
  h=date:from:to:cc:subject:message-id;
  bh=ykSqiRCaab1yIgqX3h+4+s3g46Ii3yuaeyrc7vaondw=;
  b=ZWTNqIfR8P+Z/O0EoBkPG7/S0Ct2x73H2ItjSoNq2dRP34vNi8Rib0s8
   P2zsLj5zi6fX7wiCM19EAG7wr05rAn7Nht+P3MoLK2AZANkPyI6fUbCYi
   luQnqu+BE7xXFdFXUwL68i0wCXnjL/YdRvs2cCkJcbPj9zw1JGzE7XPUj
   uKh4eLiHoP/Ae8a5qo82WodnYtJgc+O1nqbi0dwksOjZL4iv5sQYhScN0
   sJaQVfvTgkN03A5ppDQMrAL+3hWzcAk3HIgTAMwk4PjsBZYdcHIaXckgs
   1/1UX67d4iGgk5gYSMPcWIu41ccYBh1pn8bGpzor+y16s9m3DQqvT/7RQ
   Q==;
X-CSE-ConnectionGUID: Y/fdsEjWSj+tRwSxk0YkVA==
X-CSE-MsgGUID: 6pObZzhqQleTXLFKVcAWQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="765881"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="765881"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 09:23:24 -0700
X-CSE-ConnectionGUID: vwGfE8HwTo+KZAgga5ymsQ==
X-CSE-MsgGUID: WxoutRklSWWCDWpYn9+exg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1685184"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Oct 2026 09:23:23 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH1lA-00000000BBn-2Ua6;
	Wed, 14 Oct 2026 16:23:20 +0000
Date: Wed, 14 Oct 2026 18:22:47 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 14711/16498]
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: pm_domains0
 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match
 '^(power-controller|power-domain|performance-domain)([@-].*)?$'
Message-ID: <202610141828.0WNlEIQb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1fffefb00cc0b0da1f2ae24e3d33364530ea6515
commit: f9b94ef24d98a34799221cf11cd32e6eb45c7bdd [14711/16498] dt-bindings: power: Convert Ux500 PM domains to schema
config: arm-randconfig-2402-20261009 (https://download.01.org/0day-ci/archive/20261014/202610141828.0WNlEIQb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 43c3bf2782849a898d95a345a28179d639ef4e22)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141828.0WNlEIQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610141828.0WNlEIQb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): pm_domains0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): regulator-gpio: {'compatible': ['regulator-gpio'], 'gpios': [[29, 4, 0]], 'enable-gpios': [[28, 25, 0]], 'enable-active-high': True, 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[2900000]], 'regulator-name': ['mmci-reg'], 'regulator-type': ['voltage'], 'startup-delay-us': [100], 'states': [[1800000, 1], [2900000, 0]], 'phandle': 120} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-snowball.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): pm_domains0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): pm_domains0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): pm_domains0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): pm_domains0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): pm_domains0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): pm_domains0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): pm_domains0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): pm_domains0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: pm_domains0 (stericsson,ux500-pm-domains): $nodename:0: 'pm_domains0' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
