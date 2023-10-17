Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F2182DC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 07:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDZmlhpq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697528088; x=1729064088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NrnpqRuuSjP/EWsVL/hwgbB/HmTFSuGtI09GSFJa+Fg=;
  b=EDZmlhpqWx4W3gjHD5xdYmjtTgHQJendTFMnJq2sfvf8rQZEEkVXy7eo
   s10B+RrAp++8KWAEf/iV+1PlExNQZ8yx3Njxxvbyyik6GuI88TIHRkF9l
   is1nYpxk0Tg1T6GYOVd1gTPCED7XA7UMXW0c5ans/65upl8OiSyFFtHfN
   pDaBWXLj0neerVoqlD9u/Gug04v+SfSoI4RvlexskZPskpFl1+9XNu5TJ
   YnBD7O1jbrZ/9PK+1p2C6u/HAfJGddvjzCPcRJDxAd4CthBjKsD4r8Mo7
   HmxMBKXwWEcMMLIpw2YR30yxSZWdkNnv4kjLtLjGuX4UbQ5LUuqscvnYW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="365072789"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="365072789"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 00:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1003259390"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="1003259390"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2023 00:34:24 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qseaq-0009GH-0C;
	Tue, 17 Oct 2023 07:34:20 +0000
Date: Tue, 17 Oct 2023 15:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] thermal/core: Hardening the self-encapsulation
Message-ID: <202310171543.Dc9OqudQ-lkp@intel.com>
References: <20231012102700.2858952-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012102700.2858952-1-daniel.lezcano@linaro.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.6-rc6]
[also build test WARNING on linus/master next-20231016]
[cannot apply to rafael-pm/thermal]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/thermal-core-Reorder-the-headers-inclusion/20231017-105029
base:   v6.6-rc6
patch link:    https://lore.kernel.org/r/20231012102700.2858952-1-daniel.lezcano%40linaro.org
patch subject: [PATCH 1/2] thermal/core: Hardening the self-encapsulation
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310171543.Dc9OqudQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171543.Dc9OqudQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171543.Dc9OqudQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/thermal/tegra/soctherm.c:36:
>> drivers/thermal/tegra/../thermal_core.h:18:2: warning: #warning This header can only be included by the thermal core code [-Wcpp]
      18 | #warning This header can only be included by the thermal core code
         |  ^~~~~~~


vim +18 drivers/thermal/tegra/../thermal_core.h

    16	
    17	#ifndef THERMAL_CORE_SUBSYS
  > 18	#warning This header can only be included by the thermal core code
    19	#endif
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
