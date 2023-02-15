Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3254117E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 03:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676433455; x=1707969455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QNveVT6QE8c7bIyYVHhtvoUVhyxLxIJocViDSyxsURs=;
  b=jmcywXG3vhl0ubbzlI6FNnFEQA1dNUYQ0+8kmV0MMb2kMBvwRKlXe67v
   +16ySsByoSmQqABlVHdYFr+XL/E7pAQf/aZEDpXQnMnMMPyCLcDerImbA
   lYpieubtXpf1yap2bjlYaDcyR5az3kt9Eygv50IRvluQ08hQUpTGF/tqr
   p/l4TaAb/V0SqmVo6r4LJ8CYiX6WJTwovYh3VVET0L937d1EhTVbsLpTc
   L5kszTuzCitviHGq4p97SF5NDVu5qiCFmd74ZU8IWxVpDrLHEpq2r7Q1a
   JWWDEaCU/W/HwV6wMozOOmW0ZlKBeUq6sTIF8fuJ9orn0ilwevX3ZbcfQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393740589"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="393740589"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 19:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812281078"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="812281078"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2023 19:57:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS8vC-00090T-2C;
	Wed, 15 Feb 2023 03:57:30 +0000
Date: Wed, 15 Feb 2023 11:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 11693/12724] ERROR: modpost:
 "walk_hmem_resources" [drivers/dax/hmem/dax_hmem.ko] undefined!
Message-ID: <202302151109.xlBpZKUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
commit: 7dab174e2e27eeaf10273e597ffbef4f8ea032bb [11693/12724] dax/hmem: Move hmem device registration to dax_hmem.ko
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230215/202302151109.xlBpZKUS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7dab174e2e27eeaf10273e597ffbef4f8ea032bb
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7dab174e2e27eeaf10273e597ffbef4f8ea032bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151109.xlBpZKUS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "walk_hmem_resources" [drivers/dax/hmem/dax_hmem.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
