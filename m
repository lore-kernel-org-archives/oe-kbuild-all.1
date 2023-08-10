Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035510E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 05:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691646604; x=1723182604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkm6MCZRGEQtPUWPkNIsFENGQOB/mzuhzyayYnYwgiQ=;
  b=ZGkuR9BD38cGGvVpZ3nMBDfdQjx2G3J7jeWLvRmworNvmzK7b4hD6+L/
   X7Vz1VmguTU4L3047XMPHMaGNzwEx6sKEm0LYNvEZavD+YC+xPSWYTp53
   MDyrcmAoFeoRGd6Uq6vKioAap3FIrrfO2z9stwpwRIA4i9PAP014DGQTY
   4J9UYk2HfXA2bqENhPzH8RBhco9RcP9/QD3Fy3Vk2+NWuj4D3FrbtL1qH
   kQPFYIUCjQ5Af3gORqqT0egoSLmfEXKymfwFivqjG6zsoMp6ZUbKVqpKb
   u3Q59C4xT5Zo5yi9vAxehkkQNkR3VGbqnqzbfFU00GPxi6TjYG3nrjJVz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="402263219"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="402263219"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 22:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="681963948"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="681963948"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Aug 2023 22:50:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTyYa-0006lE-0i;
	Thu, 10 Aug 2023 05:50:00 +0000
Date: Thu, 10 Aug 2023 13:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 321/356]
 arch/x86/virt/vmx/tdx/tdx_module_loader_old/seamcall.h:57:23: error:
 implicit declaration of function '__seamcall'; did you mean 'seamcall'?
Message-ID: <202308101316.QtBeRlB7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   3927f67e05ac0811bf21e5d5d3f659ff4684aca5
commit: 5249f5244c961ac41a1f3771b53798b5ffea8251 [321/356] [REVERTME] x86/virt/tdx: Boot-time tdx module loading
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308101316.QtBeRlB7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101316.QtBeRlB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101316.QtBeRlB7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/virt/vmx/tdx/tdx_module_loader_old/p-seamldr.c:20:
   arch/x86/virt/vmx/tdx/tdx_module_loader_old/seamcall.h: In function 'seamcall':
>> arch/x86/virt/vmx/tdx/tdx_module_loader_old/seamcall.h:57:23: error: implicit declaration of function '__seamcall'; did you mean 'seamcall'? [-Werror=implicit-function-declaration]
      57 |                 err = __seamcall(op, &args);
         |                       ^~~~~~~~~~
         |                       seamcall
   cc1: some warnings being treated as errors


vim +57 arch/x86/virt/vmx/tdx/tdx_module_loader_old/seamcall.h

    36	
    37	static inline u64 seamcall(u64 op, u64 rcx, u64 rdx, u64 r8, u64 r9,
    38				   struct tdx_ex_ret *ex)
    39	{
    40		struct tdx_module_args args = {
    41			.rcx = rcx,
    42			.rdx = rdx,
    43			.r8 = r8,
    44			.r9 = r9,
    45		};
    46		u64 err;
    47	
    48		if (ex) {
    49			err = __seamcall_ret(op, &args);
    50			ex->regs.rcx = args.rcx;
    51			ex->regs.rdx = args.rdx;
    52			ex->regs.r8 = args.r8;
    53			ex->regs.r9 = args.r9;
    54			ex->regs.r10 = args.r10;
    55			ex->regs.r11 = args.r11;
    56		} else {
  > 57			err = __seamcall(op, &args);
    58		}
    59	
    60		return err;
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
