Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EFD33FA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 19:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675278948; x=1706814948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lsTahDqO1TWFIMGFptTZd+DpzEyHd+SMMlB9JQ8lMFM=;
  b=Oz3BVpuOoXaYgxF1VHgiI+EOANrpzBHVLeuldE/l+zQhZTLf4IjYQWtY
   7bdVubbiPVOW+Po6gjnlV+r2ryFlpjzdLDvA0vwaUIppOwkBBUPiQA874
   1B9avcBcCtw/iVfYruBql0fe8K1gVc8dHyM1H4IaPSI7BpswQm06cFykd
   ahF4SYZicIlskyLV3B3dwww9HwUEtJCef/hBCqlRxR+V96YNCvNIUTlJ/
   5LDvQBErUfekC9g7UqP4U2TSjCmLoF1f6fRsKpiy7Jv/hxg+DOhPUpGn0
   sFf27FCenrlh1tPEnRXFwcX4xYISsQAzllXQJ5GERpCcOC1AnogMQQFAC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316245712"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="316245712"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 11:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="753799328"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="753799328"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Feb 2023 11:15:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNIa9-0005js-1o;
	Wed, 01 Feb 2023 19:15:45 +0000
Date: Thu, 2 Feb 2023 03:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error:
 drivers/hid/i2c-hid/i2c-hid-core.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302020356.kZpGTMDW-lkp@intel.com>
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
config: riscv-randconfig-r042-20230130 (https://download.01.org/0day-ci/archive/20230202/202302020356.kZpGTMDW-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/hid/i2c-hid/i2c-hid-core.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
