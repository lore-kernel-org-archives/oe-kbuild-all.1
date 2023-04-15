Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ECAA3C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 04:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681531821; x=1713067821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZ4LcBlATZxTiJ9tdbg/cqPtIsjfX4uxhF3UUodJ1xU=;
  b=IRBBgcpBu/crimXYK42BNLBks8+6Un9TP8LkB09DsKlsKyzbwn+Zrg8w
   YCWzxK1HewmSgnH0N9MTgAMmslE9pOL1+H1HvZj5KrUwXYWDD0Cv1TyrS
   ox95XqnQIQ04G/8QAD0YjqzBA652Smau0MKuH693Ipl/3VNKRQhMfr8ef
   T+4iBe29re5C/BL3JP4RRfVn8TZ9/tn3WkU9iyx3ZRKoqQgNz+Yiaxppp
   /0rRRR70By1WuMKph4Iegoh8MHj586kL8rajDUkIKx/YoZ5Uzuc3fkYbP
   nb4M10Mhxk8KP0Blt0tbqcrikzJjKmXjnxqPNXya+hE6IOKA1KJAyRhr1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328768834"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="328768834"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 21:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779414404"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="779414404"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 21:10:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnXEn-000aPb-2R;
	Sat, 15 Apr 2023 04:10:09 +0000
Date: Sat, 15 Apr 2023 12:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Gwendal Grignou <gwendal@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14 8831/9354]
 drivers/pkglist/pkglist_none.c:45:12: warning: no previous declaration for
 'pkglist_init'
Message-ID: <202304151149.a7Fyzr1l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: d9b1191b6bcec39a70d613de7e4647999b8e9dc9 [8831/9354] CHROMIUM: drivers: Create pkglist for configuration
config: m68k-randconfig-s042-20230409 (https://download.01.org/0day-ci/archive/20230415/202304151149.a7Fyzr1l-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/d9b1191b6bcec39a70d613de7e4647999b8e9dc9
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14
        git checkout d9b1191b6bcec39a70d613de7e4647999b8e9dc9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151149.a7Fyzr1l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pkglist/pkglist_none.c:45:12: sparse: sparse: symbol 'pkglist_init' was not declared. Should it be static?
   drivers/pkglist/pkglist_none.c:51:6: sparse: sparse: symbol 'pkglist_exit' was not declared. Should it be static?
>> drivers/pkglist/pkglist_none.c:45:12: warning: no previous declaration for 'pkglist_init' [-Wmissing-declarations]
    int __init pkglist_init(void)
               ^~~~~~~~~~~~
>> drivers/pkglist/pkglist_none.c:51:6: warning: no previous declaration for 'pkglist_exit' [-Wmissing-declarations]
    void pkglist_exit(void) { }
         ^~~~~~~~~~~~


vim +/pkglist_init +45 drivers/pkglist/pkglist_none.c

    44	
  > 45	int __init pkglist_init(void)
    46	{
    47		return 0;
    48	}
    49	module_init(pkglist_init);
    50	
  > 51	void pkglist_exit(void) { }
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
