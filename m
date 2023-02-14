Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662DD28F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676356026; x=1707892026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zw1Ty+aOuLLCfBUaRwSeec/Qh0MYjrV8dBKhx8QpaNE=;
  b=kcUucmPbIniV9c4ShCwv9qjApDludqSqV0fosyDwqpC0XkliKz2kuMVC
   HTx5uYBv1pWjYhE+0w3so9S+Gz+/ArSDS6lOOiLNqcC74SvGfClhoznRJ
   BdLMJVAPmuPTe4og4gN3ABuWxpLUAtJc9vwOSCuLyIuqx03QCJNQFD/17
   idRjqtnbDDEW5c6s+ChKaSGb78miZ7Ik5v/hgJEFOTPi9FW+g1F8xZOVQ
   zvgWG5qHXLb+Xqh8B9LvOk4B4C04Oe3Cm7OwjU+bEw5JZM0C/pT2f1Au0
   gjq0UGRz8tOdVQxkRc+/hMo8sO8COyVmPf7VdI9sFac6sUwN71e/slKSI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310722704"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="310722704"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 22:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="618929059"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="618929059"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Feb 2023 22:26:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRomH-0008H3-2J;
	Tue, 14 Feb 2023 06:26:57 +0000
Date: Tue, 14 Feb 2023 14:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/md/dm-verity-avb.c:177:6: warning: no previous prototype for
 'dm_verity_avb_error_handler'
Message-ID: <202302141432.asoh9zVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: f6219b7d72f896548c596ddb6249ecffdab8b041 ANDROID: AVB error handler to invalidate vbmeta partition.
date:   2 years, 2 months ago
config: h8300-allyesconfig (https://download.01.org/0day-ci/archive/20230214/202302141432.asoh9zVE-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=f6219b7d72f896548c596ddb6249ecffdab8b041
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout f6219b7d72f896548c596ddb6249ecffdab8b041
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/md/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141432.asoh9zVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bio.h:8,
                    from include/linux/device-mapper.h:11,
                    from drivers/md/dm-verity-avb.c:9:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/asm-generic/page.h:93:51: warning: ordered comparison of pointer with null pointer [-Wextra]
      93 | #define virt_addr_valid(kaddr)  (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
         |                                                   ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   drivers/md/dm-verity-avb.c: At top level:
>> drivers/md/dm-verity-avb.c:177:6: warning: no previous prototype for 'dm_verity_avb_error_handler' [-Wmissing-prototypes]
     177 | void dm_verity_avb_error_handler(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dm_verity_avb_error_handler +177 drivers/md/dm-verity-avb.c

   176	
 > 177	void dm_verity_avb_error_handler(void)
   178	{
   179		dev_t dev;
   180	
   181		DMINFO("AVB error handler called for %s", avb_vbmeta_device);
   182	
   183		if (strcmp(avb_invalidate_on_error, "yes") != 0) {
   184			DMINFO("Not configured to invalidate");
   185			return;
   186		}
   187	
   188		if (avb_vbmeta_device[0] == '\0') {
   189			DMERR("avb_vbmeta_device parameter not set");
   190			goto fail_no_dev;
   191		}
   192	
   193		dev = name_to_dev_t(avb_vbmeta_device);
   194		if (!dev) {
   195			DMERR("No matching partition for device: %s",
   196			      avb_vbmeta_device);
   197			goto fail_no_dev;
   198		}
   199	
   200		invalidate_vbmeta(dev);
   201	
   202	fail_no_dev:
   203		;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
