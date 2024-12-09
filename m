Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA1B14B088
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719544; cv=none; b=F54grNZUjlYYcqwqpVnxNq9yvlkElnhIJdSMydpyHMubdm4RD3utFTEEDqfIJc3YixmSknwMhyvBrWMG+dh2c+Gth8bDhUNK73We/KGKfzUsVTPhUIwYcnxLZ7dFVJheoTfrIecY07M4A6Leu1MOojjDfsswjJb+EGvx0YO+d2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719544; c=relaxed/simple;
	bh=h8jf0p3Hl4A+N35rWP+L5QZQeLTLaN0ARz6Ymme/pp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQ/kdeTUAOiRfcN7DsjIVpKYzpzeqCds41ey32oQ/9z3ZoSGGMdmHgqyhvAh8Iu6fxThSoHvmEslEva0OvLtgB2MRxeIVCufAk6qYUBbANb2jkQ4AMLlkNKCTvE0FDP7udBT9X17y7KoXoGPr7glVoZ7RrwB+QitFRF/Ju6lRxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kA50drXh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kA50drXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719542; x=1765255542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8jf0p3Hl4A+N35rWP+L5QZQeLTLaN0ARz6Ymme/pp4=;
  b=kA50drXhoFHHedxsJiyEFMnhVOMhr1TxROdJ68VzsVFRwXRD6TjIt32a
   XULbxDJFnFHf+urBxJ5d23gsfNtHfB1SinmYF8ikkczSGP/1YEHjLuhd4
   XtdMF4mEM8lfTwsbtaIizoEzFF2+e0C6LF9Xvirh+Ol9T3LiuGy7JiZ7m
   NMeA70/MBCKhQWQJnTB3jqD+/KVmPohivjPWJl4S+Z47NmI6ch0bHYtJx
   /h+aT6MSz3OTmc4g+a0duKEEZXEoP0gKDGOntp4hdNjD/5wMVH1XfiDFq
   2EBoIVyCtWNzQ0cj9gJFNmCFk0LwmEzrVNpBS8kun8XSU66/UOSLWdEZC
   A==;
X-CSE-ConnectionGUID: dyfi0BWKQ3GcRxB5E7TyIQ==
X-CSE-MsgGUID: aZBAlBwXQdCQfMVhDBw+0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="56484233"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="56484233"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:45:40 -0800
X-CSE-ConnectionGUID: B+ZCYsECRpyiFFTaclz/AA==
X-CSE-MsgGUID: 9lrzEcrqT62bGZd8DVtnAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="100012722"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2024 20:45:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVeK-0003ud-25;
	Mon, 09 Dec 2024 04:45:36 +0000
Date: Mon, 9 Dec 2024 12:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: arch/s390/kernel/ipl.c:1973 sys_vmcmd_on_reboot_store() warn:
 unsigned 'len' is never less than zero.
Message-ID: <202412081614.5uel8F6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: 247576bf624a200b9d4dba6126e760af0d5ebe0e s390/ipl: Do not accept z/VM CP diag X'008' cmds longer than max length
date:   7 months ago
config: s390-randconfig-r071-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081614.5uel8F6W-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081614.5uel8F6W-lkp@intel.com/

smatch warnings:
arch/s390/kernel/ipl.c:1973 sys_vmcmd_on_reboot_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1974 sys_vmcmd_on_panic_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1975 sys_vmcmd_on_halt_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1976 sys_vmcmd_on_poff_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1977 sys_vmcmd_on_restart_store() warn: unsigned 'len' is never less than zero.

vim +/len +1973 arch/s390/kernel/ipl.c

99ca4e582d4a408 Michael Holzheu 2008-01-26  1972  
99ca4e582d4a408 Michael Holzheu 2008-01-26 @1973  DEFINE_IPL_ATTR_STR_RW(vmcmd, on_reboot, "%s\n", "%s\n", vmcmd_on_reboot);
99ca4e582d4a408 Michael Holzheu 2008-01-26 @1974  DEFINE_IPL_ATTR_STR_RW(vmcmd, on_panic, "%s\n", "%s\n", vmcmd_on_panic);
99ca4e582d4a408 Michael Holzheu 2008-01-26 @1975  DEFINE_IPL_ATTR_STR_RW(vmcmd, on_halt, "%s\n", "%s\n", vmcmd_on_halt);
99ca4e582d4a408 Michael Holzheu 2008-01-26 @1976  DEFINE_IPL_ATTR_STR_RW(vmcmd, on_poff, "%s\n", "%s\n", vmcmd_on_poff);
7dd6b3343fdc190 Michael Holzheu 2011-08-03 @1977  DEFINE_IPL_ATTR_STR_RW(vmcmd, on_restart, "%s\n", "%s\n", vmcmd_on_restart);
99ca4e582d4a408 Michael Holzheu 2008-01-26  1978  

:::::: The code at line 1973 was first introduced by commit
:::::: 99ca4e582d4a4088969681efff97be44d98421a1 [S390] kernel: Shutdown Actions Interface

:::::: TO: Michael Holzheu <holzheu@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
