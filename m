Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E342A7E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683009558; x=1714545558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JHmOyhknu72fwCyTp0J5ERbzi4vLQDGwzRbCdXl/ONg=;
  b=PHcdwRlliVhpGX0tSo1VQbJ5TlFt5y0PWh/4/EKLqhwb/Q5YQEqyJKmz
   yE+kgCpDMo/jmUtnXxMeTteQNBBxWSy5CdJ6Q1M0ucTx8vH8/M+U7hnpt
   YNm1v8dpYaNdUF9+ZhYBOXUybXXzyxz7bY84izqt3jJC6ewrDbSWwm+IA
   JxDDvqON0sJCZXm9EUJWoBdJpUB6vk7DMUBWisLRg+PGTJcJwsMZCWWJ6
   JGjVol6DXUpB3EY3d+/+oUxgbA9CpMzbBca2yIb+IuhfRlVj0T2nlrZQe
   dD58eDVUwFRXBbEsP1iEEZAd6LykjRJJL2ne2oo2p9VA9qIhEfOC6FQ4F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="345798440"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="345798440"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 23:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="942330850"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="942330850"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 May 2023 23:39:14 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptjfO-0000tI-0f;
	Tue, 02 May 2023 06:39:14 +0000
Date: Tue, 2 May 2023 14:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bharat Bhushan <bbhushan2@marvell.com>, wim@linux-watchdog.org,
	linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	sgoutham@marvell.com
Cc: oe-kbuild-all@lists.linux.dev, Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [PATCH 2/2 v3] Watchdog: Add marvell octeontx2 watchdog driver
Message-ID: <202305021447.bgPFpj8n-lkp@intel.com>
References: <20230425081926.9234-2-bbhushan2@marvell.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425081926.9234-2-bbhushan2@marvell.com>

Hi Bharat,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on groeck-staging/hwmon-next linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharat-Bhushan/Watchdog-Add-marvell-octeontx2-watchdog-driver/20230425-162039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230425081926.9234-2-bbhushan2%40marvell.com
patch subject: [PATCH 2/2 v3] Watchdog: Add marvell octeontx2 watchdog driver
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230502/202305021447.bgPFpj8n-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5b2d826a13c7553b51784a1fb56606bfda9f81d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bharat-Bhushan/Watchdog-Add-marvell-octeontx2-watchdog-driver/20230425-162039
        git checkout 5b2d826a13c7553b51784a1fb56606bfda9f81d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021447.bgPFpj8n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/octeontx2_wdt.c:13:10: fatal error: asm/arch_timer.h: No such file or directory
      13 | #include <asm/arch_timer.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/watchdog/octeontx2_wdt.c

    12	
  > 13	#include <asm/arch_timer.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
