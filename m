Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF727716
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675632816; x=1707168816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+Mt0Lt7nqWmg7ISR26/6FxGrpzn3DQH0LiX01i/WKc=;
  b=i+1nEr1P813hIYt7wLgw+KwyDfhfLXazHp8D1XVmQEzBVGwTpHIGSv5A
   dqLGcR3vlFHVp6MRybJM5IC6ja29WpenS7w4qdt4i/1Kfr5AV74qALawK
   bzk6li6y1qZU67tDAZ9eV/ERZBsQKEx2+FeP4IsxAkoJA+hOridzxgWbq
   eitiF9l5e9Er5XU0wWRUoISliXrYxIcNJIzHeC2x5+xryAbkWDrYZOvta
   9kRxa9TqqRGIZl/Nt2EgqmR0uGFp1dauFkt9/NcMLz16rpjExScuKiVC+
   Ck/giEb0dkVvssfYoKiiESIeHHO/GOGyTsGYiGgmiAR3hPNhmU16JT69x
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="317097317"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="317097317"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 13:33:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="734923527"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="734923527"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Feb 2023 13:33:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOmdi-0002EJ-24;
	Sun, 05 Feb 2023 21:33:34 +0000
Date: Mon, 6 Feb 2023 05:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl-lazy-lowerdata 1/2] ld.lld: error: undefined symbol:
 __hexagon_divdi3
Message-ID: <202302060508.Z6iHoKs2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl-lazy-lowerdata
head:   815a759a1a03f231d5fc94fcb2de98efac1e184b
commit: 6364ddb1e514220d5b88c3b6b53c040419996c35 [1/2] ovl: add support for "redirect_dir=lazyfollow" on lower only overlay
config: hexagon-randconfig-r041-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060508.Z6iHoKs2-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/6364ddb1e514220d5b88c3b6b53c040419996c35
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il ovl-lazy-lowerdata
        git checkout 6364ddb1e514220d5b88c3b6b53c040419996c35
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __hexagon_divdi3
   >>> referenced by inode.c
   >>>               fs/overlayfs/inode.o:(ovl_getattr) in archive vmlinux.a
   >>> referenced by inode.c
   >>>               fs/overlayfs/inode.o:(ovl_getattr) in archive vmlinux.a
   >>> did you mean: __hexagon_divsi3
   >>> defined in: vmlinux.a(arch/hexagon/lib/divsi3.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
