Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3896168A2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691576914; x=1723112914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxLjU2ieSLm+PLrEC+ElVM/z+oPrP34R0HAAbrbJorI=;
  b=aGwQu58EBNFXUE8lRjjbkXBP605/ehvKfEpIr1jXrlJazFBt/jiPZqmf
   es79O4+AOvXjv9aAVwkEl7p00qVGrwZz18PID+PoXuSmRhDRAj4W0DvkG
   TNVHlM7EFt6yntlUAcg2lElmg6CSHRPgI4WIg5zCCUI3WmUOi4pZ2qF1W
   5Lq0q9NngC0MUwtxP+ccWjDT9HhlZJIW6IatqPtZvBrzKETMpdW7S+nfg
   8RrGGMYwPpH3zh2js8Larp+1yHSbheTzqETuPE+9TgoBXS2HwLYQBSXKC
   ucpoi0zhu9yl9oPsz8vfSyhdIoJvLyuv+RR/Aq44tksFUmcont3W3Bef7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373867943"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="373867943"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 03:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821798824"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="821798824"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 03:28:29 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTgQW-00060g-1V;
	Wed, 09 Aug 2023 10:28:28 +0000
Date: Wed, 9 Aug 2023 18:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>, Luis Chamberlain <mcgrof@kernel.org>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [linux-next:master 5897/8441] sh4-linux-ld: storage.c:undefined
 reference to `__bread_gfp'
Message-ID: <202308091806.BLTWsL9p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 925c86a19bacf8ce10eb666328fb3fa5aff7b951 [5897/8441] fs: add CONFIG_BUFFER_HEAD
config: sh-se7619_defconfig (https://download.01.org/0day-ci/archive/20230809/202308091806.BLTWsL9p-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091806.BLTWsL9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091806.BLTWsL9p-lkp@intel.com/

Note: the linux-next/master HEAD 21ef7b1e17d039053edaeaf41142423810572741 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/romfs/storage.o: in function `romfs_dev_read':
>> storage.c:(.text+0xb8): undefined reference to `__brelse'
>> sh4-linux-ld: storage.c:(.text+0xbc): undefined reference to `__bread_gfp'
   sh4-linux-ld: fs/romfs/storage.o: in function `romfs_dev_strnlen':
   storage.c:(.text+0x188): undefined reference to `__brelse'
   sh4-linux-ld: storage.c:(.text+0x18c): undefined reference to `__bread_gfp'
   sh4-linux-ld: fs/romfs/storage.o: in function `romfs_dev_strcmp':
>> storage.c:(.text+0x2d0): undefined reference to `__bread_gfp'
>> sh4-linux-ld: storage.c:(.text+0x2d8): undefined reference to `__brelse'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
