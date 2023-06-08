Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E476FB1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 07:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686207884; x=1717743884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wCsytCcrF2dekrsqGmxY0gQBuIC0Ve5DP/qebllWidQ=;
  b=GLdnb4PuukiBaoWT8azJxRNFTEDiNDocN7vFMwxFyou0gGPIC76CWfBo
   pQl8wLPrag0wcu5A/EPfU55hrht0SFz3Zok50AGw/MCqZV0wEfBis4FN4
   hwd63DGkZfYl/4niEl9pz4xoUhhQQtVysCN8nYTEkSvrdf0n1HB4/sgyF
   Mj0Ea/tHrUCXaEfR4OE9UGE97zJMywVDYPZijFu5+EWY5Txs9wCHYAlJl
   Y6JWy8OhqYvWkG/+fjkGveuZUkv0PIBwq9MxS7pj0IPolI2MAn7gnxDxW
   rh55yvaPJf5ADGJ6TuNK+S1jRC9hijbVwF13qDTGIxK220y5sFzJLsTc8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443596287"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="443596287"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 00:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687283017"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="687283017"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jun 2023 00:04:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q79hJ-0007VK-1Z;
	Thu, 08 Jun 2023 07:04:41 +0000
Date: Thu, 8 Jun 2023 15:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 81/84] kernel/power/user.c:326:11: warning:
 format specifies type 'unsigned long long' but the argument has type
 'unsigned long'
Message-ID: <202306081421.r6i4eG92-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   4711a5ad0f5e066cfbdcfad6890b1264b0db53b7
commit: 6a29e8e6604154d61ac043426f2e40991d2a748c [81/84] CHROMIUM: hibernate: Add 2 new ioctls to secure image transfer.
config: mips-randconfig-r005-20230608 (https://download.01.org/0day-ci/archive/20230608/202306081421.r6i4eG92-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 6a29e8e6604154d61ac043426f2e40991d2a748c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/power/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081421.r6i4eG92-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/user.c:326:11: warning: format specifies type 'unsigned long long' but the argument has type 'unsigned long' [-Wformat]
     326 |                         pr_err("submitting bio failed at sector: %llu block number: %llu\n",
         |                                                                                     ~~~~
         |                                                                                     %lu
     327 |                                (unsigned long long)bio.bi_iter.bi_sector,
     328 |                                sbdev->nr_blocks_used);
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:493:33: note: expanded from macro 'pr_err'
     493 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
     450 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +326 kernel/power/user.c

   291	
   292	static int snapshot_write_block_device(struct snapshot_data *data) {
   293		int res = 0;
   294		struct snapshot_bdev *sbdev = &data->snapshot_bdev;
   295		struct bio bio;
   296		struct bio_vec bio_vec;
   297		int sector = 0;
   298	
   299		while (1) {
   300			struct bio_vec bvec;
   301	
   302			res = snapshot_read_next(&data->handle);
   303			if (!res)
   304				break;
   305			else if (res < (int)PAGE_SIZE) {
   306				if (res > 0)
   307					res = -EFAULT;
   308				break;
   309			}
   310	
   311			bvec.bv_page = virt_to_page(data_of(data->handle));
   312			bvec.bv_len = PAGE_SIZE;
   313			bvec.bv_offset = 0;
   314	
   315			bio_init(&bio, &bio_vec, 1);
   316			bio_set_dev(&bio, sbdev->bdev);
   317			bio.bi_iter.bi_sector = sector;
   318			bio.bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_IDLE;
   319			bio_add_page(&bio, bvec.bv_page, bvec.bv_len, bvec.bv_offset);
   320	
   321			res = submit_bio_wait(&bio);
   322	
   323			if (res) {
   324				pr_err("submitting bio failed at sector: %llu block number: %llu\n",
   325				       (unsigned long long)bio.bi_iter.bi_sector,
 > 326				       sbdev->nr_blocks_used);
   327				res = -EFAULT;
   328				break;
   329			}
   330	
   331			sector = bio_end_sector(&bio);
   332			bio_uninit(&bio);
   333			sbdev->nr_blocks_used++;
   334		}
   335	
   336		/* flush buffers before returning */
   337		if (!res) {
   338			bio_init(&bio, &bio_vec, 0);
   339			bio_set_dev(&bio, sbdev->bdev);
   340			bio.bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
   341			res = submit_bio_wait(&bio);
   342			bio_uninit(&bio);
   343		}
   344	
   345		return res;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
