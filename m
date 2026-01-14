Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38CD2F49F4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 04:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768366628; cv=none; b=cpOJdHnHJPrDhOOhoSF6hbJaEYR0PMaWftr503QWmJYHtePChLylufLKkpZAKeAgEbARJDXtzJz3YVPRSyuvR8/5Hm/k6AwuI6yLadtSy1BR+XEAG3O1n88ppCOGyOi9iNdp/iH7S413ZtwsBOgdP/G4SV7KwpcVL4g7zuSojfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768366628; c=relaxed/simple;
	bh=NxV4YvR0wqiySb+TpWOwUwUsEodIOIGQUSmbdLFbYII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sDL0oOCS8VsxGj3AvuQ/EshXG7RSPjX4LI40hModWvyf6NrKePIOTP2GNZNUJkCE9w7ZM6xWN1sNXlfJat1BtuHqMFY2jcE5a+nur4SBE7/+f3/KnTB2IGnzib3cPTeZnYSpJup+06AUzZ0E8XkdlGZUiccy1ElczaOhNB1Wb54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqV6KULE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqV6KULE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768366620; x=1799902620;
  h=date:from:to:cc:subject:message-id;
  bh=NxV4YvR0wqiySb+TpWOwUwUsEodIOIGQUSmbdLFbYII=;
  b=SqV6KULElcQIRRFE096wIyX+9gdlvz6yAimACRyQpo1VNHrzPCOICjaX
   jcSCLKKpVpH4ICi3SI99B7Ugso9TbETHVML4CbACbG++BoMi3RJCjhI0O
   Tb9Ed7K8+KwDNFD6gbIdAo5tc+7tsw3x5hZW/KIXI1JuxDJDyL2ict1vn
   vLqH8xIiIeWY4vQ+sS0hl6HdRpJKzK+2SW9l9+6ngmnv98jV7dZnWQoH6
   fk6+CPrhdfKOJj5qw8PhFIav47h9yMIcbwDOhhJcAox/a10bBwtrIihry
   PL3eRwkIFX0YJIwwPZVyi8txWXjmv3wSrK0FU0MxChfcRcf4cseVDATCt
   w==;
X-CSE-ConnectionGUID: Fh4i1OBmSPuG0P2/VxKnhw==
X-CSE-MsgGUID: wU/gbdPAS1K35LmL81ss9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69745436"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69745436"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 20:56:55 -0800
X-CSE-ConnectionGUID: Pa9uXFi5TMCCD6kCl4FXJg==
X-CSE-MsgGUID: jTJYYtb6RDqKu+S8PUYTDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="235825898"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 20:56:53 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfsw7-000000001JF-004K;
	Wed, 14 Jan 2026 04:56:51 +0000
Date: Wed, 14 Jan 2026 05:56:16 +0100
From: kernel test robot <lkp@intel.com>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb:
 timer (arm,armv7-timer): 'clocks' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202601140526.Yeb5jMhB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: a5c59a29239c35c28c6dd9f712b5ac4bc01b1bc5 ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
date:   3 months ago
config: arm-randconfig-2052-20260111 (https://download.01.org/0day-ci/archive/20260114/202601140526.Yeb5jMhB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140526.Yeb5jMhB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140526.Yeb5jMhB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: sdram@1e6e0000 (aspeed,ast2600-sdram-edac): compatible: ['aspeed,ast2600-sdram-edac', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/edac/aspeed,ast2400-sdram-edac.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
