Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08413EC6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 05:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691733293; x=1723269293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C2wESa8iP1l0Z5FSHz6iDeJPNOxgVAMYKWfs3n6J2og=;
  b=AjqUKtrMNJlzLzPVcJudkRqhQrZcK9jJYYA1MSa+kXHzSovglD4PXoNA
   rlHGKsb8lzTsK0p+Gz9U3hi0Wkp5cYM/LKTCriXt07NWm1pjT0DJPTk+Y
   oNjxr9IVYkOAc18Y93oEAYC4446VkzSUyKrw6kfFbV+5XtT7qVZ9VTUZo
   pFcLxzIixtoRtfUw/2TZOBpmo2S8WaCKNOqf6NjTF6S7X/0iqB9zTfQZY
   u8vExGgEZakicL7+rbqvl7d+ymwIhMi6teKHulupeo5hrELrfThnUgI4l
   BGrB/hN+063Jk6d7FY/cB3jX6Vb5IXbM/pE4EWYN7f1Qi64+1PwrMCZ2O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="369073119"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="369073119"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 22:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="979122493"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="979122493"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Aug 2023 22:54:31 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUL6V-0007Y0-0K;
	Fri, 11 Aug 2023 05:54:31 +0000
Date: Fri, 11 Aug 2023 13:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/upstream-hyperv/hyperv-next/TDX/0810 18/25]
 arch/x86/hyperv/ivm.c:545: undefined reference to `__tdx_hypercall_ret'
Message-ID: <202308111355.07YiFt1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-hyperv/hyperv-next/TDX/0810
head:   104f836a5da361eec57916007c24e43c4d247951
commit: 9715fa50ed2bd66dcc8e7b6abc8f9bfae3b6adaf [18/25] x86/hyperv: Support hypercalls for fully enlightened TDX guests
config: i386-randconfig-i013-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111355.07YiFt1Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111355.07YiFt1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111355.07YiFt1Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/hyperv/ivm.o: in function `hv_tdx_hypercall':
>> arch/x86/hyperv/ivm.c:545: undefined reference to `__tdx_hypercall_ret'


vim +545 arch/x86/hyperv/ivm.c

   536	
   537	u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2)
   538	{
   539		struct tdx_hypercall_args args = { };
   540	
   541		args.r10 = control;
   542		args.rdx = param1;
   543		args.r8  = param2;
   544	
 > 545		(void)__tdx_hypercall_ret(&args);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
