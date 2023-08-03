Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713C17E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691056885; x=1722592885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2IvRs0zVBnF7vxVqenwuowyH1fkojMP79ZBbO5iDtU=;
  b=T6eNKx+RT4Hnl3L6UhApdW1vQj3lazLgIO3MTRllx/yTG9TtsmOQ1oaQ
   /T4ldOAa6WbRPQc+Nhe4ZFNat/wNJIjakMejW+PeQQdpDBnsVAo/krEqP
   M+l7nU2dRCZ4W9GmtZQptYt58JDC5bccnoABYFTted/moSSbY4bpbKj66
   UkAO1qij4Jp+fXrKTeJCK97Sf7l1CkP2/RdK/iD038ZSTdtl9QQwHies5
   zSfsfzCSIftllam6rV2L3icb3Im6buxuoBuiwK+OKYv9FKuAmjDr0G1z1
   V9TUPUtIQ+yYeeystLaxEMlL5VVewHkV75AO3FSITsShYZHbk9A6jix8X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368730543"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="368730543"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 03:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872873166"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2023 03:01:21 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRV8w-00021r-0P;
	Thu, 03 Aug 2023 10:01:18 +0000
Date: Thu, 3 Aug 2023 18:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>, Luis Chamberlain <mcgrof@kernel.org>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [linux-next:master 6098/6910] arm-linux-gnueabi-ld:
 storage.c:undefined reference to `__bread_gfp'
Message-ID: <202308031810.pQzGmR1v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fb4327106e5250ee360d0d8b056c1eef7eeb9a98
commit: 925c86a19bacf8ce10eb666328fb3fa5aff7b951 [6098/6910] fs: add CONFIG_BUFFER_HEAD
config: arm-gemini_defconfig (https://download.01.org/0day-ci/archive/20230803/202308031810.pQzGmR1v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031810.pQzGmR1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031810.pQzGmR1v-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/romfs/storage.o: in function `romfs_dev_read':
>> storage.c:(.text+0x64): undefined reference to `__brelse'
>> arm-linux-gnueabi-ld: storage.c:(.text+0x9c): undefined reference to `__bread_gfp'
   arm-linux-gnueabi-ld: fs/romfs/storage.o: in function `romfs_dev_strnlen':
   storage.c:(.text+0x128): undefined reference to `__brelse'
   arm-linux-gnueabi-ld: storage.c:(.text+0x16c): undefined reference to `__bread_gfp'
   arm-linux-gnueabi-ld: fs/romfs/storage.o: in function `romfs_dev_strcmp':
>> storage.c:(.text+0x22c): undefined reference to `__bread_gfp'
>> arm-linux-gnueabi-ld: storage.c:(.text+0x27c): undefined reference to `__brelse'
   arm-linux-gnueabi-ld: storage.c:(.text+0x2a8): undefined reference to `__bread_gfp'
   arm-linux-gnueabi-ld: storage.c:(.text+0x2bc): undefined reference to `__brelse'
   arm-linux-gnueabi-ld: storage.c:(.text+0x2d4): undefined reference to `__brelse'
   arm-linux-gnueabi-ld: storage.c:(.text+0x2f4): undefined reference to `__brelse'
   arm-linux-gnueabi-ld: storage.c:(.text+0x304): undefined reference to `__brelse'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
