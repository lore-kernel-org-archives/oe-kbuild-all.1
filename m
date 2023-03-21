Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A15D30A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679422432; x=1710958432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwgtbnGEvuAHYIPypULsvf2aLNVzprA7LpHS6YMVBiE=;
  b=ASRgm5B9Hp7SpKjBNqtLykVTcPH0siryYOK9vDcCG4JwnLoojpN9Fp/d
   CedSbQ7JkPeMz4E0Px2gKiJuVcVd5BrYYUViWRyoS+lfjPoLgOHClTWgQ
   WyWJEbtx9heL4z53tOWNwgB0VrJSE/+r2cGcKj9sDeNzln1UErj5TaPcQ
   eKtSSJAhgPPgVbuI+R9NzTXv6A3I+q68DnrKRz6uiRyAHA3aw96PDG+W/
   8Kz+cQHSyK0ArdK30fB7T5uteEfA90gKbVbY5Xzfw11unwopK0VfCHhlm
   XqkymyniqTCmG1vH2lz1VudKSVkHCInmR3h3gmYGpYENlYC1rklL9MVgi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425311018"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="425311018"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 11:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="927525845"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="927525845"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Mar 2023 11:13:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pegUS-000CFQ-1c;
	Tue, 21 Mar 2023 18:13:44 +0000
Date: Wed, 22 Mar 2023 02:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 3/20]
 drivers/nvme/common/keyring.c:14:5: warning: no previous prototype for
 'nvme_keyring_init'
Message-ID: <202303220206.7FxwHjdS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v7
head:   5c13b43fa2c503188a6d668b0dec6a22078329a2
commit: e9b1071a27a0122e041829e87e86852c8b80c04a [3/20] nvme-keyring: register '.nvme' keyring
config: csky-randconfig-r006-20230319 (https://download.01.org/0day-ci/archive/20230322/202303220206.7FxwHjdS-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=e9b1071a27a0122e041829e87e86852c8b80c04a
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout e9b1071a27a0122e041829e87e86852c8b80c04a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/nvme/common/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220206.7FxwHjdS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/common/keyring.c:14:5: warning: no previous prototype for 'nvme_keyring_init' [-Wmissing-prototypes]
      14 | int nvme_keyring_init(void)
         |     ^~~~~~~~~~~~~~~~~
   drivers/nvme/common/keyring.c: In function 'nvme_keyring_init':
   drivers/nvme/common/keyring.c:16:13: warning: unused variable 'err' [-Wunused-variable]
      16 |         int err;
         |             ^~~
   drivers/nvme/common/keyring.c: At top level:
>> drivers/nvme/common/keyring.c:31:6: warning: no previous prototype for 'nvme_keyring_exit' [-Wmissing-prototypes]
      31 | void nvme_keyring_exit(void)
         |      ^~~~~~~~~~~~~~~~~


vim +/nvme_keyring_init +14 drivers/nvme/common/keyring.c

    13	
  > 14	int nvme_keyring_init(void)
    15	{
    16		int err;
    17	
    18		nvme_keyring = keyring_alloc(".nvme",
    19					     GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
    20					     current_cred(),
    21					     (KEY_POS_ALL & ~KEY_POS_SETATTR) |
    22					     (KEY_USR_ALL & ~KEY_USR_SETATTR),
    23					     KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
    24		if (IS_ERR(nvme_keyring))
    25			return PTR_ERR(nvme_keyring);
    26	
    27		return 0;
    28	}
    29	EXPORT_SYMBOL_GPL(nvme_keyring_init);
    30	
  > 31	void nvme_keyring_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
