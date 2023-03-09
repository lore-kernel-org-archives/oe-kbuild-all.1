Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1911C284
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 19:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678389460; x=1709925460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tU8nIUhBsnnShOQCPXH4ie/I0WjpSQJB0JSlAdImQcQ=;
  b=SkomPA/t6AZpQjckayr31LxCTEqkC1MM3OOBTf3et1NSTucpTeSkkS09
   Y6Me+jC0sCCu5xTRjxVQhUxrk4I50+w8QqWMl5egfg9DWhwPBPsFZubcP
   Lb+qJVABCx71AUh0V95izPtpH23qaUd77m/yjlGnvmD6qHqAeI388EDVp
   2ZvXrXJbyTv93Jc0nzeXd4Ljac5ORJzzOeyT63qWzFv2WCYNWkDFV3LgV
   k8VmWXX0/yFdYXESoEFqVfpTUQ4GN0tqowpriCK938eP8nqfG2r8g8HBQ
   jAgPInfXqV+0+UIPi61Zt9905m4BK5knvXi6Q4Q+fVjmqhb57+09yMb0+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="334023668"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="334023668"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 11:17:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627492582"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="627492582"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Mar 2023 11:17:38 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paLlh-0003AP-1V;
	Thu, 09 Mar 2023 19:17:37 +0000
Date: Fri, 10 Mar 2023 03:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:alexghiti_test 68/74] make[4]: *** No rule to make target
 'arch/riscv/lib/memcpy.S', needed by 'arch/riscv/purgatory/memcpy.o'.
Message-ID: <202303100327.aXKpfKxg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   a66ce4f614559da376cae340d6012bf9a02e3c08
commit: e920e73b3d1f0558170fa2acc4938c685d0919ff [68/74] riscv: optimized memcpy
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230310/202303100327.aXKpfKxg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/e920e73b3d1f0558170fa2acc4938c685d0919ff
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel alexghiti_test
        git checkout e920e73b3d1f0558170fa2acc4938c685d0919ff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100327.aXKpfKxg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/riscv/lib/memcpy.S', needed by 'arch/riscv/purgatory/memcpy.o'.
   make[4]: Target 'arch/riscv/purgatory/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
