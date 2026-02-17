Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EE32309B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 02:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771294482; cv=none; b=RyWm4JoWOgF1uFIPySlipRaYnOukLTBsH6k60lsrmWH8ANy1pmUyKx1tAvYDj4g1X2FvvZtu7Qmu7SHB2cZi4M8HhUAPf3V+lGr8hb6D6OY095FfIxeeIX+dZU8SqJGdeEAgICziFWIowQVUnsx96Lw4PSkFuOE2GQ7YWKYDMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771294482; c=relaxed/simple;
	bh=Jrk6tWVzRHHFw6c6rJElHZAkE1PhDOpHeM0AZwq8mfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MnrxxqYd6vsP++q8byETWgEsxboOosmqwTLvHT4o11lBseqARPBZNLp+eoe2oSSIyMnI0V/324Ez1j3TpI2I8YIjjy2mDy0cbMfgu6Kr4F0J1XuuW+IP9nNPEoY9n1Zki0wr4jZgl2ojr6Jr8lpRqdIGPmcaS+v9BS74A8KyJQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGv9nXu5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGv9nXu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771294481; x=1802830481;
  h=date:from:to:cc:subject:message-id;
  bh=Jrk6tWVzRHHFw6c6rJElHZAkE1PhDOpHeM0AZwq8mfk=;
  b=XGv9nXu57B/M/ua77CwAJXiGY4dl4pvL7V5d1WvvEP3MQRNylfApFQql
   z051QqpKlfqhl3HW1fvAzWQ2uLP1kygS/eOzLl45OkEPE2onT+gRtn8DE
   2Eg08n8rkzHJTqzLZLqnjO2+E5ZjYnfOu6ocUJnJEsGXq+hN2RgppA69e
   LTzs69kYxUqBeZGrOJFl5tP8t2CLepe710aH9Km+P7ovFmpkMV1bVF5LI
   /2F1bcEv9QHd4arhmSrnv72vWNXGHt+pAKERiSmDfUcekIrFiFq6YMFdD
   r1sGqpRnqHk7+OA6c4CIj2gnRtcMvv/1Z4DuyutxQkAD43j6eWxYWx+mH
   A==;
X-CSE-ConnectionGUID: lXpL5ftbRy2v8N9NYwOOlA==
X-CSE-MsgGUID: K/VwukwxTgqCmSrwzwWF/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="94996820"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="94996820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 18:14:41 -0800
X-CSE-ConnectionGUID: uaAuucylSiKp1vBzYvbqzA==
X-CSE-MsgGUID: dHI01sqURsGu8Zpjs4JRfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217891384"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Feb 2026 18:14:39 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsAbk-000000002iH-3HOT;
	Tue, 17 Feb 2026 02:14:36 +0000
Date: Tue, 17 Feb 2026 03:14:17 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Shen <sjg168@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 3620/13026]
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202602170340.RYg4GAOo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
commit: bc83b7353d2bfefba73193335bacc3542d8a7ae2 [3620/13026] ARM: dts: aspeed: Add Facebook Anacapa platform
config: arm-randconfig-2051-20260215 (https://download.01.org/0day-ci/archive/20260217/202602170340.RYg4GAOo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170340.RYg4GAOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170340.RYg4GAOo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
