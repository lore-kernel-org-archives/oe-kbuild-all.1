Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65E3399
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 01:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfHSJMwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699059981; x=1730595981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2PMmp9SFs/xcnAA/URLeJz24639IQ3TUMm1QqQR+6aA=;
  b=JfHSJMwL9+7uuT7YaRDmkao8STzETNxuIQcWQO0ktoqcXvmOzxPh7RHu
   5jUPqc2RzY7hkMAipGRF+T3Yx1HZIGiRl8fPGwKwOck23BNPBNLcX6ZUn
   OVNnC4doO3byKAmDp9UHL+jHfUoOpxoxtw8r2O7Q1R8OctsPNn3z7h6yN
   pZd0MSXZZfJ4sE9vYkmXAeLcIqbdpILp9dfkqtjpaG3afnOs0q+ZcFo6z
   cZJzEinuB1AunM3Y10754jzse14pu/9TmevBcHfOjzA8f6XPZm8gdbj5U
   4kc/CxZntv/vmFIDYPSyVk8YCW6EB2G3Jaij4inUHguIuAt8xFjNd0smA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="379442798"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="379442798"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 18:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="9907473"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 18:06:20 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz57B-0003AB-31;
	Sat, 04 Nov 2023 01:06:17 +0000
Date: Sat, 4 Nov 2023 09:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dongmin Lee <ldmldm05@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dongmin Lee <ldmldm05@gmail.com>
Subject: Re: [PATCH] kernel/reboot: Explicitly notify if halt occurred
 instead of power off
Message-ID: <202311040832.yiyrijgk-lkp@intel.com>
References: <20231103061448.68118-1-ldmldm05@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103061448.68118-1-ldmldm05@gmail.com>

Hi Dongmin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bc3012f4e3a9765de81f454cb8f9bb16aafc6ff5]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongmin-Lee/kernel-reboot-Explicitly-notify-if-halt-occurred-instead-of-power-off/20231103-142501
base:   bc3012f4e3a9765de81f454cb8f9bb16aafc6ff5
patch link:    https://lore.kernel.org/r/20231103061448.68118-1-ldmldm05%40gmail.com
patch subject: [PATCH] kernel/reboot: Explicitly notify if halt occurred instead of power off
config: x86_64-randconfig-123-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040832.yiyrijgk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040832.yiyrijgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040832.yiyrijgk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/reboot.c:66:5: sparse: sparse: symbol 'poweroff_fallback_to_halt' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
