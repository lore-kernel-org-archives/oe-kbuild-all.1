Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF7A2598
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681116995; x=1712652995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yqjZL9vGSImdyNHgR5R2oSjZS+aT4z8lt3nIVMRQ410=;
  b=VhmIDLud63Q00sZruAeFmpmytSGfTNrjNpd4SfdOEvSRRA4zc0uaJlTe
   tE8e1mzjmJaR8j0LDRfJ9ebZQC45mrlZo4N56J9NJbWS+FoMj6ad+GWuD
   nDxp4fjNvpqtlnbICdLRUhoahJfGw5iN2o+P6FkdiDc7tPdYa4mbzchQ4
   JrjbRVSViUYNK2B0c/T5upuiEhiYn3K0dyZ9yqePI8iXwLj4GJ7jhWTFf
   F9SiHsqDV/X3mjMG6VHfEAcc1tNioX9QAnIO3wpbwP9sBRcDZltiqypIZ
   jOWj2M8spvo0gXpPNBHTDVQAg9HI8wTXxSAqSGiLj70BmeLK3AwsTU/HJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="342080457"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="342080457"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 01:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="757393632"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="757393632"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Apr 2023 01:56:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plnJy-000VFp-0J;
	Mon, 10 Apr 2023 08:56:18 +0000
Date: Mon, 10 Apr 2023 16:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <dfustini@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] RISC-V: Add support for sqoscfg CSR
Message-ID: <202304101634.eVWKJ9Ul-lkp@intel.com>
References: <20230410043646.3138446-3-dfustini@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410043646.3138446-3-dfustini@baylibre.com>

Hi Drew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on d34a6b715a23ccd9c9d0bc7a475bea59dc3e28b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/RISC-V-Detect-the-Ssqosid-extension/20230410-123605
base:   d34a6b715a23ccd9c9d0bc7a475bea59dc3e28b2
patch link:    https://lore.kernel.org/r/20230410043646.3138446-3-dfustini%40baylibre.com
patch subject: [RFC PATCH 2/2] RISC-V: Add support for sqoscfg CSR
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230410/202304101634.eVWKJ9Ul-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e4cdc958b7e755dd86202b069497aa36e01b325a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Drew-Fustini/RISC-V-Detect-the-Ssqosid-extension/20230410-123605
        git checkout e4cdc958b7e755dd86202b069497aa36e01b325a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101634.eVWKJ9Ul-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv64-linux-ld: arch/riscv/kernel/ptrace.o:(.discard+0x0): multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:(.discard+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/signal.o:(.discard+0x0): multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:(.discard+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/compat_signal.o:(.discard+0x0): multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:(.discard+0x0): first defined here
   riscv64-linux-ld: kernel/sched/core.o:(.discard+0x5): multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:(.discard+0x0): first defined here
   riscv64-linux-ld: kernel/sched/fair.o:(.discard+0x2): multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:(.discard+0x0): first defined here
   riscv64-linux-ld: kernel/sched/build_utility.o:(.discard+0x13): multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:(.discard+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
