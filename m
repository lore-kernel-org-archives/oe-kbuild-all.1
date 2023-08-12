Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08FB23D3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691860401; x=1723396401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pnOcIuhGSZgPjDSDYO+oH0NzYbGrNiPBqKpucRhyCjk=;
  b=nQT5Kd4cXfKNEt2tgOyUTCSkv4jpber+uqw6mvbKp04jTaKer9au4iiw
   hHCSmnGb3EvwzSLGiSXnTyCzYZkXTESsLHfxq8Te4bCO2j3LnNRrfXSDo
   wuCNBzbt2YreErAsP2xEWmxHVtTrfgLAZUgTdy1eJX0MN67knC05u4yl/
   WO18IXs86AO2KsS4qprHe/AZdcw/HAwIGNl9xUab2iIVncJuPMhHG0zDb
   brUDQ8KhI5JofnpvxxvcwO8pc+CuwA0hTZe1aBGeYVJdoPmKHZrfgLv7t
   EyH3wegiDaBKsS7jZASqRcdffhfnV6XNfdI5eg7D14dj4K7XAurwfd0jz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="402822329"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="402822329"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 10:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="736072162"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="736072162"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2023 10:13:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUsAx-0008hw-0h;
	Sat, 12 Aug 2023 17:13:19 +0000
Date: Sun, 13 Aug 2023 01:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 10/20] arch/x86/kernel/sev.c:185:30: warning: no
 previous prototype for 'sev_snp_current_doorbell_page'
Message-ID: <202308130135.hOe5SU9Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   a8a44aa58e6c9eac7cdbb142e11b3ac894404756
commit: 65f17da72a5e7625d2cb608eabf084e53f9286dc [10/20] x86/sev: Add AMD sev-snp enlightened guest support on hyperv
config: x86_64-randconfig-x012-20230812 (https://download.01.org/0day-ci/archive/20230813/202308130135.hOe5SU9Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130135.hOe5SU9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130135.hOe5SU9Y-lkp@intel.com/

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
