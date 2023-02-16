Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6DBD3F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 23:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676591273; x=1708127273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RhcWtcvuQ6c1ldco2fw8dmiuqzUvkOYSR4WEMaWxR4Y=;
  b=I4tFyTEeK7WezbXAoB8YMgeVXO4QGKbo+lRHwGox5b5RWvkEXwqeX4j2
   9HGKtJasj3I0ehTC9o6QzZ0ZSjDNxvfyke6ut81PiWv59rafIgn1gcfa6
   HjxnSyaDWsoZi/cwF0houW4aHOlBcDTtyJi06UvXI3eHyk0s34Xv36Uqu
   5y11aevucPVEL0brW+V9HGWMvV8Q+3Qkyh6Oy65P+J8iIwXMNHfIQT+xH
   epWejvwqpxXkrwPuGYijAzB+e8wYsmrNrzN1+oeSSOA9uJpjT7ilsZEBC
   veXKDZXAPk/E1+f3GMoXdhXNwPhpTJpPx/2otuEiepCAWsMj6YhpwYsSr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396542519"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="396542519"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 15:47:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="779581223"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="779581223"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2023 15:47:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSnyg-000Axl-1I;
	Thu, 16 Feb 2023 23:47:50 +0000
Date: Fri, 17 Feb 2023 07:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [ammarfaizi2-block:axboe/linux-block/for-6.3/block 148/148]
 block/blk-merge.c:984:42: sparse: sparse: incorrect type in initializer
 (different base types)
Message-ID: <202302170743.GXypM9Rt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-6.3/block
head:   67205f80be9910207481406c47f7d85e703fb2e9
commit: 3481d9424950159b1dbd366a14acab79f1440bbf [148/148] block: sync mixed merged request's failfast with 1st bio's
config: openrisc-randconfig-s042-20230213 (https://download.01.org/0day-ci/archive/20230217/202302170743.GXypM9Rt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/3481d9424950159b1dbd366a14acab79f1440bbf
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/for-6.3/block
        git checkout 3481d9424950159b1dbd366a14acab79f1440bbf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170743.GXypM9Rt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-merge.c:984:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted blk_opf_t const [usertype] ff @@     got unsigned int @@
   block/blk-merge.c:984:42: sparse:     expected restricted blk_opf_t const [usertype] ff
   block/blk-merge.c:984:42: sparse:     got unsigned int
   block/blk-merge.c:1010:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted blk_opf_t const [usertype] ff @@     got unsigned int @@
   block/blk-merge.c:1010:42: sparse:     expected restricted blk_opf_t const [usertype] ff
   block/blk-merge.c:1010:42: sparse:     got unsigned int
>> block/blk-merge.c:763:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted blk_opf_t @@
   block/blk-merge.c:763:24: sparse:     expected unsigned int
   block/blk-merge.c:763:24: sparse:     got restricted blk_opf_t
   block/blk-merge.c:765:28: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted blk_opf_t @@
   block/blk-merge.c:765:28: sparse:     expected unsigned int
   block/blk-merge.c:765:28: sparse:     got restricted blk_opf_t
>> block/blk-merge.c:763:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted blk_opf_t @@
   block/blk-merge.c:763:24: sparse:     expected unsigned int
   block/blk-merge.c:763:24: sparse:     got restricted blk_opf_t
   block/blk-merge.c:765:28: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted blk_opf_t @@
   block/blk-merge.c:765:28: sparse:     expected unsigned int
   block/blk-merge.c:765:28: sparse:     got restricted blk_opf_t

vim +984 block/blk-merge.c

   980	
   981	static enum bio_merge_status bio_attempt_back_merge(struct request *req,
   982			struct bio *bio, unsigned int nr_segs)
   983	{
 > 984		const blk_opf_t ff = bio_failfast(bio);
   985	
   986		if (!ll_back_merge_fn(req, bio, nr_segs))
   987			return BIO_MERGE_FAILED;
   988	
   989		trace_block_bio_backmerge(bio);
   990		rq_qos_merge(req->q, req, bio);
   991	
   992		if ((req->cmd_flags & REQ_FAILFAST_MASK) != ff)
   993			blk_rq_set_mixed_merge(req);
   994	
   995		blk_update_mixed_merge(req, bio, false);
   996	
   997		req->biotail->bi_next = bio;
   998		req->biotail = bio;
   999		req->__data_len += bio->bi_iter.bi_size;
  1000	
  1001		bio_crypt_free_ctx(bio);
  1002	
  1003		blk_account_io_merge_bio(req);
  1004		return BIO_MERGE_OK;
  1005	}
  1006	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
