Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B21323A4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682753759; x=1714289759;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4MZH2YfAhK3dbuI1k+d1aDpORkk4i0N3cVc5octPaRc=;
  b=O7ODVkY4va7b/AupI51RT2EJCS2qO2FxB3qMMwHCkGwTzlrdW6T8OPbx
   /9UDXJ3wwIZfcqbJXCdZNc6VzFDNqW3ZdOuezQD/zRBPJ2OMwJlGP6Y+F
   zdyfHM6aJMDyyX4r6ehMUS2dxh/XPlfOIWyMeQCYuAevhpwy1KCFDq0Z8
   bfo2xC6dvcEpm6epUYHftodfdHswuDfDeOkNoc+7/Jtr9gxBeQ/BG8hBx
   tqVBAfKFhGM4MRJoAwkx4JFeg5gNix1+fAzeofVgxhdhYIvB21YIuUw9X
   y6LUBgr73SLoan1ZDtpLFwKRzeJGaDA8vk6AffWNGw/QX4GpK+ujdlSQ+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="347947566"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="347947566"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 00:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="760003021"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="760003021"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2023 00:35:57 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psf7c-0000z7-1g;
	Sat, 29 Apr 2023 07:35:56 +0000
Date: Sat, 29 Apr 2023 15:35:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Hari Nagalla <hnagalla@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 43/45]
 drivers/remoteproc/ti_k3_m4_remoteproc.c:178:13: warning: variable
 'boot_addr' set but not used
Message-ID: <202304291541.6aalre9h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   5b69be59af422fe55a3cee133b337b1027cb98c3
commit: 4572e31ebde2789bcb3bfd41396a2a309df82096 [43/45] remoteproc: k4-m4: Add a remoteproc driver for M4F subsystem
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230429/202304291541.6aalre9h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 4572e31ebde2789bcb3bfd41396a2a309df82096
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291541.6aalre9h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/ti_k3_m4_remoteproc.c: In function 'k3_m4_rproc_start':
>> drivers/remoteproc/ti_k3_m4_remoteproc.c:178:13: warning: variable 'boot_addr' set but not used [-Wunused-but-set-variable]
     178 |         u32 boot_addr;
         |             ^~~~~~~~~


vim +/boot_addr +178 drivers/remoteproc/ti_k3_m4_remoteproc.c

   166	
   167	/*
   168	 * Power up the M4F remote processor.
   169	 *
   170	 * This function will be invoked only after the firmware for this rproc
   171	 * was loaded, parsed successfully, and all of its resource requirements
   172	 * were met.
   173	 */
   174	static int k3_m4_rproc_start(struct rproc *rproc)
   175	{
   176		struct k3_rproc *kproc = rproc->priv;
   177		struct device *dev = kproc->dev;
 > 178		u32 boot_addr;
   179		int ret;
   180	
   181		if (kproc->ipc_only) {
   182			dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
   183				__func__);
   184			return -EINVAL;
   185		}
   186	
   187		ret = k3_m4_rproc_request_mbox(rproc);
   188		if (ret)
   189			return ret;
   190	
   191		boot_addr = rproc->bootaddr;
   192		ret = k3_rproc_release(kproc);
   193		if (ret)
   194			goto put_mbox;
   195	
   196		return 0;
   197	
   198	put_mbox:
   199		mbox_free_channel(kproc->mbox);
   200		return ret;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
