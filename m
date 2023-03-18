Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13A7F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 06:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679121458; x=1710657458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FmBI/SVwFIfZKJ1q+hiNP9G9RV5t1wz1kTe7IIGxqNI=;
  b=RUB6/BSHAMAKWLBnR1tojW6JNLftlc+JxqD+l6BOtM096O3PmUU50sB0
   5SQ0Xu+zwIEpV1EPoqAtvmtOnUSV1Z/6X6cPffmZtco7GCIn8G7eTtiVu
   pWD7JsHk7j3jcAaQTCuvlbarlTNzn6XhRrgVD/zXM8pQKtTLA3kvxw4Gn
   ke7/Vki1dRS/PInJhHYeTcoQwLjzk2L7+IppUV+6nWfZY+MFZsHLy+6yn
   baon7oNVNVFFlTmGUoEwXW2m2m1HZtw8BskWI53IwCUUu5gbTSnTNwqCT
   6hcp4a9ZUd0i/zXBhc822tO4J3vdo9lIPXLlO/XzeyGDLyxkITiN6kp7p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="400989083"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="400989083"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 23:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="673808570"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="673808570"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Mar 2023 23:37:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdQC7-0009s6-1t;
	Sat, 18 Mar 2023 06:37:35 +0000
Date: Sat, 18 Mar 2023 14:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 2/20] lib/dynamic_debug.c:1315:5: warning: no
 previous prototype for function 'ddebug_remove_module'
Message-ID: <202303181437.B9xpvXNJ-lkp@intel.com>
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
config: i386-randconfig-a014-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181437.B9xpvXNJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/6d401a03e8e7c163a40988faf567cf9d25ec8665
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout 6d401a03e8e7c163a40988faf567cf9d25ec8665
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181437.B9xpvXNJ-lkp@intel.com/

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
