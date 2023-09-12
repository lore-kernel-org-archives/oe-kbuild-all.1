Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F549443
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694518298; x=1726054298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwNaxSVFsY2SvCKO71LOf6gbY6Z1G4AHsL9BA1gTnPA=;
  b=Nqk0ZenClAH+pDiYW1lk8PZWcvi5Ad14JAZxfce0BRKeZlF9MxRFoL86
   uXZzfC+ox7bJQiwbsX7Lnx1PYm1DxWV5eUMugS+XD0fiaR1Id0iCnnhRA
   Ib5gtGrlvCSsvhKTmHZrkLYRp4HOtCtXU00tlCLxTvXpxnR7SHKTyFdyN
   KzKGMXpOoBn762ghaQp1QhHqryl/1/Muz8TE2eBc0ywQEGuZiMpefxOj/
   nJk2k7eShXYiPI1QXJNGDKHVO1fhFQnVPghrp+FI0kv3yopzumLUDwwzs
   PayzbJKHDXvynypZOcBOl6Ctx3JcGm1gEPYGrxEyrgNZjQz+CHl0PikBy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="357778160"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="357778160"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 04:31:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813783572"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="813783572"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2023 04:31:30 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg1c4-0000JS-2y;
	Tue, 12 Sep 2023 11:31:25 +0000
Date: Tue, 12 Sep 2023 19:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 271/321]
 arch/x86/kvm/vmx/tdx_error.c:43:28: error: 'TDH_MEM_RD' undeclared; did you
 mean 'TDH_MNG_RD'?
Message-ID: <202309121905.PAG69nfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   f6388449e0300e7413c7e2ea4875923875ddb340
commit: 920563f6b59b6ae10b906bd111dd30a2f3f4a42f [271/321] [REVERTME] KVM: TDX: return -EAGAIN on race to populate Secure EPT entry
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309121905.PAG69nfn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121905.PAG69nfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121905.PAG69nfn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/tdx_error.c: In function 'tdx_seamcall_name':
>> arch/x86/kvm/vmx/tdx_error.c:43:28: error: 'TDH_MEM_RD' undeclared (first use in this function); did you mean 'TDH_MNG_RD'?
      43 |                 BUILD_NAME(TDH_MEM_RD),
         |                            ^~~~~~~~~~
   arch/x86/kvm/vmx/tdx_error.c:26:28: note: in definition of macro 'BUILD_NAME'
      26 | #define BUILD_NAME(name) { name, #name }
         |                            ^~~~
   arch/x86/kvm/vmx/tdx_error.c:43:28: note: each undeclared identifier is reported only once for each function it appears in
      43 |                 BUILD_NAME(TDH_MEM_RD),
         |                            ^~~~~~~~~~
   arch/x86/kvm/vmx/tdx_error.c:26:28: note: in definition of macro 'BUILD_NAME'
      26 | #define BUILD_NAME(name) { name, #name }
         |                            ^~~~
>> arch/x86/kvm/vmx/tdx_error.c:44:28: error: 'TDH_MEM_WR' undeclared (first use in this function); did you mean 'TDH_VP_WR'?
      44 |                 BUILD_NAME(TDH_MEM_WR),
         |                            ^~~~~~~~~~
   arch/x86/kvm/vmx/tdx_error.c:26:28: note: in definition of macro 'BUILD_NAME'
      26 | #define BUILD_NAME(name) { name, #name }
         |                            ^~~~


vim +43 arch/x86/kvm/vmx/tdx_error.c

    27	
    28	static const char *tdx_seamcall_name(u64 op)
    29	{
    30		static const struct tdx_name names[] = {
    31			BUILD_NAME(TDH_VP_ENTER),
    32			BUILD_NAME(TDH_MNG_ADDCX),
    33			BUILD_NAME(TDH_MEM_PAGE_ADD),
    34			BUILD_NAME(TDH_MEM_SEPT_ADD),
    35			BUILD_NAME(TDH_VP_ADDCX),
    36			BUILD_NAME(TDH_MEM_PAGE_RELOCATE),
    37			BUILD_NAME(TDH_MEM_PAGE_AUG),
    38			BUILD_NAME(TDH_MEM_RANGE_BLOCK),
    39			BUILD_NAME(TDH_MNG_KEY_CONFIG),
    40			BUILD_NAME(TDH_MNG_CREATE),
    41			BUILD_NAME(TDH_VP_CREATE),
    42			BUILD_NAME(TDH_MNG_RD),
  > 43			BUILD_NAME(TDH_MEM_RD),
  > 44			BUILD_NAME(TDH_MEM_WR),
    45			BUILD_NAME(TDH_MEM_PAGE_DEMOTE),
    46			BUILD_NAME(TDH_MR_EXTEND),
    47			BUILD_NAME(TDH_MR_FINALIZE),
    48			BUILD_NAME(TDH_VP_FLUSH),
    49			BUILD_NAME(TDH_MNG_VPFLUSHDONE),
    50			BUILD_NAME(TDH_MNG_KEY_FREEID),
    51			BUILD_NAME(TDH_MNG_INIT),
    52			BUILD_NAME(TDH_VP_INIT),
    53			BUILD_NAME(TDH_MEM_PAGE_PROMOTE),
    54			BUILD_NAME(TDH_MEM_SEPT_RD),
    55			BUILD_NAME(TDH_VP_RD),
    56			BUILD_NAME(TDH_MNG_KEY_RECLAIMID),
    57			BUILD_NAME(TDH_PHYMEM_PAGE_RECLAIM),
    58			BUILD_NAME(TDH_MEM_PAGE_REMOVE),
    59			BUILD_NAME(TDH_MEM_SEPT_REMOVE),
    60			BUILD_NAME(TDH_MEM_TRACK),
    61			BUILD_NAME(TDH_MEM_RANGE_UNBLOCK),
    62			BUILD_NAME(TDH_PHYMEM_CACHE_WB),
    63			BUILD_NAME(TDH_PHYMEM_PAGE_WBINVD),
    64			BUILD_NAME(TDH_VP_WR),
    65			BUILD_NAME(TDH_SYS_LP_SHUTDOWN),
    66		};
    67	
    68		return tdx_find_name(op, names, ARRAY_SIZE(names),
    69				"Unknown TDX SEAMCALL op");
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
