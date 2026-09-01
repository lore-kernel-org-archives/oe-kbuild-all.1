Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C19732C8B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Sep 2026 23:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304186; cv=none; b=kQCg2EogCamzREn8GrokRtQRiZgKc/+I/mNCJDMc+yjDkvHNvWR8zMXXR8l1JtJE9Vl4CEh2RF6vUDqamLjmRDL7YrsMJSPaVzB3XKrsM/WY1bO3BoFYjKimkX/9P7EdweEh00bQqgp1N56g0Fbh6bqHFyEavvn0qq9jO05BssU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304186; c=relaxed/simple;
	bh=ulONAQ8oVuK6MDcZ6xgQldVLLZTptl5eNlnpA3KSOzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XRLLANQ2ToF7pNihJWQwOcLo6NaH6lFx4Vs2KSK2wX731+dxEGli2luHaM/sWCwcB1bXyqnLzBjlWapJMezdFX0Ul9fu9A2r4a3SkhU+L0YofIEx3OskxY74FOb+WZgh0WeKu6iG3S4edfKPhgZn8QNayAwYv5I2JaGdkj3U030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErSnuzXD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErSnuzXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788304184; x=1819840184;
  h=date:from:to:cc:subject:message-id;
  bh=ulONAQ8oVuK6MDcZ6xgQldVLLZTptl5eNlnpA3KSOzA=;
  b=ErSnuzXDtVvuSWBT/h/yBwaix+krNF/tUWfQ+I2p59EoHNRNoCG5YkkB
   ZAM6+cqkp+LjkQd2aQOzuazkVHWd+aa8hQ7d3xqfJ9WA7pfMHEsbSsyjL
   E/QtG+XIGVifrvouoCKxt4NVLR1EsRxVSk9Wzqk9yXvuxMq3MzuEVu0JR
   1ezqHwq3RDaN3GroQg9wTsXmMY5SBFcc/YL6pkkB3DNbYCRVPcuIumWSL
   MWva6Oes+qRhuOH0PlocSPYbQEoNywQosdPGcxNFAxBamj/5YbaNSvw16
   H7XkMi7x9uZrci4VBFix/rsmec6LlsO6rueyldu3w9xaPDac3iPGKdRsY
   A==;
X-CSE-ConnectionGUID: y09dY/llS5SyQlLGR3mZDA==
X-CSE-MsgGUID: zj2lcK60TIyvR1hHK7f+Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88779903"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88779903"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 16:09:43 -0700
X-CSE-ConnectionGUID: n6pfYxrWSkON0KjNkKo2jg==
X-CSE-MsgGUID: DjeAKCeDT+WsD6boXlvbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="268697273"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Sep 2026 16:09:42 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1Xbn-000000001b8-1vBh;
	Tue, 01 Sep 2026 23:09:39 +0000
Date: Wed, 02 Sep 2026 07:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mwalle:for-next 8/16] Warning:
 drivers/mtd/spi-nor/sfdp.c:417 function parameter 'bfpt' not described in
 'spi_nor_post_bfpt_fixups'
Message-ID: <202609020636.P552Ce98-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mwalle/linux.git for-next
head:   83c8181b644285c296a3e4e3f7adf95027a87f3d
commit: e4ce6aa7f23f3b9ed2d3778ff9799f67757246d1 [8/16] mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp
config: i386-randconfig-052-20260901 (https://download.01.org/0day-ci/archive/20260902/202609020636.P552Ce98-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609020636.P552Ce98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609020636.P552Ce98-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mtd/spi-nor/sfdp.c:417 function parameter 'bfpt' not described in 'spi_nor_post_bfpt_fixups'
>> Warning: drivers/mtd/spi-nor/sfdp.c:417 function parameter 'bfpt' not described in 'spi_nor_post_bfpt_fixups'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
