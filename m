Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C10B2F2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681199943; x=1712735943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lIi7jw8MkjTrAwndwSZUamSHF9/slYRJpU3SIr/eg/4=;
  b=IB7trz54/BQlCim/vs4owmQQV4FyWP5vaYccYeobUvW/D2XlBgKZft9Y
   RA0L4DnvvxK2+VLuAKf7YySxczK2HgrrB0j7mYvE0ITbOE1x3WbTZXea4
   7ZDo1k6iYgzUR5A0z93ZOqtRRjMGGX981Vi/v6VFF9MVNnNCa3OzdjE53
   WgJwrinISnvkvjcWcFSbYFeqbdaWP3wnhwkyD3QxuyD5cmxtCc8zsP6XE
   P+c+nR10p44RSpaX0Vnn9nGz0CCARXZiVvQLbZ2jCVkIVXgNBRR2XJBmG
   wdudRg0USRUus42/WRv6pKBYkUBD8bN5aDZUlsOPnqe6Y9upaRNelt3H2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="406378899"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="406378899"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 00:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="812478712"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="812478712"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Apr 2023 00:59:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm8u5-000W7B-0L;
	Tue, 11 Apr 2023 07:59:01 +0000
Date: Tue, 11 Apr 2023 15:58:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/hyperv-next/v6.1-rc7/for-intel-pov-hv/1207 10/19]
 ERROR: modpost: "hv_tdx_hypercall" [drivers/pci/controller/pci-hyperv.ko]
 undefined!
Message-ID: <202304111544.X7wdR40U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/hyperv-next/v6.1-rc7/for-intel-pov-hv/1207
head:   c0a631602939506ef2bceba6697a80b7a366779b
commit: 805bc04f26f1ed4477b5ed68f1284b7bd5d0bf30 [10/19] x86/hyperv: Support hypercalls for TDX guests
config: x86_64-randconfig-a016-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111544.X7wdR40U-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/dcui/tdx/commit/805bc04f26f1ed4477b5ed68f1284b7bd5d0bf30
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/hyperv-next/v6.1-rc7/for-intel-pov-hv/1207
        git checkout 805bc04f26f1ed4477b5ed68f1284b7bd5d0bf30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111544.X7wdR40U-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "hv_tdx_hypercall" [drivers/pci/controller/pci-hyperv.ko] undefined!
>> ERROR: modpost: "hv_tdx_hypercall" [drivers/hv/hv_vmbus.ko] undefined!
>> ERROR: modpost: "hv_tdx_hypercall" [drivers/hv/hv_balloon.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
