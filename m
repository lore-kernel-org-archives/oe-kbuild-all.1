Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F6ECE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rg1frG+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700916522; x=1732452522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eMMb+vR49O5G87Xy2+Jnk2aB14PSkyQRlSV3asC93Ak=;
  b=Rg1frG+uzsO5FcbIdWb8zwXnjGI8VEOmUXnEZL1ZbhzE6rNidlx2gtrE
   4D2Hl8GxHJUopFOPdjE+wjhrlpMdwVk6xzwb6V6wSwjlUfTdwbQpEDTly
   XwygBzQfqpWPpmiS9LyxnhqsYl73Z7ARPkNr3eHlWpD4zmvoZs/VPVcA4
   F2w8LdH825SvO2HJ6iLeMY2ictXAWmc3x3ZVUc5WKL8jajg/7tvRoUa/f
   8+DkdRGkyfFB4SFtLNuD9BAjRu5OMnU3SuWkCA+5hhEplgtFU47V9FeAQ
   iuA7F/4KJJhEESkSgODDIjed/p3bIR7aYKfucseNOar4hCMiK6RCTh4oP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5745027"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="5745027"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 04:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="9363877"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2023 04:48:40 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6s5O-0003yq-1E;
	Sat, 25 Nov 2023 12:48:38 +0000
Date: Sat, 25 Nov 2023 20:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 65/65] xfs_aops.c:undefined reference to
 `xfs_zone_alloc_blocks'
Message-ID: <202311251817.6bsLOkzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   f5b3c0ffa575a5035e6d607b616c05638ed48937
commit: f5b3c0ffa575a5035e6d607b616c05638ed48937 [65/65] xfs: support zoned RT devices
config: nios2-randconfig-002-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251817.6bsLOkzL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251817.6bsLOkzL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251817.6bsLOkzL-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: fs/xfs/xfs_aops.o: in function `xfs_zoned_map_blocks':
>> xfs_aops.c:(.text+0x588): undefined reference to `xfs_zone_alloc_blocks'
   xfs_aops.c:(.text+0x588): relocation truncated to fit: R_NIOS2_CALL26 against `xfs_zone_alloc_blocks'
>> nios2-linux-ld: xfs_aops.c:(.text+0x5cc): undefined reference to `xfs_zone_alloc_blocks'
   xfs_aops.c:(.text+0x5cc): relocation truncated to fit: R_NIOS2_CALL26 against `xfs_zone_alloc_blocks'
   nios2-linux-ld: fs/xfs/xfs_aops.o: in function `xfs_zoned_rewrite_range':
>> xfs_aops.c:(.text+0x151c): undefined reference to `xfs_zone_finish_alloc'
   xfs_aops.c:(.text+0x151c): relocation truncated to fit: R_NIOS2_CALL26 against `xfs_zone_finish_alloc'
   nios2-linux-ld: fs/xfs/xfs_super.o: in function `xfs_fs_show_stats':
>> xfs_super.c:(.text+0x728): undefined reference to `xfs_zoned_show_stats'
   xfs_super.c:(.text+0x728): relocation truncated to fit: R_NIOS2_CALL26 against `xfs_zoned_show_stats'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
