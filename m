Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D4D2AE7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 03:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735614032; cv=none; b=tkaxDNijAB1ydg7e6VwSlvcTB4fgKngj35+Zvt6U3IJiLSxxZxt7ux9NX2ipVlNFnhOE/r5wyseSE3gzaXB7OV1V/skghf3QpKCWM7ZUuydJnMTpW5S2QlikPVESk+AcXsZJbcoQ+4kMU/ZWfyoRwdZ2shrRXJO9xMYkyJ/raxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735614032; c=relaxed/simple;
	bh=FWMDNKMb7z3fbaMQCp7APYWIVVT0sl6IR6+oafdvtV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jSR9h1beld8wQeN3zRTIgvjqiV0Sh5scGBx8VZmCWs7greysaUd28OXkt4+MittaxPUIWr2WRNyb1Zv7WRAre4xeVVGqojpb4UDdVfVe1WXw0qJ0fKwDZ5XF9tDZxCs5GltkYkjioDgbDSbSRNwKnyHP/NjFvJs1Se+4aQNaFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T42hCjjf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T42hCjjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735614031; x=1767150031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWMDNKMb7z3fbaMQCp7APYWIVVT0sl6IR6+oafdvtV4=;
  b=T42hCjjfumiYeA/YiuO22OOvL0VuVp2ge+KRRVXAYWwyon+tEY7WqCfw
   k6mNzOgbPJct/t1cx97Jj26rNg7w8fzEjSqelJLXLc570qd2yuXnKA9fE
   zzLwB8A3fM/knskQChxJT8+quX2tVWtOHJ1mp25jdUQ84n+XgO+JBoJyT
   ZO7nbNWtTyzdXS/4h/Un2rzNqxTubK4lGpUe6aiBD/s2H3nfh5ABsQmLE
   DMkOK34BLMFCWhtOjAKtk4w2W2X3W4xxgybpg2++B8xprTUbNaFhgVEIK
   9uCzxU35C0sS1/0Tf+ygkgHom+JH76xbNMDO3lrrXBAXwV9u3aBmCanER
   g==;
X-CSE-ConnectionGUID: 7k4p4orFSuObtrz5JbIM1g==
X-CSE-MsgGUID: 2aWlkTy7QuO9AO2fVbqg0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35152144"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="35152144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 19:00:30 -0800
X-CSE-ConnectionGUID: 7Te337q1TSaWOTaR2CNnSw==
X-CSE-MsgGUID: ucahnoA/QBqVS59OhFzA2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="131780494"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Dec 2024 19:00:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSSUc-0006df-2j;
	Tue, 31 Dec 2024 03:00:26 +0000
Date: Tue, 31 Dec 2024 10:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Min Ma <min.ma@amd.com>
Subject: [linux-next:master 477/5236] drivers/accel/amdxdna/aie2_pci.c:21:5:
 sparse: sparse: symbol 'aie2_max_col' was not declared. Should it be static?
Message-ID: <202412311028.x2UtcSHm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: c88d3325ae69b30be7bb80080d211dbfced8003f [477/5236] accel/amdxdna: Add hardware resource solver
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311028.x2UtcSHm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311028.x2UtcSHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311028.x2UtcSHm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/aie2_pci.c:21:5: sparse: sparse: symbol 'aie2_max_col' was not declared. Should it be static?
   drivers/accel/amdxdna/aie2_pci.c:259:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/accel/amdxdna/aie2_pci.c:261:31: sparse: sparse: cast removes address space '__iomem' of expression

vim +/aie2_max_col +21 drivers/accel/amdxdna/aie2_pci.c

    20	
  > 21	int aie2_max_col = XRS_MAX_COL;
    22	module_param(aie2_max_col, uint, 0600);
    23	MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
