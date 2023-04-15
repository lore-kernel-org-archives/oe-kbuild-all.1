Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74FEA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 07:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681543733; x=1713079733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UUU1t/iQoecLYV0ON/lqt4wFw6ps8f5qDHaQMZKnr94=;
  b=P51gN/T7AT5UXR/Kq4Eft1qrQFAZbis+9nNZFzCAeien/9v6UaMziKXU
   yW6UxdswtlSWtB9hIr0YFGgax6E6ds8kOg8512WFgNRg8HIVWHgThqBJG
   qnUpj0zhxUZmuS9d0wAYX8QqvmIU8X0/bJhHgnUkxmFDtTYJEW0UDCaZw
   a136KhM90mXSQuJS4ZjCLrdUWtAeIG3obApF7I7rKmCVZSXOrofip7Tjp
   zEqfb06C4bT1CJGefw8wQsa8CXCb9FMkgq+8smahQJc34NQIkKPHjL3Nx
   pqsOkQm7ap6yU4dk+zGOYw9VTGgufuIcXL8bkM+wldfAyaF+tc3ydZ0GT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="342117937"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="342117937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 00:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722735854"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="722735854"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Apr 2023 00:28:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnaKa-000agH-0i;
	Sat, 15 Apr 2023 07:28:20 +0000
Date: Sat, 15 Apr 2023 15:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 114/9838] include/linux/module.h:243:21:
 error: '__mod_of__imx8m_blk_ctrl_of_match_device_table' aliased to undefined
 symbol 'imx8m_blk_ctrl_of_match'
Message-ID: <202304151507.Qbzxe0Z5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jindong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 245075cb7098e00517c3362f7d6a8e13d1e83120 [114/9838] MA-18464 soc: imx: Support building imx8m soc driver as module
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304151507.Qbzxe0Z5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/245075cb7098e00517c3362f7d6a8e13d1e83120
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 245075cb7098e00517c3362f7d6a8e13d1e83120
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151507.Qbzxe0Z5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from drivers/soc/imx/imx8mp-blk-ctrl.c:8:
>> drivers/soc/imx/imx8mp-blk-ctrl.c:746:25: error: 'imx8m_blk_ctrl_of_match' undeclared here (not in a function); did you mean 'imx8mp_blk_ctrl_of_match'?
     746 | MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:243:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:243:21: error: '__mod_of__imx8m_blk_ctrl_of_match_device_table' aliased to undefined symbol 'imx8m_blk_ctrl_of_match'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/soc/imx/imx8mp-blk-ctrl.c:746:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     746 | MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +243 include/linux/module.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  239  
cff26a51da5d20 Rusty Russell     2014-02-03  240  #ifdef MODULE
cff26a51da5d20 Rusty Russell     2014-02-03  241  /* Creates an alias so file2alias.c can find device table. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  #define MODULE_DEVICE_TABLE(type, name)					\
0bf8bf50eddc75 Matthias Kaehlcke 2017-07-24 @243  extern typeof(name) __mod_##type##__##name##_device_table		\
cff26a51da5d20 Rusty Russell     2014-02-03  244    __attribute__ ((unused, alias(__stringify(name))))
cff26a51da5d20 Rusty Russell     2014-02-03  245  #else  /* !MODULE */
cff26a51da5d20 Rusty Russell     2014-02-03  246  #define MODULE_DEVICE_TABLE(type, name)
cff26a51da5d20 Rusty Russell     2014-02-03  247  #endif
^1da177e4c3f41 Linus Torvalds    2005-04-16  248  

:::::: The code at line 243 was first introduced by commit
:::::: 0bf8bf50eddc7511b52461bae798cbfaa0157a34 module: Remove const attribute from alias for MODULE_DEVICE_TABLE

:::::: TO: Matthias Kaehlcke <mka@chromium.org>
:::::: CC: Jessica Yu <jeyu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
