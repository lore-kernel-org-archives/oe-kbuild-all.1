Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97F1865
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677741430; x=1709277430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z8GXkr+gw/uRLm5C9eXznhq/7GxikkSoT5dXFM/BkuM=;
  b=a1f+Ph7A4X2m/qZ4RklLSr70AaE9vQn28cv4hoGbhljpwyPhJgdRZoCi
   ho62G+KQnKuTDEBiWvEuy03eBjgksXSzBI6OO6FP9dFEiqkASsBPqOloP
   NRj61CUeOt++jQUF7vuvdIyLXa8WSkttj/N7dvoiqnHLN1uiVB7h/diY5
   kZNfRDm3bEg+53U442+lqW7t/OjLI9Fnmp91RfooZgyn1toKqsurePxlh
   VGg4EKc/hcCnxBhpfnGvUYsgCAqpih9K+f2ssTd2EkrsQh1ByLrO9PjEA
   NePvn8mXu9pBPrxCGYw1b4hbqwvDLDkv7lVz2tuZOjZ+MMQynlvf20wnw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397206999"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="397206999"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 23:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="624809335"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="624809335"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Mar 2023 23:17:06 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXdBZ-0000If-2U;
	Thu, 02 Mar 2023 07:17:05 +0000
Date: Thu, 2 Mar 2023 15:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: qcom_minidump.c:(.text.qcom_minidump_subsystem_desc+0x50): undefined
 reference to `qcom_smem_get'
Message-ID: <202303021516.Dx87mHXV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/firmware-qcom_scm-Clear-download-bit-during-reboot/20230301-183309
head:   a99ae10e91ff613554ccd5e93d2ad2ba087bcbc9
commit: b716fb4bf431d2b258156d38ae5c98a54c36e0c5 soc: qcom: Add Qualcomm minidump kernel driver
date:   21 hours ago
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230302/202303021516.Dx87mHXV-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b716fb4bf431d2b258156d38ae5c98a54c36e0c5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mukesh-Ojha/firmware-qcom_scm-Clear-download-bit-during-reboot/20230301-183309
        git checkout b716fb4bf431d2b258156d38ae5c98a54c36e0c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021516.Dx87mHXV-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/soc/qcom/qcom_minidump.o: in function `qcom_minidump_subsystem_desc':
>> qcom_minidump.c:(.text.qcom_minidump_subsystem_desc+0x50): undefined reference to `qcom_smem_get'
   mips-linux-ld: drivers/soc/qcom/qcom_minidump.o: in function `qcom_minidump_ready':
>> qcom_minidump.c:(.text.qcom_minidump_ready+0xc8): undefined reference to `qcom_smem_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
