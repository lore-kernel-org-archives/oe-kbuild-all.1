Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F92882B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786873; cv=none; b=K6GdMWIscmdxE8ugXNIxY5ij4hgNo4Ufmj+tcGESBS5eBo6KvK4O0WeclQNlmrzWGK0hYKVjN2Md0x96jzx7mAaF5z/IR752HpecxKtro5KgjtOpTd8nBreg6aZjW7HiwCZZ2pOCkY4xPVX5SqpVcOn4gPF6zmMYdJwiRynD2gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786873; c=relaxed/simple;
	bh=85fv7oPb79/jeamn2NNKtzZUupYhkdnb5j2rJy5r8OE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hOgictCJO3NCTA7YVZ1cwRrvgAPArwFqOgVBa1gHjKEqsCdmqaRuAs/0svzFUSAjA56OAxSdBP6yWxmpHcUvRVWBUvvm81ELsYybbDJuE/cm49Ve15IxBS7kwqG1W4/o7/Cdt8DqI4IdtkEaxcwqeO9V/svqd48tYIJBzVmMJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpW/ZeV+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpW/ZeV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753786870; x=1785322870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=85fv7oPb79/jeamn2NNKtzZUupYhkdnb5j2rJy5r8OE=;
  b=SpW/ZeV+h9ZHS7sAL0DvmXdfcs5azR5mRxLHD7+W0Cojxy+ugjSqzgVk
   5iHVcbbc0nmniIrU9/0CftNGoAf5JZR/RLPR32ag0ueU/NYMbKJ1jGfGa
   aJ+MrOy3kvsexUIvQaCw56yLUwi3AnqlJOWMrtdb3TQ+jS/hMVkkrOBTf
   SBUiVknmep8g+baaqpAObyBZwMsftccjGyjxzv/ODao6BLgZ+2f5tNz11
   5TeSFFdFMAvEB0HkcMrmF0bzfFug0D0ISl4aGuZnVNE9Y1WjOYJQk3SxT
   MWhNgMTHCmN+l+grLJVwywaO41BsQPdaB33khcoadXMH3Xii4uuZxVxkb
   g==;
X-CSE-ConnectionGUID: RCSxOivGSS+456ApeQVniQ==
X-CSE-MsgGUID: UOLJXWCSQZOwoU58IM3tvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55989003"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55989003"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 04:01:10 -0700
X-CSE-ConnectionGUID: 5FV/je/5SQSxefFFFCwZLA==
X-CSE-MsgGUID: 6VkmJqPjThiPN5gt0tzUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="163015328"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2025 04:01:08 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugi4w-0001Db-0A;
	Tue, 29 Jul 2025 11:01:06 +0000
Date: Tue, 29 Jul 2025 19:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4598/12827]
 arch/mips/boot/dts/brcm/bcm97425svmb.dtb: memc-ddr@2000
 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202507291837.Eao18ixU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   54efec8782214652b331c50646013f8526570e8d
commit: 501be7cecec9aaf9cd52e76d0820efd6d0b952e7 [4598/12827] dt-bindings: memory-controller: Define fallback compatible
config: mips-randconfig-051-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291837.Eao18ixU-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291837.Eao18ixU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291837.Eao18ixU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: waketimer@409580 (brcm,brcmstb-waketimer): 'interrupt-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: waketimer@409580 (brcm,brcmstb-waketimer): $nodename:0: 'waketimer@409580' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: memory_controllers (simple-bus): $nodename:0: 'memory_controllers' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: memory-controller@0 (brcm,brcmstb-memc): $nodename:0: 'memory-controller@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: /memory_controllers/memory-controller@0: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: /memory_controllers/memory-controller@0/memc-arb@1000: failed to match any schema with compatible: ['brcm,brcmstb-memc-arb']
>> arch/mips/boot/dts/brcm/bcm97425svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: /memory_controllers/memory-controller@0/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy']
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: /memory_controllers/memory-controller@0/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy']
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: memory-controller@1 (brcm,brcmstb-memc): $nodename:0: 'memory-controller@1' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: /memory_controllers/memory-controller@1: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: /memory_controllers/memory-controller@1/memc-arb@1000: failed to match any schema with compatible: ['brcm,brcmstb-memc-arb']
>> arch/mips/boot/dts/brcm/bcm97425svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: /memory_controllers/memory-controller@1/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy']
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: /memory_controllers/memory-controller@1/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy']
--
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: waketimer@408e80 (brcm,brcmstb-waketimer): 'interrupt-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: waketimer@408e80 (brcm,brcmstb-waketimer): $nodename:0: 'waketimer@408e80' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: memory_controllers (simple-bus): $nodename:0: 'memory_controllers' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: memory-controller@0 (brcm,brcmstb-memc): $nodename:0: 'memory-controller@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: /memory_controllers/memory-controller@0: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: /memory_controllers/memory-controller@0/memc-arb@1000: failed to match any schema with compatible: ['brcm,brcmstb-memc-arb']
>> arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: /memory_controllers/memory-controller@0/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy']
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: /memory_controllers/memory-controller@0/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy']
--
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: waketimer@408e80 (brcm,brcmstb-waketimer): 'interrupt-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: waketimer@408e80 (brcm,brcmstb-waketimer): $nodename:0: 'waketimer@408e80' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: memory_controllers (simple-bus): $nodename:0: 'memory_controllers' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: memory-controller@0 (brcm,brcmstb-memc): $nodename:0: 'memory-controller@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: /memory_controllers/memory-controller@0: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: /memory_controllers/memory-controller@0/memc-arb@1000: failed to match any schema with compatible: ['brcm,brcmstb-memc-arb']
>> arch/mips/boot/dts/brcm/bcm97360svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: /memory_controllers/memory-controller@0/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy']
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: /memory_controllers/memory-controller@0/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy']
--
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: waketimer@408e80 (brcm,brcmstb-waketimer): 'interrupt-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: waketimer@408e80 (brcm,brcmstb-waketimer): $nodename:0: 'waketimer@408e80' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: memory_controllers (simple-bus): $nodename:0: 'memory_controllers' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: memory-controller@0 (brcm,brcmstb-memc): $nodename:0: 'memory-controller@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: /memory_controllers/memory-controller@0: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: /memory_controllers/memory-controller@0/memc-arb@1000: failed to match any schema with compatible: ['brcm,brcmstb-memc-arb']
>> arch/mips/boot/dts/brcm/bcm97362svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: /memory_controllers/memory-controller@0/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy']
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: /memory_controllers/memory-controller@0/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy']
--
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: waketimer@409580 (brcm,brcmstb-waketimer): 'interrupt-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: waketimer@409580 (brcm,brcmstb-waketimer): $nodename:0: 'waketimer@409580' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/brcm,brcmstb-waketimer.yaml#
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: memory_controllers (simple-bus): $nodename:0: 'memory_controllers' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: memory-controller@0 (brcm,brcmstb-memc): $nodename:0: 'memory-controller@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: /memory_controllers/memory-controller@0: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: /memory_controllers/memory-controller@0/memc-arb@1000: failed to match any schema with compatible: ['brcm,brcmstb-memc-arb']
>> arch/mips/boot/dts/brcm/bcm97435svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: /memory_controllers/memory-controller@0/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy']
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: /memory_controllers/memory-controller@0/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy']
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: memory-controller@1 (brcm,brcmstb-memc): $nodename:0: 'memory-controller@1' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: /memory_controllers/memory-controller@1: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: /memory_controllers/memory-controller@1/memc-arb@1000: failed to match any schema with compatible: ['brcm,brcmstb-memc-arb']
>> arch/mips/boot/dts/brcm/bcm97435svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: /memory_controllers/memory-controller@1/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy']
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: /memory_controllers/memory-controller@1/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
