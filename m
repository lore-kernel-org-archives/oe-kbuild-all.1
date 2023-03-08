Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0DF8BF3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678304352; x=1709840352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dgrcUYfN0aq2Kg+UeTbEA23dlBaXujhvs2JL7YxDbP8=;
  b=VcA2uRDvUzNf9pIecMobawABf8RZyBY64tXfugZk65EIuF+BSISMBJ6G
   s5M6ho+VQ2cctRJiorCT6VcIUO60d+CdTsBhjrq38rLTaD9bMoOJbs9W7
   J6EfQ5OTDmPLDYVKo8DwbgIVPDbXNCz+w4beNCcxkAPzvmgkMtw6hdcVC
   NizbdtdwRkyl8vJQIl1vUzyvmj1/V3Mph95uOExgSdBvkI1fqFQV4Nplk
   dfePY0X+D+RD+AN8ywNg1oip5xq+XF9OC2XguUJ0nVFMAvFVT3prs0952
   QQn8Qq4EZitv3usqcx0m0ln/Ug/3vkN/k4wB7mfVOTQVQSgXOQzbk2beb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315914785"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="315914785"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:38:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851232346"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="851232346"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 11:38:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZzcm-0002Mt-13;
	Wed, 08 Mar 2023 19:38:56 +0000
Date: Thu, 9 Mar 2023 03:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 395/450] drivers/md/dm-flakey.c:308:35:
 error: implicit declaration of function 'bvec_kmap_local'; did you mean
 'bvec_kmap_irq'?
Message-ID: <202303090344.hyJLVyaX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   466e66e57f1a7f9cf8ddeb5e946ab80c625d56b1
commit: 257adfa30b780df395997e4fee5c0763d7f5a248 [395/450] dm flakey: fix a bug with 32-bit highmem systems
config: ia64-buildonly-randconfig-r001-20230308 (https://download.01.org/0day-ci/archive/20230309/202303090344.hyJLVyaX-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=257adfa30b780df395997e4fee5c0763d7f5a248
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout 257adfa30b780df395997e4fee5c0763d7f5a248
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090344.hyJLVyaX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:154,
                    from include/linux/pgtable.h:6,
                    from arch/ia64/include/asm/uaccess.h:40,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/highmem.h:5,
                    from include/linux/bio.h:8,
                    from include/linux/device-mapper.h:11,
                    from drivers/md/dm-flakey.c:8:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:137:48: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
     137 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
   drivers/md/dm-flakey.c: In function 'corrupt_bio_data':
>> drivers/md/dm-flakey.c:308:35: error: implicit declaration of function 'bvec_kmap_local'; did you mean 'bvec_kmap_irq'? [-Werror=implicit-function-declaration]
     308 |                         segment = bvec_kmap_local(&bvec);
         |                                   ^~~~~~~~~~~~~~~
         |                                   bvec_kmap_irq
>> drivers/md/dm-flakey.c:308:33: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     308 |                         segment = bvec_kmap_local(&bvec);
         |                                 ^
>> drivers/md/dm-flakey.c:310:25: error: implicit declaration of function 'kunmap_local' [-Werror=implicit-function-declaration]
     310 |                         kunmap_local(segment);
         |                         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +308 drivers/md/dm-flakey.c

   287	
   288	static void corrupt_bio_data(struct bio *bio, struct flakey_c *fc)
   289	{
   290		unsigned int corrupt_bio_byte = fc->corrupt_bio_byte - 1;
   291	
   292		struct bvec_iter iter;
   293		struct bio_vec bvec;
   294	
   295		if (!bio_has_data(bio))
   296			return;
   297	
   298		/*
   299		 * Overwrite the Nth byte of the bio's data, on whichever page
   300		 * it falls.
   301		 */
   302		bio_for_each_segment(bvec, bio, iter) {
   303			if (bio_iter_len(bio, iter) > corrupt_bio_byte) {
   304				char *segment;
   305				struct page *page = bio_iter_page(bio, iter);
   306				if (unlikely(page == ZERO_PAGE(0)))
   307					break;
 > 308				segment = bvec_kmap_local(&bvec);
   309				segment[corrupt_bio_byte] = fc->corrupt_bio_value;
 > 310				kunmap_local(segment);
   311				DMDEBUG("Corrupting data bio=%p by writing %u to byte %u "
   312					"(rw=%c bi_opf=%u bi_sector=%llu size=%u)\n",
   313					bio, fc->corrupt_bio_value, fc->corrupt_bio_byte,
   314					(bio_data_dir(bio) == WRITE) ? 'w' : 'r', bio->bi_opf,
   315					(unsigned long long)bio->bi_iter.bi_sector, bio->bi_iter.bi_size);
   316				break;
   317			}
   318			corrupt_bio_byte -= bio_iter_len(bio, iter);
   319		}
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
