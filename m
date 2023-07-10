Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B93313AF4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 21:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689023010; x=1720559010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jAJmVTgcEXtfgXzyTzCt24oi+7pn6K9VlIVWkifxXBY=;
  b=O4yuPZC5c+UfIAIp13DpSdfYaGmVRfPFtinjlGGSbqUAkiotQGUWxxLQ
   Uf3y2X6DqUhypmFz/jhX855sleEJajBR1fXxHNsxNe94k07r4y42CCehc
   NbOjNRS4k7VEo7LU6QmDOQdt2e3g40slKd083SfW2D2Lv6gAsqU65gzVO
   l024qGt9UhBFoD1sBpzoQiFU0h0wlE7/ZZemGycaIGqwhzN25v9273aMd
   SH1Bvcpg25UNxMjlh7yZIW2vsNOyyQHayFEP86Sxxs/WH3lAALwFkyPAQ
   ts3R2SlQOCQFycner9k8CymS3CYXo6PDQA7jGHgG59RJFGHsGF2tkW4kN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430540181"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="430540181"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 14:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750467018"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="750467018"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Jul 2023 14:03:28 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIy2Z-000406-2N;
	Mon, 10 Jul 2023 21:03:27 +0000
Date: Tue, 11 Jul 2023 05:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 5/6] fs/f2fs/super.c:1563:23: error: 'struct
 f2fs_dev_info' has no member named 'blkz_seq'
Message-ID: <202307110435.0H8FQZZW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   d73b38253cda925126fc85e32277fbe2f1b100bf
commit: 2031cbae1532cadb0838ebc1fecbfd14698b5a0a [5/6] f2fs: don't reopen the main block device in f2fs_scan_devices
config: alpha-randconfig-r021-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110435.0H8FQZZW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110435.0H8FQZZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110435.0H8FQZZW-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/super.c: In function 'destroy_device_list':
>> fs/f2fs/super.c:1563:23: error: 'struct f2fs_dev_info' has no member named 'blkz_seq'
    1563 |         kvfree(FDEV(0).blkz_seq);
         |                       ^


vim +1563 fs/f2fs/super.c

  1558	
  1559	static void destroy_device_list(struct f2fs_sb_info *sbi)
  1560	{
  1561		int i;
  1562	
> 1563		kvfree(FDEV(0).blkz_seq);
  1564		for (i = 1; i < sbi->s_ndevs; i++) {
  1565			blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
  1566	#ifdef CONFIG_BLK_DEV_ZONED
  1567			kvfree(FDEV(i).blkz_seq);
  1568	#endif
  1569		}
  1570		kvfree(sbi->devs);
  1571	}
  1572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
