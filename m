Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809BC2C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 15:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687189177; x=1718725177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9wkQaJbJe+ciVyEB8IBxkHa0nEQJvtV3k6ZK9SGZIS0=;
  b=dB2LAIXSe2KrI7Dlckpi5vYVIsebgumzhclR4brbTRnk3/kRDSSYHTQL
   PPwhbqxDAhBtzSYH+VYx9yShk0pmy6o7rQBZmY8tzaE2hCFa6E019XcL/
   5czvPwGKijcKtilg4pnNUii6zD6inbEBZTtUZSW8rdqaMss73onv/swNz
   qzJE13xQflJ3QgM7c9pmBEBfG37ESnUTtoky0mA4ypkXAWlScqQXUIHYO
   kxaDoB5Gd0428T4xmxc4otDNaAYA8QRFkKu8ku4aMHvxM9sLueJ/ZMcgo
   8EqcHIAvuycUFxgFIGlxo13mcMAlATSvB4ZoRIDpxUa9a5/c1khH1ZeV+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="357150036"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="357150036"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 08:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="779079089"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="779079089"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jun 2023 08:39:36 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBGyd-0004rE-1h;
	Mon, 19 Jun 2023 15:39:35 +0000
Date: Mon, 19 Jun 2023 23:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 32/35]
 net/mpls/af_mpls.c:1438:15: error: implicit declaration of function
 'mpls_dev_sysctl_register'; did you mean 'mpls_dev_sysctl_unregister'?
Message-ID: <202306192307.U2G2a3nu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   2b49f8dc213b7691cb69000b5a3986f82eb064e8
commit: 39c637a25cfe21584d6de41a2d8db3ef0261131d [32/35] sysctl: move mpls_dev_sysctl_register down so the mpls_table is 'visible'
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230619/202306192307.U2G2a3nu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306192307.U2G2a3nu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306192307.U2G2a3nu-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/mpls/af_mpls.c: In function 'mpls_add_dev':
>> net/mpls/af_mpls.c:1438:15: error: implicit declaration of function 'mpls_dev_sysctl_register'; did you mean 'mpls_dev_sysctl_unregister'? [-Werror=implicit-function-declaration]
    1438 |         err = mpls_dev_sysctl_register(dev, mdev);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
         |               mpls_dev_sysctl_unregister
   net/mpls/af_mpls.c: At top level:
>> net/mpls/af_mpls.c:2632:12: error: static declaration of 'mpls_dev_sysctl_register' follows non-static declaration
    2632 | static int mpls_dev_sysctl_register(struct net_device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   net/mpls/af_mpls.c:1438:15: note: previous implicit declaration of 'mpls_dev_sysctl_register' with type 'int()'
    1438 |         err = mpls_dev_sysctl_register(dev, mdev);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/mpls/af_mpls.c:2632:12: warning: 'mpls_dev_sysctl_register' defined but not used [-Wunused-function]
    2632 | static int mpls_dev_sysctl_register(struct net_device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1438 net/mpls/af_mpls.c

37bde79979c386 Robert Shearman 2015-04-22  1412  
03c57747a7020a Robert Shearman 2015-04-22  1413  static struct mpls_dev *mpls_add_dev(struct net_device *dev)
03c57747a7020a Robert Shearman 2015-04-22  1414  {
03c57747a7020a Robert Shearman 2015-04-22  1415  	struct mpls_dev *mdev;
03c57747a7020a Robert Shearman 2015-04-22  1416  	int err = -ENOMEM;
27d691056bde4a Robert Shearman 2017-01-16  1417  	int i;
03c57747a7020a Robert Shearman 2015-04-22  1418  
03c57747a7020a Robert Shearman 2015-04-22  1419  	ASSERT_RTNL();
03c57747a7020a Robert Shearman 2015-04-22  1420  
03c57747a7020a Robert Shearman 2015-04-22  1421  	mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
03c57747a7020a Robert Shearman 2015-04-22  1422  	if (!mdev)
03c57747a7020a Robert Shearman 2015-04-22  1423  		return ERR_PTR(err);
03c57747a7020a Robert Shearman 2015-04-22  1424  
27d691056bde4a Robert Shearman 2017-01-16  1425  	mdev->stats = alloc_percpu(struct mpls_pcpu_stats);
27d691056bde4a Robert Shearman 2017-01-16  1426  	if (!mdev->stats)
27d691056bde4a Robert Shearman 2017-01-16  1427  		goto free;
27d691056bde4a Robert Shearman 2017-01-16  1428  
27d691056bde4a Robert Shearman 2017-01-16  1429  	for_each_possible_cpu(i) {
27d691056bde4a Robert Shearman 2017-01-16  1430  		struct mpls_pcpu_stats *mpls_stats;
27d691056bde4a Robert Shearman 2017-01-16  1431  
27d691056bde4a Robert Shearman 2017-01-16  1432  		mpls_stats = per_cpu_ptr(mdev->stats, i);
27d691056bde4a Robert Shearman 2017-01-16  1433  		u64_stats_init(&mpls_stats->syncp);
27d691056bde4a Robert Shearman 2017-01-16  1434  	}
27d691056bde4a Robert Shearman 2017-01-16  1435  
1182e4d0b4f873 David Ahern     2017-03-28  1436  	mdev->dev = dev;
1182e4d0b4f873 David Ahern     2017-03-28  1437  
37bde79979c386 Robert Shearman 2015-04-22 @1438  	err = mpls_dev_sysctl_register(dev, mdev);
37bde79979c386 Robert Shearman 2015-04-22  1439  	if (err)
37bde79979c386 Robert Shearman 2015-04-22  1440  		goto free;
37bde79979c386 Robert Shearman 2015-04-22  1441  
03c57747a7020a Robert Shearman 2015-04-22  1442  	rcu_assign_pointer(dev->mpls_ptr, mdev);
03c57747a7020a Robert Shearman 2015-04-22  1443  
03c57747a7020a Robert Shearman 2015-04-22  1444  	return mdev;
37bde79979c386 Robert Shearman 2015-04-22  1445  
37bde79979c386 Robert Shearman 2015-04-22  1446  free:
27d691056bde4a Robert Shearman 2017-01-16  1447  	free_percpu(mdev->stats);
37bde79979c386 Robert Shearman 2015-04-22  1448  	kfree(mdev);
37bde79979c386 Robert Shearman 2015-04-22  1449  	return ERR_PTR(err);
03c57747a7020a Robert Shearman 2015-04-22  1450  }
03c57747a7020a Robert Shearman 2015-04-22  1451  

:::::: The code at line 1438 was first introduced by commit
:::::: 37bde79979c3862c79294c62ddcef7efc477e4bf mpls: Per-device enabling of packet input

:::::: TO: Robert Shearman <rshearma@brocade.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
