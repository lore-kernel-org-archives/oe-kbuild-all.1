Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17BAFE7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 13:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680097014; x=1711633014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nsdkCrxLBUH9tKbMWKtqUuj5Q4V+wA9wiG1VhPleKA=;
  b=JAN8lJbtV1pEuA1uc8490yoIavHdvkpELB+5RcUxVWkspTeWnZ/yeZAK
   R3z/EQ6Bz1tdqrTl56d5VhtRItgmqaYv8WnqIIyeBxuxeymGug3vbfj6N
   8EboNHw/BQ1Vdz8f5uXjZtYjtGEMMhtjB6CsGjqQuBnDljraSH6MdT3Mj
   hHk8i2mZcehAojZKX2Z8TVV6ORlbE48Zh6UlaZ+0fzUYRDeQyECCppdp8
   jWEEvCAdY2YKNAKypGh7GdkI6I6spcwT8roHaIwGWWApYPiRExnDTUJ/o
   upLQDfXdEiMxI05+aYiabfqTYYCnkS7ZzjTB7qG0FzxeGWf5E/c3kcTxF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="321271342"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="321271342"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 06:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="773582681"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="773582681"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Mar 2023 06:36:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phVyu-000Ja6-1L;
	Wed, 29 Mar 2023 13:36:52 +0000
Date: Wed, 29 Mar 2023 21:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ls-zhu:refactor 5/7] drivers/vdpa/ifcvf/ifcvf_main.c:439:31:
 warning: variable 'adapter' set but not used
Message-ID: <202303292144.Yx54vxL4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ls-zhu/linux refactor
head:   eec40a854a7617076952ac5dfc273a9f3ed10bf0
commit: e07aed8d27dc17ff4587560d7e484de57870e970 [5/7] retire ifcvf_add_status, ifcvf_start_hw and ifcvf_start_datapath
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230329/202303292144.Yx54vxL4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ls-zhu/linux/commit/e07aed8d27dc17ff4587560d7e484de57870e970
        git remote add ls-zhu https://github.com/ls-zhu/linux
        git fetch --no-tags ls-zhu refactor
        git checkout e07aed8d27dc17ff4587560d7e484de57870e970
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/vdpa/ifcvf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303292144.Yx54vxL4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vdpa/ifcvf/ifcvf_main.c: In function 'ifcvf_vdpa_set_status':
>> drivers/vdpa/ifcvf/ifcvf_main.c:439:31: warning: variable 'adapter' set but not used [-Wunused-but-set-variable]
     439 |         struct ifcvf_adapter *adapter;
         |                               ^~~~~~~


vim +/adapter +439 drivers/vdpa/ifcvf/ifcvf_main.c

5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  436  
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  437  static void ifcvf_vdpa_set_status(struct vdpa_device *vdpa_dev, u8 status)
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  438  {
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26 @439  	struct ifcvf_adapter *adapter;
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  440  	struct ifcvf_hw *vf;
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  441  	u8 status_old;
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  442  	int ret;
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  443  
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  444  	vf  = vdpa_to_vf(vdpa_dev);
6b5df347c6482f drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2021-08-12  445  	adapter = vdpa_to_adapter(vdpa_dev);
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  446  	status_old = ifcvf_get_status(vf);
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  447  
bb02e6e63d0e71 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-06-05  448  	if (status_old == status)
bb02e6e63d0e71 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-06-05  449  		return;
bb02e6e63d0e71 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-06-05  450  
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  451  	if ((status & VIRTIO_CONFIG_S_DRIVER_OK) &&
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  452  	    !(status_old & VIRTIO_CONFIG_S_DRIVER_OK)) {
7cfd36b7e8be6b drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-11-25  453  		ret = ifcvf_request_irq(vf);
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  454  		if (ret) {
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  455  			status = ifcvf_get_status(vf);
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  456  			status |= VIRTIO_CONFIG_S_FAILED;
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  457  			ifcvf_set_status(vf, status);
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  458  			return;
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  459  		}
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  460  	}
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  461  
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  462  	ifcvf_set_status(vf, status);
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  463  }
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  464  

:::::: The code at line 439 was first introduced by commit
:::::: 5a2414bc454e89e0515b47500734a65aa40cf9fe virtio: Intel IFC VF driver for VDPA

:::::: TO: Zhu Lingshan <lingshan.zhu@intel.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
