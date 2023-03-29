Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22858EB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 03:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680059974; x=1711595974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Lgd/FMkkXT9y6yiguyDskDLed9DsMavAmMpJSSMIlk=;
  b=iqcFLbDIaSVSltCi5rKeGbp/WaeWpWiKAHprkKJ5VMRB8lXJ4l0mj3CM
   Fc8naluB3LqHNl+UgZnYkK+mcbXUnbgSzi1C34RvW6ANvpzxgn7vhq364
   8b7L1jq4hr9IM8kr6G1urzJYp/nW7MMlx8fuk83WO4wV6yiIEBiXoKnG3
   CX6856jFaxtxV6gA24AhLRbV/4pK5NNOTKhMK1ZcaXlBOZcSrDbt51+rz
   kglUm4tza+ffBtrIkXgokNgC5DRXoFHzFGLvEF1UNidADDS1SVfqFX1NY
   +IkjX9B0BZNjlM1QVnc87XmBsmK+2xPhEOYCJN164Yqt5vbFHWa2hrPFW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="343177195"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="343177195"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 20:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="808033413"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="808033413"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Mar 2023 20:19:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phMLV-000J9v-0g;
	Wed, 29 Mar 2023 03:19:33 +0000
Date: Wed, 29 Mar 2023 11:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/address-helpers 6/20] include/linux/of_address.h:111:12:
 error: 'of_property_read_reg' defined but not used
Message-ID: <202303291102.5DZSaPMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/address-helpers
head:   3a4e9c2e639e023556eefa93256ce5bf34137a60
commit: e1734fd6c45321b802652b8e199ee3ae198171d4 [6/20] of/address: Add of_property_read_reg() helper
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230329/202303291102.5DZSaPMz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=e1734fd6c45321b802652b8e199ee3ae198171d4
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/address-helpers
        git checkout e1734fd6c45321b802652b8e199ee3ae198171d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash arch/sparc/ drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291102.5DZSaPMz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/kernel/of_device_common.c:10:
>> include/linux/of_address.h:111:12: error: 'of_property_read_reg' defined but not used [-Werror=unused-function]
     111 | static int of_property_read_reg(struct device_node *np, int idx, u64 *addr, u64 *size)
         |            ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/of_property_read_reg +111 include/linux/of_address.h

   110	
 > 111	static int of_property_read_reg(struct device_node *np, int idx, u64 *addr, u64 *size)
   112	{
   113		return -ENOSYS;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
