Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739891EB2E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732815101; cv=none; b=F1y3VD+w04ttRuadfRbeYeklx3Xq68upCx2GVTIk+Iufb/vqtihvpTNUnkYWdD80Fye2ePLv4GCKczXluwcyto9vjO7ZXKwm9Jg+RD0mxsQpUDyOUMkN41X46mJeU7C5uhe7OmyhjgVvB+2aJTD/T9vT8UODrUqtm4hNfptjSX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732815101; c=relaxed/simple;
	bh=L87rBp+ar2EyZ2NkBEeO8jBYobrAxhtHGB3LtB//+Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JrnvVNIr4IZb/VSLriwEVUDio+F/ZPW0I9qs+6PvttEFwMGbg9aN+too85aKWHful9L7W98tcriiQq7eed5DsYlAx7cj6HBExkWq0X0glUeYWn/cMcmimTjc25vstVTx1Ifva8oWISCGD6d7Hgoo9F4FxpQTc3O3wvxQueZcsEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LT0lC6YV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LT0lC6YV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732815099; x=1764351099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L87rBp+ar2EyZ2NkBEeO8jBYobrAxhtHGB3LtB//+Wo=;
  b=LT0lC6YVI6NYsauiC4Rg9zYP3Gw5aEeoC02WYjd+wlXx5XohenrWsRit
   ff2WeKpCNCRAZo984+3n4juR1l1LkmnwQT+NlhwCLkmjUbI4z215HOvX7
   B8tcavvhirL7HMzJN2K4NPqQzelFWbZ+2uR27g6u/UXtWbnPNcZ0COA0U
   4eQl7+ZzkaWFniKsExKVHzFN8W+KRgGO4xwLY5uwS2i4kh238QSFQjN1V
   IWQvAjTalkAiuulBeLEX0ZdmXVcMIHG7QemVjUgIXrHzgspm//rqxdoOs
   JZ8nkgINb81fzbXIPFhh1fPraUKGP6rQMOdhwYPbmLoWDD+sVhvMEugk/
   g==;
X-CSE-ConnectionGUID: ZE40hufLRLi4JlKvxhQwtg==
X-CSE-MsgGUID: Va9nLpWdTEGnOV0Qup2NhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32991305"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="32991305"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:31:39 -0800
X-CSE-ConnectionGUID: wmek7hTQRtWoXvxr9EFVoA==
X-CSE-MsgGUID: zM4CRBxgR3iu7iPft9OW9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97387366"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2024 09:31:37 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGiMZ-0009rp-1v;
	Thu, 28 Nov 2024 17:31:35 +0000
Date: Fri, 29 Nov 2024 01:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1315/1315] arch/arm64/mm/init.c:790:17:
 error: 'pmu_nmi_enable' undeclared; did you mean 'cpuhp_smt_enable'?
Message-ID: <202411290101.y0Trpl2b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 0c40cea7cfc2d1d9762e6fbbb531a43e6dac95ca [1315/1315] NMI: Enable arm-pmu interrupt as NMI in Acensed.
config: arm64-randconfig-004-20241128 (https://download.01.org/0day-ci/archive/20241129/202411290101.y0Trpl2b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290101.y0Trpl2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290101.y0Trpl2b-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/init.c:469:13: warning: no previous prototype for 'arm64_memblock_init' [-Wmissing-prototypes]
     469 | void __init arm64_memblock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c: In function 'ascend_enable_all_features':
   arch/arm64/mm/init.c:787:17: error: 'mem_sleep_current' undeclared (first use in this function)
     787 |                 mem_sleep_current = PM_SUSPEND_ON;
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:787:17: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/mm/init.c:790:17: error: 'pmu_nmi_enable' undeclared (first use in this function); did you mean 'cpuhp_smt_enable'?
     790 |                 pmu_nmi_enable = true;
         |                 ^~~~~~~~~~~~~~
         |                 cpuhp_smt_enable


vim +790 arch/arm64/mm/init.c

   774	
   775	void ascend_enable_all_features(void)
   776	{
   777		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   778			enable_mmap_dvpp = 1;
   779	
   780		if (IS_ENABLED(CONFIG_ASCEND_IOPF_HIPRI))
   781			enable_iopf_hipri = 1;
   782	
   783		if (IS_ENABLED(CONFIG_ASCEND_CHARGE_MIGRATE_HUGEPAGES))
   784			enable_charge_mighp = 1;
   785	
   786		if (IS_ENABLED(CONFIG_SUSPEND))
   787			mem_sleep_current = PM_SUSPEND_ON;
   788	
   789		if (IS_ENABLED(CONFIG_PMU_WATCHDOG))
 > 790			pmu_nmi_enable = true;
   791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
