Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4191361
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674290412; x=1705826412;
  h=date:from:cc:subject:message-id:mime-version;
  bh=k1ObnSHb453Na3THednAsohj2s8rKV4hYxtCPYkC7aw=;
  b=BknstBDyaGxDqucvFsNmJcrzGQq4Q9capBuh30osCn5iuvrEhWi47Mqz
   DjwEVh32uGhcMF1ypWxUrG783t/XyJFiMbAYgANDwi6JIf3auW9P7UvOC
   xuDLfOenKfjUFIKITP/FuFt9lhWSr+2iA9prjY3PxXb08KTeKxv0stafk
   WAaUcwd8HjIa9WEobKYzSaeseHHJ1r9R1pQ+PpAvOZVrhRAX8RsuSTBjj
   ygLpi/SPWiQujuqDq1lhxfra3+9xEBSNfL/2ezpYxfnw2RSmKuLeqdjAE
   Wr36fN5H3AWoQlsn+qBWLXVQSxuW3X1sOZKhnTftSHDxo6gM96eeE1iEe
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="353024303"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="353024303"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 00:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="638421822"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="638421822"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jan 2023 00:40:09 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ9Q1-0003rE-0K;
	Sat, 21 Jan 2023 08:40:09 +0000
Date: Sat, 21 Jan 2023 16:39:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-5.10.y-cicd 20145/21104] ld.lld: error:
 drivers/counter/counter-core.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202301211653.mGd436qI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi William,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   b1294a176635a75f2e351773ba76f41d11ec53e4
commit: b232ed3b2fe44ddc827995d70741cc21452e9e01 [20145/21104] counter: 104-quad-8: Remove IIO counter ABI
config: riscv-randconfig-r042-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211653.mGd436qI-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout b232ed3b2fe44ddc827995d70741cc21452e9e01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/counter/counter-core.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/counter/counter-sysfs.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/counter/counter-chrdev.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
