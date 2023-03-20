Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FBC7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679334053; x=1710870053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ydwEXOnIXCURqQ2iDWD9YjDZAjy2bpF0xx+p0gG7jmI=;
  b=AfRqr1KN85YmOijYSi/1SB/OX8IRnATSqfiyiZ/icn1o6imY8BZMnsfs
   bdGK+5/mtMh/Y6UR8ydgLeA0NK9pM+ruEkEsdxB0VYgAKNUw2X7LLkyDk
   uL/s2Hk2l8QmfN0tEwZW5MZ9h8//cIjsJQlDzRxe+Kt9TfIp9DgNQln3I
   OLQAebVGD64q0rSEKy61x3K9eSR4pqVyZHPtpYSWSkan9F0uTsHNFw1PS
   e6zMbnipIJjK8BW8SJADBa1f9VXG6GIgOLSjbjP4bJJXYYVNpkXJx3ARi
   KocT3CXUyYS21uiMHO/Inu/EWVR/V7OupRvrRaWu1UwEva3zUpEXgzBqS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="366452980"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="366452980"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 10:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770279734"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="770279734"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Mar 2023 10:40:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peJV5-000BCE-0w;
	Mon, 20 Mar 2023 17:40:51 +0000
Date: Tue, 21 Mar 2023 01:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 2823/4847] cc_driver.c:undefined reference to
 `devm_platform_get_and_ioremap_resource'
Message-ID: <202303210131.GnKf48ma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
commit: e70a329832df84e25ed47cbdc5c96276331356b3 [2823/4847] crypto: ccree - Use devm_platform_get_and_ioremap_resource()
config: s390-randconfig-r024-20230320 (https://download.01.org/0day-ci/archive/20230321/202303210131.GnKf48ma-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e70a329832df84e25ed47cbdc5c96276331356b3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e70a329832df84e25ed47cbdc5c96276331356b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210131.GnKf48ma-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   coherent.c:(.text+0x6e): undefined reference to `memremap'
   s390-linux-ld: coherent.c:(.text+0x10e): undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.o: in function `dma_declare_coherent_memory':
   coherent.c:(.text+0x43a): undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.o: in function `dma_release_coherent_memory':
   coherent.c:(.text+0x494): undefined reference to `memunmap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
   cistpl.c:(.text+0x222): undefined reference to `iounmap'
   s390-linux-ld: cistpl.c:(.text+0x234): undefined reference to `ioremap'
   s390-linux-ld: cistpl.c:(.text+0x286): undefined reference to `ioremap'
   s390-linux-ld: cistpl.c:(.text+0x29c): undefined reference to `iounmap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
   cistpl.c:(.text+0xda2): undefined reference to `iounmap'
   s390-linux-ld: drivers/crypto/ccree/cc_driver.o: in function `init_cc_resources':
>> cc_driver.c:(.text+0x552): undefined reference to `devm_platform_get_and_ioremap_resource'
   s390-linux-ld: drivers/crypto/ccree/cc_debugfs.o: in function `cc_debugfs_init':
   cc_debugfs.c:(.text+0xbe): undefined reference to `debugfs_create_regset32'
   s390-linux-ld: cc_debugfs.c:(.text+0x13a): undefined reference to `debugfs_create_regset32'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
