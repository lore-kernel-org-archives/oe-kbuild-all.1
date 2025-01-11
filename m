Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12DA1A2550
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736602214; cv=none; b=YqcSgZlnIyj6LvVfmDdQps+zmqz2ShuakZNc0gBt1reqzbG/ps7DfprelmYSgpo19oYl4x3y8bXffskjnvWPyybFbQGMvNRBfK58XS4ikCxXQ6J+z7YI7Xxp3GX5OmKOyZ3c2ttrSIK3k5MMl1PeotSABJZgxUzhv6bfDVAr9NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736602214; c=relaxed/simple;
	bh=Rp0UfKUyYJA/sH3Psv9pXvBPDNpYlhL25w2eqvyDprQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ox6an+zEL+h5k0B9IKtOfWQgii50HObZhXWGTICzoLpmq0bVseP/+iWDCh/b1ldJgCRPmyDakL1h4tuFioKtDBrwP1mPX1KTcauOJx+pPdIENonddlNdkGMAnLwpMREz+Jl0iTxdiWO86O0qRjHSlkI9t1kIM6W9QO126igI4Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEo7Ieun; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEo7Ieun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736602212; x=1768138212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rp0UfKUyYJA/sH3Psv9pXvBPDNpYlhL25w2eqvyDprQ=;
  b=YEo7Ieun/w6rXBeWnN8TUUgSf6YcVGMafycSws1OpruIeC259GOjaniW
   n6qLFC4psVsnsf8rEFuF55alDk4L2YmC/jHq66xxjfsiIT4Sqxr2APg3x
   LmF6+RwVA8EnDdbPMWWpZz88csgPzwh81T1vl/x6J6IKWarDTVuY9IgRM
   opc1mUdW2n5416yp/GrtWJMdj9saupPlrg8rw/wbSwbCdTca52qzkH7j/
   fHx40xzpIucjbi7q7MH99wDMp65chnjvFoeOfBrPp8kyLEinPRiPoPVF8
   wWLN4TuG5YWWRPK6NeHyHzKUv/xXxHM8JVxt//OCpGm4mhX3gjjLCR7sj
   Q==;
X-CSE-ConnectionGUID: F0jred/iQ9SasCUW+bkCHw==
X-CSE-MsgGUID: SAkBqHu5Ssmt9ovoXydtlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="40567032"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="40567032"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 05:30:11 -0800
X-CSE-ConnectionGUID: gacotKIyTrqmhqljxonHgQ==
X-CSE-MsgGUID: fDXMNr3ZRn+BtacZlxsOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="134818507"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2025 05:30:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWbZ0-000Kgl-29;
	Sat, 11 Jan 2025 13:30:06 +0000
Date: Sat, 11 Jan 2025 21:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Wendy Liang <wendy.liang@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 107/504] kismet: WARNING: unmet direct
 dependencies detected for FPGA_BRIDGE when selected by XILINX_AIE
Message-ID: <202501112112.dDj21ayV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: a5b482ab14e4356dcfe8b98ba9e8254df9923a0f [107/504] misc: ai-engine: Move AI engine reg access to kernel
config: arm64-kismet-CONFIG_FPGA_BRIDGE-CONFIG_XILINX_AIE-0-0 (https://download.01.org/0day-ci/archive/20250111/202501112112.dDj21ayV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250111/202501112112.dDj21ayV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112112.dDj21ayV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FPGA_BRIDGE when selected by XILINX_AIE
   WARNING: unmet direct dependencies detected for FPGA_BRIDGE
     Depends on [n]: FPGA [=n]
     Selected by [y]:
     - XILINX_AIE [=y] && (ARM64 [=y] || COMPILE_TEST [=n]) && ZYNQMP_FIRMWARE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
