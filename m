Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337A9442F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 12:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678882441; x=1710418441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LplsPf37H4GDdhUn6fr9fa+c1n190KsmuyNLn5YFe/M=;
  b=YQnvsYtTCggWft47NUVyWZjmZZYgqSLSfjkDjp2RJUecJOw+r1//ocBD
   TfDREuyI245eWttTX3c8gw4eoRMs/q/6jh5DNDG064w8f1evDuNBMLgUQ
   KAW3ZRrfTYU+2aTRLncqR+GRc+yE5jovoSObYC3Ir1j7czK52E57lVac+
   Ip0vra61a2PqsQUwXihZJkQagHJXV1uyFz+lscbk9zbAs/1yz2JATvCSe
   kY3FxKN1K9Zy6B7da870S16mOQbedLNDexKKL+AZMVcan/CTLfNv1ZksT
   vvwnPI+NPpuXSY0pzpPQ3aa9q8e+eJzykTUSX6CtMWc4N8joAMr8RMGUD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335170397"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="335170397"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 05:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="803264967"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="803264967"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Mar 2023 05:13:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcQ0n-0007ed-02;
	Wed, 15 Mar 2023 12:13:45 +0000
Date: Wed, 15 Mar 2023 20:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/uaccess/fixes 1/4] lib/usercopy_kunit.c:144:6: warning:
 no previous prototype for 'usercopy_test_exit'
Message-ID: <202303152041.rPmsbM7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/uaccess/fixes
head:   bcab174e50dd95f92848c50fdfec65390e201a4b
commit: ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6 [1/4] lib: test copy_{to,from}_user()
config: arm-randconfig-r046-20230313 (https://download.01.org/0day-ci/archive/20230315/202303152041.rPmsbM7D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/uaccess/fixes
        git checkout ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303152041.rPmsbM7D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/usercopy_kunit.c:144:6: warning: no previous prototype for 'usercopy_test_exit' [-Wmissing-prototypes]
     144 | void usercopy_test_exit(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~~


vim +/usercopy_test_exit +144 lib/usercopy_kunit.c

   143	
 > 144	void usercopy_test_exit(struct kunit *test)
   145	{
   146		struct usercopy_env *env = test->priv;
   147	
   148		kunmap(env->ubuf);
   149	
   150		usercopy_ubuf_unpin(env);
   151		usercopy_mm_free(env->mm);
   152		usercopy_env_free(env);
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
