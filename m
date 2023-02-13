Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4101AD52
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 21:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676324378; x=1707860378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EqdrpFEi7Qyotc8kdpNOYuX90gVdchA9DAzl3A9XRKo=;
  b=czCkIKmE99n9BCf4PB6F4iqyhLqVxeKzex5PqK4jSPwE2eYJBtRELMc1
   aCG+Y1w8ArCJHSddRzDAkTz/KeeVP3swuzLpIK5QVsptPGzQ4rxryfAwm
   llLBIov54JrUD6cM8ciIQrMXpvFIE9ONXbKBnENw8eCaqihJKbWRvhRMD
   WMUyYnCz8lzavqCUOjQnqZRQ3ZvOuJAlrl9VtjXovpde2uQ4dP29tsZjb
   nyu+viYNdGBbBMp2g/mVCd84x9OZmJy3XzfbC2q7rIVQAZcNSZCdMHV+u
   emvyykd/eKzynJ8HDd2Nj6VpGNrq4QDjGrFvi4mJxQZhhyWmyRfbKravl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="311367678"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="311367678"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 13:39:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="842924812"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="842924812"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Feb 2023 13:39:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRgXv-00081Z-21;
	Mon, 13 Feb 2023 21:39:35 +0000
Date: Tue, 14 Feb 2023 05:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Subhajit Paul <subhajit_paul@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y 1603/9999] ld.lld: error:
 drivers/rpmsg-kdrv/rpmsg_kdrv.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302140503.G8RFqxiB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Subhajit,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   713711eae4043f95066d081165095e7c88f6ba68
commit: 9a68bbf173db487a44d2300f7fbb29f3244c8b3a [1603/9999] rpmsg-kdrv: Add support for device virtualization
config: riscv-randconfig-r042-20230212 (https://download.01.org/0day-ci/archive/20230214/202302140503.G8RFqxiB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout 9a68bbf173db487a44d2300f7fbb29f3244c8b3a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140503.G8RFqxiB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/rpmsg-kdrv/rpmsg_kdrv.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
