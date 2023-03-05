Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9D628EF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678025670; x=1709561670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R79R2+s/I+jYKijt0uUwThRFrB7DpIUDBX0hxvl1ivU=;
  b=YmXh0kNhld+Aq5+79FS/e+7i0ug0JB++61NXx7y7xdaf9qddjDseO1R1
   cs0jnWHEefJ/XV0DubA6t7GHDlO5MsFIfMwPjdP9EhqBLqzgCzxu5urTx
   5nl+jh61J+aMA2QNoAB8kOzJ4IU/kTERdalp5TCyFausX9MmYCMVyX8rH
   fKW1xZ+fCa2ftFt2pghutsd7JpRSU4MgwFuOmaiwHZh3oVwJbKeUgsc7v
   DAEkLCSbRqtwHdXBLSFzSLDaDL3O2SfbjnAS9k6CXGjYyiWWOoOslyk1Y
   asECQuxJWGE4GjI/ii1wrKZu+FlWOJ7HwrZ2B4WNaxLDO0yA9MeXbFN7N
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337695547"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="337695547"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 06:14:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="785893425"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="785893425"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Mar 2023 06:14:28 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYp88-0002nm-11;
	Sun, 05 Mar 2023 14:14:28 +0000
Date: Sun, 5 Mar 2023 22:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:debugfs_lookup_fix 1/1]
 drivers/mtd/spi-nor/debugfs.c:254:2-16: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202303052201.l1sxpnD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_lookup_fix
head:   416ca04cc251b11c991d466dae592f7308f52079
commit: 416ca04cc251b11c991d466dae592f7308f52079 [1/1] mtd: spi-nor: fix memory leak when using debugfs_lookup()
config: sh-randconfig-c033-20230305 (https://download.01.org/0day-ci/archive/20230305/202303052201.l1sxpnD9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303052201.l1sxpnD9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/debugfs.c:254:2-16: WARNING: NULL check before some freeing functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
