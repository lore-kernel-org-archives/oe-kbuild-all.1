Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F633B798
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAhl8PR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701779386; x=1733315386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qXXq8JVhFV0GPx6MtO10ygfEwUUY4keECdjj2Tu7MdI=;
  b=QAhl8PR/yrxPUmFkrVXdBHqGAjM+LwVxm8VXjijZluaEBFjxxiq/hcDf
   W3LwrAjtV5RukOL2FAaiqs6qhAgI2RfP+juxVwYBLjksS2AenjfjEF7dK
   +wYSHyai1HrnJY2hPEkePEvwe29wq1TD1/mZC/i4WQNJPDIqAiH+mqQpu
   wYi+tKxXiAv6QgIzeHba+vdHECNxVkrQ5pMuVCycszRg1A9QrVQ6Amn7W
   a2AP3EKQYNMXSNc8mGUlPJM5/MZ9xgLGOe6dhnlK9IOJyYZDi1j70pP2u
   klU0r87cFiEouFuE9bBXgH445OW2hnoQGHXauwaNBqeFEdXq8tGZZTiWf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="391048714"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="391048714"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="805262971"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="805262971"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Dec 2023 04:29:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUYT-0008xb-2w;
	Tue, 05 Dec 2023 12:29:37 +0000
Date: Tue, 5 Dec 2023 20:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] PM: QoS: Add a performance QoS
Message-ID: <202312052019.Vy6Upt3W-lkp@intel.com>
References: <20231201190757.144741-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201190757.144741-2-daniel.lezcano@linaro.org>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/acpi-bus rafael-pm/thermal linus/master rafael-pm/devprop v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/PM-QoS-Add-a-performance-QoS/20231202-031119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231201190757.144741-2-daniel.lezcano%40linaro.org
patch subject: [RFC PATCH 2/2] PM: QoS: Add a performance QoS
config: parisc-randconfig-001-20231203 (https://download.01.org/0day-ci/archive/20231205/202312052019.Vy6Upt3W-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052019.Vy6Upt3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052019.Vy6Upt3W-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/ufs/core/ufs-sysfs.o: in function `dev_pm_qos_hide_perf_limit':
>> (.text.dev_pm_qos_hide_perf_limit+0x0): multiple definition of `dev_pm_qos_hide_perf_limit'; drivers/ufs/core/ufshcd.o:(.text.dev_pm_qos_hide_perf_limit+0x0): first defined here
   hppa-linux-ld: drivers/ufs/core/ufs-mcq.o: in function `dev_pm_qos_hide_perf_limit':
>> (.text.dev_pm_qos_hide_perf_limit+0x0): multiple definition of `dev_pm_qos_hide_perf_limit'; drivers/ufs/core/ufshcd.o:(.text.dev_pm_qos_hide_perf_limit+0x0): first defined here
   hppa-linux-ld: drivers/ufs/core/ufs-debugfs.o: in function `dev_pm_qos_hide_perf_limit':
>> (.text.dev_pm_qos_hide_perf_limit+0x0): multiple definition of `dev_pm_qos_hide_perf_limit'; drivers/ufs/core/ufshcd.o:(.text.dev_pm_qos_hide_perf_limit+0x0): first defined here
   hppa-linux-ld: drivers/ufs/core/ufs_bsg.o: in function `dev_pm_qos_hide_perf_limit':
>> (.text.dev_pm_qos_hide_perf_limit+0x0): multiple definition of `dev_pm_qos_hide_perf_limit'; drivers/ufs/core/ufshcd.o:(.text.dev_pm_qos_hide_perf_limit+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
