Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9619642
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 22:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676759117; x=1708295117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=laXIZsPU8phcegYH1xaAgQHcmueZl/j8CLXArM5uvSs=;
  b=jm3Dzw2h/j/ozU60qdZeQK8m0+OLoFs0XEapqWUarTDceyHefUCWUEVJ
   3+nKcl+SfcSFroXezAYQ1IiRP07wWyA88eHS6vXUCfcyiAcgoL77flVWZ
   q/CnRCheMo96s/54/WzL2eQGUr24zB3os6QnG9n7jdw5Xy+3BMtDT1mKb
   i1dYBYPSscEdW2HYD9SsGSteQuiydaV4xyioiAsTeWsSlEZ7Y5Lzhvs9f
   KV2PMpkpUKX5IYRnHu8D/f4Zysa5kguG6p1LcFCKLlNjNRwYuo6VHUhSr
   lGCOLDSoyBpGPWB27HF4qET/RSETkA2i7ONe1TP3n9TsCEsVs2IrlH29L
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="333568394"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="333568394"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 14:25:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="672975369"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="672975369"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Feb 2023 14:25:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTVdr-000CoD-2J;
	Sat, 18 Feb 2023 22:25:15 +0000
Date: Sun, 19 Feb 2023 06:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 2/20] lib/dynamic_debug.c:1315:5: warning: no
 previous prototype for function 'ddebug_remove_module'
Message-ID: <202302190642.KXfTMWCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-next
head:   23def6f5fa9da6a03e232b4368bfa5908d7e3194
commit: cf693cfaeb0eb6df6fb46cfd8f9c168c708596d4 [2/20] dyndbg: use the module notifier callbacks
config: arm-randconfig-r014-20230219 (https://download.01.org/0day-ci/archive/20230219/202302190642.KXfTMWCt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/jimc/linux/commit/cf693cfaeb0eb6df6fb46cfd8f9c168c708596d4
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout cf693cfaeb0eb6df6fb46cfd8f9c168c708596d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190642.KXfTMWCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1315:5: warning: no previous prototype for function 'ddebug_remove_module' [-Wmissing-prototypes]
   int ddebug_remove_module(const char *mod_name)
       ^
   lib/dynamic_debug.c:1315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ddebug_remove_module(const char *mod_name)
   ^
   static 
   1 warning generated.


vim +/ddebug_remove_module +1315 lib/dynamic_debug.c

e9d376f0fa66bd Jason Baron      2009-02-05  1310  
e9d376f0fa66bd Jason Baron      2009-02-05  1311  /*
e9d376f0fa66bd Jason Baron      2009-02-05  1312   * Called in response to a module being unloaded.  Removes
e9d376f0fa66bd Jason Baron      2009-02-05  1313   * any ddebug_table's which point at the module.
e9d376f0fa66bd Jason Baron      2009-02-05  1314   */
ff49d74ad383f5 Yehuda Sadeh     2010-07-03 @1315  int ddebug_remove_module(const char *mod_name)
e9d376f0fa66bd Jason Baron      2009-02-05  1316  {
e9d376f0fa66bd Jason Baron      2009-02-05  1317  	struct ddebug_table *dt, *nextdt;
e9d376f0fa66bd Jason Baron      2009-02-05  1318  	int ret = -ENOENT;
e9d376f0fa66bd Jason Baron      2009-02-05  1319  
e9d376f0fa66bd Jason Baron      2009-02-05  1320  	mutex_lock(&ddebug_lock);
e9d376f0fa66bd Jason Baron      2009-02-05  1321  	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
4573fe15437c90 Rasmus Villemoes 2019-03-07  1322  		if (dt->mod_name == mod_name) {
e9d376f0fa66bd Jason Baron      2009-02-05  1323  			ddebug_table_free(dt);
e9d376f0fa66bd Jason Baron      2009-02-05  1324  			ret = 0;
4573fe15437c90 Rasmus Villemoes 2019-03-07  1325  			break;
e9d376f0fa66bd Jason Baron      2009-02-05  1326  		}
e9d376f0fa66bd Jason Baron      2009-02-05  1327  	}
e9d376f0fa66bd Jason Baron      2009-02-05  1328  	mutex_unlock(&ddebug_lock);
7a5e202dfb8ab7 Jim Cromie       2021-10-13  1329  	if (!ret)
7a5e202dfb8ab7 Jim Cromie       2021-10-13  1330  		v2pr_info("removed module \"%s\"\n", mod_name);
e9d376f0fa66bd Jason Baron      2009-02-05  1331  	return ret;
e9d376f0fa66bd Jason Baron      2009-02-05  1332  }
e9d376f0fa66bd Jason Baron      2009-02-05  1333  

:::::: The code at line 1315 was first introduced by commit
:::::: ff49d74ad383f54041378144ca1a229ee9aeaa59 module: initialize module dynamic debug later

:::::: TO: Yehuda Sadeh <yehuda@hq.newdream.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
