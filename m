Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432D442F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676549489; x=1708085489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zgvC7N+gMjdYPixt7iLUGVl2tl0+S+4moybB9DBcAug=;
  b=HT8mNYIlH26OnC3PsBVGT2eJ8+F/s7mbIaV4zNmI15BlB9yp5QMT9Ldd
   XCkHnThW9suWHpWLdYH3Ivy3I0G3eI5Am/+fbATtph+qWigtw+aKUPZ4D
   1A1d6KHP72ZyT6KWutd8Ul3T7ADcyiqn5SOuh+DtOT42y7JD/bzHlCDSM
   S2MSSHAEPFTgWY925sRaKmgWR680+UGl3M16o+2Xw+hEvMa1xYSt+QPAR
   p1ZVPDpfKlf1rcqMu+MN2YMnAUmW+m8oAe+rdIzv8fyspNS1BPANTKctU
   5FOjqHBndxt4Lc84WbMpdqEd8NbfcbJauC24WJfD5o8wGRmx/u3kAplhZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="333870449"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="333870449"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 04:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="733848788"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="733848788"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2023 04:11:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSd6j-000AFN-1o;
	Thu, 16 Feb 2023 12:11:25 +0000
Date: Thu, 16 Feb 2023 20:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 20736/20749]
 drivers/remoteproc/ti_k3_m4_remoteproc.c:916:13: warning: variable 'ret' set
 but not used
Message-ID: <202302162023.mKTc2g8j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   76b3e88d569210a51399e8d8c8babd995af29d11
commit: 88b05e58d3dee101d9d403948a03c31c39266457 [20736/20749] remoteproc: k3-m4: Introduce PM suspend/resume handlers
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230216/202302162023.mKTc2g8j-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202302162023.mKTc2g8j-lkp@intel.com/

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
