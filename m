Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07831442B3E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 21:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977754; cv=none; b=HE1kAsN9vKymM3y87UbE8aMyR8bfuTlkdbW3IMy4rIbsLz/ai05At/Tr3rsW3UGPQECspxaQ6SN6Ke27i2Nhi22CbKxMtQS45hrwFno5dxd8pyHYBcbn7ArGss93aUAaoSjSFXDBSFIaJch5ntuHsinPVqmHmP2otcNryB1Oncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977754; c=relaxed/simple;
	bh=OynfP7jYvtAOT6yDaQ2JJIB2ExpN13YWahleRKmllbo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=as53rjazLsFXMLXvZmdszUDQVv80qZCnqPZacN+t5VVXgbntUBQDazB/0YKWyp4TO9SXCQl3GBT2Ip50jVnu4BWabWJKmoASESKNe+SMYq02kOWi02hg4yhrPPTuR8XJ9DoNeiFXyQ7AsjrPM4hK8WcwDK67f0R/1cX8280d9/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSVHZxtd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSVHZxtd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790977751; x=1822513751;
  h=date:from:to:cc:subject:message-id;
  bh=OynfP7jYvtAOT6yDaQ2JJIB2ExpN13YWahleRKmllbo=;
  b=TSVHZxtdiKfzrpLv75fIPJnQS8vpnzE+fQsiCr1eSJlO1cuQsOM08e9Q
   j7mpN69Js/ZfCRClbpbu0oL9SKFTv0bTpd7Yvqj6ZxxRWmiWsKqnos1py
   B2YXiYyaReNS97NyLyfLSw0H+QggEHB9G+r6gUTyeKwkjSK5R5HDb6Y/v
   4fzwS/IGW/4lGtcB1EGblyy7ptEglc4yS2T+Zl/KF+5XZPvFAl0MJBqhN
   jxivA1pukH02WQXw0qYsfwAhx9vwXuojvCjRP9vRSl3AEkeXgHyZZ34tq
   MEQOQue0IueDnZxbs7YTD7Mh7/qdYA6LM53ojMEgXJPiyZQ3cQhzZl3/J
   g==;
X-CSE-ConnectionGUID: EoFWbqqoQuuTg2zhCeekXQ==
X-CSE-MsgGUID: CGBAonx/TrKDKlLwCvswSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="109236640"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="109236640"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 14:49:11 -0700
X-CSE-ConnectionGUID: WKa/EONlQI6H5WoNVDWptg==
X-CSE-MsgGUID: sQutECDMTY+r+B1TKWhdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275873481"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2026 14:49:08 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCl7q-000000000m3-1CDZ;
	Fri, 02 Oct 2026 21:49:06 +0000
Date: Fri, 02 Oct 2026 23:48:31 +0200
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 10767/13246]
 arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202610022326.kA7cdH9O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: 17ed07aa3b1222da7c33635cf47c4832d6c8f910 [10767/13246] arm64: dts: renesas: Add support for solidrun rzg2lc som and hb-iiot evb
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261002/202610022326.kA7cdH9O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610022326.kA7cdH9O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610022326.kA7cdH9O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-a.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-b.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
