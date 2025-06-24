Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2222D4C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784749; cv=none; b=qVO9VTf2LCe9g5+g/CZOljcAWBJjeZk0387CgdW6v8KtRv58zDx1ECqB5bJsPBbnFUvJ7BrmDmBloG1dt9SP5OyefO0Klo7sKk5/NgwL4VLPsT90JDsDUORgkJjXxcJNq4p6o1llKJPTCbzGAfG3rX2o0uXllLJJ/n3vnoMg1lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784749; c=relaxed/simple;
	bh=AVEKaHGVlwR0nQrGmczgpwU7KY0mBnXeMn/Q0vDd8lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SsiA0/lE+wvXoF0+z/weIorQGMoXWZeGQ8n1EmVdh+gsBqUAbJ9WeHOLev6YA+3MOZvjqT+JK8xvoG38JD+d1ouPeXTHAtg9g54lznSaIkmNFRupJZP/hGBmRN6y2XDPKTPQWYrirwcqx9SB+HR2Gw0a7qbGR672cCoUUq5oMNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZm8BD3L; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZm8BD3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750784747; x=1782320747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AVEKaHGVlwR0nQrGmczgpwU7KY0mBnXeMn/Q0vDd8lQ=;
  b=GZm8BD3LqBK9KmUKfT4xwMSms/eNh2CaKQj2gEftYaOpCFTeYutWowXk
   N2YNc7pl6Y4P5hprl3mK44Y5lXnxnpm6K2lIaELrXif4XBuB1A1Qr0P2g
   Yt1SYMxbQuewfMmr2b8RgwtPF6NGnQGm45H4eQkmPGbrALN4EeqSYWYNY
   9EpvWYAL3HwVop+CA3tLQi11n6TLGpYhMr0xkugcd10AaH3k8iOVnUAXK
   c6v+V1R+OJX2XTsmsgjhobXVd1M88H5mZrsvrhmGFkG5VHjNWxt5Itlx6
   6FQWfKsfbVRVjxTEY0+YVPyST90c1IGDYgxG2pyIe6EGOhnSC+yLx4O4e
   Q==;
X-CSE-ConnectionGUID: SHBZv4gqQ8Gb72GQBaIbUw==
X-CSE-MsgGUID: +/DzMvGqS+mXA9GtVI4A7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52904478"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="52904478"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 10:05:46 -0700
X-CSE-ConnectionGUID: hjOVkL+oSkK7VvFN3NGMxg==
X-CSE-MsgGUID: xCbRElefT/m+Oy9rY5hHOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="156256443"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jun 2025 10:05:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU75a-000SLm-1a;
	Tue, 24 Jun 2025 17:05:42 +0000
Date: Wed, 25 Jun 2025 01:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>
Subject: [linux-next:master 3203/4739]
 arch/arm64/boot/dts/apm/apm-mustang.dtb: pcppll@17000100
 (apm,xgene-pcppll-clock): 'type' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202506250015.DUfXQi3y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ae2aaafb21454f4781c30734959cf223ab486ef
commit: 094e11183d1837734b3c76dbea5baf33269445b9 [3203/4739] dt-bindings: clock: Convert APM XGene clocks to DT schema
config: arm64-randconfig-051-20250621 (https://download.01.org/0day-ci/archive/20250625/202506250015.DUfXQi3y-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250015.DUfXQi3y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250015.DUfXQi3y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-mustang.dtb: refclk (fixed-clock): #clock-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: soc (simple-bus): i2cslimpro: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: soc (simple-bus): hwmonslimpro: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: soc (simple-bus): reboot@17000014: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: pcppll@17000100 (apm,xgene-pcppll-clock): 'type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/apm,xgene-socpll-clock.yaml#
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: socpll@17000120 (apm,xgene-socpll-clock): 'type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/apm,xgene-socpll-clock.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: socplldiv2 (fixed-factor-clock): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/fixed-factor-clock.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: socplldiv2 (fixed-factor-clock): #clock-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-factor-clock.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/msi@79000000: failed to match any schema with compatible: ['apm,xgene1-msi']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/edac@78800000: failed to match any schema with compatible: ['apm,xgene-edac']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/edac@78800000/edacmc@7e800000: failed to match any schema with compatible: ['apm,xgene-edac-mc']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/edac@78800000/edacmc@7e840000: failed to match any schema with compatible: ['apm,xgene-edac-mc']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/edac@78800000/edacmc@7e880000: failed to match any schema with compatible: ['apm,xgene-edac-mc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
