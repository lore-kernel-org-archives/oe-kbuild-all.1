Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD008372686
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791186009; cv=none; b=Jbyl6uExIXAZ2ncIRbzdOcHg/oApW9M4XnmwEjPGTHboeCjzl0oZrvFReodfGYAbTdSp5WfdZ1kJOiVkxwBxWACCVNUsxCWPcG2QWq3sKICrOy2Jzxxor9D4LbdmM1Xt738h7gMuCLBuakrn/I0CdDZCqNzsI7c1vCvtra4DVpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791186009; c=relaxed/simple;
	bh=91UXnkJYJFUycutttlBBKnoreMfnH2eUXXB8BAMHWys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVOswHGD/J1+fcoHDQDPpgz5Oe2yykNTld0wRi5RJNRzDvvFQwnMOl0+6Y0XqOxbHKVDV2tt0gp6WihLyWarwAX4nHTfB+p+xr2EDbgxJnVmvdjdYoYTOM6oISgae7suekvGHyUfh/5ICaVVCMTjvLsqgJbzkN4fJaVJZ423DhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIOkYkfg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIOkYkfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791186008; x=1822722008;
  h=date:from:to:cc:subject:message-id;
  bh=91UXnkJYJFUycutttlBBKnoreMfnH2eUXXB8BAMHWys=;
  b=NIOkYkfg+IsA8DfgivSeJQKSMwPjolYnOcglGpdQTy9KYveC70gULV+7
   R/KKFdjsmdhHnPgJdFNjNiA3FfEVayjrsodJ/m3CdOAiSsA7Qy1WCt3yH
   rcF1avu7YKmbM8gTazicNSJ69cCDWwQZBr7oeoKhzitngVC8+yrqJolCY
   3kcPO0Ug9BHh9ziWHasiZFI1If0KTgyot1304NlGDspX3X42HVyjl++x7
   lD0+bphYxTGKSw21MCZbR4Wqm5B1CSKdeodR+UGr5krfLsweTsVN4vfT0
   AKU4i1XPiRpcOaol8IfR///FZ/6ycgVtP9M3EPQj47tDHvZE2+41S1UvQ
   g==;
X-CSE-ConnectionGUID: TgHxMjUVQWGFde842GYAEQ==
X-CSE-MsgGUID: 5O167vClSrand6dfzVkCvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90981251"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="90981251"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 00:40:07 -0700
X-CSE-ConnectionGUID: X+8CUd6xSbu+RZgSHxAFYQ==
X-CSE-MsgGUID: EX3g+eQCRTCkj2zOkYRAkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="794482"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 05 Oct 2026 00:40:06 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDdIp-00000000VSr-3Ua7;
	Mon, 05 Oct 2026 07:40:03 +0000
Date: Mon, 05 Oct 2026 15:39:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-p3-wip 7/8] kernel/time/ntp.c:1244:13:
 warning: conflicting types for 'pps_fit_reset'
Message-ID: <202610051540.gXL9SRxF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-p3-wip
head:   24b5bb6499c7dcc715bf50f768bc24b50f9cc631
commit: f04f156f18471fef43c99e5ef017165b43f34e7a [7/8] ntp: Estimate PPS frequency by least-squares fit over the interval
config: xtensa-randconfig-1001-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051540.gXL9SRxF-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051540.gXL9SRxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051540.gXL9SRxF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/ntp.c: In function 'pps_clear':
   kernel/time/ntp.c:175:2: error: implicit declaration of function 'pps_fit_reset'; did you mean 'sas_ss_reset'? [-Werror=implicit-function-declaration]
     pps_fit_reset(ntpdata);
     ^~~~~~~~~~~~~
     sas_ss_reset
   kernel/time/ntp.c: At top level:
>> kernel/time/ntp.c:1244:13: warning: conflicting types for 'pps_fit_reset'
    static void pps_fit_reset(struct ntp_data *ntpdata)
                ^~~~~~~~~~~~~
   kernel/time/ntp.c:1244:13: error: static declaration of 'pps_fit_reset' follows non-static declaration
   kernel/time/ntp.c:175:2: note: previous implicit declaration of 'pps_fit_reset' was here
     pps_fit_reset(ntpdata);
     ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pps_fit_reset +1244 kernel/time/ntp.c

  1243	
> 1244	static void pps_fit_reset(struct ntp_data *ntpdata)
  1245	{
  1246		ntpdata->pps_fit_n = 0;
  1247		ntpdata->pps_fit_sx = ntpdata->pps_fit_sy = 0;
  1248		ntpdata->pps_fit_sxy = ntpdata->pps_fit_sxx = 0;
  1249	}
  1250	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
