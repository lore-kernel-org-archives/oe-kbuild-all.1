Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1AA7F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 01:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686707803; x=1718243803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NbBbWRRJY5gYOyH8TiMMFSVdHWMxRn9nK+HNJ7/UUYA=;
  b=TbXMXbf2lk1jkTC/6Kz8UdVHKSrjdUTW+uIGDqRQM2YVndWuITdcaCR/
   Lcg5smpZMPFfZvGv408EQCE+NeMhsJ2WuBILAMYt77Q+DQB4M9a6emSvp
   Bp65FBCRQobqurfhdxv/ncHe5xsMw+HC4KV+QXpAnrV8tjvjjm9b+zGnG
   uJRG/BVOP4iafIUu9NgLLxVJnh3SVwS1ihtOhvPkvd2km38bXBGgixFGK
   YlrAkKXvodmOhHx4LMN3r6O42I6/eaPzDRK5CuECEhanX8EsecR+ffIOu
   T5iRdk7LkCHxrAl6PQT3xQVKX1185+zcrQkLdtMJeR85ZFD5px2dHdGbv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="348156696"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="348156696"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 18:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="706026161"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="706026161"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jun 2023 18:56:42 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9FkX-00024n-19;
	Wed, 14 Jun 2023 01:56:41 +0000
Date: Wed, 14 Jun 2023 09:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl_fake_path 4/4] ERROR: modpost:
 "backing_file_real_path" [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202306140923.1HDfcLlv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl_fake_path
head:   5e7793f2eb20e6c00a93df2e7b674b68d6da2286
commit: 5e7793f2eb20e6c00a93df2e7b674b68d6da2286 [4/4] ovl: enable fsnotify events on underlying real files
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20230614/202306140923.1HDfcLlv-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/5e7793f2eb20e6c00a93df2e7b674b68d6da2286
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il ovl_fake_path
        git checkout 5e7793f2eb20e6c00a93df2e7b674b68d6da2286
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140923.1HDfcLlv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "backing_file_real_path" [fs/nfsd/nfsd.ko] undefined!
>> ERROR: modpost: "backing_file_real_path" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
