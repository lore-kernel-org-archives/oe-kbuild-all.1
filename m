Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ADA1FD0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 06:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691129832; x=1722665832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SYuq35jeUa7k1BPcu/plxCkcaH4V4qAzZ9kIhZF8atI=;
  b=KsLPBClU9N1QE5kBfUAq+OOGbjEw/3vE7sF+DEVUMalciAsmrEagIpdy
   DD7iJedTUpyj48zx6R6z65nzwsFI816RSOZu0A3BzJYAazlQz8i1365Rj
   tEzujeyOUSKJBYSpa5YO3ymvmT0rhDdauCMEVNzRGilRra7uLXloMr6Oa
   RgtyPnZuX+n4DZvtbq88G/oiFMXrUhkONsSbml3CR7aqf4/eL+1fB8MvC
   PQ4OK8CoYos1ySI7JK/WEDTy5mhFFGBnSTybP8AbNL4rhfcyBlJQ9LHtu
   6BCQjoZukoDGcdBZoNaaOceZfX0NLMTSTfm9sKZZkLMD7bCybBNTiLC4Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="433928885"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="433928885"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 23:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="799892018"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="799892018"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2023 23:17:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRo7V-0002fV-2g;
	Fri, 04 Aug 2023 06:17:05 +0000
Date: Fri, 4 Aug 2023 14:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [axboe-block:for-6.6/block 30/30] fs/buffer.c:2789: undefined
 reference to `bio_put'
Message-ID: <202308041329.6SK97Asr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.6/block
head:   0f842210d97a7a02d14ee44c3766bcc1ceabf99c
commit: 0f842210d97a7a02d14ee44c3766bcc1ceabf99c [30/30] fs/Kconfig: Fix compile error for romfs
config: i386-buildonly-randconfig-r004-20230731 (https://download.01.org/0day-ci/archive/20230804/202308041329.6SK97Asr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041329.6SK97Asr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041329.6SK97Asr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   ld: fs/buffer.o: in function `end_bio_bh_io_sync':
>> fs/buffer.c:2789: undefined reference to `bio_put'
   ld: fs/buffer.o: in function `bio_alloc':
>> include/linux/bio.h:427: undefined reference to `fs_bio_set'
>> ld: include/linux/bio.h:427: undefined reference to `bio_alloc_bioset'
   ld: fs/buffer.o: in function `submit_bh_wbc':
>> fs/buffer.c:2821: undefined reference to `__bio_add_page'
>> ld: fs/buffer.c:2827: undefined reference to `guard_bio_eod'
>> ld: fs/buffer.c:2834: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `mpage_bio_submit_read':
>> fs/mpage.c:81: undefined reference to `guard_bio_eod'
>> ld: fs/mpage.c:82: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `mpage_bio_submit_write':
   fs/mpage.c:89: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:90: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `bio_alloc':
>> include/linux/bio.h:427: undefined reference to `fs_bio_set'
>> ld: include/linux/bio.h:427: undefined reference to `bio_alloc_bioset'
   ld: fs/mpage.o: in function `__mpage_writepage':
>> fs/mpage.c:624: undefined reference to `bio_add_folio'
   ld: fs/mpage.o: in function `mpage_read_end_io':
>> fs/mpage.c:49: undefined reference to `blk_status_to_errno'
>> ld: fs/mpage.c:59: undefined reference to `bio_put'
   ld: fs/mpage.o: in function `mpage_write_end_io':
   fs/mpage.c:65: undefined reference to `blk_status_to_errno'
   ld: fs/mpage.c:75: undefined reference to `bio_put'
   ld: fs/mpage.o: in function `bio_alloc':
>> include/linux/bio.h:427: undefined reference to `fs_bio_set'
>> ld: include/linux/bio.h:427: undefined reference to `bio_alloc_bioset'
   ld: fs/mpage.o: in function `do_mpage_readpage':
   fs/mpage.c:306: undefined reference to `bio_add_folio'
--
>> fs/mpage.c:370:6: warning: no previous prototype for 'mpage_readahead' [-Wmissing-prototypes]
     370 | void mpage_readahead(struct readahead_control *rac, get_block_t get_block)
         |      ^~~~~~~~~~~~~~~
>> fs/mpage.c:392:5: warning: no previous prototype for 'mpage_read_folio' [-Wmissing-prototypes]
     392 | int mpage_read_folio(struct folio *folio, get_block_t get_block)
         |     ^~~~~~~~~~~~~~~~
>> fs/mpage.c:669:1: warning: no previous prototype for 'mpage_writepages' [-Wmissing-prototypes]
     669 | mpage_writepages(struct address_space *mapping,
         | ^~~~~~~~~~~~~~~~


vim +2789 fs/buffer.c

^1da177e4c3f415 Linus Torvalds       2005-04-16  2780  
4246a0b63bd8f56 Christoph Hellwig    2015-07-20  2781  static void end_bio_bh_io_sync(struct bio *bio)
^1da177e4c3f415 Linus Torvalds       2005-04-16  2782  {
^1da177e4c3f415 Linus Torvalds       2005-04-16  2783  	struct buffer_head *bh = bio->bi_private;
^1da177e4c3f415 Linus Torvalds       2005-04-16  2784  
b7c44ed9d2fc6b4 Jens Axboe           2015-07-24  2785  	if (unlikely(bio_flagged(bio, BIO_QUIET)))
08bafc0341f2f79 Keith Mannthey       2008-11-25  2786  		set_bit(BH_Quiet, &bh->b_state);
08bafc0341f2f79 Keith Mannthey       2008-11-25  2787  
4e4cbee93d56137 Christoph Hellwig    2017-06-03  2788  	bh->b_end_io(bh, !bio->bi_status);
^1da177e4c3f415 Linus Torvalds       2005-04-16 @2789  	bio_put(bio);
^1da177e4c3f415 Linus Torvalds       2005-04-16  2790  }
^1da177e4c3f415 Linus Torvalds       2005-04-16  2791  
5bdf402a05fafc5 Ritesh Harjani (IBM  2022-08-18  2792) static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
1420c4a549bf28f Bart Van Assche      2022-07-14  2793  			  struct writeback_control *wbc)
^1da177e4c3f415 Linus Torvalds       2005-04-16  2794  {
1420c4a549bf28f Bart Van Assche      2022-07-14  2795  	const enum req_op op = opf & REQ_OP_MASK;
^1da177e4c3f415 Linus Torvalds       2005-04-16  2796  	struct bio *bio;
^1da177e4c3f415 Linus Torvalds       2005-04-16  2797  
^1da177e4c3f415 Linus Torvalds       2005-04-16  2798  	BUG_ON(!buffer_locked(bh));
^1da177e4c3f415 Linus Torvalds       2005-04-16  2799  	BUG_ON(!buffer_mapped(bh));
^1da177e4c3f415 Linus Torvalds       2005-04-16  2800  	BUG_ON(!bh->b_end_io);
8fb0e342481c4d8 Aneesh Kumar K.V     2009-05-12  2801  	BUG_ON(buffer_delay(bh));
8fb0e342481c4d8 Aneesh Kumar K.V     2009-05-12  2802  	BUG_ON(buffer_unwritten(bh));
^1da177e4c3f415 Linus Torvalds       2005-04-16  2803  
^1da177e4c3f415 Linus Torvalds       2005-04-16  2804  	/*
48fd4f93a00eac8 Jens Axboe           2008-08-22  2805  	 * Only clear out a write error when rewriting
^1da177e4c3f415 Linus Torvalds       2005-04-16  2806  	 */
2a222ca992c35ae Mike Christie        2016-06-05  2807  	if (test_set_buffer_req(bh) && (op == REQ_OP_WRITE))
^1da177e4c3f415 Linus Torvalds       2005-04-16  2808  		clear_buffer_write_io_error(bh);
^1da177e4c3f415 Linus Torvalds       2005-04-16  2809  
07888c665b405b1 Christoph Hellwig    2022-01-24  2810  	if (buffer_meta(bh))
1420c4a549bf28f Bart Van Assche      2022-07-14  2811  		opf |= REQ_META;
07888c665b405b1 Christoph Hellwig    2022-01-24  2812  	if (buffer_prio(bh))
1420c4a549bf28f Bart Van Assche      2022-07-14  2813  		opf |= REQ_PRIO;
07888c665b405b1 Christoph Hellwig    2022-01-24  2814  
1420c4a549bf28f Bart Van Assche      2022-07-14  2815  	bio = bio_alloc(bh->b_bdev, 1, opf, GFP_NOIO);
^1da177e4c3f415 Linus Torvalds       2005-04-16  2816  
4f74d15fe40833d Eric Biggers         2020-07-02  2817  	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
4f74d15fe40833d Eric Biggers         2020-07-02  2818  
4f024f3797c43cb Kent Overstreet      2013-10-11  2819  	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
^1da177e4c3f415 Linus Torvalds       2005-04-16  2820  
741af75d4027b12 Johannes Thumshirn   2023-05-31 @2821  	__bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
^1da177e4c3f415 Linus Torvalds       2005-04-16  2822  
^1da177e4c3f415 Linus Torvalds       2005-04-16  2823  	bio->bi_end_io = end_bio_bh_io_sync;
^1da177e4c3f415 Linus Torvalds       2005-04-16  2824  	bio->bi_private = bh;
^1da177e4c3f415 Linus Torvalds       2005-04-16  2825  
83c9c547168e8b9 Ming Lei             2020-01-05  2826  	/* Take care of bh's that straddle the end of the device */
83c9c547168e8b9 Ming Lei             2020-01-05 @2827  	guard_bio_eod(bio);
83c9c547168e8b9 Ming Lei             2020-01-05  2828  
fd42df305f804dd Dennis Zhou          2018-12-05  2829  	if (wbc) {
fd42df305f804dd Dennis Zhou          2018-12-05  2830  		wbc_init_bio(wbc, bio);
34e51a5e1a6e939 Tejun Heo            2019-06-27  2831  		wbc_account_cgroup_owner(wbc, bh->b_page, bh->b_size);
fd42df305f804dd Dennis Zhou          2018-12-05  2832  	}
fd42df305f804dd Dennis Zhou          2018-12-05  2833  
4e49ea4a3d27636 Mike Christie        2016-06-05 @2834  	submit_bio(bio);
^1da177e4c3f415 Linus Torvalds       2005-04-16  2835  }
bafc0dba1e20d84 Tejun Heo            2015-06-02  2836  

:::::: The code at line 2789 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
