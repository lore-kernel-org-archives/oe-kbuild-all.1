Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718B13B3C12
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 06:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789279526; cv=none; b=edwELLK4YS/dQPG3hZlwMDtQS0EH8thfq2/Y3Uaz/O7LaBsbydNJ7iVI2Z1v8dZHA2OaBiEwJCA5w143Srq4V3R2CbfW3xUIvNOo3vl6lyaqwXvePncPuR+3V+/LxphtQOrZTFe0Kw9057vQv0te12KfmJ++6Qx8IM8iYGoun6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789279526; c=relaxed/simple;
	bh=otm/z99bPaBki+g/M6mp7/+0heEEbJjJJcGyGITaLOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KxtQnktOExblBev9A4cvuY6Q+Pvf0HqtL7f6QlSnbeCK/AAV85nf/wq4BjRxf9zWAFsdiztp3fj85DO6PLtPfN2OIzZ1nF7IeQPqyAqr7D7qV/ne8y2hKP9wogsc1vjk5T9ELm3AcBtWKS3f40mqWF6UtxdZ7U6yalfAnIIHjvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UM3I1Zwy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UM3I1Zwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789279525; x=1820815525;
  h=date:from:to:cc:subject:message-id;
  bh=otm/z99bPaBki+g/M6mp7/+0heEEbJjJJcGyGITaLOI=;
  b=UM3I1Zwy1voGFD1IDnMHTZ/DZYVDpRx3ZQDnf5oQKPvUc491CWgPP9JE
   3q7jW8hnl07Abxxa8gHDvqw+63PWkhEYMXoy43x35rgP6PoO4z2TTD/Oy
   S+pUy8OqmQRTvI5igQd7na2jqSLhwB+RHJfrJRa1SEs/frDzykUZUeRyB
   QFs/yzFo0ZTjtLU4XE9989OZccmf7pO616xZDKIwph7K0pZn2PxcBgraq
   bdrHaKcTieRdnUW+kHyr1MHIOIZTZXosFx6kz9VviLyEveLzQMS69sxWt
   LE+vyLOMHW/CWD1xalaMQllAjF+HaSTiZeKudl5kbuJlrvvUoKeVf5ZpW
   g==;
X-CSE-ConnectionGUID: i21hjoZHR+6lYqA6gc6HMQ==
X-CSE-MsgGUID: IZV+SUyTTNq1cpQSmMGUyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="92189664"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="92189664"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 23:05:24 -0700
X-CSE-ConnectionGUID: voXJSqQfSwuZtukQlYgu2Q==
X-CSE-MsgGUID: 173fjNyZTferRLI1tErO4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="274249779"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Sep 2026 23:05:22 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5dHT-000000003ep-1FOZ;
	Sun, 13 Sep 2026 06:02:52 +0000
Date: Sun, 13 Sep 2026 14:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 47/51] xfs_verify_media.c:undefined
 reference to `__moddi3'
Message-ID: <202609131348.ztZPDGxI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   13c4aa2fcb1f62fdf47e7abe90741e89f682761e
commit: 02f8dc603a17ea775ceaba9d4b8d84552ce367f3 [47/51] xfs: verify data checksums during media verification
config: xtensa-randconfig-001-20260911 (https://download.01.org/0day-ci/archive/20260913/202609131348.ztZPDGxI-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609131348.ztZPDGxI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609131348.ztZPDGxI-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   xtensa-linux-ld: fs/xfs/libxfs/xfs_rtcsumfile.o:(.text+0x4c): undefined reference to `__divdi3'
   xtensa-linux-ld: fs/xfs/libxfs/xfs_rtcsumfile.o: in function `xfs_rtcsum_bmap':
   xfs_rtcsumfile.c:(.text+0xd2): undefined reference to `__divdi3'
   xtensa-linux-ld: xfs_rtcsumfile.c:(.text+0x2b0): undefined reference to `__udivdi3'
   xtensa-linux-ld: fs/xfs/libxfs/xfs_rtcsumfile.o: in function `xfs_rtcsum_file_size':
   xfs_rtcsumfile.c:(.text+0x2ea): undefined reference to `__udivdi3'
   xtensa-linux-ld: fs/xfs/xfs_ioend.o: in function `xfs_daddr_to_rtb':
   xfs_ioend.c:(.text+0x154): undefined reference to `__moddi3'
   xtensa-linux-ld: fs/xfs/xfs_ioend.o: in function `xfs_rtcsum_verify_ioend':
   xfs_ioend.c:(.text+0x1dc): undefined reference to `__moddi3'
   xtensa-linux-ld: fs/xfs/xfs_iomap.o: in function `xfs_iomap_write_unwritten':
   xfs_iomap.c:(.text+0x442c): undefined reference to `__moddi3'
   xtensa-linux-ld: fs/xfs/xfs_iomap.o: in function `xfs_read_iomap_begin':
   xfs_iomap.c:(.text+0x455e): undefined reference to `__moddi3'
   xtensa-linux-ld: fs/xfs/xfs_verify_media.o: in function `xfs_verify_media_error.isra.16':
>> xfs_verify_media.c:(.text+0x6b8): undefined reference to `__moddi3'
   xtensa-linux-ld: fs/xfs/xfs_verify_media.o:xfs_verify_media.c:(.text+0x7fb): more undefined references to `__moddi3' follow
   xtensa-linux-ld: fs/xfs/xfs_rtcsum.o: in function `xfs_rtcsum_free_zone':
   xfs_rtcsum.c:(.text+0x544): undefined reference to `__divdi3'
   xtensa-linux-ld: fs/xfs/xfs_rtcsum.o: in function `xfs_rtcsum_log':
   xfs_rtcsum.c:(.text+0x702): undefined reference to `__divdi3'
   xtensa-linux-ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zoned_need_gc':
   xfs_zone_gc.c:(.text+0x858): undefined reference to `__moddi3'
   xtensa-linux-ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zoned_gcd':
   xfs_zone_gc.c:(.text+0xc35): undefined reference to `__moddi3'
   xtensa-linux-ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zoned_need_gc':
   xfs_zone_gc.c:(.text+0x8e4): undefined reference to `__moddi3'
   xtensa-linux-ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zoned_gcd':
   xfs_zone_gc.c:(.text+0x1213): undefined reference to `__moddi3'
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
