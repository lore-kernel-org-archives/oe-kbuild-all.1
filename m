Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA768483
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675272763; x=1706808763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qFz4DNZZrf7NtEpkO3nF4jXlJ4Bo13qVCPigH8eiPfs=;
  b=DQT4FrYJTKEelu4sHR86wPX+bEwHt2f3RUc/60xPOBCzWpheDTg0Kuzt
   SRhE8OW+oCaOsI/7GAgY3VjPtpD3E9Idm2WRR+dz/TKIFjrHFZRZCitCP
   kCg5ChKmMgsmwuZOoD/QSJfn8Cp/CDb++CFxzOGIYqMTMeRRXJd7/TOz6
   JvtcmBcE6+8/q99x+JGGQK8vhJYxMNjOGKf/wyno5KjCZg0xmd/a2gKiz
   U+kXbSXvTAkA5WDrAkltsd9WYUtkVyoZyKbseelACFAGfw9roDx3JbvER
   sahzbrVmJSR+GB0Pe9/YwZJxLCxfG4SSBYk12BNQgw13VE7ZQRJqO4Wpz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="392792281"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="392792281"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 09:32:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="666988555"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="666988555"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Feb 2023 09:32:38 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNGyL-0005d6-2q;
	Wed, 01 Feb 2023 17:32:37 +0000
Date: Thu, 2 Feb 2023 01:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: mingzhe.zou@easystack.cn, colyli@suse.de,
	andrea.tomassetti-opensource@devo.com, bcache@lists.ewheeler.net
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@gmail.com,
	linux-bcache@vger.kernel.org, zoumingzhe@qq.com,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	mingzhe <mingzhe.zou@easystack.cn>
Subject: Re: [PATCH 3/3] bcache: support overlay bcache
Message-ID: <202302020120.FNJ9XwCm-lkp@intel.com>
References: <20230201065202.17610-3-mingzhe.zou@easystack.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201065202.17610-3-mingzhe.zou@easystack.cn>

Hi,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc6 next-20230201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mingzhe-zou-easystack-cn/bcache-submit-writeback-inflight-dirty-writes-in-batch/20230201-145421
patch link:    https://lore.kernel.org/r/20230201065202.17610-3-mingzhe.zou%40easystack.cn
patch subject: [PATCH 3/3] bcache: support overlay bcache
config: alpha-randconfig-r026-20230129 (https://download.01.org/0day-ci/archive/20230202/202302020120.FNJ9XwCm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/785b6ea709e3008e2df009d5555c80db709e6d5f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review mingzhe-zou-easystack-cn/bcache-submit-writeback-inflight-dirty-writes-in-batch/20230201-145421
        git checkout 785b6ea709e3008e2df009d5555c80db709e6d5f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/md/bcache/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/md/bcache/super.c: In function 'register_bdev':
>> drivers/md/bcache/super.c:1475:41: error: implicit declaration of function 'part_to_dev'; did you mean 'part_devt'? [-Werror=implicit-function-declaration]
    1475 |         ret = sysfs_create_link_nowarn(&part_to_dev(bdev->bd_part)->kobj,
         |                                         ^~~~~~~~~~~
         |                                         part_devt
>> drivers/md/bcache/super.c:1475:59: error: 'struct block_device' has no member named 'bd_part'; did you mean 'bd_partno'?
    1475 |         ret = sysfs_create_link_nowarn(&part_to_dev(bdev->bd_part)->kobj,
         |                                                           ^~~~~~~
         |                                                           bd_partno
   drivers/md/bcache/super.c: In function 'register_cache':
   drivers/md/bcache/super.c:2403:59: error: 'struct block_device' has no member named 'bd_part'; did you mean 'bd_partno'?
    2403 |         ret = sysfs_create_link_nowarn(&part_to_dev(bdev->bd_part)->kobj,
         |                                                           ^~~~~~~
         |                                                           bd_partno
   cc1: some warnings being treated as errors


vim +1475 drivers/md/bcache/super.c

  1453	
  1454	static int register_bdev(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
  1455					 struct block_device *bdev,
  1456					 struct cached_dev *dc)
  1457	{
  1458		const char *err = "cannot allocate memory";
  1459		struct cache_set *c;
  1460		int ret = -ENOMEM;
  1461	
  1462		memcpy(&dc->sb, sb, sizeof(struct cache_sb));
  1463		dc->bdev = bdev;
  1464		dc->bdev->bd_holder = dc;
  1465		dc->sb_disk = sb_disk;
  1466	
  1467		if (cached_dev_init(dc, sb->block_size << 9))
  1468			goto err;
  1469	
  1470		err = "error creating kobject";
  1471		if (kobject_add(&dc->disk.kobj, bdev_kobj(bdev), "bcache_bdev"))
  1472			goto err;
  1473	
  1474		err = "error creating lagacy sysfs link";
> 1475		ret = sysfs_create_link_nowarn(&part_to_dev(bdev->bd_part)->kobj,
  1476					       &dc->disk.kobj, "bcache");
  1477		if (ret && ret != -EEXIST) {
  1478			pr_err("Couldn't create lagacy disk sysfs ->bcache");
  1479			goto err;
  1480		}
  1481	
  1482		if (bch_cache_accounting_add_kobjs(&dc->accounting, &dc->disk.kobj))
  1483			goto err;
  1484	
  1485		pr_info("registered backing device %pg\n", dc->bdev);
  1486	
  1487		list_add(&dc->list, &uncached_devices);
  1488		/* attach to a matched cache set if it exists */
  1489		list_for_each_entry(c, &bch_cache_sets, list)
  1490			bch_cached_dev_attach(dc, c, NULL);
  1491	
  1492		if (BDEV_STATE(&dc->sb) == BDEV_STATE_NONE ||
  1493		    BDEV_STATE(&dc->sb) == BDEV_STATE_STALE) {
  1494			err = "failed to run cached device";
  1495			ret = bch_cached_dev_run(dc);
  1496			if (ret)
  1497				goto err;
  1498		}
  1499	
  1500		return 0;
  1501	err:
  1502		pr_notice("error %pg: %s\n", dc->bdev, err);
  1503		bcache_device_stop(&dc->disk);
  1504		return ret;
  1505	}
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
