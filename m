Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A37322E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 21:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676843030; x=1708379030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qvGcUs9PDfBmSyU+85XghHKG7szjkew+//8feDLXby0=;
  b=ZO1P2hohhk9wYC4gWLFJaR1e/fmvxJcP0WyaK6lpIhyoLKm7HdL/XdJ/
   IBQaReDVdYFVdsSYBDNwFlcVIotxLITn4tyXk+9QjQcyNZ17KjLz4J3GL
   PZ+fWI8iZruN56wZBK83zUt9oDzA8i8RtxNOfGzvMM3oAynWww9yUIGt6
   nCuwUyllmgV/V7+vF8cvyNc7W2Zk6XOx/0TamVEZa6S4GDxYfEwct3lWz
   QS0bSF+vrgycguJcyGot4spDHoRxTchpKKiB7vSli8SgOzhF0uVs0Eg6T
   e28SEzKOvaratKN/I5cJnzAzsWbmlE2kgXS7ZDeoyeB3tnmg+n8HTf4Yv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="418510476"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="418510476"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 13:43:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="703520955"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="703520955"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Feb 2023 13:43:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTrTH-000DSn-29;
	Sun, 19 Feb 2023 21:43:47 +0000
Date: Mon, 20 Feb 2023 05:43:46 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error: undefined symbol: watchdog_update_hrtimer_threshold
Message-ID: <202302200525.Q6q0gcPY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Colin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 215b4b4c085f76d42696c118a4f4fc9a64f17cff CHROMIUM: hardlockup: detect hard lockups without NMIs using secondary cpus
date:   2 years, 2 months ago
config: x86_64-randconfig-a013-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200525.Q6q0gcPY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=215b4b4c085f76d42696c118a4f4fc9a64f17cff
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 215b4b4c085f76d42696c118a4f4fc9a64f17cff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200525.Q6q0gcPY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: watchdog_update_hrtimer_threshold
   >>> referenced by watchdog.c:244 (kernel/watchdog.c:244)
   >>>               watchdog.o:(lockup_detector_reconfigure) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
