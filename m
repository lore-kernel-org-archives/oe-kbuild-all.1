Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0023820E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 10:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675075803; x=1706611803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ePsH3c1bFgToe3/QKHTslftXeO8bV+ysGR2OHez72Og=;
  b=IGDObFEG5Jy8PMfHJt523xHQicmzdDxEsiyyq7U1zKATD99AmPyJ+8dR
   elJ3YpEO3qTVg1Tgwu75DwCyg03bExEATdLVywMBARTKIDtkzLWLT3/bt
   w563H9StTSXlRCy/EkZNpx7sj8pJoMpdJh4FMc6qWpbWKG6YCpw4I0/wZ
   0SzqaS8ZDoMYu9M+VyucukcxS9RIgC4GvGm7EWAmGme4hPGP5jOnNedDF
   U/ItuqI7M3OQind6Xsd7BLfI3A+C50k93vJ8kCykotvBb2mEC+8j2eW9i
   8/NpJdxSqKFmaGvvEc/qkpg3iFa1hBSsEc/au8hANkI7ucmBptnX4PI+w
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307873285"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="307873285"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 02:50:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="657413176"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="657413176"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jan 2023 02:50:01 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMRjc-0003Zi-0F;
	Mon, 30 Jan 2023 10:50:00 +0000
Date: Mon, 30 Jan 2023 18:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] mmc: sdhci-of-dwcmshc: Add runtime PM support
Message-ID: <202301301851.mZZD4srv-lkp@intel.com>
References: <1675064285-25425-3-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675064285-25425-3-git-send-email-shawn.lin@rock-chips.com>

Hi Shawn,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc6 next-20230130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/mmc-sdhci-of-dwcmshc-Update-DLL-and-pre-change-delay-for-rockchip-platform/20230130-154508
patch link:    https://lore.kernel.org/r/1675064285-25425-3-git-send-email-shawn.lin%40rock-chips.com
patch subject: [PATCH 2/3] mmc: sdhci-of-dwcmshc: Add runtime PM support
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230130/202301301851.mZZD4srv-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d1d3d5eccfcbf25cd2517e1b7c0833dda42faff3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shawn-Lin/mmc-sdhci-of-dwcmshc-Update-DLL-and-pre-change-delay-for-rockchip-platform/20230130-154508
        git checkout d1d3d5eccfcbf25cd2517e1b7c0833dda42faff3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/mmc/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:25,
                    from include/linux/acpi.h:15,
                    from drivers/mmc/host/sdhci-of-dwcmshc.c:10:
>> drivers/mmc/host/sdhci-of-dwcmshc.c:681:28: error: 'dwcmshc_suspend' undeclared here (not in a function)
     681 |         SET_RUNTIME_PM_OPS(dwcmshc_suspend, dwcmshc_resume, NULL)
         |                            ^~~~~~~~~~~~~~~
   include/linux/pm.h:337:28: note: in definition of macro 'RUNTIME_PM_OPS'
     337 |         .runtime_suspend = suspend_fn, \
         |                            ^~~~~~~~~~
   drivers/mmc/host/sdhci-of-dwcmshc.c:681:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     681 |         SET_RUNTIME_PM_OPS(dwcmshc_suspend, dwcmshc_resume, NULL)
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-of-dwcmshc.c:681:45: error: 'dwcmshc_resume' undeclared here (not in a function); did you mean 'dwcmshc_remove'?
     681 |         SET_RUNTIME_PM_OPS(dwcmshc_suspend, dwcmshc_resume, NULL)
         |                                             ^~~~~~~~~~~~~~
   include/linux/pm.h:338:27: note: in definition of macro 'RUNTIME_PM_OPS'
     338 |         .runtime_resume = resume_fn, \
         |                           ^~~~~~~~~
   drivers/mmc/host/sdhci-of-dwcmshc.c:681:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     681 |         SET_RUNTIME_PM_OPS(dwcmshc_suspend, dwcmshc_resume, NULL)
         |         ^~~~~~~~~~~~~~~~~~


vim +/dwcmshc_suspend +681 drivers/mmc/host/sdhci-of-dwcmshc.c

   677	
   678	static const struct dev_pm_ops dwcmshc_pmops = {
   679		SET_SYSTEM_SLEEP_PM_OPS(dwcmshc_runtime_suspend,
   680					dwcmshc_runtime_resume)
 > 681		SET_RUNTIME_PM_OPS(dwcmshc_suspend, dwcmshc_resume, NULL)
   682	};
   683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
