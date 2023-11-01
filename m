Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF81612B8E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWbFmxgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698843789; x=1730379789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xqb2s8yu9Tqmf7i3D/xBNAG070CrOhqluUcoukJ5yAU=;
  b=PWbFmxgSMkPjIYk0bZrndrAjmtCoyM2XOuP3PEMlrQO45ylB4jjuOHpS
   cGZXKUDTqNbOqPrIFfHjy7ta74gGVhzl+UaJbEAIsfi4XdcYHQKXagwES
   vg4H8lFbz+5cfH7W9hKWeYLxovD6yUipEdoddQDXfrKYFxmRqS7eOpxbS
   QF5SlyJlnvKfr0k6U8yIRNzdqhRMWtT56bSfnG9oKQV0db9CIDQrkKePf
   4Ssz1eT1/7T/roof7+LqMgGKym7GEOOUuanyhtsvTJmvrxT0DcUhZkGFt
   5ktp0QZRrtRrXtrcyCz4NPX25IWsE9IbpobXYGa5zSCUPhomxpVv+yroH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1341822"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="1341822"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 06:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="737398925"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="737398925"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Nov 2023 06:01:54 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyAr1-0000oo-1M;
	Wed, 01 Nov 2023 13:01:51 +0000
Date: Wed, 1 Nov 2023 21:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 20/48] undefined reference to `__udivdi3'
Message-ID: <202311012038.F3dTGafQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   c4f7071632b671933d29f8b9cdb202a6c1c43dd4
commit: 0bebbff604f9f794dd835c776c496036426b4cd3 [20/48] iomap: add the concept of a merge boundary to the writeback code
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20231101/202311012038.F3dTGafQ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311012038.F3dTGafQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311012038.F3dTGafQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: fs/iomap/buffered-io.o: in function `iomap_ioend_try_merge':
>> (.text+0x2e8): undefined reference to `__udivdi3'
>> microblaze-linux-ld: (.text+0x308): undefined reference to `__udivdi3'
   microblaze-linux-ld: fs/iomap/buffered-io.o: in function `iomap_writepage_map':
   (.text+0x7ebc): undefined reference to `__udivdi3'
   microblaze-linux-ld: (.text+0x7ee0): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
