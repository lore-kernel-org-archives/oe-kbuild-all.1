Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7082E20EB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685804561; x=1717340561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pNyRny8KdGWDutF+37JX/jyOgPSlu09GAv45gIJamWU=;
  b=RsdpJSoEILVYmmFszjvW3wSGoXc51SaNw8qnwbN0ISUukfNrtSKYLnq8
   7d3NjJXNAufppF6cTgPfwfPYkF5tun5uTR/t1pEQNPAjT/WarY6npzAUM
   ZBDfWfZd4wySvymp69gyP7uMt7lK0OgLP02WlthMGuagSmGz9oI2/0PLn
   Tz1+cYpl8emF/pk2y+wmbyJiFKkzHC0uCI8VTmRc+HlpiNfvophHVq0oN
   1wOwICLIjVqg0g7M+PFvwHlMMybD6yslNC4wkDwg0bzMcvuBY2Nta+d+t
   YBQWc0uQDpyRZd84sxxgItDCQsUZSpGPNy9Y0uli8WE+Mg5TAI9lraqns
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="359388910"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="359388910"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 08:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="711293924"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="711293924"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jun 2023 08:02:39 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5Sm6-0001jZ-1v;
	Sat, 03 Jun 2023 15:02:38 +0000
Date: Sat, 3 Jun 2023 23:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>,
	Usama Arif <usama.arif@bytedance.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [dwmw2:parallel-6.2-rc6-part1 6/9] kernel/smpboot.c:28:1: sparse:
 sparse: symbol '__pcpu_scope_idle_threads' was not declared. Should it be
 static?
Message-ID: <202306032233.CUgcsNvw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc6-part1
head:   ce7e2d1e046a163f4c44f091c8a7cc52c49c91ff
commit: 16cbbd7ba311802f092c246998b466512e16237b [6/9] x86/smpboot: Support parallel startup of secondary CPUs
config: x86_64-randconfig-s023-20230531 (https://download.01.org/0day-ci/archive/20230603/202306032233.CUgcsNvw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc6-part1
        git checkout 16cbbd7ba311802f092c246998b466512e16237b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306032233.CUgcsNvw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/smpboot.c:28:1: sparse: sparse: symbol '__pcpu_scope_idle_threads' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
