Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC065C85
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 05:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685599146; x=1717135146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sgmvVFAV0nxERnenwgp4h6SyaThzHUMiABIME260PNs=;
  b=VvnqElA0mZ8q5aexHLPiLm0c19aNs6R5AA4t/HyBOx6H7tk2/qj7sejY
   tkY6y3ViDJiwBcLJLmvP3wUOYQ7nXYwfyRz6udyNORVmUO1n7kujghLF+
   vOOg8K+S94zUpJQr/eq8Y7QBmrVK8E+lwhVo562FCgbZfcJE8qGscx/lN
   wBTSeSKjmBrAtzGNuiED9zLG32iSNqrl/oVt/ZTkyaamK5kkrN5Kv9n34
   bZF34es7ebPfZ2/YyEea6RpydoploooQIZrSoJ+hHB3qhsMDgMUrnoPy0
   mPsrOBScfItWswulFN4sM/+iALBsreMlmbPAHvEEH5QNXK0ZYNvrOKtN3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="358735421"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="358735421"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 22:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="772272897"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="772272897"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 May 2023 22:59:04 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4bKx-0001yF-2V;
	Thu, 01 Jun 2023 05:59:03 +0000
Date: Thu, 1 Jun 2023 13:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [axboe-block:for-6.5/block 65/74] drivers/md/raid1.c:1151:25:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202306011304.WeeKix79-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block
head:   8e8fedab1194ef90e007636eb3d224c4f8e979a7
commit: 6473bc325644b9c8473e6c92bfb520a68dce1e12 [65/74] md: check for failure when adding pages in alloc_behind_master_bio
config: microblaze-randconfig-s052-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011304.WeeKix79-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=6473bc325644b9c8473e6c92bfb520a68dce1e12
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.5/block
        git checkout 6473bc325644b9c8473e6c92bfb520a68dce1e12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011304.WeeKix79-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/raid1.c:646:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:646:24: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:646:24: sparse:    struct md_rdev *
   drivers/md/raid1.c:777:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:777:24: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:777:24: sparse:    struct md_rdev *
>> drivers/md/raid1.c:1151:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long addr @@     got struct page *[assigned] page @@
   drivers/md/raid1.c:1151:25: sparse:     expected unsigned long addr
   drivers/md/raid1.c:1151:25: sparse:     got struct page *[assigned] page
   drivers/md/raid1.c:1244:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:1244:24: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:1244:24: sparse:    struct md_rdev *
   drivers/md/raid1.c:1407:40: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:1407:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:1407:40: sparse:    struct md_rdev *
   drivers/md/raid1.c:1638:40: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:1638:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:1638:40: sparse:    struct md_rdev *
   drivers/md/raid1.c:1710:40: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:1710:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:1710:40: sparse:    struct md_rdev *
   drivers/md/raid1.c:1827:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:1827:25: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:1827:25: sparse:    struct md_rdev *
   drivers/md/raid1.c:1838:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:1838:25: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:1838:25: sparse:    struct md_rdev *
   drivers/md/raid1.c:1996:60: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got int rw @@
   drivers/md/raid1.c:2301:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:2301:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:2301:32: sparse:    struct md_rdev *
   drivers/md/raid1.c:2337:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:2337:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:2337:32: sparse:    struct md_rdev *
   drivers/md/raid1.c:2354:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:2354:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:2354:32: sparse:    struct md_rdev *
   drivers/md/raid1.c:2770:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/raid1.c:2770:24: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid1.c:2770:24: sparse:    struct md_rdev *

vim +1151 drivers/md/raid1.c

  1122	
  1123	static void alloc_behind_master_bio(struct r1bio *r1_bio,
  1124						   struct bio *bio)
  1125	{
  1126		int size = bio->bi_iter.bi_size;
  1127		unsigned vcnt = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
  1128		int i = 0;
  1129		struct bio *behind_bio = NULL;
  1130	
  1131		behind_bio = bio_alloc_bioset(NULL, vcnt, 0, GFP_NOIO,
  1132					      &r1_bio->mddev->bio_set);
  1133		if (!behind_bio)
  1134			return;
  1135	
  1136		/* discard op, we don't support writezero/writesame yet */
  1137		if (!bio_has_data(bio)) {
  1138			behind_bio->bi_iter.bi_size = size;
  1139			goto skip_copy;
  1140		}
  1141	
  1142		while (i < vcnt && size) {
  1143			struct page *page;
  1144			int len = min_t(int, PAGE_SIZE, size);
  1145	
  1146			page = alloc_page(GFP_NOIO);
  1147			if (unlikely(!page))
  1148				goto free_pages;
  1149	
  1150			if (!bio_add_page(behind_bio, page, len, 0)) {
> 1151				free_page(page);
  1152				goto free_pages;
  1153			}
  1154	
  1155			size -= len;
  1156			i++;
  1157		}
  1158	
  1159		bio_copy_data(behind_bio, bio);
  1160	skip_copy:
  1161		r1_bio->behind_master_bio = behind_bio;
  1162		set_bit(R1BIO_BehindIO, &r1_bio->state);
  1163	
  1164		return;
  1165	
  1166	free_pages:
  1167		pr_debug("%dB behind alloc failed, doing sync I/O\n",
  1168			 bio->bi_iter.bi_size);
  1169		bio_free_pages(behind_bio);
  1170		bio_put(behind_bio);
  1171	}
  1172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
