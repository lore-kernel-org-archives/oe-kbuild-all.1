Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C40223DCE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 10:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784371989; cv=none; b=gusc270Pfd1xLcvkd7KIX/to9n4z/JOrUgKq5INAyHYewfFQ1cuOpuwbsPYx7CGeaLW62LFK9T/ed1oNp6wY/FXRiSRxRPIp3HjuH5HwFLaI3B//Lu6tZBfqVpSKHM5asXCE1wGNFOm/JvdT+zXRpnq9VA+vgQQGh/Qwi0RZdOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784371989; c=relaxed/simple;
	bh=63okk1sH1YB1HNlwW8CUtpCOS2E7YCK2PeX83ApWT34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dYO7ThtzWCyGoTNfbS0DbzYrHF5k2KTJoUki6SKCL1F5N0FuoqpmgbA0ayksCB6kxVVdkw3Lmk/XUKMYiNHkb9uPfT5Ph/GqpEXNtNKjMlUmVKUBRkSaLx3An3KFW4frNvq/Zu+MmoM8l7DcZdyLck2hRhZ9MDaTieYSCGm07D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpB86QiZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpB86QiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784371988; x=1815907988;
  h=date:from:to:cc:subject:message-id;
  bh=63okk1sH1YB1HNlwW8CUtpCOS2E7YCK2PeX83ApWT34=;
  b=cpB86QiZU0WJT1p71T690nOAUEJuHtCXCAfECjMVoTz3gMK3vEvcgcRW
   KqBpDbw6rkYHtYS3gwpZnd9ir8bWquVNcsSsN3kQa26TUWkOAJruyRGjO
   xIf3Nxjeft40DiOt8RDHsET5VUaHFycRGZDFfxN/oPLJddV0hcJL2BVvY
   uE6Yr/AMj/a+nVeoI6lKJdB9C/yYM5LgfXRqM4QBXWaFA2gf238eY0NHM
   Dh4Uc9hof0+BWZvstFruQxHNJHmKsz+Fb4/j5/mHGp/fs1PpK+cXfbW4n
   Wx/vDNWR3+1NWqyNrFdG5Vzp3+R3xEO26bnhj+eLP8xfsghnbda2+BRi9
   g==;
X-CSE-ConnectionGUID: W1oLJiV1TiWsdolrpYvmaQ==
X-CSE-MsgGUID: lj1PWlVBTVG7tKyAQUP5wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95379555"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="95379555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 03:53:07 -0700
X-CSE-ConnectionGUID: if9swJJmSKWZKYQCaX1mNg==
X-CSE-MsgGUID: ATyMCcedS5e3C1nisvbpXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="260810979"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Jul 2026 03:53:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl2eu-00000000Uif-0nsv;
	Sat, 18 Jul 2026 10:52:44 +0000
Date: Sat, 18 Jul 2026 18:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 45/51] ld: xfs_verify_media.c:undefined
 reference to `xfs_csum_verify'
Message-ID: <202607181846.IOPrb6Tv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: ecfea0e9b783f5fcb29e76838e0a64bc9bcf59c9 [45/51] xfs: verify data checksums during media verification
config: i386-buildonly-randconfig-003-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181846.IOPrb6Tv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181846.IOPrb6Tv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181846.IOPrb6Tv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/iomap/ioend.o: in function `iomap_ioend_writeback_submit':
   ioend.c:(.text+0x1fc): undefined reference to `fs_bio_integrity_generate'
   ld: fs/xfs/xfs_ioend.o: in function `xfs_ioend_submit_read_sync':
   xfs_ioend.c:(.text+0x392): undefined reference to `xfs_rtcsum_read_async'
   ld: xfs_ioend.c:(.text+0x54c): undefined reference to `xfs_csum_verify'
   ld: fs/xfs/xfs_super.o: in function `xfs_fs_fill_super':
   xfs_super.c:(.text+0x2c05): undefined reference to `xfs_rtcsum_mount'
   ld: fs/xfs/xfs_verify_media.o: in function `xfs_submit_verify_bio_csum.constprop.0':
   xfs_verify_media.c:(.text+0xd9c): undefined reference to `xfs_rtcsum_read_async'
>> ld: xfs_verify_media.c:(.text+0xf24): undefined reference to `xfs_csum_verify'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
