Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2811800E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 19:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686340065; x=1717876065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KJOwM+P3cb2t0bV1FaTa5qmrKJiBrJ1IWfvGYV5f2o4=;
  b=bre9b5uYKBYbpXdpNflGC9fGkQfVWbQAlomli96Hh9FdZJU8vrpNHjK8
   jpyppnKqqpd3Kw5N3cCZfq9w7hh4pHhDW2wTKXE1L+0Z+wRrjb+StXXNJ
   F1IpoxMr11tuc6Sx4ZY2hh4CrTOj53Qxu2N4jtFd0uh0ao7yI+dpNn2jX
   WV0Rf/sJZA0LFQqOCQOJMSRDH9iINYKXZviBaBxTuIftIRjw6wIaUdHoL
   C5g0twGgd4R+mKrlDrv0hyoN/exqAHXwansG1U6H1sJ5Fiox4nHHZRw7R
   VWC7+7jiEeqm6VQDWKx20pRjYAt4+AxaezcZatLuUD0iOMeUAU9WQ8Okl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361035375"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="361035375"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 12:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854847676"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="854847676"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 12:47:43 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7i5G-0009LM-25;
	Fri, 09 Jun 2023 19:47:42 +0000
Date: Sat, 10 Jun 2023 03:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:dm-6.5-thin-reserve-throwaway 2/12]
 drivers/md/dm-flakey.c:418:17: warning: ignoring return value of
 'bio_add_page' declared with attribute 'warn_unused_result'
Message-ID: <202306100327.sfoRCggu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git dm-6.5-thin-reserve-throwaway
head:   7d034746b1222a3675e2f5cad90548712cc854f1
commit: 00811892beac462479bbd2f31edcd1e12f38f057 [2/12] dm flakey: clone pages on write bio before corrupting them
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230610/202306100327.sfoRCggu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git/commit/?id=00811892beac462479bbd2f31edcd1e12f38f057
        git remote add snitzer https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git
        git fetch --no-tags snitzer dm-6.5-thin-reserve-throwaway
        git checkout 00811892beac462479bbd2f31edcd1e12f38f057
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/md/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100327.sfoRCggu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-flakey.c: In function 'clone_bio':
>> drivers/md/dm-flakey.c:418:17: warning: ignoring return value of 'bio_add_page' declared with attribute 'warn_unused_result' [-Wunused-result]
     418 |                 bio_add_page(clone, pages, size_to_add, 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +418 drivers/md/dm-flakey.c

   359	
   360	static struct bio *clone_bio(struct dm_target *ti, struct flakey_c *fc, struct bio *bio)
   361	{
   362		struct bio *clone;
   363		unsigned size, remaining_size, nr_iovecs, order;
   364		struct bvec_iter iter = bio->bi_iter;
   365	
   366		if (unlikely(bio->bi_iter.bi_size > UIO_MAXIOV << PAGE_SHIFT))
   367			dm_accept_partial_bio(bio, UIO_MAXIOV << PAGE_SHIFT >> SECTOR_SHIFT);
   368	
   369		size = bio->bi_iter.bi_size;
   370		nr_iovecs = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
   371	
   372		clone = bio_kmalloc(nr_iovecs, GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
   373		if (!clone)
   374			return NULL;
   375	
   376		bio_init(clone, fc->dev->bdev, bio->bi_inline_vecs, nr_iovecs, bio->bi_opf);
   377	
   378		clone->bi_iter.bi_sector = flakey_map_sector(ti, bio->bi_iter.bi_sector);
   379		clone->bi_private = bio;
   380		clone->bi_end_io = clone_endio;
   381	
   382		remaining_size = size;
   383	
   384		order = MAX_ORDER - 1;
   385		while (remaining_size) {
   386			struct page *pages;
   387			unsigned size_to_add, to_copy;
   388			unsigned char *virt;
   389			unsigned remaining_order = __fls((remaining_size + PAGE_SIZE - 1) >> PAGE_SHIFT);
   390			order = min(order, remaining_order);
   391	
   392	retry_alloc_pages:
   393			pages = alloc_pages(GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN | __GFP_COMP, order);
   394			if (unlikely(!pages)) {
   395				if (order) {
   396					order--;
   397					goto retry_alloc_pages;
   398				}
   399				clone_free(clone);
   400				return NULL;
   401			}
   402			size_to_add = min((unsigned)PAGE_SIZE << order, remaining_size);
   403	
   404			virt = page_to_virt(pages);
   405			to_copy = size_to_add;
   406			do {
   407				struct bio_vec bvec = bvec_iter_bvec(bio->bi_io_vec, iter);
   408				unsigned this_step = min(bvec.bv_len, to_copy);
   409				void *map = bvec_kmap_local(&bvec);
   410				memcpy(virt, map, this_step);
   411				kunmap_local(map);
   412	
   413				bvec_iter_advance(bio->bi_io_vec, &iter, this_step);
   414				to_copy -= this_step;
   415				virt += this_step;
   416			} while (to_copy);
   417	
 > 418			bio_add_page(clone, pages, size_to_add, 0);
   419			remaining_size -= size_to_add;
   420		}
   421	
   422		return clone;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
