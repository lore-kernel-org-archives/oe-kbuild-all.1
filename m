Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F21384
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682154949; x=1713690949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BoubhM3hxQv2VWu+5X4h4+1HW4kTQ6DJ5TYQTVOISpY=;
  b=iyL82MPiOj84qPYvVxKEJKROvuFXj7zLMMrHgjweAqEM/FLXfhuBxn3O
   wiZJPW2VYZsTiko5qKnGo7APDwwy7y8oiL2t6q3RAUHNG0ZxiW25e+pve
   o4wnv7DVZMot6PYy4hfb6ESFzHE1obW8fkQZD6DKH8RS7Xgf01EQE6l0J
   uMWokAKmDQI/2CJ2XhQ9m7j+0JPiqhCFYyGO2ZsCGWPWPW/RyPPaSied/
   vs2IP3myAV8EtSFHzLs/yH8mZUGKZMYoQaStptn35qDPmbYC/dDFuCoOm
   tIeyt3sIaqSeKX+E9oa9uU4ZWK5fQwDA4dJSO4Kj6XdgLbQiY2f78HVxC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409080534"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="409080534"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 02:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="1022143629"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="1022143629"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2023 02:15:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq9LI-000hCu-0B;
	Sat, 22 Apr 2023 09:15:40 +0000
Date: Sat, 22 Apr 2023 17:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v5 8/10] arch/x86/hyperv/ivm.c:427:
 undefined reference to `__tdx_hypercall_ret'
Message-ID: <202304221752.rZRBOWh3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v5
head:   4b485dee53a76f5b055d2feac48bb166243bc67d
commit: 5ee89b2f5de98de910e8951e90176b12a7a1bbee [8/10] x86/hyperv: Support hypercalls for TDX guests
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230422/202304221752.rZRBOWh3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/dcui/tdx/commit/5ee89b2f5de98de910e8951e90176b12a7a1bbee
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v5
        git checkout 5ee89b2f5de98de910e8951e90176b12a7a1bbee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221752.rZRBOWh3-lkp@intel.com/

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
