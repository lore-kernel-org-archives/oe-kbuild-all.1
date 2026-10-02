Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8563447F764
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938367; cv=none; b=JvtntHPDfRRbSusZ3UDOkUB9HD1QtdMUG4ZTYNy6ASlFhs/FFhCbWfwYwXtdeR04uDeMRW3SgxZYkriP6JAQ4YGEFTe84T3bAfXmpczQ62R6+LxA6VJSjo6LS4D7ZUpbonxBaY8PML1o2a4OKKSKjLtxUvnLGrKApEvIRo59eWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938367; c=relaxed/simple;
	bh=10SSTYK6DwGpUscmcN9ikX4bKuv6qzRY40RN3dQZlj4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hbxLiguvOGnK0KweWu7CBe+9glsF6WIvE5dHdi0Ivq7kuvwd5SV0N2EQbA46enACbb0jIFEM9MDMH2YRMWHjQZuMG//2IJaQgPARIl/QcxXGAQAywxKjOL5OBlOSTBSLUaJv0OHLf5rYApnE5Jx1X6eGnQ5vxhGEw6LSgslpOwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0RJ1AaT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0RJ1AaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790938364; x=1822474364;
  h=date:from:to:cc:subject:message-id;
  bh=10SSTYK6DwGpUscmcN9ikX4bKuv6qzRY40RN3dQZlj4=;
  b=N0RJ1AaTR6xi0XU4R9X3bTfOEjK3Lk5IOqNssvKSPjqlLNXrjKA2YH9o
   dAVdXfwLrLSmq8cksxN1uri8TKJa9V5yVmOiHQOgMDyBgX/w/7gJY2iPP
   1hkvyTcuKrHrZWYjT4RiOnacQ0Qk+jEnkPVZzBZ/9zHZrywL6QvnRrXpG
   BMZBWJLkQRq/YlMRsl5ly2NYfgXyGONAyi/eUGE+L/muJRumh1j92LG24
   10ukrOh2muzh66wTkac5Wqngq10M79oH0LD6IjRiSoBum+Pv1TVbyMMEO
   qPwcdtHrchuyNa3T5oyiBGF6vMI6KV0oPlUzyrKWZk7eTpL/lZFqb0Zvw
   Q==;
X-CSE-ConnectionGUID: I/tn4ZuQRrG0V/B/H1kxZw==
X-CSE-MsgGUID: qbKj9eo0SjGFC/T3f6BOJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90471556"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90471556"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:52:44 -0700
X-CSE-ConnectionGUID: 7PEL0Mf/QWymXJ/OKGns1g==
X-CSE-MsgGUID: MAZq5KoAQmibRAI4CnoTuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275776723"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2026 03:52:42 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCasa-000000000VP-12yA;
	Fri, 02 Oct 2026 10:52:40 +0000
Date: Fri, 02 Oct 2026 12:51:50 +0200
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 10766/13246]
 arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202610021251.jUjatZoL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: 823703cb5e3a6825daf8ce5dbfc03aeafbc5b688 [10766/13246] arm64: dts: renesas: Add support for solidrun rzv2l som and hb-iiot evb
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261002/202610021251.jUjatZoL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021251.jUjatZoL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021251.jUjatZoL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-b.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-a.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
