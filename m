Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18CB1860
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 07:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678604718; x=1710140718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkAky7VyI1vY3IUJayZw9KuFEd3vbvX1JJFA4r8SCTE=;
  b=JMz8RtaBFPf3/dQzfeXx4P1MKyPTNwxNzGQz7U2xeY2/TNWkIXr/8H+Y
   3lLg0NDGhJXE97qpfU1cl1rZs/JTqsX8zIYQT0Y6xc2/cvza5DPD/lTNx
   uV8krr0Tk8GUfDcOQGxWgMfNrIjUlZocRzHvCUvl2FW178ISjpIYfNbOf
   d5D9lelTLEwiPJ+XXWemk+g3NA+P7qKi6zsN6lRTvXShx8lomhSr1DoJU
   Dse2r7S37mtuNe2qdasZQLYVcpoAs+lc8jP0ftSRdDzg/pO/MGvcG7AE/
   +EfnebfizRNDhkv6DoV13iS/ycvEKLstiLrEyI9lwMWrYBOznkILWfOlJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="325323409"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="325323409"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 23:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="678307689"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="678307689"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Mar 2023 23:05:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbFla-00055E-2H;
	Sun, 12 Mar 2023 07:05:14 +0000
Date: Sun, 12 Mar 2023 15:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-hans 24/62]
 drivers/platform/x86/x86-android-tablets/lenovo.c:441: undefined reference
 to `intel_soc_pmic_exec_mipi_pmic_seq_element'
Message-ID: <202303121457.gnk66ujX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   02c464b73645404654359ad21f368a13735e2850
commit: 9b1d2662b8c586eb10cb939c7ae2c25bb36d2b61 [24/62] platform/x86: x86-android-tablets: Add touchscreen support for Lenovo Yoga Tab 3 Pro YT3-X90F
config: x86_64-randconfig-r035-20221128 (https://download.01.org/0day-ci/archive/20230312/202303121457.gnk66ujX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=9b1d2662b8c586eb10cb939c7ae2c25bb36d2b61
        git remote add pdx86-platform-drivers-x86 https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
        git fetch --no-tags pdx86-platform-drivers-x86 review-hans
        git checkout 9b1d2662b8c586eb10cb939c7ae2c25bb36d2b61
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121457.gnk66ujX-lkp@intel.com/

Note: the pdx86-platform-drivers-x86/review-hans HEAD 02c464b73645404654359ad21f368a13735e2850 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `lenovo_yt3_init':
>> drivers/platform/x86/x86-android-tablets/lenovo.c:441: undefined reference to `intel_soc_pmic_exec_mipi_pmic_seq_element'
>> ld: drivers/platform/x86/x86-android-tablets/lenovo.c:442: undefined reference to `intel_soc_pmic_exec_mipi_pmic_seq_element'


vim +441 drivers/platform/x86/x86-android-tablets/lenovo.c

   402	
   403	static int __init lenovo_yt3_init(void)
   404	{
   405		struct gpio_desc *gpiod;
   406		int ret;
   407	
   408		/*
   409		 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
   410		 * connected to GPIOs, rather then having them hardwired to the correct
   411		 * values as is normally done.
   412		 *
   413		 * The bq25890_charger driver controls these through I2C, but this only
   414		 * works if not overridden by the pins. Set these pins here:
   415		 * 1. Set /CE to 0 to allow charging.
   416		 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
   417		 *    the main "bq25892_1" charger is used when necessary.
   418		 */
   419	
   420		/* /CE pin */
   421		ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
   422		if (ret < 0)
   423			return ret;
   424	
   425		/*
   426		 * The gpio_desc returned by x86_android_tablet_get_gpiod() is a "raw"
   427		 * gpio_desc, that is there is no way to pass lookup-flags like
   428		 * GPIO_ACTIVE_LOW. Set the GPIO to 0 here to enable charging since
   429		 * the /CE pin is active-low, but not marked as such in the gpio_desc.
   430		 */
   431		gpiod_set_value(gpiod, 0);
   432	
   433		/* OTG pin */
   434		ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
   435		if (ret < 0)
   436			return ret;
   437	
   438		gpiod_set_value(gpiod, 0);
   439	
   440		/* Enable the regulators used by the touchscreen */
 > 441		intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9b, 0x02, 0xff);
 > 442		intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa0, 0x02, 0xff);
   443	
   444		return 0;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
