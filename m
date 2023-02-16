Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF87747A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676562151; x=1708098151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sPYCeFtwMqbeqGow/6aeKvXfa/5QJIUcClpehVFO8tw=;
  b=kgxA0F0cespoGDX2KPsKBVuTYwvZPSOkUHLBbXQlYhO0VYIbxmdV+5Cr
   uwrischR7fIfaOprrt3aqMsS4GNwIOqMH6+fxMWE9eFaunbd2PjiP6a5n
   AvJa+r2Y3tNYNjvF04xxUovdmFaQ7+AElOzHcYf3iDTlqxjxOHDjKoyT3
   naB9XXDPyeyjL602MnI1lPZ1szclB00yvpx6KPJKJMxBKBsWC3ECRIO0a
   r4pjcvP9Paab1Q9c3tkAFzQ7ls5MuOhNN/K7XB2j2l6v9RUOgYKE2gctZ
   cv+7e81hXHbx3VzM35pDhmLEdco0nVYXGW8mOoXH4Ecs9LbFOfbOzEcgb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331744808"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="331744808"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 07:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="999072243"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="999072243"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2023 07:42:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSgOz-000AKD-0V;
	Thu, 16 Feb 2023 15:42:29 +0000
Date: Thu, 16 Feb 2023 23:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 11510/13217] cxl.c:undefined reference to
 `to_cxl_dax_region'
Message-ID: <202302162331.zGyXCiuH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   509583475828c4fd86897113f78315c1431edcc3
commit: 09d09e04d2fcf88c4620dd28097e0e2a8f720eac [11510/13217] cxl/dax: Create dax devices for CXL RAM regions
config: s390-randconfig-r005-20230212 (https://download.01.org/0day-ci/archive/20230216/202302162331.zGyXCiuH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=09d09e04d2fcf88c4620dd28097e0e2a8f720eac
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 09d09e04d2fcf88c4620dd28097e0e2a8f720eac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302162331.zGyXCiuH-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/dax/cxl.o: in function `cxl_dax_region_probe':
>> cxl.c:(.text+0x92): undefined reference to `to_cxl_dax_region'
   s390-linux-ld: drivers/dax/cxl.o: in function `cxl_dax_region_driver_init':
>> cxl.c:(.init.text+0x3c): undefined reference to `__cxl_driver_register'
   s390-linux-ld: drivers/dax/cxl.o: in function `cxl_dax_region_driver_exit':
>> cxl.c:(.exit.text+0x32): undefined reference to `cxl_driver_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
