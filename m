Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C17A197555
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718628712; cv=none; b=UcaApof4bfg1OhK2JI2vZcJZkNyK0rW0z2r1tJARDgEMmIW7Hb5Oj1TMw34HzHtMwORyXXJYFUvDePNZxBBfVQhHYbf+E3W3LWaAzSbdLH9STSSX0aQyJzuD7Gnku2FXQPnVazvzagmfMbfo/ijdeWA6WQkGRiHw8ZeM8EnFmrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718628712; c=relaxed/simple;
	bh=79AJt2CrUAEECo3mMOW9ZDbFKzBjWM4S6OUkWjjSii4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svCnGGYpTszAxv8zVymHJPV0hahSf8noFChDd0ujhGiUoWWwg7rvHUzq1wFQ/i9cRdJ/BgVGqiBX7IzpritpgZp0x3tJVAv13jj0VFmvDk3QtnbvOuKdyJfP6n81jvi9O5Knpsu+KPgqHqJUZMktq76G8uhDRE6w+raVVifAK0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcwgqehn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcwgqehn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718628711; x=1750164711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79AJt2CrUAEECo3mMOW9ZDbFKzBjWM4S6OUkWjjSii4=;
  b=bcwgqehnVQn6RQW41v7SRelr+HD5pMQopLGfqwtr9teUl5qB9w4smAoW
   4grOVWksTEGVmx45+TSwJ1Vih+nXoy6O/DFQ6f3Q2nT3ocxRR9nPajqNr
   C2wqk8a5UtxoU6u/WPy76EWWGW49f/d+Vav+vo2fmLmy02Pph32F8bFAY
   GT52BYyMxSKCAlNcWGDk7fMXXRH5w5VOcFnSmDejWjIIgMrhDTO8Lq0iS
   TAo+qCGZFm76vKiDd+NT5Q2Gmea6a1Ywcp+oEP9M/61jCNNEY4uokWKYh
   it/hJMpzngTfWXGj9Wl54sxd7jMfjqyrrdpOFEQjN6UJRgasSiIuGDXw0
   A==;
X-CSE-ConnectionGUID: rZhNbvImSyekEkS6dD9YRw==
X-CSE-MsgGUID: IEMcJ97MTGW1iZMP957S0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26566369"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26566369"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 05:51:50 -0700
X-CSE-ConnectionGUID: FmoDlToeSOmYhpiMRkDFZQ==
X-CSE-MsgGUID: 49+eAdXGRx+YM+8Pg8L0ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41122119"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jun 2024 05:51:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJBpp-0004IX-2G;
	Mon, 17 Jun 2024 12:51:45 +0000
Date: Mon, 17 Jun 2024 20:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 6/39] arch/arm64/boot/dts/ti/k3-am69-sk.dtb:
 video-codec@4210000: 'sram-size' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202406172046.hHjPsUs3-lkp@intel.com>
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
commit: ebc10b12a1243d26973b60bd07d48c7410cf5769 [6/39] arm64: dts: ti: k3-j784s4-main: SRAM Allocation for VPU
config: arm64-randconfig-051-20240616 (https://download.01.org/0day-ci/archive/20240617/202406172046.hHjPsUs3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406172046.hHjPsUs3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406172046.hHjPsUs3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: video-codec@4210000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: video-codec@4220000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pcie@2900000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pcie@2910000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pcie@2920000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pcie@2930000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: video-codec@4210000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: video-codec@4220000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pcie@2900000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pcie@2910000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pcie@2920000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pcie@2930000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
