Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0EE8827
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682631035; x=1714167035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E7BGj3Gl5g9SCm5OO2PVG1LtEWlAgM0zB1osTNxvMHw=;
  b=Gb+z36IK772Vm9MjX9j3FIw2zvPDjzQP4hDSma3uFF4W+0iEbUbgYnAx
   wl30eROZ/fz17/yPNryO++1724acodU6XEe3KJS9NguXg6t6czDi7ZeA5
   1n2/TDIgvP3bJewylknsjcYnJroEOvIkviT2fvYkDkrZ45NaUFRYIDq0r
   1nrUWxHXENJQoo3UfbZZq3yBOaFpl1vcT1rxDLZD9dLB5arM3daURtSAY
   vgNTCpQ/ShHaUhBRTEoKylWsu6P/BWH9rMO1lMTEyKiDMr/eAY81ilMIV
   qCnnLIeBOo+Lpy89DKkKGDIOaa4SqO5+2kn+KbvRFJBUoyW+NgJ53CW/H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="345028870"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="345028870"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 14:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="838570345"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="838570345"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2023 14:30:27 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps9C6-00008N-2M;
	Thu, 27 Apr 2023 21:30:26 +0000
Date: Fri, 28 Apr 2023 05:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bharat Bhushan <bbhushan2@marvell.com>, wim@linux-watchdog.org,
	linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	sgoutham@marvell.com
Cc: oe-kbuild-all@lists.linux.dev, Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [PATCH 2/2 v4] Watchdog: Add marvell GTI watchdog driver
Message-ID: <202304280541.b8a8NzCY-lkp@intel.com>
References: <20230427071408.8493-2-bbhushan2@marvell.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427071408.8493-2-bbhushan2@marvell.com>

Hi Bharat,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on groeck-staging/hwmon-next linus/master v6.3 next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharat-Bhushan/Watchdog-Add-marvell-GTI-watchdog-driver/20230427-154706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230427071408.8493-2-bbhushan2%40marvell.com
patch subject: [PATCH 2/2 v4] Watchdog: Add marvell GTI watchdog driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230428/202304280541.b8a8NzCY-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/86559345de78e2e9f634ba9835a63764b6f88fd5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bharat-Bhushan/Watchdog-Add-marvell-GTI-watchdog-driver/20230427-154706
        git checkout 86559345de78e2e9f634ba9835a63764b6f88fd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280541.b8a8NzCY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/marvell_gti_wdt.c:13:10: fatal error: asm/arch_timer.h: No such file or directory
      13 | #include <asm/arch_timer.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/watchdog/marvell_gti_wdt.c

    12	
  > 13	#include <asm/arch_timer.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
