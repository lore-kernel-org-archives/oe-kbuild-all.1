Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C33184F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677935516; x=1709471516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VxRLNTDi+lFbQcet2x7K/Flih+jsY2dagMlAX8E8CgQ=;
  b=X4WeEFi5IJDdq+oTV9oe/voR4JaCZgpGGoZXyNg8ZyQVhW3JNKnB3ZZK
   gV711OGCg22/nmH+dNq2OQpFDXSNtSGapbyhnUtaemq0aXsmkqZIC2hSx
   aGZgGItJl5UhLF0mYA3EsqBe4IOifg7v56/m5/8Y0Isym+4VJybEbw6Su
   pIxSRBChoEPsGCO96okjWufLsygpuJrvPKImsYHwefP8nTIZcO0xj2KvX
   9gkBvylw9p6kKulTD4wjHscuzUl3DP/ojwVlFetQuhfgJCZhSuY/KMmdy
   roxXnYhr8Zuql+7RYTbBaPxOPqs7MzffFDwYFeJeV/q4Zzu02bouKBcOz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="400076837"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="400076837"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 05:11:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="818810234"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="818810234"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2023 05:11:54 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYRg1-0002BI-2F;
	Sat, 04 Mar 2023 13:11:53 +0000
Date: Sat, 4 Mar 2023 21:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:c630-next-20230303 30/32] include/linux/qcom_qseecom.h:18:10:
 fatal error: linux/qcom_scm.h: No such file or directory
Message-ID: <202303042147.EXPBbV3E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux c630-next-20230303
head:   d9306ea90cf14a6435578168f594e67096c623ff
commit: 3f9d0114f4032b9d958317ec418a8f83a78bd8ca [30/32] firmware: Add support for Qualcomm UEFI Secure Application
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230304/202303042147.EXPBbV3E-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/3f9d0114f4032b9d958317ec418a8f83a78bd8ca
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev c630-next-20230303
        git checkout 3f9d0114f4032b9d958317ec418a8f83a78bd8ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042147.EXPBbV3E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/qcom_qseecom_uefisecapp.c:16:
>> include/linux/qcom_qseecom.h:18:10: fatal error: linux/qcom_scm.h: No such file or directory
      18 | #include <linux/qcom_scm.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 include/linux/qcom_qseecom.h

34ed78949f2ce7 Maximilian Luz 2023-01-18  12  
34ed78949f2ce7 Maximilian Luz 2023-01-18  13  #include <linux/device.h>
34ed78949f2ce7 Maximilian Luz 2023-01-18  14  #include <linux/dma-mapping.h>
34ed78949f2ce7 Maximilian Luz 2023-01-18  15  #include <linux/kernel.h>
34ed78949f2ce7 Maximilian Luz 2023-01-18  16  #include <linux/mm.h>
34ed78949f2ce7 Maximilian Luz 2023-01-18  17  #include <linux/mutex.h>
34ed78949f2ce7 Maximilian Luz 2023-01-18 @18  #include <linux/qcom_scm.h>
34ed78949f2ce7 Maximilian Luz 2023-01-18  19  #include <linux/types.h>
34ed78949f2ce7 Maximilian Luz 2023-01-18  20  
34ed78949f2ce7 Maximilian Luz 2023-01-18  21  

:::::: The code at line 18 was first introduced by commit
:::::: 34ed78949f2ce7a962ee1073caf2fa5b39852cda firmware: Add support for Qualcomm Secure Execution Environment SCM interface

:::::: TO: Maximilian Luz <luzmaximilian@gmail.com>
:::::: CC: Steev Klimaszewski <steev@kali.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
