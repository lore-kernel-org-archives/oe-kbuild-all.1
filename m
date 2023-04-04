Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABAB28F3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680627638; x=1712163638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92nVTJwFUP1oBdpQorzBlzyZhcMXuyz0lO9XeKDaOFw=;
  b=UMzjreXTLH45jsbeUcR73ViIXBksfgal7zX92r7saB54mHNzrZcC5lS9
   d+Pxk9WoeJ212eEBmaCmzwbLUVj4+MR8pEWz30bd8zfBfoPu/h/ddsj4f
   i0wmDDR7lCFs2OQdm1D6PcwmodNASsPeL/MRpKY0alxDXUGMN17D4Wm8v
   VhMqD3I/NXv74QNuxKTABoJrORo+Xl5wsx6MuHGngurK9CvAYfwEfHxfK
   veM65mou2JBr4DH+zfMP8rypYTMvHG3sBCNxEBugLhU1XGjptChkP4eAc
   jv+FuNpeGBh2K/GPjdyCR9lUlotOHXnrUODBbulighiIQS2GHHYIRcfT+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="343951112"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="343951112"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 10:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="750993724"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="750993724"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Apr 2023 10:00:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjk1M-000Pvg-1i;
	Tue, 04 Apr 2023 17:00:36 +0000
Date: Wed, 5 Apr 2023 00:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:zram-fixups 15/16] drivers/block/zram/zram_drv.c:778:25:
 error: storage size of 'bv' isn't known
Message-ID: <202304050047.Oe2Dl6CK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git zram-fixups
head:   a75acb782a11ba205a518ebdeed39291404f18fb
commit: 970c3c593b542adeb1c416db8b3d1d5016fdfed2 [15/16] zram: fix synchronous reads
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20230405/202304050047.Oe2Dl6CK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-misc git://git.infradead.org/users/hch/misc.git
        git fetch --no-tags hch-misc zram-fixups
        git checkout 970c3c593b542adeb1c416db8b3d1d5016fdfed2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/block/zram/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050047.Oe2Dl6CK-lkp@intel.com/

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
