Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809F17AAB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691580693; x=1723116693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ke/1QR70K6ULdVX8VgM7M8fLBi0QEnQG+JirT1W4bdw=;
  b=LnmHs5fqmQXZi+0tgedKR5un6IDSpf82TxBYu1Okp3OzUeltJCQtsC9W
   HL74YCiUIu3oiz8fW+8Xauw8S02rpGWTs0nZt4JmzfTgTEXG6BSVShrT+
   MX15C1xNdLEvUUkDUgLHCEIiD560x0G/AUJQ0zEW47m3oMk6yaL+xZNuK
   kZzw4cbLhyFuNO1Jv5s9expWQiP5jf92aBGoaj7leYfaGpD9oJcmMISMS
   dYWKUsuqVzNyIblgxiS2/iFoQ/8UnpkGvzQ//xkN7SlT6qddRsNslAPCs
   ox0A0rGGHX3CszHQHf1vp+bJ5IfYPGCzlap2oDcKaTF/BeEvgCgWbWqZZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368554088"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="368554088"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 04:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731771501"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="731771501"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 04:31:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qThPX-00064g-1D;
	Wed, 09 Aug 2023 11:31:31 +0000
Date: Wed, 9 Aug 2023 19:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 7/29] arch/x86/kernel/sev.c:185:30: warning: no
 previous prototype for 'sev_snp_current_doorbell_page'
Message-ID: <202308091945.8YefRODI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   1f50b51d0f25cf6e93d994fbc0ec9e2f1cb3b911
commit: 2c408093ffb9d18de36d333c363d108d4794163d [7/29] x86/sev: Add AMD sev-snp enlightened guest support on hyperv
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230809/202308091945.8YefRODI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091945.8YefRODI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091945.8YefRODI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/sev.c:185:30: warning: no previous prototype for 'sev_snp_current_doorbell_page' [-Wmissing-prototypes]
     185 | struct sev_hv_doorbell_page *sev_snp_current_doorbell_page(void)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/sev.c: In function 'do_exc_hv':
   arch/x86/kernel/sev.c:284:65: error: 'vector' undeclared (first use in this function); did you mean 'sector_t'?
     284 |                                 panic("Unexpected vector %d\n", vector);
         |                                                                 ^~~~~~
         |                                                                 sector_t
   arch/x86/kernel/sev.c:284:65: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/sev.c: In function 'sev_snp_init_hv_handling':
>> arch/x86/kernel/sev.c:413:37: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     413 |         struct sev_es_runtime_data *data;
         |                                     ^~~~


vim +/sev_snp_current_doorbell_page +185 arch/x86/kernel/sev.c

   184	
 > 185	struct sev_hv_doorbell_page *sev_snp_current_doorbell_page(void)
   186	{
   187		return &this_cpu_read(snp_runtime_data)->hv_doorbell_page;
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
