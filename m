Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87F77F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682152481; x=1713688481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CDhjpEbKVtA1qIm0VMg6xuBnDrErarFdUS1b9k+MIvA=;
  b=F7aFjZGeTPE8bMe67WqKy+UulXMwzHBRk5d2QIM+ASY141vo09MzvJH+
   bazsoyY+kjdwSud3GSqwLZDC/Pdbsz/OdYHEMaT0GjolS2O+ICo88EMEP
   O5UAxA5gRFciJ6l9A/B5PKLYSCTiOYAkNfO8Mh9qab4818kWS1dz3My1/
   zvsUnH0VKa6FGBsTBjA0QPcVXJOrlpR+khRcM6P7aWCD5C8ysTNQHuDAY
   btWt+Pm/uKRMyH5p0xw/4WtMyR6eB85iXQQzp8NeNZIoyiYeMJ8yS/cAa
   Mgnf0v8J3dbfl+g7pZRkISgiwi9thdmgnbjCcxrkOrj5gl72ZC+JLXiPG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325737301"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="325737301"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 01:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695182382"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="695182382"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2023 01:34:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq8hb-000hCC-0h;
	Sat, 22 Apr 2023 08:34:39 +0000
Date: Sat, 22 Apr 2023 16:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 6778/9999] WARNING: modpost:
 vmlinux.o(.text.unlikely+0x3c08): Section mismatch in reference from the
 function io_uring_drop_tctx_refs() to the variable
 .init.data:initcall_level_names
Message-ID: <202304221603.LooNetGu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   3299fb36854fdc288bddc2c4d265f8a2e5105944
commit: f435c66d2336fff104e2c3cbfff60905733e7d89 [6778/9999] io_uring: move to separate directory
config: xtensa-randconfig-r002-20230421 (https://download.01.org/0day-ci/archive/20230422/202304221603.LooNetGu-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=f435c66d2336fff104e2c3cbfff60905733e7d89
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout f435c66d2336fff104e2c3cbfff60905733e7d89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221603.LooNetGu-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

<< WARNING: modpost: vmlinux.o(.text.unlikely+0x3c08): Section mismatch in reference from the function test_ahash_jiffies.isra.0() to the variable .init.data:initcall_level_names
>> WARNING: modpost: vmlinux.o(.text.unlikely+0x3c08): Section mismatch in reference from the function io_uring_drop_tctx_refs() to the variable .init.data:initcall_level_names
The function io_uring_drop_tctx_refs() references
the variable __initdata initcall_level_names.
This is often because io_uring_drop_tctx_refs lacks a __initdata
annotation or the annotation of initcall_level_names is wrong.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
