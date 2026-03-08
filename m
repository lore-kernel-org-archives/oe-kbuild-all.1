Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285B91DFE22
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 22:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773010345; cv=none; b=BZKKm3Z5u17XGowYyvRXqrUIce6vD+zPQo4duMwYxakI6k3JHcPRnz/zh+I49SU5VTkwDzNUaq4Cg7/cgWJsLLQeSLw7m5RtuuOIQ9BisiuuFFbJqLJo8GY/SK5kNxPxsK0GRVzHQ4wmRKun5kRNRs8U43u9rMO6pFMIZGr08Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773010345; c=relaxed/simple;
	bh=40O8+2xLmTUWNuyOr06ng8Cz3WetegocvuaONC5bpAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BMvb1d2I+w6tl6joK2lvbtE+e8WeMIVOkpKkOl+/RbYI4+qEuV9PUITao6bWGn60UvLcTwbcL9bGRFsx+wUZmblQ50wP29T2xqIyfS5TIPCPfY2gW+4lfCQTLCTaqWICVk5gxbIs6Q+sXO24AZD96r+K+DowVYpouPq/Ne64L/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFalNif+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFalNif+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773010344; x=1804546344;
  h=date:from:to:cc:subject:message-id;
  bh=40O8+2xLmTUWNuyOr06ng8Cz3WetegocvuaONC5bpAE=;
  b=KFalNif+LSan8moT37L4Hv3L3cRhcAYD8FdcziDD/S8oFRJVwk2nn+f6
   Tj114aPWe0MEwXuNY2HSG5/SDPMd1J+n90QKvN1+wVJRWzTg28DtHC1v3
   GEM+Vf46Lf3DMnoaU4Ir+QQL+qpsIsOdd3ibmj7o8vI4WV7xzUSqxZIvy
   4AXfsjeIyr/tEVXEwBCNxJ+H/NaDV7zeNB8pvJFrhHgJUun7UjeXVERv1
   AkWY5TYbvcvWIvEbiRlL73OAdHFnH4ajrhO35hgIIFdWAAAK49gmWKPcT
   JhV5xv0OZKAqiF2+srIjb6s1xQBJ7Wj3E8fvJP2/ZWp5PqV7NRX2F0cAs
   A==;
X-CSE-ConnectionGUID: udZ6eDmVSnCKcQ/Mwn240Q==
X-CSE-MsgGUID: /UL8m/OVRDW4uCrS0OXIQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="76636097"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="76636097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 15:52:24 -0700
X-CSE-ConnectionGUID: 7azNBhlhQNujGuBFDGjKDw==
X-CSE-MsgGUID: IkMNNRFESB2xku31H0/B9A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 08 Mar 2026 15:52:22 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzMyy-000000002jb-2JMj;
	Sun, 08 Mar 2026 22:52:20 +0000
Date: Sun, 08 Mar 2026 23:51:39 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/apm/apm-merlin.dtb: /hwmonslimpro: failed to match any
 schema with compatible: ['apm,xgene-slimpro-hwmon']
Message-ID: <202603082350.DsAN7zeO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   db15f4990be1b8865ae651c9d748d43c91bb9d13
commit: 676af08386e44fd6ea42b43db4c130bf04f36d92 [3/3] arm64: dts: apm-shadowcat: Move slimpro nodes out of "simple-bus" node
config: arm64-randconfig-2052-20260226 (https://download.01.org/0day-ci/archive/20260308/202603082350.DsAN7zeO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082350.DsAN7zeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082350.DsAN7zeO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['apm,strega']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['apm,strega']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /cpus/cpu@100: failed to match any schema with compatible: ['apm,strega']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /cpus/cpu@101: failed to match any schema with compatible: ['apm,strega']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /cpus/cpu@200: failed to match any schema with compatible: ['apm,strega']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /cpus/cpu@201: failed to match any schema with compatible: ['apm,strega']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /cpus/cpu@300: failed to match any schema with compatible: ['apm,strega']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /cpus/cpu@301: failed to match any schema with compatible: ['apm,strega']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: /hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: soc (simple-bus): reboot@17000014: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/apm/apm-merlin.dtb: socplldiv2 (fixed-factor-clock): #clock-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-factor-clock.yaml
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/edac@78800000: failed to match any schema with compatible: ['apm,xgene-edac']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/edac@78800000/edacmc@7e800000: failed to match any schema with compatible: ['apm,xgene-edac-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/edac@78800000/edacmc@7e840000: failed to match any schema with compatible: ['apm,xgene-edac-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/edac@78800000/edacmc@7e880000: failed to match any schema with compatible: ['apm,xgene-edac-mc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
