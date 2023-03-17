Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB41A377
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 01:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679016772; x=1710552772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N+4GrM279x6QIbtfcOZhQkVrsTyEc6fzo+dS4YHiHE8=;
  b=Nm3oZgBJ+zToLYvoDkWwjsJ3Zo9ctyZvzX7KtRLAeFYeYyVBzgq7G52P
   PScNRIAMGYqNlLSQrBDwecQQqqAKpHd0/s0z6jT/rqBEksLsT/IRdYL6j
   GojJ5OJ3Nb08H8O6SjbeaEan+MgpQH4qm3hZvOIyYC/Oc61KAnPRNZlB6
   f/9b/LQrwk3kc/IPZmO9RElmzyvjLnYE/HgWeNKhXeZNsPf4QpV91RMSi
   p6SvyvjNl88aSjiTs9U2xoq/V91hXUI+uDVv6YWpPFqk4FrhLfk4AF6ss
   c2Ljis22QAUjoDPh3EPsicDVUyQVpWYAaeKRrqhxVUZivwdUg9A/eqgMU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="403031071"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="403031071"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 18:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="682516084"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="682516084"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Mar 2023 18:32:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcyxe-0008x8-09;
	Fri, 17 Mar 2023 01:32:50 +0000
Date: Fri, 17 Mar 2023 09:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 67/69] kernel/power/user.c:325:11: warning:
 format specifies type 'unsigned long long' but the argument has type
 'unsigned long'
Message-ID: <202303170929.a7UOkePc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   aacf4827f4c27b0c33e275a98138c13be633c217
commit: 2c88b559a996981e862d35551e3f3b611847f9e3 [67/69] CHROMIUM: hibernate: Add 2 new ioctls to secure image transfer.
config: x86_64-randconfig-a012-20230313 (https://download.01.org/0day-ci/archive/20230317/202303170929.a7UOkePc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 2c88b559a996981e862d35551e3f3b611847f9e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170929.a7UOkePc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/user.c:325:11: warning: format specifies type 'unsigned long long' but the argument has type 'unsigned long' [-Wformat]
                                  sbdev->nr_blocks_used);
                                  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:343:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   1 warning generated.


vim +325 kernel/power/user.c

   290	
   291	static int snapshot_write_block_device(struct snapshot_data *data) {
   292		int res = 0;
   293		struct snapshot_bdev *sbdev = &data->snapshot_bdev;
   294		struct bio bio;
   295		struct bio_vec bio_vec;
   296		int sector = 0;
   297	
   298		while (1) {
   299			struct bio_vec bvec;
   300	
   301			res = snapshot_read_next(&data->handle);
   302			if (!res)
   303				break;
   304			else if (res < (int)PAGE_SIZE) {
   305				if (res > 0)
   306					res = -EFAULT;
   307				break;
   308			}
   309	
   310			bvec.bv_page = virt_to_page(data_of(data->handle));
   311			bvec.bv_len = PAGE_SIZE;
   312			bvec.bv_offset = 0;
   313	
   314			bio_init(&bio, &bio_vec, 1);
   315			bio_set_dev(&bio, sbdev->bdev);
   316			bio.bi_iter.bi_sector = sector;
   317			bio.bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_IDLE;
   318			bio_add_page(&bio, bvec.bv_page, bvec.bv_len, bvec.bv_offset);
   319	
   320			res = submit_bio_wait(&bio);
   321	
   322			if (res) {
   323				pr_err("submitting bio failed at sector: %llu block number: %llu\n",
   324				       (unsigned long long)bio.bi_iter.bi_sector,
 > 325				       sbdev->nr_blocks_used);
   326				res = -EFAULT;
   327				break;
   328			}
   329	
   330			sector = bio_end_sector(&bio);
   331			bio_uninit(&bio);
   332			sbdev->nr_blocks_used++;
   333		}
   334	
   335		/* flush buffers before returning */
   336		if (!res) {
   337			bio_init(&bio, &bio_vec, 0);
   338			bio_set_dev(&bio, sbdev->bdev);
   339			bio.bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
   340			res = submit_bio_wait(&bio);
   341			bio_uninit(&bio);
   342		}
   343	
   344		return res;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
