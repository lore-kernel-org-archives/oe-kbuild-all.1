Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A9378D8E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779310847; cv=none; b=kYGHYcATN9pMGDnHw3KC+tpdSmomKbxPb/s+84OvrIAeVsTsWB+1OLM+yzEXjE0SxSRJUWLxqBHS9t08gejrIEYvV82eX8D7mTVKpwL8Qyg10tZylb/gDq6kMppHkSUy6Dsz87CqXUpHdzN9w5+CbAcIdRAlhMCP89aJaCGY4Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779310847; c=relaxed/simple;
	bh=pmQFecskNmlGDBraDlS5IaYdR9h/CPCdV2mLcKCKtVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iIDXBlYN8WsmuHa2ZPM/YGqURGZvTe8URjK3l1n+lW5gVPhIHPQVutdabe0tcEczuo11FdTIkhT9wVcFDH1otVYGB3QlsSiTrl/7u3w26jlO2kQgommcNCeXxaSrHaz7H+3CgsgrCR5NdKSlpeOmmtzYFehfDHuEouZM+bdKBwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncebCxOP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncebCxOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779310847; x=1810846847;
  h=date:from:to:cc:subject:message-id;
  bh=pmQFecskNmlGDBraDlS5IaYdR9h/CPCdV2mLcKCKtVs=;
  b=ncebCxOPLBR7gtHYbSnQrKpH+v4RoZ631/l3fh0KC1SPsn8SqfXLoVI6
   03e9f23z1XXaP/Y8UL3rzHkwqrltJcSm9f6PytC1HnndDUBoFbnePlIfx
   cIu7rYJB3Y8AFQ3yD2WHOKz2zspbZnxedjQkFVRtRvMasYCCMWEYfoo2M
   biYBVWGc1/QfWIj+YUorHpeR9oqOqAzC1fnVhM0Xu0EaiO0GRoL2dc/v1
   xH6nI20sPgvMqOZTyz2MUSejMvoZ1rpNTdtvaqkLE6/phKh6/XG3fU9+O
   ejDoIm2J1dGoP97SUP4xzJ+u2khrf74Bb5z7tSuPK/rFo3vbeihXlCnGT
   Q==;
X-CSE-ConnectionGUID: Osi8fNlzQICg/iFxUyrcsg==
X-CSE-MsgGUID: 1YBb8fXXSSO9/VDH7KX+ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83841039"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="83841039"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 14:00:46 -0700
X-CSE-ConnectionGUID: EHTZCaEQRrimCRRTlZ4EAw==
X-CSE-MsgGUID: VEkz++3kSSaH0kf2EmmrSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="240355223"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 May 2026 14:00:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPo1x-00000000AeL-1Zqw;
	Wed, 20 May 2026 21:00:41 +0000
Date: Wed, 20 May 2026 22:59:55 +0200
From: kernel test robot <lkp@intel.com>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 5631/6922]
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202605202201.3mcKk8r9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   687da68900cd1a46549f7d9430c7d40346cb86a0
commit: 68b44988df9a5c25c1dbd92e898b25c4b19d924d [5631/6922] ARM: dts: aspeed: Add Meta SanMiguel BMC
config: arm-randconfig-2051-20260519 (https://download.01.org/0day-ci/archive/20260520/202605202201.3mcKk8r9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605202201.3mcKk8r9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605202201.3mcKk8r9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:640.36-644.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3c-global', 'syscon']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
