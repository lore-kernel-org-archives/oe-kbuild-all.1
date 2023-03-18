Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B27F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 07:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679124579; x=1710660579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ztTBMVUZ86u8zaw6fje3cm6bXWwcmrPjNpJtbKmtByw=;
  b=YB28gY1AwzBnYjreIh7+PhZmliUabUIc87fjNHTF8/G9oeZn+FFZMd25
   +CoSeMtuCPWBT7UEqpvzWMfn6mNX2pD9G0bHoXooP77U/J3ZTNNxlYvTC
   pF68vivnGmvzUf8lAwNoYDP6gCZPo0x07aFmKdMlBbfv5QlQIQCI++xmL
   X9k0xWXi6ZoSnmbhzdjynhVGmD9l8WxzN59lrVB9PTzjC1sIPfv4E+H4R
   9pCmwdqQgRTQ8fIU4Ifbb5iK/cP2Y8MBI6WMCG29U2aIDvCN7v966/zvK
   H1ubZDEeo+BLMKsGZMJXFUcCJOQCL23k5K65EWczLSKw37SWieU96ggea
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326778874"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="326778874"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 00:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="1009919833"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="1009919833"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2023 00:29:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdR0T-0009uH-0s;
	Sat, 18 Mar 2023 07:29:37 +0000
Date: Sat, 18 Mar 2023 15:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 2/20] include/linux/module.h:558:29: error:
 field 'dyndbg_info' has incomplete type
Message-ID: <202303181500.HHk2ltjV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-next
head:   cd23709c1ee6c57c8cee65dd371c3c03bd8d3220
commit: 6d401a03e8e7c163a40988faf567cf9d25ec8665 [2/20] dyndbg: use the module notifier callbacks
config: x86_64-randconfig-r035-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181500.HHk2ltjV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jimc/linux/commit/6d401a03e8e7c163a40988faf567cf9d25ec8665
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout 6d401a03e8e7c163a40988faf567cf9d25ec8665
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181500.HHk2ltjV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
>> include/linux/module.h:558:29: error: field 'dyndbg_info' has incomplete type
     558 |         struct _ddebug_info dyndbg_info;
         |                             ^~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/dyndbg_info +558 include/linux/module.h

   552	
   553	#ifdef CONFIG_FUNCTION_ERROR_INJECTION
   554		struct error_injection_entry *ei_funcs;
   555		unsigned int num_ei_funcs;
   556	#endif
   557	#ifdef CONFIG_DYNAMIC_DEBUG_CORE
 > 558		struct _ddebug_info dyndbg_info;
   559	#endif
   560	} ____cacheline_aligned __randomize_layout;
   561	#ifndef MODULE_ARCH_INIT
   562	#define MODULE_ARCH_INIT {}
   563	#endif
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
