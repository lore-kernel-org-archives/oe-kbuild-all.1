Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0C1187849
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732532505; cv=none; b=uCiOT5Jug4OIqdN++ceYdewooANBbjzqgwAgpsm5stKlAcfoPrxQJlLmujwsFCqyMhuIOhFR0EZ7grdbvS55hianJigH3DkZX4V0df/X9Po5zltEWBTUqfIDEMNXkS21ldNHyiwaPqgO9YyTvOvEyp2OgOLz1tISlCIh1/mV44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732532505; c=relaxed/simple;
	bh=DUZh+p1FsXJT6AghwSAhAbFV4KHsUih/WrEr2oUrpSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqPWoeR2VxkuKo+cw8mAgB1jgNBsKCbmK4fiu9MO8nsc3LlaA5t9+CTQFs8AfJMyuxnDzGPEmti4ReKGR+NWxAhtCskbVBfu162S267ktIeKGriGVEFwop7OY9rFdRaDTcFj/gRlGWEUMYZ4Bc8SDkDxtobaR0aapfoZ6ZU3Evw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3PP8pYS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3PP8pYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732532503; x=1764068503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUZh+p1FsXJT6AghwSAhAbFV4KHsUih/WrEr2oUrpSw=;
  b=b3PP8pYSm3wR5lQfEX7IgZqS5V/MW89SF4qK88q3larC/4I625ZKki/e
   gkmO1gLxA4Wlwg0v1aUeVJTsnECKQG0r8G+YUsIAZ52MKsFdfzYLrE5pI
   cdkLJwqpnffTIYKzUVsiQEHYqxi2SJAWhuJVU0qZsKal4mdaK+KA00CBK
   bi2vqFP73fR0KkSRzSvkSSvjJ1FVTxuAgnvk3l0Hm5G8/DXmAlgJ8zbYZ
   8EVVAIU7bMgWgKiIT3e7Dg7g5hH92Rw4g00YtYFOloG5ksjxvDpxhV98Q
   CrFFFJrGmbr02sKn8t9Cvjp2Bwgwcc70wX68In77auHevGoe9sNJZev9k
   g==;
X-CSE-ConnectionGUID: X7ocztskRnOYrOVyu7uhTw==
X-CSE-MsgGUID: o90Kr9yQQm+Ojl1r6leEcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43290705"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43290705"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 03:01:41 -0800
X-CSE-ConnectionGUID: yEHM6ZJASgmwsHBVVFC2Tw==
X-CSE-MsgGUID: l5GL74nyThSIGJ++OALKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96289500"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 03:01:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFWqY-0006BM-0A;
	Mon, 25 Nov 2024 11:01:38 +0000
Date: Mon, 25 Nov 2024 19:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 12500/12684]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: power:
 'ranges' is a required property
Message-ID: <202411251813.PpNvlzYh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   85a2dd7d7c8152cb125712a1ecae1d0a6ccac250
commit: e1417095a1395cd21e067c105f709773141c83d1 [12500/12684] arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
config: arm64-randconfig-051-20241125 (https://download.01.org/0day-ci/archive/20241125/202411251813.PpNvlzYh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251813.PpNvlzYh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251813.PpNvlzYh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:67.21-84.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:86.15-90.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: interrupt-controller@7cd00000: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: interrupt-controller@7cd00000: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
