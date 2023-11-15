Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE62C85E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFWxY9RX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700072281; x=1731608281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0p4QAGmnd4nhDprMmjIEHFUpDBIeMHUDWsLm07xpDI=;
  b=KFWxY9RXqbdBG2aqPGIwdbatQKoPFcXlMpANFVZe7Iq1Z+ufyKnBsBxP
   muBU3vpD9wOHihgtw3N30F1iKjUc7NtHdstEYmAtddlMFCxlkjOI6U9SF
   SFieLxI/Gio7NNK/utOtnQx8i9kFa0iwccmS7k4VyQTFaE6tSuNz1jUAw
   U9ZdSf+YTuFxZ1m28rwColkAyGlMJvP8grURYlxhGNS6UCo6tkOeVXDoJ
   OoSh+5HiBUg3o4G+4wzMFomuzeUNvxWD5x3reiD5xODMe/nlPLU8jALOe
   Puo0ISsNh+sV2QLF0VNRzvRZAkj5sr2YAP4YUu57tdZYkH+vXNq7mnmwr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370275595"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="370275595"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 10:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908849442"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="908849442"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 10:17:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3KSY-0000hO-25;
	Wed, 15 Nov 2023 18:17:54 +0000
Date: Thu, 16 Nov 2023 02:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 59/60] fs/xfs/libxfs/xfs_zones.c:131:1: warning:
 no previous prototype for function 'xfs_zone_validate'
Message-ID: <202311160209.Qp8fCqEU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   1f3ae3d354c278bed39a2951003c1411ebf428eb
commit: cfc6c2eb739956ca8d7e80867413d235c35c08b8 [59/60] xfs: support zoned RT devices
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231116/202311160209.Qp8fCqEU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160209.Qp8fCqEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160209.Qp8fCqEU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_zones.c:131:1: warning: no previous prototype for function 'xfs_zone_validate' [-Wmissing-prototypes]
   xfs_zone_validate(
   ^
   fs/xfs/libxfs/xfs_zones.c:130:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 warning generated.


vim +/xfs_zone_validate +131 fs/xfs/libxfs/xfs_zones.c

   129	
   130	int
 > 131	xfs_zone_validate(

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
