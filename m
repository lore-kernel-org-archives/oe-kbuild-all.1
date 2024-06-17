Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2258D16A94F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 20:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718656567; cv=none; b=UUfXb1Z9RJBCPwdelptWDOsbAlYN7Qatm57S7EiDSB1h7XUjsjVZONfYJJ0LU9j4lPQVd48hxPW/mgg2xFr85hnnZ1tD1+y/qM7DIvGxGcYISTXSC71rlEEKe3rbxrPVkTqknVgvSKCOuxbMjYsc6dJzlEdNIf85RqTIQXmIGx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718656567; c=relaxed/simple;
	bh=B/+ZPNGbIHwqpyxYO+/rHKkyp1sO1qGUMsH0tvDWLls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkz4TdAwOjKYy3gGPk0XtlzU3t2gzLbi5Dju/sQ3vxWMQhBdLYJOyU/JirQ5CdVCUKh8o7TOIfhx/2ACsIbqMfb/R1hFCzVwRPZprfBoVkQhONL3zh2hFXEnn36zpkma6pePLvPlmZ6X5RTdMIdVtrMkWuLhrz3wZXuVAjgLD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHG2wsSz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHG2wsSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718656565; x=1750192565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B/+ZPNGbIHwqpyxYO+/rHKkyp1sO1qGUMsH0tvDWLls=;
  b=FHG2wsSzioloqW1hiujZ4pvlQCZJTyCiI0BUmYwrzGMyQ4C8X0BMTKoN
   DN8Wg+ZKInDZghwaW1TJhk83+Y/n66CFZNX7JFIWW8NIrMcfY2759/Nv6
   5FEPNQttR/EnkhD7LzdBowMg7TP1u3LJgVRczb0iaIQCekWYWaOVjugzR
   PzUm3fy2A+l1bxYXtKAjl5uKaziFdMSRagaLNWQFbLLpRxQC50/FQczrn
   hd8UaxMHR57pHaBb0F7Pj2x0qVHjw8gzlWyxl/bZ3DiIz2w3vtQD77cOZ
   5GNOZlQCVDKvYn4uZUgiBKsKoXjDeWA2IMRyogmhDGII9sOstop/8ZNQC
   w==;
X-CSE-ConnectionGUID: OMHlbpcyQeO/g/GZPOD70g==
X-CSE-MsgGUID: uh78yMiqTGS7BTIX2rrT0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26136600"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="26136600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 13:36:02 -0700
X-CSE-ConnectionGUID: cXVLwtM3QDiBqfrPnDvWAg==
X-CSE-MsgGUID: WR9KBSGIQAq7LocJj23/jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="41409795"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jun 2024 13:36:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJJ54-0004rg-29;
	Mon, 17 Jun 2024 20:35:58 +0000
Date: Tue, 18 Jun 2024 04:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 7/39] arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb:
 video-codec@30210000: 'sram-size' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202406180431.QGU5rSGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y
head:   eeca5715c9a5b742423bd83ed587fac26268771c
commit: fe16b844a800248ff1c5365ac073a70b0f8d9cfa [7/39] arm64: dts: ti: k3-am62a-main: SRAM Allocation for VPU
config: arm64-randconfig-051-20240616 (https://download.01.org/0day-ci/archive/20240618/202406180431.QGU5rSGU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180431.QGU5rSGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180431.QGU5rSGU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[27]], 'interrupts-extended': [[1, 0, 178, 4], [28, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[122]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[27]], 'interrupts-extended': [[1, 0, 178, 4], [28, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[122]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: video-codec@30210000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
