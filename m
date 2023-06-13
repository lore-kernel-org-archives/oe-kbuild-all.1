Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B32567E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 08:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686644700; x=1718180700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mszgVLuX/Ro0Zsbd0vOfiJ43HT5FCBguSjH1bHhkMy4=;
  b=XZgeJdx6Iyl69pUwpz4AAeZet5pn+6Is2BjAAJ3W2vWH7H5ztb6eqBS9
   Ep+iQLiApYOAy4RtQX9Hj+eDsyUaWwcC58qalOiW/4zdiNIm/nDbJy2gE
   Xd3zKYPyBKoGCUo+RnhCfx1y5vZFLgDNuwmsF6w5pYkFDyymwO91Vw6BJ
   xiIRswO0LHGdoe53faOp3277uAikPHcq7fpN8V3gA/u9xhRNUe7B50VEo
   bZZC0QImWhrdQQl7hz6Jh1adWT9GL86CT7yqyn3iSSsTCXsRPJgzGB4lc
   amkXmoN/4Cb6Cou4wwOHzI8PWi+Npu/oxxgtzbKtSgfiLiY4c/jHQ7X17
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337902276"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="337902276"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 01:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705725811"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="705725811"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jun 2023 01:24:43 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8zKU-000188-0o;
	Tue, 13 Jun 2023 08:24:42 +0000
Date: Tue, 13 Jun 2023 16:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8408/8413] xtensa-linux-ld: section
 .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data
 VMA [00000000,0008e757]
Message-ID: <202306131622.msoZgTDd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   53ab6975c12d1ad86c599a8927e8c698b144d669
commit: 9afc41011eebd880e4af37db39d35cb08c54a9a7 [8408/8413] Merge branch 'sysctl-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
config: xtensa-buildonly-randconfig-r005-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131622.msoZgTDd-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9afc41011eebd880e4af37db39d35cb08c54a9a7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9afc41011eebd880e4af37db39d35cb08c54a9a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131622.msoZgTDd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data VMA [00000000,0008e757]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
