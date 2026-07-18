Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3D736CDF8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 07:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784360050; cv=none; b=SDztKMq4Uk2kiUF/PioDc6FeAKeE40ZcTSQVodoZ0ZMTSLul/I+G1KNTttztLpX8GahlG7XX49fZ0ioOeLU1y6RngivPISwI4erWDghi5s+biNyNRw5qproxOQNFSb/O4GyPbgR/OBEQ/8iA8dQDKAjsBPnRIMkprmOi/aJR2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784360050; c=relaxed/simple;
	bh=iqPOTmf1TUvttW4DINVZ2J5XrTUevEK1+L7qBFvWbVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PNYqirLzk6MLlliZrahFoib707sLl/pYp7hyZI5+GKjCR9/TfSweP/1dua6oebwDcjZ7+ozC1l5RWC0ZWLvOJG78MBcn2fjg2GUzuzb31CpB+gxgZebAjxSuS0mVNA6rm3YYddPTNVcnmhgCyvzlGD73jb6xmnFyFQpYfr0/IBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeNjpHkt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeNjpHkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784360049; x=1815896049;
  h=date:from:to:cc:subject:message-id;
  bh=iqPOTmf1TUvttW4DINVZ2J5XrTUevEK1+L7qBFvWbVs=;
  b=ZeNjpHktRURUJp6c9NQdk5dZuO5lZJ82lqNhU1EQ39aSVKfks6T8X8ly
   2mmRFvZ/aJBrZlM47vL5L01oMGOFwaLwmQrRTsyccJ8xBrMJmP4JHV/9R
   XLYjFilP3BrhtHD7eRigu2nvs9r66kaqaeWL2ao3qHX8iQPw1clMrpXyg
   HluAZJtQNxTHWmwUHadb+/o8ksqABULYHtJLzH2HYMEsKleCBI96JnRxi
   ekRlIWvtCssTHa7B0FWgrmOW5O2J6GKa+MjA4vO3lFzX95HvtxaFDqDCK
   ld/SQsJaB/vlPzGbp0kiOxkUcq+r4ZzmUGgNqR0v3pbmTx19zb7hAnaDv
   w==;
X-CSE-ConnectionGUID: XSvRhPhnTq6LQlvWBZyVSQ==
X-CSE-MsgGUID: wyNJ+ekERpK69WEL/nk6Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88839024"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="88839024"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:34:08 -0700
X-CSE-ConnectionGUID: 8ZfF8So5SHaO1xYOzinO+A==
X-CSE-MsgGUID: Eb4+5MbeQNatTVk7gO56qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="260782108"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Jul 2026 00:34:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzYi-00000000TYV-2iDb;
	Sat, 18 Jul 2026 07:34:04 +0000
Date: Sat, 18 Jul 2026 15:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 43/51] ld: xfs_ioend.c:undefined reference
 to `xfs_csum_verify'
Message-ID: <202607181520.GVob5HOP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: d2fb31974d0bb17f4f1fdc1de60e0a9ca53e6480 [43/51] xfs: add support for writing with data checksums
config: i386-buildonly-randconfig-003-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181520.GVob5HOP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181520.GVob5HOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181520.GVob5HOP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/iomap/ioend.o: in function `iomap_ioend_writeback_submit':
   ioend.c:(.text+0x1fc): undefined reference to `fs_bio_integrity_generate'
   ld: fs/xfs/xfs_ioend.o: in function `xfs_ioend_submit_read_sync':
   xfs_ioend.c:(.text+0x392): undefined reference to `xfs_rtcsum_read_async'
>> ld: xfs_ioend.c:(.text+0x54c): undefined reference to `xfs_csum_verify'
   ld: fs/xfs/xfs_super.o: in function `xfs_fs_fill_super':
   xfs_super.c:(.text+0x2bf8): undefined reference to `xfs_rtcsum_mount'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
