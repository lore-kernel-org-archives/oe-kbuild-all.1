Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33D5661
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681988321; x=1713524321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X0AcsNxyjzdN5K45x4puOjPb41X1YYnXOBBx+PBmNpE=;
  b=P4QjaFF6pRxSwAR1E5MTyvXWBjCQ8oCDcHrZfPRMps5dVVhr2lgRjPZz
   UrBPQWRSQYkDbuK0RtDaekpu9hk9iebXtAtvrRikNLYCacUn9b5uVxZxH
   WAsmSkvyyHQgSy/x8o2+rcUEDGmVjxZ8UEBBwah+B0EVVFRbN5tvQAKru
   HDUwEt45mMvfx81y9lVOTVqQoA0rB6rXiRuk2A0RYBCpwFGucSVANmRgb
   rdk+yDOuZVk0jWQa9GUiFMX6cTOh6+xDwxGiowLmrpEDJmrauNeD7Kwmc
   HHangCys79kOxNX2Gl9oRafowqFjpFDFuY8gE7d8IfK9RUycGHt3B65XT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325309252"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="325309252"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 03:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="669307247"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="669307247"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Apr 2023 03:58:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppRzq-000fmA-1n;
	Thu, 20 Apr 2023 10:58:38 +0000
Date: Thu, 20 Apr 2023 18:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 114/9845]
 include/linux/module.h:243:21: error:
 '__mod_of__imx8m_blk_ctrl_of_match_device_table' aliased to undefined symbol
 'imx8m_blk_ctrl_of_match'
Message-ID: <202304201816.cgHYpqrD-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   897d73a656fe33d0c4549c5de1d07797f99d6871
commit: 245075cb7098e00517c3362f7d6a8e13d1e83120 [114/9845] MA-18464 soc: imx: Support building imx8m soc driver as module
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230420/202304201816.cgHYpqrD-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/245075cb7098e00517c3362f7d6a8e13d1e83120
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 245075cb7098e00517c3362f7d6a8e13d1e83120
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/firmware/imx/ drivers/media/platform/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ sound/soc/sof/amd/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201816.cgHYpqrD-lkp@intel.com/

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
--
>> drivers/soc/imx/busfreq-imx8mq.c:304:6: error: redefinition of 'request_bus_freq'
     304 | void request_bus_freq(enum bus_freq_mode mode)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/soc/imx/busfreq-imx8mq.c:16:
   include/linux/busfreq-imx.h:58:20: note: previous definition of 'request_bus_freq' with type 'void(enum bus_freq_mode)'
      58 | static inline void request_bus_freq(enum bus_freq_mode mode)
         |                    ^~~~~~~~~~~~~~~~
>> drivers/soc/imx/busfreq-imx8mq.c:340:6: error: redefinition of 'release_bus_freq'
     340 | void release_bus_freq(enum bus_freq_mode mode)
         |      ^~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:61:20: note: previous definition of 'release_bus_freq' with type 'void(enum bus_freq_mode)'
      61 | static inline void release_bus_freq(enum bus_freq_mode mode)
         |                    ^~~~~~~~~~~~~~~~
>> drivers/soc/imx/busfreq-imx8mq.c:393:5: error: redefinition of 'get_bus_freq_mode'
     393 | int get_bus_freq_mode(void)
         |     ^~~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:72:19: note: previous definition of 'get_bus_freq_mode' with type 'int(void)'
      72 | static inline int get_bus_freq_mode(void)
         |                   ^~~~~~~~~~~~~~~~~


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
