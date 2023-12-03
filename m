Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9549E1863F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSpq9bY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701633374; x=1733169374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLiMihWBSxYsTzFwA3YUPrrN2+U6rxXIZyC76OTyR+U=;
  b=ZSpq9bY/jHh2zk2HVndJjnudcHbOen4Az79WUEEK1Wbkh1qXomWABa4V
   9O8YCpmJlNYFTUflQvTDjjrVxXveyT+c7i+Rgw7M/dFpDGBzvO5Du0hBD
   GMMcDy/1hsIdQsRxyJ0xw0EZS6iOwkBqOYxv40lE2igx0pKNRQjB380Tg
   ncuvPPYyD17cDoaSsp88XU9lh7jIbeuXKTuKow5AB6uJuYuzo/6p7fN2N
   7QBiWn9ghAFYWtn+gDUv/bTXKjouhujLvuVQQypSV4Xyr9xaZNJ6wlvEp
   kBF+7QqWgwa5OO1FgV22QqjMZ4lIkR7HnfjPxzGzjrztinoHAO0rbHOSA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373090505"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="373090505"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 11:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="746605022"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="746605022"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2023 11:56:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9sZT-00072U-07;
	Sun, 03 Dec 2023 19:56:07 +0000
Date: Mon, 4 Dec 2023 03:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gonglei <arei.gonglei@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning:
 variable 'cpu' set but not used
Message-ID: <202312040315.kPrI1OCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gonglei,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: dbaf0624ffa57ae6e7d87a823185ccd9a7852d3c crypto: add virtio-crypto driver
date:   7 years ago
config: x86_64-randconfig-015-20231011 (https://download.01.org/0day-ci/archive/20231204/202312040315.kPrI1OCE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231204/202312040315.kPrI1OCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312040315.kPrI1OCE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/virtio/virtio_crypto_algs.c:28:
   drivers/crypto/virtio/virtio_crypto_common.h: In function 'virtio_crypto_get_current_node':
>> drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     116 |         int cpu, node;
         |             ^~~
--
   In file included from drivers/crypto/virtio/virtio_crypto_core.c:25:
   drivers/crypto/virtio/virtio_crypto_common.h: In function 'virtio_crypto_get_current_node':
>> drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     116 |         int cpu, node;
         |             ^~~
   In file included from drivers/crypto/virtio/virtio_crypto_core.c:20:
   drivers/crypto/virtio/virtio_crypto_core.c: At top level:
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'virtio_crypto_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1463:1: note: in expansion of macro 'module_init'
    1463 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/virtio.h:190:9: note: in expansion of macro 'module_driver'
     190 |         module_driver(__virtio_driver, register_virtio_driver, \
         |         ^~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion of macro 'module_virtio_driver'
     471 | module_virtio_driver(virtio_crypto_driver);
         | ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/virtio.h:8,
                    from include/linux/virtio_config.h:6,
                    from drivers/crypto/virtio/virtio_crypto_core.c:21:
   drivers/crypto/virtio/virtio_crypto_core.c:471:22: note: 'init_module' target declared here
     471 | module_virtio_driver(virtio_crypto_driver);
         |                      ^~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1459:19: note: in definition of macro 'module_driver'
    1459 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion of macro 'module_virtio_driver'
     471 | module_virtio_driver(virtio_crypto_driver);
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'virtio_crypto_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1468:1: note: in expansion of macro 'module_exit'
    1468 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/virtio.h:190:9: note: in expansion of macro 'module_driver'
     190 |         module_driver(__virtio_driver, register_virtio_driver, \
         |         ^~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion of macro 'module_virtio_driver'
     471 | module_virtio_driver(virtio_crypto_driver);
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_core.c:471:22: note: 'cleanup_module' target declared here
     471 | module_virtio_driver(virtio_crypto_driver);
         |                      ^~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1464:20: note: in definition of macro 'module_driver'
    1464 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion of macro 'module_virtio_driver'
     471 | module_virtio_driver(virtio_crypto_driver);
         | ^~~~~~~~~~~~~~~~~~~~


vim +/cpu +116 drivers/crypto/virtio/virtio_crypto_common.h

   113	
   114	static inline int virtio_crypto_get_current_node(void)
   115	{
 > 116		int cpu, node;
   117	
   118		cpu = get_cpu();
   119		node = topology_physical_package_id(cpu);
   120		put_cpu();
   121	
   122		return node;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
