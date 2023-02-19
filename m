Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14C833EF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 22:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676845553; x=1708381553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gvChPJAZ3epKP26ukKFm+bx6sGwecWrnK3P0kdcTeE=;
  b=IpQrLWch/+E45mmuLcXuw+i+d0hnZe+0z2EY+dwJX/M247u/aNvCltOC
   ljZZncf9raxlZ9M4o2FF4XIouULc+0w/dl9WbNPBskR05y/i9T0DEe6DP
   5GPy98jWuWf/ee/uj8c/9LaBi8XlV653DUQza0zQ71JGyCB7g7ME2InOV
   Zcp153im4v3ql7SiVN0s4m0kjjiqcUNE5+cN3j4m2KG+SOXt3hS4lj3nO
   AnMa/0dvMUa22a5j30w7CWSBDZSiE7F8+Be9nkLhI2DFFlJf91GoM40iu
   sGZCmArFZ0jsaBlQLV8gp2DnWEz3svUdAzepM4oCZ+7CzxZsrCneq4BJP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="330002580"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="330002580"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 14:25:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="620953593"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="620953593"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Feb 2023 14:25:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTs7w-000DTm-2n;
	Sun, 19 Feb 2023 22:25:48 +0000
Date: Mon, 20 Feb 2023 06:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error:
 drivers/hid/i2c-hid/i2c-hid-core.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for
 extension 'zicsr'
Message-ID: <202302200614.6FbTtuxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Douglas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 7c06ef260148f720465fdcf54b4b7e933bfcbe31 FROMLIST: HID: i2c-hid: Reorganize so ACPI and OF are subclasses
date:   2 years, 2 months ago
config: riscv-randconfig-r031-20230219 (https://download.01.org/0day-ci/archive/20230220/202302200614.6FbTtuxV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=7c06ef260148f720465fdcf54b4b7e933bfcbe31
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 7c06ef260148f720465fdcf54b4b7e933bfcbe31
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200614.6FbTtuxV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/hid/i2c-hid/i2c-hid-core.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
