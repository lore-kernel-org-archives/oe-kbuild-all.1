Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098B142E67
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jul 2024 22:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720650053; cv=none; b=p70gBEbzr9KK6PLDteNbtTImdK0UebqYEoWWAZFs5IEApAGm1wF5TVu5dNkw10WnMjUarVN2EJ+7Qi2l6RNpcJvIQikhy7FTvGN9LLhE3FV9E55irRtSPV3GytvGKyDigcGOQT8uNUT3Jtv87oaqu2JMeUEjjUhTTryjcRmp29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720650053; c=relaxed/simple;
	bh=ts1S+omw6HehZULDlRQ8QZBfKmyg8ilNCIojVdzPA/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7yPyxzNfJM0PbDB3T80sV3oFfBiTAQrgYDmAKYolAIIQI7ZcQpcZjEdXuwVsMUzAl6KQVrL936acvwsddsOEsWlh92q70EEDrrjQj3dDUXaslgD27uYkm7zPIt0eMuLXvnbQoU7yoK9nlNw5uDmySIxiZhFWUvv3Yae4+20k9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Soge6fQe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Soge6fQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720650052; x=1752186052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ts1S+omw6HehZULDlRQ8QZBfKmyg8ilNCIojVdzPA/U=;
  b=Soge6fQeEdKqzrmR4nR/Dq+vWeeXyIDa8ao7oY9FkBB1AeIFC4Afu67H
   EHQ+R/nHK+zu8+3ibp9bQ/X+vnQukrslxyBKwvn+bIG3LUeEjnhVmTk7c
   cG1eZs64k7/0jOFWiD6uppXuR9fbjpEgZaCBV5K7TjqQ5TK84A8f8Pcit
   k7+1YQP27zg3AxudqjFJfg0cVuui4llv48RgElI9j/JQaw4CHibVEFDU9
   HeHwZiW+oz8W1MKweiWMNbv67Dl0wtE4wqxF4IFhmm0rMR6prYeD7qoOg
   LIQTr0kbhviE3bXWggz34+UOc8ye0GIn1ueNncsTERIVNZ+B0XqnDt12g
   Q==;
X-CSE-ConnectionGUID: 3eKdtCEtT9Kl+SFwPgLhCg==
X-CSE-MsgGUID: NLKkcJrbSHG0nToHyrI1Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18143017"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="18143017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 15:20:51 -0700
X-CSE-ConnectionGUID: zaj6MCuUT5+XlIOBqtAQtw==
X-CSE-MsgGUID: e37tAmVEQDq6gFMnEDymuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="52662807"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2024 15:20:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRfg6-000YMc-2e;
	Wed, 10 Jul 2024 22:20:46 +0000
Date: Thu, 11 Jul 2024 06:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ninad Palsule <ninad@linux.ibm.com>
Subject: [linux-next:master 2668/12309]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c-mux@70: idle-state:
 [1] is not of type 'integer'
Message-ID: <202407110621.bqVT88lx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   523b23f0bee3014a7a752c9bb9f5c54f0eddae88
commit: 0956a74cfd5a18f04bfa90be41fd1a9b65e43773 [2668/12309] ARM: dts: aspeed: Add IBM P11 Fuji BMC system
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110621.bqVT88lx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110621.bqVT88lx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407110621.bqVT88lx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-mux@70/i2c@3/led-controller@61: failed to match any schema with compatible: ['nxp,pca9551']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/led-controller@65: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/led-controller@31: failed to match any schema with compatible: ['ibm,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/led-controller@32: failed to match any schema with compatible: ['ibm,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/led-controller@33: failed to match any schema with compatible: ['ibm,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/led-controller@30: failed to match any schema with compatible: ['ibm,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/led-controller@34: failed to match any schema with compatible: ['ibm,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/led-controller@35: failed to match any schema with compatible: ['ibm,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c-mux@70: Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c-mux@70: idle-state: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c-mux@70: Unevaluated properties are not allowed ('idle-state' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@2/led-controller@60: failed to match any schema with compatible: ['nxp,pca9551']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/pwm@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/led-controller@60: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/led-controller@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,p9-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,i2c-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
