Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DFC17C2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674291013; x=1705827013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2yDgQlT4Ek+Y4bNS+U4KuyZTZvJ7+c5/MlniBsuz/w=;
  b=JeRykH/PYuAhau6B4C7GTr5ZCqLki3LG3M/g7XSjX5JdXLkBFnLKbowk
   aVrwk+fs+kCipwzecNodPakn5fA4o7LOijFRxZojZYVmf4uKMtk1aCOaj
   fjIKF09tHGhiYPrZH2LM3JsZ7KwwzTa0gjLLBUsy0zULRvJ7aGzDtIsrl
   nQvEg9jE3BSVcb6i/Lwm0uaLF+qgN7iYRbVLF6937J5Vwzta/1x2xLBi9
   O9MfyrHVU51annHf7ZHnxqN7a81mv98jcO9EwN/ZoqLy1HiUfu8AV9xJj
   nQlx9nNq74Zlrb+/NrsbulejQYK8yXwqyd8XRAuLG6TUIMT1Md2xmFz26
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="390276829"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="390276829"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 00:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="803343341"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="803343341"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2023 00:50:11 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ9Zi-0003sE-2W;
	Sat, 21 Jan 2023 08:50:10 +0000
Date: Sat, 21 Jan 2023 16:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:for-6.3/work 176/176] drivers/soc/tegra/dce.c:149:23:
 error: implicit declaration of function 'FIELD_PREP'
Message-ID: <202301211622.MvVmacsc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux for-6.3/work
head:   d2f9c8570d9db78d8edc29d02721fa315b564b4f
commit: d2f9c8570d9db78d8edc29d02721fa315b564b4f [176/176] WIP
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230121/202301211622.MvVmacsc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/thierryreding/linux/commit/d2f9c8570d9db78d8edc29d02721fa315b564b4f
        git remote add thierryreding https://github.com/thierryreding/linux
        git fetch --no-tags thierryreding for-6.3/work
        git checkout d2f9c8570d9db78d8edc29d02721fa315b564b4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/soc/tegra/dce.c: In function 'tegra_dce_boot_get_version':
>> drivers/soc/tegra/dce.c:149:23: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     149 |         u32 command = FIELD_PREP(DCE_BOOT_CMD_COMMAND, DCE_BOOT_CMD_VERSION);
         |                       ^~~~~~~~~~
   drivers/soc/tegra/dce.c: In function 'tegra_dce_irq_callback':
>> drivers/soc/tegra/dce.c:429:16: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     429 |         type = FIELD_GET(DCE_IRQ_STATUS_TYPE, value);
         |                ^~~~~~~~~
         |                FOLL_GET
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +149 drivers/soc/tegra/dce.c

   146	
   147	static int tegra_dce_boot_get_version(struct tegra_dce *dce, u32 *version)
   148	{
 > 149		u32 command = FIELD_PREP(DCE_BOOT_CMD_COMMAND, DCE_BOOT_CMD_VERSION);
   150		void *msg = (void *)(unsigned long)command;
   151		unsigned long status;
   152		int err;
   153	
   154		err = mbox_send_message(dce->boot.channel, msg);
   155		if (err < 0)
   156			return err;
   157	
   158		status = wait_for_completion_timeout(&dce->irq.done, 1000);
   159		if (status == 0)
   160			return -ETIMEDOUT;
   161	
   162		if (dce->boot.status < 0)
   163			return dce->boot.status;
   164	
   165		*version = dce->boot.status;
   166	
   167		return 0;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
