Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771051E284C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738250283; cv=none; b=fx4IJYDrTeFrfNpg3geL6QKf9ZoRtSpd08W/0eiHZW8USrgS1t9W8iHyLEP7M/Uw9K46ZDcWbgHoxVO/dHxJrBuqNie9OQhvQdrmc01Qv1kFdmKrB++UKpHWDct6GnnDnJa4dDCdHuhtT719WvdxoX+z1nVSxnGFPi4h1l+MHlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738250283; c=relaxed/simple;
	bh=6u+XZayCYsNtcm3JDOjqrQdAnjjUsC4liMixZvnyE9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9QFHLeFLwjQueT1Not86wEHfWY01MFiWSi0C92XzY5f5bRG47jbKAYbU47VdMYo3zgeLoxMU258PCGGfCM+HCpsw7zZ4lY4nEvhrNiDWBzsEraDJaILnjk/nV5jBb3tCO7xNwnOxnynfB130QgPUpTotNn5lIPqXx2ZU3ebJAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2B2qMEG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2B2qMEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738250281; x=1769786281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6u+XZayCYsNtcm3JDOjqrQdAnjjUsC4liMixZvnyE9k=;
  b=C2B2qMEGrPxxOQkTUH3pNKAMHeepTJ25p3aNT5TlMVAQVzIFnUhj2M51
   rHbOUa8MtRHZ0Kzs2K2q9UzDOwbR+6E1cbXnbuRr1nYZGuBeKCxHFhaL+
   Fg5fUIDCOswDoJBgrkK3opZVVub4XGqy8C4HEPUl7ctjsukMHQut2LOMZ
   iGWXUDDq8pYFgoZg9knulodHOZMsPfqAP06EbH+i6AfeSo7PeW2mTDNem
   FOFGF/mWmlVWTb6JENCxqN0FMouJD2kL7y6xO2rsWT+SVOZS/iSsTFUot
   XVZWh6GKtDzAKllv6jJZXu8TEk4S8w7+1sTND2zIoFWi046wyMpMFk1ya
   g==;
X-CSE-ConnectionGUID: Ejjr6qvKSQ2utnefXiM+dw==
X-CSE-MsgGUID: Kqdc4MAXSfK/7K2/3papYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42454785"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="42454785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 07:18:01 -0800
X-CSE-ConnectionGUID: jJ98L6YETiupQ+tJnkFHvA==
X-CSE-MsgGUID: dtMwGkkzQ6SMhsRIVUlvlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109158706"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Jan 2025 07:18:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdWIn-000kb5-17;
	Thu, 30 Jan 2025 15:17:57 +0000
Date: Thu, 30 Jan 2025 23:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 10345/10607]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000100000:
 failed to match any schema with compatible: ['brcm,bcm2712-pcie']
Message-ID: <202501302350.cR4cz4nl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
commit: 6e313687a8885d654b12e5978fc3ef6f1e1e1a5f [10345/10607] arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
config: arm64-randconfig-051-20250129 (https://download.01.org/0day-ci/archive/20250130/202501302350.cR4cz4nl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501302350.cR4cz4nl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501302350.cR4cz4nl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/mop@7c500000: failed to match any schema with compatible: ['brcm,bcm2712-mop']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/moplet@7c501000: failed to match any schema with compatible: ['brcm,bcm2712-moplet']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/hdmi@7c701400: failed to match any schema with compatible: ['brcm,bcm2712-hdmi0']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/hdmi@7c706400: failed to match any schema with compatible: ['brcm,bcm2712-hdmi1']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: axi: gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/gpu: failed to match any schema with compatible: ['brcm,bcm2712-vc6']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000100000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000110000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000120000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/msi-controller@1000130000: failed to match any schema with compatible: ['brcm,bcm2712-mip']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/msi-controller@1000131000: failed to match any schema with compatible: ['brcm,bcm2712-mip']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /hvs@107c580000: failed to match any schema with compatible: ['brcm,bcm2712-hvs']
--
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/mop@7c500000: failed to match any schema with compatible: ['brcm,bcm2712-mop']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/moplet@7c501000: failed to match any schema with compatible: ['brcm,bcm2712-moplet']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/hdmi@7c701400: failed to match any schema with compatible: ['brcm,bcm2712-hdmi0']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/hdmi@7c706400: failed to match any schema with compatible: ['brcm,bcm2712-hdmi1']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: axi: gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/gpu: failed to match any schema with compatible: ['brcm,bcm2712-vc6']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/pcie@1000100000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/pcie@1000110000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/pcie@1000120000: failed to match any schema with compatible: ['brcm,bcm2712-pcie']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/msi-controller@1000130000: failed to match any schema with compatible: ['brcm,bcm2712-mip']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/msi-controller@1000131000: failed to match any schema with compatible: ['brcm,bcm2712-mip']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /hvs@107c580000: failed to match any schema with compatible: ['brcm,bcm2712-hvs']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
