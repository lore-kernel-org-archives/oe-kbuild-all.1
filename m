Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47EE2F3E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 23:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677714522; x=1709250522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=438mUqu27Pg/8R7tElJ2t97iI5443sfkue+J0vJ5gNg=;
  b=B0GUqvg3JvreyL0/dcGyaPzCMgNvt53YSG2NpuHtWyXUqLfWDgftwDq7
   JMjtPFk38HScHp8h+hAY/s2r8WmlrBgHb5nyMThiMDe57xB+zOFP1Myw4
   dkEjJTtL6Zn7Byr1m0O8PTfJ9oup902rbFiA8aHwOE8Rv8ZvOw9gWnk2S
   rci/SGUAGtSPNiwgXh6W1tB7WX7oWWGXgfD/aGxKGZtmvun6/WELUTpUJ
   DGpjMF2i1fsdfRqb3LQabVjoZxf1gBtggsPqKaTI1deJYpz7Tl2rl4rGd
   T41YDYnewArOyUkuzqAmsMVWBqTi+06Wf2YXuFw/0iB86ahb5hs0nFnG4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="322831143"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="322831143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798604515"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="798604515"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Mar 2023 15:48:39 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXWBa-0006Vf-2d;
	Wed, 01 Mar 2023 23:48:38 +0000
Date: Thu, 2 Mar 2023 07:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>, rafael@kernel.org, lenb@kernel.org,
	viresh.kumar@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, pmladek@suse.com, mcgrof@kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v3] ACPI: cpufreq: use a platform device to load ACPI PPC
 and PCC drivers
Message-ID: <202303020759.pwVPib0p-lkp@intel.com>
References: <20230301085717.10411-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301085717.10411-1-petr.pavlu@suse.com>

Hi Petr,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.2 next-20230301]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Pavlu/ACPI-cpufreq-use-a-platform-device-to-load-ACPI-PPC-and-PCC-drivers/20230301-165927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230301085717.10411-1-petr.pavlu%40suse.com
patch subject: [PATCH v3] ACPI: cpufreq: use a platform device to load ACPI PPC and PCC drivers
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303020759.pwVPib0p-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/59eb26f9b02165cc5c5fb6514ff4d2a8d7a91356
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Petr-Pavlu/ACPI-cpufreq-use-a-platform-device-to-load-ACPI-PPC-and-PCC-drivers/20230301-165927
        git checkout 59eb26f9b02165cc5c5fb6514ff4d2a8d7a91356
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020759.pwVPib0p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/acpi_processor.c:177:13: warning: no previous prototype for 'acpi_pcc_cpufreq_init' [-Wmissing-prototypes]
     177 | void __init acpi_pcc_cpufreq_init(void) {}
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/acpi_pcc_cpufreq_init +177 drivers/acpi/acpi_processor.c

   162	
   163	#ifdef CONFIG_X86
   164	/* Check presence of Processor Clocking Control by searching for \_SB.PCCH. */
   165	void __init acpi_pcc_cpufreq_init(void)
   166	{
   167		acpi_status status;
   168		acpi_handle handle;
   169	
   170		status = acpi_get_handle(NULL, "\\_SB", &handle);
   171		if (ACPI_FAILURE(status))
   172			return;
   173		if (acpi_has_method(handle, "PCCH"))
   174			cpufreq_add_device("pcc-cpufreq");
   175	}
   176	#else
 > 177	void __init acpi_pcc_cpufreq_init(void) {}
   178	#endif /* CONFIG_X86 */
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
