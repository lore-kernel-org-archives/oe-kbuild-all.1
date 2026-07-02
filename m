Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFB53E4508
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 13:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000438; cv=none; b=YJgVWVaTrfjM+PLBr190fAthFOM1l+n6O6zwktKfTvc55Hog2TTYqHD+GHHaUvS85NsO0Jsh426bVhwhRRiOSifcp6/Y9GQYXtk/a5U5dzS3MW9JhfuGNteSLD0zw3upIZHcj9qpv0eDoG+xalKD6CCZaiaykZHLiAp1Kyug49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000438; c=relaxed/simple;
	bh=AWdepcgD79gcHGZwRsXwZ6ehmt5t4blnt9qVe3T7m0Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M21H3UJhEBcuaxvpr4iGixxORxPMVpkH309Fzgj0kXWLZBOu1Gcn9/GneCmJscZFbGbj28FMd7YCo6NRPlSI16O7XM2VMwzBSW6m097/zuHvzwPM1KtknfRKAsuYlbeF/hvJZrw6FUDPeon6gq/+lRo1TIn0tk5DFu1zHcRbzQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drJu6VpC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drJu6VpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783000438; x=1814536438;
  h=date:from:to:cc:subject:message-id;
  bh=AWdepcgD79gcHGZwRsXwZ6ehmt5t4blnt9qVe3T7m0Q=;
  b=drJu6VpCXzaMH5eohglzU0wZdSvmDkt9yuIbsVUdYV9cbz1zqFROih98
   VXsqOBZPl+xmhriGeeizXX31GaqsVwrMQADYCzho2vDaMHZr6e/uYd5aW
   2TfvGIcokKFTvghhv/eD54Lvn0FEsxGbhOE9A+uf7/51HjvZ+k4L3zDXA
   4SgQA1Y0b7b2c8TzC7oUlw6q9HxWrDHYLZxRvtWU4mEwivFHWqqoTW7kr
   w1Or3hlzgg+o2VLo84KTVJbWjHAz99BZVPfZhLeYdKXvoL1nIFAe5xWZQ
   MrwqxgWSxtNtDwtdb1iyHUfuxt6UL1MKT8jnO4qDmc6gnatzryMVRBnyh
   A==;
X-CSE-ConnectionGUID: r61wTByqTZGr4TAAA/naDQ==
X-CSE-MsgGUID: gsk3jHT8TDOwg/rjJtTSDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71277166"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="71277166"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:53:57 -0700
X-CSE-ConnectionGUID: bUiw9xLeRhKj0WsfrmfElg==
X-CSE-MsgGUID: KSWAMUIpTJe8dJn+/as0aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="276075742"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jul 2026 06:53:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfHrT-00000000Apd-1D8H;
	Thu, 02 Jul 2026 13:53:51 +0000
Date: Thu, 02 Jul 2026 21:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/187 1/1] ERROR: modpost:
 drivers/net/phy/as21xx_1.9.1/aeon_as21xxx: 'custome_cfg' exported twice.
 Previous export was in vmlinux
Message-ID: <202607022121.Zn6IFOHd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/187
head:   3591b14936035fc6eaa4ffb659d63289367e34d4
commit: d35953f4687e0059a657274066a7dfbf1b6d4173 [1/1] net: phy: rename as21xx v1.9.1 like it's done for 1.9.2
config: openrisc-randconfig-r112-20260702 (https://download.01.org/0day-ci/archive/20260702/202607022121.Zn6IFOHd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022121.Zn6IFOHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022121.Zn6IFOHd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/net/phy/as21xx_1.9.1/aeon_as21xxx: 'custome_cfg' exported twice. Previous export was in vmlinux
>> ERROR: modpost: drivers/net/phy/as21xx_1.9.1/aeon_as21xxx: 'aeon_cl45_read' exported twice. Previous export was in vmlinux
>> ERROR: modpost: drivers/net/phy/as21xx_1.9.1/aeon_as21xxx: 'aeon_cl45_write' exported twice. Previous export was in vmlinux
ERROR: modpost: "__mulsi3" [kernel/locking/test-ww_mutex.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/rcu/rcuscale.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/time/time_test.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/trace/preemptirq_delay_test.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/dlm/dlm.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/ext2/ext2.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/coda/coda.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/exfat/exfat.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/isofs/isofs.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/nfs/nfs.ko] undefined!
WARNING: modpost: suppressed 1022 unresolved symbol warnings because there were too many)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
