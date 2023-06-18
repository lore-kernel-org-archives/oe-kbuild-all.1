Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC197184C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687092499; x=1718628499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ui3qH8FcOciDQjDxiJUhQ1bNAwCAQq/X9fFrsvOrLc=;
  b=K4aR2RkeWcdvvqNG6lPm7ax1vPfiUummKGKpNiS6EXWqueWickS+3dPF
   VaPqofUZgRTjiJjy7mkFRboib21Ml4ipUJqUiaQ4NbClm1PUmXQxZn5uO
   A0MhhvAsl4DSrjdk+cpGXSHwKiK9f+C7oY9d4Nit0h0uSk/nB9G1t8lvY
   m4MkMBRv/PtKEEJBaTI0eNaVuTVwHVUznGxlz5z4xmQ5KnbTgDx25zCOh
   kPXj6IhObImbbcLvbDCqfZJB9dHpgWIK5N2vgJoGXftMa1XDVt9064J8Y
   NNB4+0JLnIqZ5kAAgFkJewVbgA637W9Wy1gUf2bUYEFBlGQYbUpMmrudi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="425424220"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="425424220"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 05:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="803340279"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="803340279"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jun 2023 05:48:17 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qArpJ-0003j6-0z;
	Sun, 18 Jun 2023 12:48:17 +0000
Date: Sun, 18 Jun 2023 20:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230618-hacks 13/45] ld: block/fops.c:582:
 undefined reference to `iomap_file_buffered_write'
Message-ID: <202306182028.YuPKL0oQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230618-hacks
head:   d17988fe31ebdd87d8d375a54d9e94ac79252b03
commit: 43d3c1c7d345f4a8ff7a5f088cf25bf1801cb0d9 [13/45] block: use iomap for writes to block devices
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20230618/202306182028.YuPKL0oQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306182028.YuPKL0oQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306182028.YuPKL0oQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `blkdev_buffered_write':
   block/fops.c:582: undefined reference to `iomap_file_buffered_write'
>> ld: block/fops.c:582: undefined reference to `iomap_file_buffered_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
