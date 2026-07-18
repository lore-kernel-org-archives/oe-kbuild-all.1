Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1043122FE0E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 01:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784339648; cv=none; b=mAsA/Yvw5G9IgN+3Wk6ovoz1Htx4S17SpP/zJvpTz+0ILrps0BdWjFJhKVlBZwIzApqd+Dty7AIPkvejcnL4TYKPFQJg+dFdOg75mr45xqWrJ3srQ1qSHbi2OYv7zSNdytw3MfXZj3Oc9JEygXva5jzX2+6joV70s1zWWTSInHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784339648; c=relaxed/simple;
	bh=1eC89LOSR0Xvf+Kb7r7qCqTJrI+NpKKSztOJVmaC3is=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hOsUuY3z8GkTpISgxHEr2QVYmmG0b2xUR5qCKZNVbIQCgWYj/xkVLYwulDoep9zrvuRELWh1E727NRhQNEgaPYqIIWySh82C4ZsJyz9Qf+olisYqkPmgD7wERKycdGKSNkP553lcL3M5Xe/3ptqcwdSiEY6bWGDx7gSYAQbHbEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ActT4+C9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ActT4+C9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784339648; x=1815875648;
  h=date:from:to:cc:subject:message-id;
  bh=1eC89LOSR0Xvf+Kb7r7qCqTJrI+NpKKSztOJVmaC3is=;
  b=ActT4+C9wwcZTSE3AC3sCqzd4CMbZyLgrQRQRxzmnKhGdgUckFpt+i4H
   9kwCWk1dW8QxIs80cZkONDOHRtCTxXchtKoUQHkLrSpJaw36eIZiqpz5M
   gl+sfpJ+yJ9hBHMiXf0/WjURjwTru3k68Z4OFOOoUQ0BYLL+pvNX8Ci3N
   hxopIrl46/unP41241phc/28EpV40rLjW8y93aKmJvRIPaUOBfK4GpeUY
   QaQ9JY5tpXVVFxvXS8FQkfM1Wk1ZFzf2RVaIavneeLe/H/vsk3Ge9TMUA
   Q7WbCkBWT3WE3GbOED+FDIYHIiS3P7ps8zTZ6KmZFjPB3I3lJ0f5FV1DH
   g==;
X-CSE-ConnectionGUID: P3wdZNKtQZefVC6hZ0X20Q==
X-CSE-MsgGUID: ndbvS+8AT8S4NPvvy7D9wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84864516"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="84864516"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 18:54:07 -0700
X-CSE-ConnectionGUID: 1jGKfOytQ5W0EUvcQrSQhA==
X-CSE-MsgGUID: TcscwW2LQz2i0rqxQj9Y3g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jul 2026 18:54:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkuFa-00000000TMh-21fH;
	Sat, 18 Jul 2026 01:53:59 +0000
Date: Sat, 18 Jul 2026 09:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 39/51] ld.lld: error: undefined symbol:
 xfs_rtcsum_mount
Message-ID: <202607180934.R8PFZpDV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: ac76f4f1f7ef9c32cbd6f5cd8163ba542ca02726 [39/51] xfs: core RT data checksum support
config: arm64-randconfig-003-20260718 (https://download.01.org/0day-ci/archive/20260718/202607180934.R8PFZpDV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180934.R8PFZpDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180934.R8PFZpDV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_rtcsum_mount
   >>> referenced by xarray.c
   >>>               vmlinux.o:(xfs_fs_fill_super)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
