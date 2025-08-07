Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9D82550AD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754574150; cv=none; b=nxqmGcQzg1lcz51nOtse1+VywocV+WO+xFldjz6Bn4cvIUTKAQHmvqL6te+tukh2+lZpCzDZWBtJY7sMe6icGe3xzbDCsQV7rvrQB0Bh4kJg1NPFcLB5cNtdM3d8+THcAYxnWfXj/8TI7L51PWRgqRTf0c6w/Lb9MYSLIkdzY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754574150; c=relaxed/simple;
	bh=bAjSJdppc8McMjTaKD0b5FWFPUhg0BMAKR03VxZT5Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HR5DAorsRnajZyR45NK9DQpvKStW2VS3bZPHM0/msTUvNYXBvHdUyBlIO3nax+lk15K4KXwgH/J4pA+ixPPqtB7ySAdrbCptFPnJNA5bJRaDaTryoum/IKWtLj29jXyE9+ZfKgiEr13yNV4Twlq2n0G+Nrhtyadbc28DEj2ghS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzOU0K8Q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzOU0K8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754574149; x=1786110149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bAjSJdppc8McMjTaKD0b5FWFPUhg0BMAKR03VxZT5Uw=;
  b=FzOU0K8QE6W/y6aZM5x7UppCwQHnFan6RD7uRIDgI1E+jD9CgSwmb9/V
   oJaopssQg6HzVwsRUEylfnFHX8ZE7aR9KL+C7tBi4srUfXzGzM+sNL1cu
   onaUWZAxgUwesgcdyxyIueEdB+aDrg0QKfUUF4bWr6DWTdM0YweMFRL7W
   Y7g1FmASBcD2r3GUAYpItjZa1ZlGQ/y059PeNIDUtdDj7qaPpNH138lpM
   S4UEKJ65G2OqRHBsscDx4RazVUuzNaTpyo1BZDQ3mzsXOuelNIlSee/1B
   kc07d1jEfSu5pnL0q6+J5oyyk21w7bhe7E8s4hgraipyC7I6eL1fkU2rZ
   w==;
X-CSE-ConnectionGUID: zAb9YTmrS9SjIHUWdUbz4g==
X-CSE-MsgGUID: DboPUFtDSImrb1OHstpJRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68283610"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68283610"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 06:42:28 -0700
X-CSE-ConnectionGUID: j92ZH2PaSFyWfr9B+9DNJg==
X-CSE-MsgGUID: xD8X2nqzQUSWhpyMi7QPkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164965645"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2025 06:42:27 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk0sy-0002Sx-2u;
	Thu, 07 Aug 2025 13:42:24 +0000
Date: Thu, 7 Aug 2025 15:41:30 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 131/801] htmldocs: Warning:
 Documentation/devicetree/bindings/display/ti/ti,dra7-dss.yaml references a
 file that doesn't exist:
 Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
Message-ID: <202508071512.6Enbv3OZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 8c1a9d6f1ab1d2e6fd82273221fe308a70017680 [131/801] dt-bindings: display: Convert ti/ti,omap-dss to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071512.6Enbv3OZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071512.6Enbv3OZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,quadfs.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,flexgen.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
   Warning: Documentation/devicetree/bindings/clock/ti/ti,dra7-apll-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/dpll.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,dra7-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,omap2-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,omap3-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,omap4-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,omap5-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
   Warning: Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/tilcdc/panel.txt
   Warning: Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
