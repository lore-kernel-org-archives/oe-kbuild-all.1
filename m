Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F24819E69
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 17:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686937729; x=1718473729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2WBcusr9EQNZZuhk0EvevfvJhZ49yZxl57ZBW72FSaE=;
  b=aLgxthu4RglckNoOTegXEgjtbMPTFMLrgvuB5mglhcR542PUwcOK+al1
   RD+w1I7C0cCwM/eDuvOw2oWuktknchMQZNn+GWj4uGGY3vsZz9ff9hvOi
   cjFKjK2XNIJx1eWgeUxhUSaB2MLzPUNcQ/NrB6iUAsLU69RBBidzrLk3J
   4RF2ywVaGbk/at0Vr4YiDSE5QcUOj63fb2jQR29ALyxVMpaEYQv/Gs6+3
   6ghThRe7Uaebtalhk6XVh0xxLUFST80f82n1hJ4SxT3WuraI6KdrBd862
   Oj8y3ODFaoPyMA8OlbERc7G3I8aQZk8f5LqGqIuh93WeLIYi3aM0kWlvZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="362687055"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="362687055"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 10:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="778239880"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="778239880"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2023 10:48:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qADZ0-0001eC-0R;
	Fri, 16 Jun 2023 17:48:46 +0000
Date: Sat, 17 Jun 2023 01:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/upstream-tip/x86/tdx/v7 4/14]
 arch/x86/hyperv/ivm.c:427: undefined reference to `__tdx_hypercall_ret'
Message-ID: <202306170143.YtarxGjA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-tip/x86/tdx/v7
head:   5ae5d192055aeda39295b9e4a245452f0e33d204
commit: 40528e7b482a0dcdb8a8b888640ba3e73a4b0ff6 [4/14] x86/hyperv: Support hypercalls for TDX guests
config: i386-randconfig-s043-20230615 (https://download.01.org/0day-ci/archive/20230617/202306170143.YtarxGjA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170143.YtarxGjA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306170143.YtarxGjA-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
