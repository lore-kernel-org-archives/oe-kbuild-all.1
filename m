Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A962C9A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679070976; x=1710606976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ilja6VzEte/lf5nrHOEEZfsXxzbGkV5RnRrWkHlYhpQ=;
  b=mz73NQpYhRjiqQK+7Km2FslQunp90TMe8JkUCb4B9BmbxsMiaPZhbAwD
   xVZCnvnNggiXvKP0fugWsGDVV/KTB4TVMl32UV43cvlpnlge36DEfXlVL
   ywf3Zw7MWzpGJx6Wta8dHElVM8TlsbvrknvUs0vw/zuAETol55lg+aCbC
   fV7xhR4+qOCRFFuNoY4pr3jLwfsZj3ZLmiK411XJbnoeQSQWlojMZ87C6
   o7G1jrtkUGsW+42KKwctNgHouAFMGrqwxit9HnSgjp6n2R2g5xcEVEcUU
   ctEVycyEDYwTUCC4kTUYX0DiaUEs26/urWYJXuufVZW5mstCyvW6WXUBp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="400884720"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="400884720"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 09:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744603588"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="744603588"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2023 09:36:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdD3u-0009UE-1e;
	Fri, 17 Mar 2023 16:36:14 +0000
Date: Sat, 18 Mar 2023 00:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Naik <abhishek.naik@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 18/20]
 debugfs.c:(.text.iwl_dbgfs_tas_get_status_read+0x32c): undefined reference
 to `iwl_mvm_get_tas_approved_list'
Message-ID: <202303180030.dXZMzVNf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending
head:   95c0ef33f4a09287f7ded7a3c0f86daba8564b1a
commit: 72bb7b286759a4f480114977d4faf353385bd167 [18/20] iwlwifi: mvm: Add debugfs to get TAS status
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230318/202303180030.dXZMzVNf-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=72bb7b286759a4f480114977d4faf353385bd167
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout 72bb7b286759a4f480114977d4faf353385bd167
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180030.dXZMzVNf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
   (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x234): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x254): additional relocation overflows omitted from the output
   mips-linux-ld: drivers/net/wireless/intel/iwlwifi/mvm/ptp.o: in function `iwl_mvm_ptp_get_adj_time':
   ptp.c:(.text.iwl_mvm_ptp_get_adj_time+0x64): undefined reference to `__udivdi3'
   mips-linux-ld: drivers/net/wireless/intel/iwlwifi/mvm/debugfs.o: in function `iwl_dbgfs_tas_get_status_read':
>> debugfs.c:(.text.iwl_dbgfs_tas_get_status_read+0x32c): undefined reference to `iwl_mvm_get_tas_approved_list'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
