Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A453F2F33
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 20:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683319229; x=1714855229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MWqs2nOYRtEXn4gyTwMIZPyDs2gVo1pgQpC3TTn4pKI=;
  b=iM8EzwQ3FUL0q7hjvvdY+6vmAsXK2TfrygW1D1ZptTbOtooCI4k1OUp+
   jbvNNtP8GtSsd8Jzxh1yAp9BgKnECGZHemm63ufRBqWHQ7FEBpTI7sa55
   SDZoIglRNZ7eb7vN1z0x2PB80VtEC4hNDs1XOmG9zo5QzaDgmK/+iioxq
   1uPjAMbaRWFHG7O3ub+/jvwRadLfDhckxvFT9Kms/9LABkbkKVfOt2nW1
   51vX58Kt88kUSQ7dA9w4v49QW/GiBRK6PJyWDZiSh47Jp2p2A9hDJTbqq
   0d5rCvuvFAgX9xkl1C/qcxSQy9jvBA9WetHlAJbky9C/p7MO8xbL1IHvn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414840354"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="414840354"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="675241793"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="675241793"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 May 2023 13:40:27 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv2E6-0000qr-2n;
	Fri, 05 May 2023 20:40:26 +0000
Date: Sat, 6 May 2023 04:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/netfilter/xt_quota2.c:172:30: warning: unused variable
 'q2_counter_fops'
Message-ID: <202305060414.zydhBGeE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JP,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 1fddb786f92f19613702d7c063c62996dfbc1ddf ANDROID: netfilter: xt_quota2: add quota2 from xtables-addons
date:   2 years, 5 months ago
config: powerpc-buildonly-randconfig-r004-20230505 (https://download.01.org/0day-ci/archive/20230506/202305060414.zydhBGeE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=1fddb786f92f19613702d7c063c62996dfbc1ddf
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 1fddb786f92f19613702d7c063c62996dfbc1ddf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ net/netfilter/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060414.zydhBGeE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/netfilter/xt_quota2.c:14:
   In file included from include/linux/list.h:9:
   In file included from include/linux/kernel.h:12:
   In file included from include/linux/bitops.h:29:
   In file included from arch/powerpc/include/asm/bitops.h:62:
   arch/powerpc/include/asm/barrier.h:49:9: warning: '__lwsync' macro redefined [-Wmacro-redefined]
   #define __lwsync()      __asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
           ^
   <built-in>:324:9: note: previous definition is here
   #define __lwsync __builtin_ppc_lwsync
           ^
>> net/netfilter/xt_quota2.c:172:30: warning: unused variable 'q2_counter_fops' [-Wunused-const-variable]
   static const struct proc_ops q2_counter_fops = {
                                ^
   2 warnings generated.


vim +/q2_counter_fops +172 net/netfilter/xt_quota2.c

   171	
 > 172	static const struct proc_ops q2_counter_fops = {
   173		.proc_read	= quota_proc_read,
   174		.proc_write	= quota_proc_write,
   175		.proc_lseek	= default_llseek,
   176	};
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
