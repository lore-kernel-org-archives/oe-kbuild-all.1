Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8B2188CC3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609229; cv=none; b=T9ngRySFlk686ZZAKdzN00XhRw3wM2S3F0Qr+TALSdyaNLNtFfYidhtgQLKMYP1zDTruMpcPnKSNqpHywtzzzNE2IOt16ndbrKlRhxyYwrjm7emhf+TA4vYbdri/Imt/TunlNLojZMxzni4sQYt9k4rFBJ99dLCnA/Eod3Vjxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609229; c=relaxed/simple;
	bh=nIVFTNXtn+daedQzednP+mKjjfCDH8XXmoaENDsTl84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WZc0N8FRUFbcXYPIbXnodYnEx3LfST158HsUvX4uOAxTDcQFlJjSVrQEjw1F06TGwCwG1rQuGd4kWq+A6qMVA4ZwgtoazE0j/SWU7rlm8LEjUdtaS+Y+87yRRaMhnxg4ejQ9lNJLAAuYsQfjjoCMhaeRCDBOUM5iBK9WlFgLrgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUvSVy4O; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUvSVy4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718609228; x=1750145228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nIVFTNXtn+daedQzednP+mKjjfCDH8XXmoaENDsTl84=;
  b=QUvSVy4O+DZu+BvIqgcZSCRewwpvXr9G6Xblj1ifoRRt+ZIO8zdjpEOj
   tEELgR3+CKnp8V1bKMjHkA7/2+r6G7NTLeEKpl93uPV/bZV2ucAksPHMf
   NmTsRv5181+w+scRWb378P3rqW9gcHu3DOpD2dn27nliYL7zQYRu5UOje
   Fue9eG34zGnDDVf5c+KDLaqDJ47+DOw/I0TBBPF3u0ALGvzUb8ZUG29gE
   zmMFLgu4YnFYWka6p6GkXYWlDgj1uG89MntKumdvAjikaWpS3df3OTToB
   NlkVXfXG+a/fEZOz6nJ2PLiR1nUO/F8LeVjIoSebV6aZl2MQglylLU0Q4
   g==;
X-CSE-ConnectionGUID: 4ThlrL3ZSsax5JiI+zsMrQ==
X-CSE-MsgGUID: V5Lz/kN8Qj67OTfqvQE/1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="32966277"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="32966277"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 00:27:07 -0700
X-CSE-ConnectionGUID: mk2sjiVoTZCnitUmnE02oQ==
X-CSE-MsgGUID: HbOZ9OiGQ0SDHH3WBB1dsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="72317766"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2024 00:27:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ6lb-0003xC-25;
	Mon, 17 Jun 2024 07:27:03 +0000
Date: Mon, 17 Jun 2024 15:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Vibhore Vardhan <vibhore@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 29/137]
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: Unevaluated
 properties are not allowed ('interrupt-names' was unexpected)
Message-ID: <202406171513.3mtoUpWz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   038aa785c74b05cb8f4b574c972272e77a6dfb57
commit: 57d9a072c594dc724aeef091148af1635ee6207e [29/137] arm64: dts: ti: k3-am62a7-sk: enable uart as wakeup source
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240617/202406171513.3mtoUpWz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171513.3mtoUpWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171513.3mtoUpWz-lkp@intel.com/

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
