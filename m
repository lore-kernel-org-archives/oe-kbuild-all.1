Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1D57C720
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789888; cv=none; b=rgT//LVvirNqwGZ2pnE4PUODt4JoS1iX+L/IV+zwqIDbM1Vo0+ZENkyqRZZrJG4+LbEnBkIIFeus3zHZU0aRu0Qn7WAB9fzbkrzwuorVUFB/oZHlkwsvCV2tBEG7WZ/wSOOL2WsMhybNC1jAtDpj8+SwDxnFTKOTkd1ylrS9qcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789888; c=relaxed/simple;
	bh=OZmVXz1lQp0BfimhJc2s6cnSU7FEOJYJ1nApmtOA1TI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JEhUpSGxvz8oTDx356WJ3uRzwW8hIGBPUMd4usbZcy6uVqftYcRRDQlIBywW9oeKUVvT3uoFIRV3hj4lW5CvQjsU+e6ujEiNHIJKaoT7zyEknDLxikgM7BGJw5aGB2tqQ3Z6luQV1dPHGUxlq8f0svEKMkI4TFZmGqIaNrfHTUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDTLJTIG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDTLJTIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789887; x=1822325887;
  h=date:from:to:cc:subject:message-id;
  bh=OZmVXz1lQp0BfimhJc2s6cnSU7FEOJYJ1nApmtOA1TI=;
  b=QDTLJTIGLggVK079E5JljOagcYeLM/oQEj13O6uewDHC6zOm4BhQ+FVW
   y+JBdL6tPyq/jm25UpM4JJ5PK356AHBqIqkdI6EaNd8RY8Cbu3XlGg4V/
   eHn4eNy9MaMe7roS14frHiM7tMKdubIultSGWE7mlLDznRYJL82X+6/ue
   GXsqs8dPq8MGZFpL//Bq+ODIvaO/sR3ipSNHuhwJjo11E9ZhwExoaFSVx
   8Hr/xTxoVxcukKhXAChIUR+JPP7TaqRS6yNEImwa3qV+7sYYM0I814C1I
   hcPnKCUsN1yHAJ89UIF0E9+3Paw7QrZXjgu2DKPhmXk18VoLEbRa9cfRT
   Q==;
X-CSE-ConnectionGUID: LqEgzKCbTzy4GKZZAEQdqw==
X-CSE-MsgGUID: gq0V/kHfTQuD33YbSipt9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="100866514"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="100866514"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:38:06 -0700
X-CSE-ConnectionGUID: IbUpLArEQr+ZJCurErZ9qA==
X-CSE-MsgGUID: +JaHGI9HSjasXqWuWWx9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="273838658"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Sep 2026 10:38:05 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xByFm-000000001wp-1Vyz;
	Wed, 30 Sep 2026 17:38:02 +0000
Date: Wed, 30 Sep 2026 19:37:52 +0200
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 10913/12559]
 arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202609301936.oogGZnPc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
commit: 823703cb5e3a6825daf8ce5dbfc03aeafbc5b688 [10913/12559] arm64: dts: renesas: Add support for solidrun rzv2l som and hb-iiot evb
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20260930/202609301936.oogGZnPc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301936.oogGZnPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301936.oogGZnPc-lkp@intel.com/

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
