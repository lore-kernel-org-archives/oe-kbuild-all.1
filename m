Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8412F41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 22:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676069217; x=1707605217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B80iFpdi+uYS02two521j+yNAuyJUaDsJeoGo92OkLY=;
  b=EIeVtjNQr1dtLk0wNOAOf4E86wvIfcE5XkkQdsAD5XDZhPp624CKu473
   ZQBGkRM7XYjFOLZWU0ytg/lpN8nx6C0kNTi0Zg9hLc34JWpEf4Se0hdJu
   +kwey8EQF4BiqUppBWwgD8F8Abm+cGPJUZxdyBbKp8AcfALAEewcRd5He
   Zome+BH2ZqiMhuEbWbSLAIswd6oqF/W50Jw5Mruukdj7Q2X/+hdUnvXgE
   OxlGygJEa3WsrGpdXEcvZ7b1Q71Q4xSgumy3Tw9cVfN4QtlXTzVrxo2C+
   vL3jDfZ7qIMCKJ7wDF8GuXbzu/EBOdzA2r34Rx3SjH2Zcp7EOn7bBEGeE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="314189870"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="314189870"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 14:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="842168332"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="842168332"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Feb 2023 14:46:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQcAK-000663-32;
	Fri, 10 Feb 2023 22:46:48 +0000
Date: Sat, 11 Feb 2023 06:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>
Subject: drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202302110649.laICQKZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4f72a263e162938de26866b862ed6015f5725946
commit: 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb LoongArch: Add PCI controller support
date:   6 months ago
config: loongarch-randconfig-s052-20230210 (https://download.01.org/0day-ci/archive/20230211/202302110649.laICQKZV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/infiniband/hw/vmw_pvrdma/ net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110649.laICQKZV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/infiniband/hw/vmw_pvrdma/pvrdma_cmd.c: note: in included file:
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     expected unsigned int [usertype] value
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     got restricted __le32 [usertype]
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:306:16: sparse: sparse: cast to restricted __le32
--
   drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c: note: in included file:
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:306:16: sparse: sparse: cast to restricted __le32
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     expected unsigned int [usertype] value
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     got restricted __le32 [usertype]
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     expected unsigned int [usertype] value
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     got restricted __le32 [usertype]
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     expected unsigned int [usertype] value
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     got restricted __le32 [usertype]
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:306:16: sparse: sparse: cast to restricted __le32
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:306:16: sparse: sparse: cast to restricted __le32
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     expected unsigned int [usertype] value
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     got restricted __le32 [usertype]
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     expected unsigned int [usertype] value
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     got restricted __le32 [usertype]
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     expected unsigned int [usertype] value
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     got restricted __le32 [usertype]
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:306:16: sparse: sparse: cast to restricted __le32
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     expected unsigned int [usertype] value
   drivers/infiniband/hw/vmw_pvrdma/pvrdma.h:301:16: sparse:     got restricted __le32 [usertype]

vim +301 drivers/infiniband/hw/vmw_pvrdma/pvrdma.h

29c8d9eba550c6 Adit Ranadive 2016-10-02  298  
29c8d9eba550c6 Adit Ranadive 2016-10-02  299  static inline void pvrdma_write_reg(struct pvrdma_dev *dev, u32 reg, u32 val)
29c8d9eba550c6 Adit Ranadive 2016-10-02  300  {
29c8d9eba550c6 Adit Ranadive 2016-10-02 @301  	writel(cpu_to_le32(val), dev->regs + reg);
29c8d9eba550c6 Adit Ranadive 2016-10-02  302  }
29c8d9eba550c6 Adit Ranadive 2016-10-02  303  

:::::: The code at line 301 was first introduced by commit
:::::: 29c8d9eba550c6d73d17cc1618a9f5f2a7345aa1 IB: Add vmw_pvrdma driver

:::::: TO: Adit Ranadive <aditr@vmware.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
