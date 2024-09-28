Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73666179AE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 04:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727499543; cv=none; b=Ri7G1xrQtsbF0B7JfkCX4Z3JeisrVXHtw0PCobsBO5nQTM4ZjH1Qbr281EfI+LhHkv/tP2TzQHDsQ8GBxmia0wy/zzjGJmKYN+mhcQtHXcGUNjNoGFcJCHytz6KyB4oHVpLMP7Vl+BkV1PAQIiYH1amwa1asgxVl/6vXa6P+R+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727499543; c=relaxed/simple;
	bh=0QjbSRTWgB4R5xdMVBoW2v7qM0bx3hp3DkdXrg/F1Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DewPiu8lESa/dnhAjcJf3Kn+E0RaWBT4IJmU2uXbLf+uDpC4cXL8DS0cOpbpfShlozHAIIZ9XxjZFrFIGpGbSBORNtNaLtl/IPez7Z7Ux4MrTLs7TMQBB2qpqx1ec3A8N2Hjc/agjGs3jKTyaSXW678mk9U+sv9xvpuWk8YrlE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJtbXfER; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJtbXfER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727499541; x=1759035541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QjbSRTWgB4R5xdMVBoW2v7qM0bx3hp3DkdXrg/F1Fo=;
  b=MJtbXfERIXa4jPIQScCIMMeMqH+qFU3WIc38HieHbcPMVps7Vyzf9Qyp
   DauIGmKRleREf9UiaFZXyNmnz1nuCv+vQtFrz+RlFbyfHdwOa3VdAgaLn
   fnWvDCWdBq0B4AAp1nCZuV6qyWB4I+moDXRt631FB9mhYjlmaNUdmrTIu
   1IJufhXlDbdB7YOtL6ckUE43ObtRmHYC2rCVoEqR7tHvttfqjWx6jtg6q
   zLQ2sO29lMCUI+Wi05TO8ThYqAr6FNGc6oIJ9EXNMk2bp0Kv1YRFYkNv3
   N42KuyEDZo83Q7ZD48qcqofKNXtAm/80vQzOOOA2u1OtSFUT4JdA1DUuA
   A==;
X-CSE-ConnectionGUID: YRRG5Jq1Tcy7fMOVZ1BD9g==
X-CSE-MsgGUID: 0qL/CsNnRTyUxFMqTR8hQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="38040161"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="38040161"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 21:59:01 -0700
X-CSE-ConnectionGUID: 5+TpXzrCTIuOpPE1iyIrtA==
X-CSE-MsgGUID: yrkUcGLVS2GvdwCvIi8KKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103549815"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2024 21:58:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suPXl-000Mvb-22;
	Sat, 28 Sep 2024 04:58:57 +0000
Date: Sat, 28 Sep 2024 12:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15026/23799]
 arch/arm64/mm/init.c:790:17: error: 'pmu_nmi_enable' undeclared; did you
 mean 'perf_pmu_enable'?
Message-ID: <202409281255.ytTMHoEG-lkp@intel.com>
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
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: 0c40cea7cfc2d1d9762e6fbbb531a43e6dac95ca [15026/23799] NMI: Enable arm-pmu interrupt as NMI in Acensed.
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281255.ytTMHoEG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281255.ytTMHoEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281255.ytTMHoEG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/init.c:469:13: warning: no previous prototype for 'arm64_memblock_init' [-Wmissing-prototypes]
     469 | void __init arm64_memblock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c: In function 'ascend_enable_all_features':
   arch/arm64/mm/init.c:787:17: error: 'mem_sleep_current' undeclared (first use in this function)
     787 |                 mem_sleep_current = PM_SUSPEND_ON;
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:787:17: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/mm/init.c:790:17: error: 'pmu_nmi_enable' undeclared (first use in this function); did you mean 'perf_pmu_enable'?
     790 |                 pmu_nmi_enable = true;
         |                 ^~~~~~~~~~~~~~
         |                 perf_pmu_enable


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
