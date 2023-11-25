Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236211708
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6MnUOQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700918946; x=1732454946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0N3ww45C8WxHVExbEuFz/9TSndYLJkF2aAOKqOC12U=;
  b=Y6MnUOQYS2av2Z1fqO/hYUMfvL1TkDseTJXJCsPbOeIxp03j6ron/iBg
   +K+8fgv2d2l97gAt1vJ+exUKVZ+JiT1oPi55YlE/Lw9TBjcr7Wtzu4PV6
   IaK8CjCcPG9a3/ENhjsd++PwOajDOi9nsuNOc71WhlapZl8fagcBlcp54
   4JisIL9xpHpCE44Ty7y5bEQ1VkbG3853NczWDkuBbfddbM5nQ0fivViJu
   V0lOeD3qBsGWDHBswF/Se+pecsoLMDxlBDjQf1GEpV8XSgZ2Q582IM+yS
   CCph0E9WL7/5E2/swBK3Q6Hg9XkN/ZNS0jtPHIZMLPGW+/rc7Tlz4UM/+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372667768"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="372667768"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 05:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="9369469"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2023 05:29:01 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6siR-00043W-06;
	Sat, 25 Nov 2023 13:28:59 +0000
Date: Sat, 25 Nov 2023 21:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 65/65] powerpc64-linux-ld: xfs_aops.c:undefined
 reference to `xfs_zone_alloc_blocks'
Message-ID: <202311252006.0dIBxllQ-lkp@intel.com>
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
config: powerpc64-randconfig-001-20231125 (https://download.01.org/0day-ci/archive/20231125/202311252006.0dIBxllQ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252006.0dIBxllQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252006.0dIBxllQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xfs_zone_finish_alloc'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: fs/xfs/xfs_aops.o: in function `xfs_zoned_map_blocks':
   xfs_aops.c:(.text+0x604): undefined reference to `xfs_zone_alloc_blocks'
>> powerpc64-linux-ld: xfs_aops.c:(.text+0x6d0): undefined reference to `xfs_zone_alloc_blocks'
   powerpc64-linux-ld: fs/xfs/xfs_aops.o: in function `xfs_zoned_rewrite_range':
   xfs_aops.c:(.text+0x2004): undefined reference to `xfs_zone_finish_alloc'
   powerpc64-linux-ld: fs/xfs/xfs_super.o: in function `xfs_fs_show_stats':
   xfs_super.c:(.text+0xb08): undefined reference to `xfs_zoned_show_stats'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
