Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77C112B72
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692272513; x=1723808513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=62MmOQluxFEstnGGWL6HuQpr0BwTXktiZcir6dVcBjU=;
  b=iQtgd0qlRS0ZXTlfTTTgasFRhECfa//DWtykCYiKPyPip+7oSe1yLQ+A
   /jl4VhdDScG+4tc0XDjbf2egBCZl0Jp//Ka6EGaK/rV8erOKd+/p24J2D
   td9vdFxyhp2ihLmo2NwOXtjLW8JicM8iSXai6O3dmMts+qV0C9TOk2IZ+
   0YjI4hIyN5XWk+4jjlTMlF0ocYhzaCcG9x8S2hXOSdDna2lj+WTG/0tyc
   HBsDcYvtjOyKMyHC50jxQ7W/1214xmAB/LnYm9bw27xEhDsFQbnYP3PZj
   wpL/toeRh5FqkTE60XtSyBV2mCjjMhd+FECJMdWHx2q7GcdfuM85xtily
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362936362"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="362936362"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 04:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="981127320"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="981127320"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2023 04:41:52 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWbNs-00015r-0X;
	Thu, 17 Aug 2023 11:41:49 +0000
Date: Thu, 17 Aug 2023 19:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Dexuan Cui <decui@microsoft.com>
Subject: [dcui-tdx:decui/upstream-hyperv/hyperv-next/TDX/0816 5/27]
 arch/x86/include/asm/mshyperv.h:265:13: error: conflicting types for
 'hv_isolation_type_en_snp'
Message-ID: <202308171905.b8TBE0By-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-hyperv/hyperv-next/TDX/0816
head:   269f1434402833526e9c322f860d35aab76386ba
commit: 362be6abe7585901d74f8747f4d8711b8e5d9086 [5/27] x86/hyperv: Use vmmcall to implement Hyper-V hypercall in sev-snp enlightened guest
config: x86_64-randconfig-r012-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171905.b8TBE0By-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171905.b8TBE0By-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171905.b8TBE0By-lkp@intel.com/

Note: the dcui-tdx/decui/upstream-hyperv/hyperv-next/TDX/0816 HEAD 269f1434402833526e9c322f860d35aab76386ba builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/mm/pat/set_memory.c:36:
   arch/x86/include/asm/mshyperv.h: In function 'hv_do_hypercall':
   arch/x86/include/asm/mshyperv.h:62:6: error: implicit declaration of function 'hv_isolation_type_en_snp' [-Werror=implicit-function-declaration]
      62 |  if (hv_isolation_type_en_snp()) {
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mshyperv.h: At top level:
>> arch/x86/include/asm/mshyperv.h:265:13: error: conflicting types for 'hv_isolation_type_en_snp'
     265 | extern bool hv_isolation_type_en_snp(void);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mshyperv.h:62:6: note: previous implicit declaration of 'hv_isolation_type_en_snp' was here
      62 |  if (hv_isolation_type_en_snp()) {
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/hv_isolation_type_en_snp +265 arch/x86/include/asm/mshyperv.h

faff44069ff538 Tianyu Lan 2021-10-25  263  
faff44069ff538 Tianyu Lan 2021-10-25  264  extern bool hv_isolation_type_snp(void);
58ed6a01357316 Tianyu Lan 2023-03-28 @265  extern bool hv_isolation_type_en_snp(void);
faff44069ff538 Tianyu Lan 2021-10-25  266  

:::::: The code at line 265 was first introduced by commit
:::::: 58ed6a0135731654a525f29fc9c18a2b3d5cc2eb x86/hyperv: Add sev-snp enlightened guest static key

:::::: TO: Tianyu Lan <tiala@microsoft.com>
:::::: CC: Dexuan Cui <decui@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
