Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A716ADB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680880552; x=1712416552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LjtZG++Sj1V0oENUdnnCqZB43f6LIO1/9khiA7omdhs=;
  b=Hlv1t4g94kLz4v67ICRMHCKQHQwnavsFSK5vXLQmvvyBmsbL6qPG6ngk
   5GmbJtFgm8lX9fKULBF0zqCNKPJdt8C5EEjAlxiIdqgtDsaV71/0WGrPk
   2qKv1dukm7H8WHvaL7RBOI5xMFqlaUDWAJ9v28OMNCdR922z+QB42emad
   r5Ri4YEI3M75FOAKstbrnSjyJ2PSsuGDxgu3rruLfj3osgJw4OMtmcJrv
   CWS68aRjkzM7YhsmHmkRVxk4LAbwxj7+b72aa30Usg/lZInhYjaTw2LbA
   JYIOS0wWs6RnFgf9i9QprrsvPcUNgNeJephvebLtPeQb/4QahR6LUIDq5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="327081268"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="327081268"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 08:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="664922920"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="664922920"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2023 08:15:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pknoc-000SdG-1h;
	Fri, 07 Apr 2023 15:15:50 +0000
Date: Fri, 7 Apr 2023 23:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v4 9/11] arch/x86/hyperv/ivm.c:427:
 undefined reference to `__tdx_hypercall_ret'
Message-ID: <202304072336.sgNBjdZn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v4
head:   1d92fca91fe3723a3a86bb54b4d427c9fcb803e9
commit: 54aa56c2db98cb287a268cd954d4c8cc8919cec9 [9/11] x86/hyperv: Support hypercalls for TDX guests
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230407/202304072336.sgNBjdZn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/dcui/tdx/commit/54aa56c2db98cb287a268cd954d4c8cc8919cec9
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v4
        git checkout 54aa56c2db98cb287a268cd954d4c8cc8919cec9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072336.sgNBjdZn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/hyperv/ivm.o: in function `hv_tdx_hypercall':
>> arch/x86/hyperv/ivm.c:427: undefined reference to `__tdx_hypercall_ret'


vim +427 arch/x86/hyperv/ivm.c

   418	
   419	u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2)
   420	{
   421		struct tdx_hypercall_args args = { };
   422	
   423		args.r10 = control;
   424		args.rdx = param1;
   425		args.r8  = param2;
   426	
 > 427		(void)__tdx_hypercall_ret(&args);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
