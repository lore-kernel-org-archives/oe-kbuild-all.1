Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053C15B15C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 23:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718840646; cv=none; b=u0Nr/NcwpJO3lrdAKy2OA3a5KGCnZs6/a6cH6GmtKPIPyx6KwgbStaZFb6PYR2Z1jFtKlj3Egsv33HT584uSiEKb4RBxZZeWpNACy9N+2Jqk/mkqppS8IJJ/5OMPAjDxb4TYIyeczDyFYbAG1kzeFEro1BSDXcvmET9n+AMf+Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718840646; c=relaxed/simple;
	bh=PgSfg4lBwNVprPMcOVejvPdnAsyJ33dZexsKFkls+Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TymHam1QbpxT+Ta1tStoBDV2LH/oSvthtBMl2IlAp7DGNfNxNEgfMhhRoF6P5upeJUzlh1Z2hoxMfCM38hopUV+GQPjMOIQKAkb4tDu/RIm63IK6026Ju7IjHdJGHX2nK9FSoFvzsgowGRdRhE43rZAmpWUjY53SbKv28CDJiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRjbCg4s; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRjbCg4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718840644; x=1750376644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PgSfg4lBwNVprPMcOVejvPdnAsyJ33dZexsKFkls+Ms=;
  b=QRjbCg4sLeeixBpGdaYlyaI3rYVjEtiGSNtXQlicL8gz0SlEfLXCk38u
   o73mgxU6dehmMEXx9O/klxe1mlb82ybHmWY9NsADaDlQk3TEQLyrwWIwz
   H+77icXNLcNtvsLlFHTF76fyxDvV9IlrW31IpCjxdrK5ciQy05TELnga9
   lsy1lHVqazw3Z+du4wrpRvywOSAogGHF0kZCKjEz5C7eHSfmEpr19C2Ov
   Bes21yvi28HtuZcIF91jGqhd5G8sSlOqSEbjWrzGgptQMk/hCLf1Kv/+Y
   L/5VEltjcPWemPkeL1EiDT/OBhkehVcX5w3R2njvhCY/Hci9NilgJZP91
   A==;
X-CSE-ConnectionGUID: 2+k3gmjcSaOWFwbr8pTGrw==
X-CSE-MsgGUID: bMmpuEYiTy+Xgyd8Ox9Qsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="38310024"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="38310024"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 16:44:01 -0700
X-CSE-ConnectionGUID: eTiVxTarQw6GgfeaqZ/+TQ==
X-CSE-MsgGUID: 1FIUOq39SCyf8tuP7b0c6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="46428529"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jun 2024 16:43:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK4y5-00076W-12;
	Wed, 19 Jun 2024 23:43:57 +0000
Date: Thu, 20 Jun 2024 07:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vibhore Vardhan <vibhore@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 29/137]
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: Unevaluated
 properties are not allowed ('interrupt-names' was unexpected)
Message-ID: <202406200750.wSoqK9sn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   9c49bc21672dbb6da549befaa30f95e8ed3c80e8
commit: 57d9a072c594dc724aeef091148af1635ee6207e [29/137] arm64: dts: ti: k3-am62a7-sk: enable uart as wakeup source
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240620/202406200750.wSoqK9sn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200750.wSoqK9sn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200750.wSoqK9sn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: syscon@43000000: 'syscon@4008', 'syscon@4018' do not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[13]], 'interrupts-extended': [[1, 0, 178, 4], [14, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[103]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[13]], 'interrupts-extended': [[1, 0, 178, 4], [14, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[103]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
