Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C651AAE28
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 06:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774766359; cv=none; b=WbCncPBOf5kBhJRC0cFGuuxqelDab1JJzPCQPnfxgzQtfhDcBVUTylG4KnK+RDe3uV+WVWEuBjJfHOz+rG2Il9vzcu6I6/FhlooSA3SDAKFUx1fqm2CTJoVybaRLJB88ikoe3EWu2SB9MZtzZ+SD6sPuvbXCWvITLj53YAQ3Ms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774766359; c=relaxed/simple;
	bh=VcPmhHcEmifxYBbJsYS4iyFfMTV9gLR9RBAjGGnkYG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tpOGjuuokiXmjxWKEGkwgWnBu9KzYgEVVrilYOH+ZGelXbZ2Qcb6nwVa8f7Uj551dM/Hts5ZW71owmhUKtt1YfC3ISU806Lr1Jt4/QId52KLrpYXfgHJgMBKyY50U5BOU9H12N0FA1HYJ9LyDqZ1GRk4/A0ALZWj2nsldNVGobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7lCYRd2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7lCYRd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774766357; x=1806302357;
  h=date:from:to:cc:subject:message-id;
  bh=VcPmhHcEmifxYBbJsYS4iyFfMTV9gLR9RBAjGGnkYG8=;
  b=j7lCYRd2GD6rEce9jVV/hZiZIHH2Qh7uNLmrN6FeaZsJFgyhCoG0XpwN
   e8g1qZbsnjN9yBuOc9I8mbdKOrSBN2sPGul9rT17COlaVvylmCLxtBjYN
   wX11+IzQNRNcYc1wl5dpWDgdwvx4HDldK92ut+ub5qpRyqvn4Wcea6rhX
   vPWpjsPmlqS56BT5a0iRaIUPtQJ+bT6QtoAVS71Juzbm4d06lilT27tLs
   hYNXZXPCiiIjcOK5vJe+7mnGhm9naGKiHbFt9i0LUfVYJVGsA5XLjIGZ2
   oPfLWuWdXxye0H3CDDQcEndMNb90/tWwvG7exUVYvvUfCloOrsRLdcxRm
   A==;
X-CSE-ConnectionGUID: LuhPG7+BS6a7N32ep9oYLQ==
X-CSE-MsgGUID: xNh3w+UJSgulG3eiBrWLag==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75674188"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="75674188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 23:39:17 -0700
X-CSE-ConnectionGUID: THAbWtpmTfa1iqqlk5Bnsg==
X-CSE-MsgGUID: A7NvDiHeRjyRC+N9aUmTlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="256223949"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2026 23:39:14 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6jnk-000000007rx-1La5;
	Sun, 29 Mar 2026 06:39:12 +0000
Date: Sun, 29 Mar 2026 08:38:47 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 8726/10350]
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb:
 regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not
 allowed ('enable-active-low' was unexpected)
Message-ID: <202603290828.5gt393t6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3b058d1aeeeff27a7289529c4944291613b364e9
commit: 60eff75ac67bbf5445bdbd2842b0109ac591441c [8726/10350] arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
config: arm64-randconfig-2051-20260326 (https://download.01.org/0day-ci/archive/20260329/202603290828.5gt393t6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290828.5gt393t6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:241.34-489.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:241.34-489.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
