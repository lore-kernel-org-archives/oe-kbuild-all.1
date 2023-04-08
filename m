Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71998C2EA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680950987; x=1712486987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O854vmKVM+eaSCtYFhZXcoJZ+d6x0FyYu+TkdZBcJVk=;
  b=XVIZ3/ChHrIpH8qdOZCoDHuapy3VTcb6ORnBvzE5sddcnXk8yGwNxBYw
   C3pur4NntNv6ZcXEjf0iz5043xPqStcteobve6OeyFtrSBJvM8cYi3eLr
   W3MHtqBQvp4EGSr5B5b0xfEtEaoI/v3OOOnHBVULdwvs7fBZMsCaDYx16
   kknRLlvJVe6fnuyGv8Ydd5ua1PeADDCb3goq/krSgeSSFXaSzaEHnF3kb
   PeFdpnT4ujLpSCmRrSoxDqM4WWjnWenXf9y2bznIPCUasNHI+JRejbaIB
   GR330m7ZkVqoNg8WotONmH6WoNvx0lfjVjhjpB3a8YNzZJXWogQLE0Lgs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344911640"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="344911640"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 03:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690290712"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="690290712"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2023 03:49:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl68e-000TeD-1X;
	Sat, 08 Apr 2023 10:49:44 +0000
Date: Sat, 8 Apr 2023 18:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 21840/22025]
 drivers/remoteproc/ti_k3_m4_remoteproc.c:916:13: warning: variable 'ret' set
 but not used
Message-ID: <202304081820.y7mXpgzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hari,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 88b05e58d3dee101d9d403948a03c31c39266457 [21840/22025] remoteproc: k3-m4: Introduce PM suspend/resume handlers
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304081820.y7mXpgzq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 88b05e58d3dee101d9d403948a03c31c39266457
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081820.y7mXpgzq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/ti_k3_m4_remoteproc.c: In function 'k3_m4_rproc_start':
   drivers/remoteproc/ti_k3_m4_remoteproc.c:333:13: warning: variable 'boot_addr' set but not used [-Wunused-but-set-variable]
     333 |         u32 boot_addr;
         |             ^~~~~~~~~
   drivers/remoteproc/ti_k3_m4_remoteproc.c: In function 'k3_m4_rproc_stop':
   drivers/remoteproc/ti_k3_m4_remoteproc.c:379:46: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     379 |         ret = mbox_send_message(kproc->mbox, (void *)msg);
         |                                              ^
   drivers/remoteproc/ti_k3_m4_remoteproc.c: In function 'k3_m4_rproc_resume':
>> drivers/remoteproc/ti_k3_m4_remoteproc.c:916:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     916 |         int ret = 0;
         |             ^~~


vim +/ret +916 drivers/remoteproc/ti_k3_m4_remoteproc.c

   911	
   912	static int __maybe_unused k3_m4_rproc_resume(struct device *dev)
   913	{
   914		struct platform_device *pdev = to_platform_device(dev);
   915		struct k3_m4_rproc *kproc = platform_get_drvdata(pdev);
 > 916		int ret = 0;
   917	
   918		if (kproc->rproc->state == RPROC_OFFLINE)
   919			goto out;
   920	
   921		if (kproc->rproc->state != RPROC_SUSPENDED) {
   922			ret = -EBUSY;
   923			goto out;
   924		}
   925	
   926		rproc_boot(kproc->rproc);
   927		kproc->rproc->state = RPROC_RUNNING;
   928	out:
   929		return 0;
   930	}
   931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
