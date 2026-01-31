Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD5B38B7B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769902599; cv=none; b=nTkiEJRsjoFhdU8mdHS1nOfBYxaPIOM/0C3L1UGO4PxYK8wDHiKE/htOM6NUgORMM/NRNT/HtzVEImWA5+Ce5DPue1QOf0T74Pxr3M1BU38OTtDyJA1Oj91Y95oqICr7cx9vtlgY92hml40xxXO7ZsLrgxl0Yez/Xp7r78/1XDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769902599; c=relaxed/simple;
	bh=0FTJg0lNL5RfOztQHIAkcq7zJiY3mW7es7fEq0MZFRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hpQFQso+N7YYAlPVNGF+fJxSMaJDdDhNalZV5ElcikOBY+2E6yyoTHpz+DcUBLonZUkY9pXRIlbJIKLJ5fayBbQVpKzDnmvNJqT7f8+NF6PWlHv7mBmS2WGfWcHUvtmNNb+yCACfwWrNIENrSenTPMOge1GAkoMtv1458Nkc9qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7EoXJS6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7EoXJS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769902597; x=1801438597;
  h=date:from:to:cc:subject:message-id;
  bh=0FTJg0lNL5RfOztQHIAkcq7zJiY3mW7es7fEq0MZFRY=;
  b=R7EoXJS6dauI+rmD87/wX3tkkcewm8psON5P6+7MVN41YQRWher70nwj
   +YO4/9vyMUlesWojSyspTzeJfpeBr7W0hptxskiwUhgZJyLKw16/gHtZ0
   S0/p+HhkaDGXqE3jHLhGQBX7pCDPEPIx+Fce/z1nHhDnoL1yg9LsjxBsN
   fDB3b3FmAYlvq4hHZYHcBcpDouZCv1A7VeP7gpWvYc/uboz44Vqr6X5W0
   lr1aWJQZ7AmoBb4Bw/FLTucRsSrTpg9TYo1Rq4AajuC2A+PxhJfDtltNj
   5HPtrH70wgMYaHv+Dm51J6hpnkFH+kboQGPUD4Hc78wGZiDbr6JolN8lv
   Q==;
X-CSE-ConnectionGUID: 0vSPw3jMT56xfbKMI9MLgw==
X-CSE-MsgGUID: puX5qIegRZOr4cGZ4WRP/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="96573469"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="96573469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 15:36:36 -0800
X-CSE-ConnectionGUID: 07GYrTsvT0GU1VYGOrL/aQ==
X-CSE-MsgGUID: xIncafCZQQ2MkTidetOJnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="209142047"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jan 2026 15:36:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmKVz-00000000eT6-0jC0;
	Sat, 31 Jan 2026 23:36:31 +0000
Date: Sun, 01 Feb 2026 07:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Jarkko Sakkinen <jarkko@kernel.org>
Subject: [powerpc:next-test 25/26] ERROR: modpost:
 "plpks_wrapping_is_supported" [security/keys/trusted-keys/trusted.ko]
 undefined!
Message-ID: <202602010724.1g9hbLKv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   1d72a02d65a733ad124bacc2db3fb90fa81a612b
commit: c99fcb0d735bdb6f06dfe6eb7134d5d988d32dae [25/26] keys/trusted_keys: establish PKWM as a trusted source
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260201/202602010724.1g9hbLKv-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010724.1g9hbLKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010724.1g9hbLKv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "plpks_wrapping_is_supported" [security/keys/trusted-keys/trusted.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
