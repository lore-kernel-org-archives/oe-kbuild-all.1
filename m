Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93AF62D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 03:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679025373; x=1710561373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bED1iY+17bmYpuELotncPWJUHJcUxoJJvuKg77FOlVs=;
  b=UiWE5MYnOzOJsCqfGcW50TT7yPJtP+32OOZcpmIYLCsfWW40qDjSsQi5
   Utso+xG2nZE8Mg5tlV9kO/x/uyG7vMldYopjbHIx8jkimQPfrjtBihDDc
   T+PfKpMY3jAz92vVh7KrZ34ODKEZVyl5NT94mvJjh1hMzJDDluks5SMNh
   hwqhGIdl9aBYIuyqzOAHEr6WcqsXHtdDgqiLJ1gfwcvh3qgkaoYLjQcUz
   7wSDZV0uWgKOQCKfNlhJeiBhoViecoDiY1hpIsk+/8uM04niV24IG+Z5K
   I8wUPpKcQKG94vQiBO08K+KX9ynbx3bF6kRFY9LNQ75bpelUuHxxekVat
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="340542044"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="340542044"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 20:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="744412073"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="744412073"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Mar 2023 20:56:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd1C6-00093c-0q;
	Fri, 17 Mar 2023 03:55:54 +0000
Date: Fri, 17 Mar 2023 11:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: Avraham Stern <avraham.stern@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 6/20] ERROR: modpost: "__udivdi3"
 [drivers/net/wireless/intel/iwlwifi/mvm/iwlmvm.ko] undefined!
Message-ID: <202303171123.jwAhtpkK-lkp@intel.com>
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
commit: 7a2b9c4760b2623c824fc3532320288805bf1574 [6/20] wifi: iwlwifi: mvm: implement PHC clock adjustments
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230317/202303171123.jwAhtpkK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=7a2b9c4760b2623c824fc3532320288805bf1574
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout 7a2b9c4760b2623c824fc3532320288805bf1574
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171123.jwAhtpkK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/net/wireless/intel/iwlwifi/mvm/iwlmvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
