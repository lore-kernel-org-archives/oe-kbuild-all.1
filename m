Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAB7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 00:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682123550; x=1713659550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pq76RSgA8PGACiEKEJKKGD+iQGns/6UvMNQyrsUnuYg=;
  b=U9Pxil+xc0GvNj5jOFNaA9+unV3N9DQg+FGY/uFWyA2v/JCU3ZfkQWAU
   UXecjua7cFZfE+j09/HlGejYUsKydEgEnJOdIZMV1VYJ89zY6dfCJMW+H
   v2Fxnuwww2nNSXxnJ0HK+6bjEosNH7Kfjxa0CptJkrvRH1ACoHn3u61di
   +zAAQ6U+rD+EpGh3UxGEQoCEdaV7MAN3sPpvQ/aPZkXVNE1qPvlp5z157
   991CiPolLqR3zuKpxuI+cRKiV/ITMSa5J3B9DWfLJkmjkBDWw3tuTnt4L
   DsdpdDQhoLvoxKbkguiUI5f9XwQkhVIN7qUT1AF6iHUj62hkE00sNn8v4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409051746"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="409051746"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 17:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695112652"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="695112652"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2023 17:32:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq1Ay-000gxM-0L;
	Sat, 22 Apr 2023 00:32:28 +0000
Date: Sat, 22 Apr 2023 08:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-next 25/25] powerpc-linux-ld:
 mm/shmem.c:3840: undefined reference to `__udivdi3'
Message-ID: <202304220833.R2AwYt0g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-next
head:   b53026645e341d12802912ff71ad69f9eab2f5b3
commit: b53026645e341d12802912ff71ad69f9eab2f5b3 [25/25] shmem: add support to customize block size on multiple PAGE_SIZE
config: powerpc-randconfig-r003-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220833.R2AwYt0g-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=b53026645e341d12802912ff71ad69f9eab2f5b3
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next large-block-next
        git checkout b53026645e341d12802912ff71ad69f9eab2f5b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220833.R2AwYt0g-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: mm/shmem.o: in function `shmem_parse_one':
   mm/shmem.c:3838: undefined reference to `__umoddi3'
>> powerpc-linux-ld: mm/shmem.c:3840: undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
