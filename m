Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6316A4B5DE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y947KsUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701780073; x=1733316073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kC1brI3VgZvZwG2Gr+m2fOdygLPmFKgiFxISEvqJbPc=;
  b=Y947KsUHbkrCIhiRQhHdGKr1IqLYapWc5w0QhFaDAeYSGGifB6RO60wm
   YM9me+g+89KBLXhu3mnJ5OXnhxzh5x9bv+A7qbxPQn3Uus5VdVZsRRoR3
   xPYEVgd71IUa10vMnd5BmCtsx3UNydHukTvCZssfkwlFxXsL4NyVagUYN
   Cf6SMEtdyzqkcaPu1T8rhBmsXreKhALpWuPn8nQ0s3IuKYEszg5XqO82V
   BODYMLnfGe5VNnSMHCDGIdyHJdgCTIzwSt/G4pE9tLl2BJeyFZRz1A1uj
   pt81E2xLatzHmQI6+NvDaHXv6C7MIHpYupB3PlnnmR6C4xSgxLZJvhUEy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942051"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942051"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018209979"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018209979"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 04:41:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUjV-0008yY-2t;
	Tue, 05 Dec 2023 12:41:03 +0000
Date: Tue, 5 Dec 2023 20:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] PM: QoS: Add a performance QoS
Message-ID: <202312052053.GM9JEd1c-lkp@intel.com>
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
config: powerpc-randconfig-002-20231203 (https://download.01.org/0day-ci/archive/20231205/202312052053.GM9JEd1c-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052053.GM9JEd1c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052053.GM9JEd1c-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: sound/aoa/core/alsa.o: in function `dev_pm_qos_hide_perf_limit':
>> alsa.c:(.text+0x230): multiple definition of `dev_pm_qos_hide_perf_limit'; sound/aoa/core/core.o:core.c:(.text+0x690): first defined here
   powerpc-linux-ld: sound/aoa/core/gpio-pmf.o: in function `dev_pm_qos_hide_perf_limit':
   gpio-pmf.c:(.text+0xef4): multiple definition of `dev_pm_qos_hide_perf_limit'; sound/aoa/core/core.o:core.c:(.text+0x690): first defined here
   powerpc-linux-ld: sound/aoa/core/gpio-feature.o: in function `dev_pm_qos_hide_perf_limit':
   gpio-feature.c:(.text+0x1ad0): multiple definition of `dev_pm_qos_hide_perf_limit'; sound/aoa/core/core.o:core.c:(.text+0x690): first defined here
--
   powerpc-linux-ld: sound/aoa/soundbus/sysfs.o: in function `dev_pm_qos_hide_perf_limit':
>> sysfs.c:(.text+0x170): multiple definition of `dev_pm_qos_hide_perf_limit'; sound/aoa/soundbus/core.o:core.c:(.text+0x6d0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
