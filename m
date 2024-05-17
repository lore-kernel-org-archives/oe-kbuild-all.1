Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2243612FF72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715962508; cv=none; b=hZ73z9eju+wNRzQXtOtlA0hTZSGbxjpFvZZTPkrgJrI18VKlsf78GCnm9n24Bg5/ZifzzTDLb1YJanrAe/T0CZJ0Mxs1wk1/XIGiEEMQuLzPXMz+Esev4Vp80pOolg6oALyafvAAEMUbO96a7BaJldOyotPlv3ZN38f4Dtau0rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715962508; c=relaxed/simple;
	bh=gRaTQojPeQJ7nHblDDItHsTP+Nal6PUWc/nAR4F/12k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1NPOWeaPjb0My1+FJbmT5CA9WiKrL36CzXVlixZXvcyPChXrMR5oS9HFpCI38RyJs3vXhLC4Eed1exrhSv9JEee4O2p6PKw135A9tN/4IEI4l00Yofqgj/a2VUMC16V34Zz7UbRruIYAb28QvqMoC7QIhpOQ/cvFnj4pNEVALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjWKf435; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjWKf435"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715962506; x=1747498506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRaTQojPeQJ7nHblDDItHsTP+Nal6PUWc/nAR4F/12k=;
  b=QjWKf4358C8lzbwLBRvbeIEurI9FiHYoil4gLDGXg3G7v+CumfbbXWQN
   WXDkxLDpyIak3K6HdC8L6w0PfzQulFXNYpKHRX8KEzBQK2zlXWcTFKV/M
   cdyziecMWkXp3HzKid4DtaB7RJTHiT+AToFSZ64w9Xh+l9y4Kckf/d45X
   C6nBKn6mDBRELOLRHukN7t1ZHTXVLuWCU2+4ge1nZbF6D6eZTAriVWfCu
   39qCY5ACmWNs2lfbf0D8M1uRptNBBpAoNo31xqRo6oaVeeoiUUE6RC7j4
   R8FBhHJ+eHqfouj4eynZcWJJUQ6FgffS7xGGgKKjcefQZPi3EeC3gysa6
   g==;
X-CSE-ConnectionGUID: 3jBa6jTCSLKB3WHr/cudjg==
X-CSE-MsgGUID: m8sg0NNRQees8lnRMbOKzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12018070"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="12018070"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 09:15:05 -0700
X-CSE-ConnectionGUID: iWi+EI8zSB6cRJkwZTUJzw==
X-CSE-MsgGUID: pfc7wKckTCCTjATegIz4wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="31925454"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 May 2024 09:15:03 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s80DJ-0000tG-36;
	Fri, 17 May 2024 16:14:47 +0000
Date: Sat, 18 May 2024 00:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6627/6628] drivers/crypto/ccp/hygon/vpsp.c:108:21:
 warning: no previous prototype for 'map_tbl_dump'
Message-ID: <202405172341.C9uyDk5z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi xiongmengbiao,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95dac159be359bc7ba42421426462f1a96f50ee9
commit: a856376888dd6256bf3b0f13993e8baef490f41b [6627/6628] crypto: ccp: Eliminate dependence of the kvm module on the ccp module
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240517/202405172341.C9uyDk5z-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405172341.C9uyDk5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405172341.C9uyDk5z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/vpsp.c:108:21: warning: no previous prototype for 'map_tbl_dump' [-Wmissing-prototypes]
     108 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         |                     ^~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/vpsp.c:121:21: warning: no previous prototype for 'g2h_tbl_dump' [-Wmissing-prototypes]
     121 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         |                     ^~~~~~~~~~~~


vim +/map_tbl_dump +108 drivers/crypto/ccp/hygon/vpsp.c

fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  107  
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10 @108  void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  109  {
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  110  	int i;
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  111  
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  112  	pr_info("[%s]-> map_tbl_nums: %d", title, tbls->tbl_nums);
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  113  	for (i = 0; i < tbls->tbl_nums; i++) {
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  114  		pr_info("\t[%d]: parent_pa: 0x%llx, offset: 0x%x, size: 0x%x, align: 0x%x hva: 0x%llx",
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  115  			i, tbls->tbl[i].parent_pa, tbls->tbl[i].offset,
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  116  			tbls->tbl[i].size, tbls->tbl[i].align, tbls->tbl[i].hva);
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  117  	}
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  118  	pr_info("\n");
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  119  }
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  120  
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10 @121  void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  122  {
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  123  	int i;
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  124  
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  125  	pr_info("[%s]-> g2h_tbl_nums: %d, max_nums: %d", title, tbls->tbl_nums,
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  126  		tbls->max_nums);
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  127  	for (i = 0; i < tbls->tbl_nums; i++)
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  128  		pr_info("\t[%d]: hva: 0x%llx, gpa: 0x%llx", i,
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  129  			(uint64_t)tbls->tbl[i].hva, tbls->tbl[i].gpa);
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  130  	pr_info("\n");
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  131  }
fc090cfaabd5c1 arch/x86/kvm/psp.c niuyongwen 2023-08-10  132  

:::::: The code at line 108 was first introduced by commit
:::::: fc090cfaabd5c1c45916e41c09a388c254ac9505 Support tkm virtualization

:::::: TO: niuyongwen <niuyongwen@hygon.cn>
:::::: CC: xiongmengbiao <xiongmengbiao@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
