Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C7F20E7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683270309; x=1714806309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lpfuxOfmUroTByr/tIvYzhfZaL4jlfIcvpqsRRsnX7k=;
  b=dhL2FeaQEz3gMfG1RySaZRw+q43Ze0hOtEoZsxrarpPz09vIU53GY0uE
   YDZoGZyJxaOrsgcThBdFlNjacYTHvr4MFi9LTRvxfzgc16Rn7QrlzVWMX
   FV3/0zAyHqhcc8wweFXQ6CwBjMmoPpcOzDBjiTRA+RH/Q8kc0ZSZulOUy
   tDQt4MSolQne4YTYARPTdTfJF8y9HGd6NAAUIAocBPVxt+1UrU4/1JWa9
   jFDdV+//wj5D7todQV8ChJjOVNe1uzh7/+BCyRuCEmX7JqSI0MC6q3o+3
   sQVEw9FY/LpAXTFnQbrQIHPu0cFHxcW6j2LXtkotYjl/M/5WZvzOfA7lP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="412371524"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="412371524"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 00:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="700270449"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="700270449"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 May 2023 00:05:05 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pupV2-0000KB-1o;
	Fri, 05 May 2023 07:05:04 +0000
Date: Fri, 5 May 2023 15:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/mainline/v6-dda 7/13] arch/x86/hyperv/ivm.c:427:
 undefined reference to `__tdx_hypercall_ret'
Message-ID: <202305051414.mOAC4y61-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/mainline/v6-dda
head:   cef8eab38588585b3c876df8d1ccf5831a6bf54f
commit: 1c59d1571537c077052140d61589c8851b3e4fd2 [7/13] x86/hyperv: Support hypercalls for TDX guests
config: i386-buildonly-randconfig-r003-20230501 (https://download.01.org/0day-ci/archive/20230505/202305051414.mOAC4y61-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/dcui/tdx/commit/1c59d1571537c077052140d61589c8851b3e4fd2
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/mainline/v6-dda
        git checkout 1c59d1571537c077052140d61589c8851b3e4fd2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051414.mOAC4y61-lkp@intel.com/

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
