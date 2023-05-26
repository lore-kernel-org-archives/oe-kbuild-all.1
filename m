Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C1F742E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685098709; x=1716634709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjyXqqf9PtOxSNCtJV4tLxGEeSz2WhcaVgnLxuFK/eE=;
  b=QRTtYJnuOZ3oDZohfInoF6nX8cIYOmsOnrL6PD3aa/cjIiQWttG99+5w
   fZWfhCMZaHkyeboUkKXVx2f2KLjDugbTVsRUv81lmRvOOIEEz239kKOrj
   I+FQEmjSpo8+yczeHy9tKTxG6MmaKpMck+Tf0HzSK9tdMlACI6T6YvyRo
   qnyXjyvP54JZkWPAubvJHjxFexrYsjAvNwoxqaCoxPsy/bsAtG8ZmwOW5
   RBS9V+2aIzt3FQuBtbr1g/oOEoj0h3TCyKx2FKOTZZ5+pMGtZAuDZLKnF
   7BAGdQnJppfgjFkiwn8BZRftxk5UPDz1gyiBzsDk26kf/L3U3S0u3PuK6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440531594"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="440531594"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 03:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="817497782"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="817497782"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 May 2023 03:58:27 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2V9O-000JGf-1d;
	Fri, 26 May 2023 10:58:26 +0000
Date: Fri, 26 May 2023 18:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230525 13/31] block/bdev.c:455:9:
 warning: ISO C90 forbids mixed declarations and code
Message-ID: <202305261826.Hqajfjr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230525
head:   1e9b17615c8ad5829f88f54de36523f291a145cc
commit: fbc88e916be0dfe97615d765277253cd35cbf2eb [13/31] block: set mapping order for the block page cache in device_add_disk
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230526/202305261826.Hqajfjr5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=fbc88e916be0dfe97615d765277253cd35cbf2eb
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next large-block-20230525
        git checkout fbc88e916be0dfe97615d765277253cd35cbf2eb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261826.Hqajfjr5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/bdev.c: In function 'bdev_set_mapping_order':
>> block/bdev.c:455:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     455 |         unsigned int lbs = queue_logical_block_size(bdev->bd_queue);
         |         ^~~~~~~~


vim +455 block/bdev.c

   449	
   450	void bdev_set_mapping_order(struct block_device *bdev)
   451	{
   452	#ifdef CONFIG_BUFFER_HEAD
   453		return;
   454	#endif
 > 455		unsigned int lbs = queue_logical_block_size(bdev->bd_queue);
   456		int order = ilog2(lbs) - PAGE_SHIFT;
   457	
   458		if (order > 0)
   459			mapping_set_min_folio_order(bdev->bd_inode->i_mapping,
   460						    order);
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
