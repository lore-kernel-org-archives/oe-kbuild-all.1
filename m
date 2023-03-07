Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C60398
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 06:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678171075; x=1709707075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u2EZ0l7tbWRpTAp6pI24WYqO6yYULC0ozMoF9IzwRJk=;
  b=BaFUarPf9SJQ3fN4UiuZUXqow+67Vn9I4dNbQAh66oBeZpt98h7w8x+l
   4hsFHBI2jsOmEfaufZfg/5OkMLoDKtHWjehIww+yZislhq2FgjSGAlts5
   UVBCFQt54fBge+wM33RnosJn3tPNrz4jE4CWYmy3yfIPrjIYJqV4ekQFi
   SWGcxcqX5Muj5To9HWDZ9pVjVryboOv0fYigQZX7LNR9fN7+AKsp9ZQka
   b/sxSln8vdFuORCZ3HHqE3Pi17bRNb8o7m7yKKp4bJkgcLIN/nrdLsa95
   DqP6OApuIhZs4qxv2XY1d5RfU10+IAXpVS70e9FlisftTmrhlmJMJ/QRE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400595453"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="400595453"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 22:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="706699367"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="706699367"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Mar 2023 22:37:54 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZQxN-00013L-0l;
	Tue, 07 Mar 2023 06:37:53 +0000
Date: Tue, 7 Mar 2023 14:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Baron <jbaron@akamai.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [linux-next:master 816/1532] drivers/infiniband/ulp/srp/ib_srp.c:66:
 warning: "DEFINE_DYNAMIC_DEBUG_METADATA" redefined
Message-ID: <202303071444.sIbZTDCy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   709c6adf19dc558e44ab5c01659b09a16a2d3c82
commit: b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb [816/1532] dyndbg: use the module notifier callbacks
config: arc-randconfig-r011-20230305 (https://download.01.org/0day-ci/archive/20230307/202303071444.sIbZTDCy-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/infiniband/ulp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071444.sIbZTDCy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/ulp/srp/ib_srp.c:66: warning: "DEFINE_DYNAMIC_DEBUG_METADATA" redefined
      66 | #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
         | 
   In file included from include/linux/module.h:30,
                    from drivers/infiniband/ulp/srp/ib_srp.c:35:
   include/linux/dynamic_debug.h:174: note: this is the location of the previous definition
     174 | #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)                \
         | 
>> drivers/infiniband/ulp/srp/ib_srp.c:67: warning: "DYNAMIC_DEBUG_BRANCH" redefined
      67 | #define DYNAMIC_DEBUG_BRANCH(descriptor) false
         | 
   include/linux/dynamic_debug.h:188: note: this is the location of the previous definition
     188 | #define DYNAMIC_DEBUG_BRANCH(descriptor) \
         | 


vim +/DEFINE_DYNAMIC_DEBUG_METADATA +66 drivers/infiniband/ulp/srp/ib_srp.c

aef9ec39c47f0ce Roland Dreier   2005-11-02  64  
1a1faf7a8a251d1 Bart Van Assche 2016-11-21  65  #if !defined(CONFIG_DYNAMIC_DEBUG)
1a1faf7a8a251d1 Bart Van Assche 2016-11-21 @66  #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
1a1faf7a8a251d1 Bart Van Assche 2016-11-21 @67  #define DYNAMIC_DEBUG_BRANCH(descriptor) false
1a1faf7a8a251d1 Bart Van Assche 2016-11-21  68  #endif
1a1faf7a8a251d1 Bart Van Assche 2016-11-21  69  

:::::: The code at line 66 was first introduced by commit
:::::: 1a1faf7a8a251d134d375b7783a614ee79e932f2 IB/srp: Fix CONFIG_DYNAMIC_DEBUG=n build

:::::: TO: Bart Van Assche <bart.vanassche@sandisk.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
