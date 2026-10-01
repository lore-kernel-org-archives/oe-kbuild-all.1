Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB2233722
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 23:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790897516; cv=none; b=t8U98FUPaniaky1N1rTji4KyJfxv5r3mbw3QN28wGh8icEmEMthAvu76quRjSHhdmT2wdG2HWGR6OXajTyIOWVb+ul32GHPYAHrgWsMW/uPU3A0wwaEY3sO5L/Qcd41788faXJ/9HRn4ceNE5q+6iB4nPI03vJxF/7wOIqg00gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790897516; c=relaxed/simple;
	bh=iSjPO+6KDPfmuv8Fpl9y7cAGDgGK1D+VkOtTdYHbq1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vcl8ZCezTu4iiXB6yu7Bl7CucgEVnaj4efsnIotd1qjtCr02bSe3U1Nf++m/tZSHfPqqq2ruH2FyRH/ehmj9+slMPK6oaDYPlP3Ce6QRvxJudSMPVbIkf5ElZFt70U5wa9wmveOfiBaCdJtEYS5OX9MFXRioKnPkgQS8I98JHzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhuivjEy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhuivjEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790897514; x=1822433514;
  h=date:from:to:cc:subject:message-id;
  bh=iSjPO+6KDPfmuv8Fpl9y7cAGDgGK1D+VkOtTdYHbq1U=;
  b=GhuivjEyY60RSwSXvxYK02sar7MX/3/hboLsgxPMD55GCsiNJHtiVnCP
   wXwgO7UirKIv0D9salp68ZSn6+sTgM7mpne8x49yz0diBBZPcK02h0j1W
   Dn5XGkOk/YEg+bHupyB7oJ4XhUyVavfu6RXfl6cmHCNXmQHE+Q95duZPS
   hcLvrlyc+RC7X1LdadX+24Era2cRaJbsnvr06o2Oix5QbQI7SD1DXgkaY
   JqgCPJC0BXjlLeWUJT8xgL2tC9Pc5Q/fqAmEKEX2tYl9kYqfx9qb+fTc1
   F0344+dB8VGDhN7F81vqMXQncOykAxMtH0C8fKnpQyq0I5ZQmEIZ4klQj
   g==;
X-CSE-ConnectionGUID: 3dMXg3xMSAabZ3pnJgDr+A==
X-CSE-MsgGUID: xVILqovYTy2jLPF32VtbaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90804981"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90804981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 16:31:53 -0700
X-CSE-ConnectionGUID: 8mvxOyD7T5CGKGD+k3G5jA==
X-CSE-MsgGUID: GLuq4HYwTHScMxak4ggydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276180139"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 01 Oct 2026 16:31:51 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCQFh-000000000HG-3bMW;
	Thu, 01 Oct 2026 23:31:49 +0000
Date: Fri, 02 Oct 2026 01:31:01 +0200
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 10765/13246]
 arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202610020144.kooGEmVs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: 0ad5dc33c83c6bfdf7190b470fe8b2609052c9e4 [10765/13246] arm64: dts: renesas: Add support for solidrun rzg2l som and hb-iiot evb
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261002/202610020144.kooGEmVs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020144.kooGEmVs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020144.kooGEmVs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-rs485-b.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-rs485-a.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
