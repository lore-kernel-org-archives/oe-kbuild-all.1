Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E48FFC1F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718801767; cv=none; b=Sfh0QHKBtX5jIqAiw5rjGcKKAvbeltGnG4U9/kRQr2wGYikceq24di+SNhYmy4K6CINxSQFnGbWuWj4fmKlf/RjquszwnYQbmUwvtt+PuiQ2GROX/TF0Ieh5lyPBk4AOpfvnzWedWUyu5p6MxTkuOi1LzSva+3jzS0G0OhmXvnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718801767; c=relaxed/simple;
	bh=6ThDWL2GCm6AhnAMMppMhvB1tMTm2Jonkc59laoJQqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HgfSlQtcTX+wBlo7MXBYNMFYiwEMjGfhu31LZ9GQSRSwdBH31qhDbCwDE9v6KlnOGG67b5OlFqs8GLDCCea2RgiPO9I6vi3Xwqp2L3Hq6zo4HUcS8vWj3OzqsDB/v9ZPRHk7g2+cpiiZu0PEAffFiLFVnX1v45HxNWTkEXUPD9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhVdhjaw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhVdhjaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718801765; x=1750337765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ThDWL2GCm6AhnAMMppMhvB1tMTm2Jonkc59laoJQqw=;
  b=PhVdhjawkqWqCEk28/29aa5Nae8sMRKJD/I9KYRM2Y8KOD5ktzGYiVNu
   5nH36eeM14zKHEYdm/UMh3abF1RVhoESKmw2Sy9AsTfDW+7mLUxuRzXRl
   GDO+NDZvjDQWXGj0arD/aWI9ZxAUY8SQUHGLaRGgzG3Sxn8x2pTxKJ7X0
   tO1soDIFzm2IjapiJwuzOxoclg2OHRhz/4CTqOUXC06udnwfNUuoV6U4Z
   fiWIxi+GyxDNMKujK+fjL39Dphbtoj55bV53/vrDhOAZ0V1wAZPv9+Ffi
   ssuggKUvTOWYJCUnestV8UGrsMvb1KS6n0LAWZJCtTSnbgURZKlolV33z
   A==;
X-CSE-ConnectionGUID: VoSTV0V2QaiDt3Ow7OH0DQ==
X-CSE-MsgGUID: Lj0FUfXNSsiTtDedxfzSaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33203495"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="33203495"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 05:56:05 -0700
X-CSE-ConnectionGUID: 5am+3uIQQKW/DSoed+24pA==
X-CSE-MsgGUID: ppBTfIFuQqeneaTaf3k9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="46457113"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jun 2024 05:56:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJur3-0006b8-1h;
	Wed, 19 Jun 2024 12:56:01 +0000
Date: Wed, 19 Jun 2024 20:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 69/184]
 arch/arm64/boot/dts/apple/t602x-die0.dtsi:238.29-243.4: Warning
 (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges
 property
Message-ID: <202406192016.97aEJ2wg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: efc3fab9a638ce7c22196491d155259a56b028e8 [69/184] arm64: dts: apple: Add initial t602x device trees
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240619/202406192016.97aEJ2wg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406192016.97aEJ2wg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406192016.97aEJ2wg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6021.dtsi:33.28-35.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t6021.dtsi:37.34-39.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t6021.dtsi:41.22-43.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:293.14-309.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:311.14-320.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:238.29-243.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:82.42-85.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:13.10-24.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +238 arch/arm64/boot/dts/apple/t602x-die0.dtsi

 > 238		display: display-subsystem {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
