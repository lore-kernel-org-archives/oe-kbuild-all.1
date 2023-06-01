Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8FE1108
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 02:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685586717; x=1717122717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jq4Tb2zBxpxn97BrsDc0Q+5mZk3Ifs121zf2q74QG6o=;
  b=aJAEh89eoTeexDECTcoMJe/r290uZNflM+HX3cL1nN/fLllGfx5KGf88
   hrzYCDjhV1ph7Az+vzE8aaCz6/kvOcy49pHKXPfWGjODuVeVqKBKJRzBp
   lvbIPfEAyg7w6hvgsGJ7ll8cYomd7xg6wT+4eBSDyL4BYXJFa1cmy95fa
   2d27h4SnW5UM+ISR+D78xqrAeEalFA8iD1Qh5hAcU0uMQdKa9kfCj4Sm5
   D15aaCu/alA/J4BFLPDmUx+M0x4KH8F/69F1wcdIbXmOi9ovlk/Su04FW
   JTA+FjPPBAcv8IzTjYsWYUizk8xfXWHaMvIRA6jzKDTpQTLhZDjwtQHO7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="441788384"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="441788384"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 19:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="707135842"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="707135842"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 May 2023 19:31:55 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Y6U-0001nt-2Q;
	Thu, 01 Jun 2023 02:31:54 +0000
Date: Thu, 1 Jun 2023 10:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [linux-stable-rc:queue/6.1 25/26] m68k-linux-ld: section .rodata VMA
 [00001000,00516a77] overlaps section .text VMA [00000400,009252ef]
Message-ID: <202306011046.1z5hh8sD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.1
head:   ef50524405c2e132c80d1d177add6e426cf041c5
commit: d8224f629b25c04a2e65fc416cb533973ebfc777 [25/26] page_pool: fix inconsistency for page_pool_ring_[un]lock()
config: m68k-buildonly-randconfig-r002-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011046.1z5hh8sD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=d8224f629b25c04a2e65fc416cb533973ebfc777
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.1
        git checkout d8224f629b25c04a2e65fc416cb533973ebfc777
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011046.1z5hh8sD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> m68k-linux-ld: section .rodata VMA [00001000,00516a77] overlaps section .text VMA [00000400,009252ef]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
