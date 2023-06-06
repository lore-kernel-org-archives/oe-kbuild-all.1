Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40035660
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686038722; x=1717574722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JBZmHBNoMjUY9XzWb8cNbHiErPD+qgw73+boNWpoyoI=;
  b=m0uk1fig7e47r+uzlCdIgP4i3RuQjr6hZ4IO+Bg5Y+HLxKy1bDHYp/XZ
   c8XS3gT+fn8VBclrdHWmgY1Bi+nra7O0/OM9T/LoORh3ZCvDakkggOdFG
   kWgTfkxPwuf1NPdctJnoyMVyaOKDKjqvKSdMHigl4eirbO8xDio63WwKg
   XI57lrTQe+//3FrQdJA0ktGbyDqyabnlLXbhJloACKOxWDWM2tdj5dfcN
   VCmloS+BET+txbR+H3DIBksbAqsyiCRz3YHYNj7KELgyiFg5FWvB78hXH
   ZViQWKcEwY4Y2TDTMYt+fdxLbLAT1S3bgMxuS5pvBvMSjW6T4Ezo2agbM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355450686"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="355450686"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 01:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659421677"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="659421677"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 01:05:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Rgg-00050f-03;
	Tue, 06 Jun 2023 08:05:06 +0000
Date: Tue, 6 Jun 2023 16:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/cpufreq/cpu-boost.c:49:1: sparse: sparse: symbol
 'cpuboost_mutex' was not declared. Should it be static?
Message-ID: <202306061538.1GC3lmFG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 9f5418234d57e7121aa50e6673dda5f281bf1cfa CHROMIUM: cpufreq: cpu-boost: Add cpu-boost driver
date:   2 years, 6 months ago
config: i386-randconfig-s052-20230606 (https://download.01.org/0day-ci/archive/20230606/202306061538.1GC3lmFG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=9f5418234d57e7121aa50e6673dda5f281bf1cfa
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 9f5418234d57e7121aa50e6673dda5f281bf1cfa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpufreq/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061538.1GC3lmFG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpufreq/cpu-boost.c:49:1: sparse: sparse: symbol 'cpuboost_mutex' was not declared. Should it be static?

vim +/cpuboost_mutex +49 drivers/cpufreq/cpu-boost.c

    42	
    43	static unsigned int cpuboost_input_boost_interval_ms = 150;
    44	module_param_named(input_boost_interval_ms,
    45			   cpuboost_input_boost_interval_ms, uint, 0644);
    46	MODULE_PARM_DESC(input_boost_interval_ms,
    47			 "Interval between input events to reactivate input boost (msec)");
    48	
  > 49	DEFINE_MUTEX(cpuboost_mutex);
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
