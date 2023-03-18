Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74363B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 02:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679107891; x=1710643891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+TFmuq7FCvkr7223gykz9hvuHlw0ZwBSUzIGPXuZ50=;
  b=ARLxb4AJSbfIprjKHw0X9izvsPzte0sKEOwkdi9NT97Rj55BnbSr9xmx
   1glO/n64H06UKVrRVlC01x/ptM3ng++ccAi7625XRt1JIoimmZY3n5nqX
   3SOEAOvnDZj+Htkq1cMErhCnOdPvItCHzv4xp17HKIqeYrryD6wadslc+
   QCGezywUVy3ZA8gbfyZFtkGhegrStaECsIE/v8iNI3yZf8PYxifb1+weE
   aykj6KEfO443WuTTiGZF8Gjq4vBVLkU1oaHDT1NsUwKvOy28IbK5Qg46c
   zLc4+rXvJZJ/SiLXtbLycdS0hWxGuD+A3D5ozrBRpWCBXQ0Otyjx8YZi6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326763738"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="326763738"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 19:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="769581911"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="769581911"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2023 19:51:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdMfJ-0009ky-1E;
	Sat, 18 Mar 2023 02:51:29 +0000
Date: Sat, 18 Mar 2023 10:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230317-module-alloc-opts 31/31]
 kernel/module/main.c:2673:6: warning: no previous prototype for
 'module_autoload_proceed'
Message-ID: <202303181000.UuSMCCkz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230317-module-alloc-opts
head:   68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
commit: 68dfd11f7ebeb379312f4fc89c2792ce52d71ab4 [31/31] module: add a sanity check prior to allowing kernel module auto-loading
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230318/202303181000.UuSMCCkz-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230317-module-alloc-opts
        git checkout 68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181000.UuSMCCkz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/module/main.c: In function 'move_module':
   kernel/module/main.c:2227:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2227 |         int ret = -ENOMEM;
         |             ^~~
   kernel/module/main.c: At top level:
>> kernel/module/main.c:2673:6: warning: no previous prototype for 'module_autoload_proceed' [-Wmissing-prototypes]
    2673 | bool module_autoload_proceed(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/module_autoload_proceed +2673 kernel/module/main.c

  2667	
  2668	/*
  2669	 * We allow contention of the module_mutex here because kernel module
  2670	 * auto-loading a special feature *and* because we are only allowing
  2671	 * MAX_KMOD_CONCURRENT possible checks at a time for a module.
  2672	 */
> 2673	bool module_autoload_proceed(const char *name)
  2674	{
  2675		int err;
  2676	
  2677		mutex_lock(&module_mutex);
  2678		err = module_patient_check_exists(name);
  2679		mutex_unlock(&module_mutex);
  2680	
  2681		if (err == -EEXIST)
  2682			return false;
  2683		return true;
  2684	}
  2685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
