Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF17B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675611984; x=1707147984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFWWuXonyD35alLRey+QfV5pPnZnYH2eELvsYwQw9zc=;
  b=P0SD44t3XjsmZWa7DnkjTKnegyfzpYba5UresS58UhYl+qXyopxfBBEa
   UPnwKXBDFKlz9EvkNTr2mCJp3nyHyrOvY/H0zucuq/NElnMU41f8YLSlT
   CQ4BkFBzk9KqxlnJfaJKkqrrPJkTVe+/MnQZwFmkSmvLFfCF2hAAaamF2
   jD4LN8n5pq27RRLhb7BXk8uYqpJq/GUNX6wca1Sub0IZUK+OPMKK4Nj1+
   ODQuPKU4Es3EfdG+E65Qg5hq+E9ui5RL7e+DhTgY+1a/c2tcFRIt+RK6U
   GQzw4ZDd+LhIeGOyxh0z0I223lYVWVFjIkhqC5KBLDhE8fvZLK3fOhoI/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="331190687"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="331190687"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 07:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="659623986"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="659623986"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Feb 2023 07:46:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOhDi-00025E-1u;
	Sun, 05 Feb 2023 15:46:22 +0000
Date: Sun, 5 Feb 2023 23:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6164/20208]
 drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype
 for function 'int_imx_secvio_sc_check_state'
Message-ID: <202302052356.N7JjBG1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 8e33e9a47296b6a3afd7da3c950b77eaacfc42b3 [6164/20208] Merge branch 'firmware/next' into next
config: riscv-randconfig-r026-20230205 (https://download.01.org/0day-ci/archive/20230205/202302052356.N7JjBG1K-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/8e33e9a47296b6a3afd7da3c950b77eaacfc42b3
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 8e33e9a47296b6a3afd7da3c950b77eaacfc42b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/imx/ drivers/firmware/imx/ drivers/mailbox/ drivers/pci/controller/mobiveil/ drivers/rpmsg/ drivers/soc/imx/secvio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype for function 'int_imx_secvio_sc_check_state' [-Wmissing-prototypes]
   int int_imx_secvio_sc_check_state(struct device *dev)
       ^
   drivers/soc/imx/secvio/imx-secvio-sc.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int int_imx_secvio_sc_check_state(struct device *dev)
   ^
   static 
   drivers/soc/imx/secvio/imx-secvio-sc.c:377:29: warning: variable 'data' set but not used [-Wunused-but-set-variable]
           struct imx_secvio_sc_data *data;
                                      ^
   2 warnings generated.
--
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:5: warning: no previous prototype for function 'fuse_reader' [-Wmissing-prototypes]
   int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
       ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
   ^
   static 
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:5: warning: no previous prototype for function 'snvs_reader' [-Wmissing-prototypes]
   int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
       ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
   ^
   static 
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:5: warning: no previous prototype for function 'snvs_dgo_reader' [-Wmissing-prototypes]
   int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
       ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
   ^
   static 
   3 warnings generated.


vim +/int_imx_secvio_sc_check_state +140 drivers/soc/imx/secvio/imx-secvio-sc.c

c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  139  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05 @140  int int_imx_secvio_sc_check_state(struct device *dev)
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  141  {
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  142  	struct secvio_sc_notifier_info info = {0};
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  143  	int ret = 0;
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  144  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  145  	ret = int_imx_secvio_sc_get_state(dev, &info);
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  146  	if (ret) {
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  147  		dev_err(dev, "Failed to get secvio state\n");
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  148  		goto exit;
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  149  	}
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  150  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  151  	/* Call chain of CB registered to this module if status detected */
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  152  	if (info.hpsvs || info.lps || info.lptds)
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  153  		if (imx_secvio_sc_notifier_call_chain(&info))
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  154  			dev_warn(dev,
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  155  				 "Issues when calling the notifier chain\n");
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  156  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  157  exit:
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  158  	return ret;
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  159  }
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  160  

:::::: The code at line 140 was first introduced by commit
:::::: c4c96d8e4f4bd60d88bfbcedf2edefdc1e1f7cf8 SSI-87: soc: imx: secvio: Add support for SNVS secvio and tamper via SCFW

:::::: TO: Franck LENORMAND <franck.lenormand@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
