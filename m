Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF444EA1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 04:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680928230; x=1712464230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ySnJf8iIvkgNjbMa5a6KGhiwC1BMlqjFijIsTlC/wLg=;
  b=ifQZvhy5xAopEp/C5qH7mmcisQMnd/AE4bHVZKzvC+KXvZOrADhcj2am
   1O9qNUNe2LEq5eZoUEh8LUzlu1Ggw0g4SJumUbyZr0gMmaJ9pdB12KtRK
   +cnq8qVjBICxb2SAcb5yjApYKsvV+8NNveJvMB8p5cErCwR91dM/kkNOj
   O3Ms4LNbi+Dp6xKPmKG6keEfZ+1dcIZ/NBTKdlV6iMajeEPS/VTQGNFOx
   WCDNWMwJYF/ycisPT2l/XLZRKL1m6TdqlOp2ZW3e/pKQZrg8mEjso9n6e
   QejCHorUl6p8KxzvD60Qz4hTZi/jL+bAMQrvJkps0+H4SiqeBeOWJrpmo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="340598854"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="340598854"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 21:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637898745"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="637898745"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 21:30:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl0Dc-000TJW-0l;
	Sat, 08 Apr 2023 04:30:28 +0000
Date: Sat, 8 Apr 2023 12:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 15/16] zram: fix synchronous reads
Message-ID: <202304081219.Y5WyFKHp-lkp@intel.com>
References: <20230406144102.149231-16-hch@lst.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406144102.149231-16-hch@lst.de>

Hi Christoph,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/zram-make-zram_bio_discard-more-self-contained/20230406-234133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230406144102.149231-16-hch%40lst.de
patch subject: [PATCH 15/16] zram: fix synchronous reads
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304081219.Y5WyFKHp-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e4596d7c2cf157f5b3d566cb2cc0769c9232a728
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christoph-Hellwig/zram-make-zram_bio_discard-more-self-contained/20230406-234133
        git checkout e4596d7c2cf157f5b3d566cb2cc0769c9232a728
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081219.Y5WyFKHp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/zram/zram_drv.c: In function 'zram_sync_read':
>> drivers/block/zram/zram_drv.c:778:25: error: storage size of 'bv' isn't known
     778 |         struct bio_bvec bv;
         |                         ^~
   drivers/block/zram/zram_drv.c:778:25: warning: unused variable 'bv' [-Wunused-variable]


vim +778 drivers/block/zram/zram_drv.c

   774	
   775	static void zram_sync_read(struct work_struct *work)
   776	{
   777		struct zram_work *zw = container_of(work, struct zram_work, work);
 > 778		struct bio_bvec bv;
   779		struct bio bio;
   780	
   781		bio_init(&bio, zw->zram->bdev, &bv, 1, REQ_OP_READ);
   782		bio.bi_iter.bi_sector = zw->entry * (PAGE_SIZE >> 9);
   783		__bio_add_page(&bio, zw->page, PAGE_SIZE, 0);
   784		submit_bio_wait(&bio);
   785	}
   786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
