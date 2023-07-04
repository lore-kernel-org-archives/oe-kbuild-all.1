Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D505E4431
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688467373; x=1720003373;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3CQ1tTl22nOiPye/bE0JkiW9wIH+fqqYlCYmSWJUdYE=;
  b=FR0PWJgPPbD8mLexFJw0blRYtIRdygKio7mYel6hNX5CjIDXCsKVKT2x
   dg8vC31TL6VDCZbSzJb+6LBk+vpQwDYCaRGkaQkcaaqp8l7d9amjxFFuX
   fhIsis/eOoRQv2vl/pCcZjYkrH/d8xTbmKlmkqcInTo9rl+C+uDr4X7JK
   zk581ZXvEZrZqYTx9PU0mKl9mVo+QqIv6lVEMVU5o1M5QJ5Hs2mQO2UGs
   fcbZH6Hfq8hNiLqILo8zxo3m1V0/VLvaS0MtiZf4GFoaXNjcTwt/IDY67
   Z+O7iVTGvpsM/VN7F+hnWEoGjWIVGowdZTrd4bq44bpK8hjxUPrxf6f5p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361956221"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="361956221"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 03:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748385220"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="748385220"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Jul 2023 03:42:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGdUg-000ICV-0Y;
	Tue, 04 Jul 2023 10:42:50 +0000
Date: Tue, 4 Jul 2023 18:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:debugfs_cleanup 1/7]
 drivers/hwmon/oxp-sensors.c:437:23: error: implicit declaration of function
 'devm_device_add_groups'; did you mean 'devm_device_add_group'?
Message-ID: <202307041850.vqrtdhj7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_cleanup
head:   3b24ae38f8fe0b3d0877a909072bf871c65654a9
commit: 1893121f03c6880cd4942d43f47fd7318a713809 [1/7] driver core: remove devm_device_add_groups()
config: x86_64-randconfig-x012-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041850.vqrtdhj7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041850.vqrtdhj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041850.vqrtdhj7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/oxp-sensors.c: In function 'oxp_platform_probe':
>> drivers/hwmon/oxp-sensors.c:437:23: error: implicit declaration of function 'devm_device_add_groups'; did you mean 'devm_device_add_group'? [-Werror=implicit-function-declaration]
     437 |                 ret = devm_device_add_groups(dev, oxp_ec_groups);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       devm_device_add_group
   cc1: some warnings being treated as errors


vim +437 drivers/hwmon/oxp-sensors.c

ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  411  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  412  /* Initialization logic */
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  413  static int oxp_platform_probe(struct platform_device *pdev)
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  414  {
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  415  	const struct dmi_system_id *dmi_entry;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  416  	struct device *dev = &pdev->dev;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  417  	struct device *hwdev;
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  418  	int ret;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  419  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  420  	/*
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  421  	 * Have to check for AMD processor here because DMI strings are the
ebd4bfee2b972d Derek J. Clark            2022-12-28  422  	 * same between Intel and AMD boards, the only way to tell them apart
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  423  	 * is the CPU.
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  424  	 * Intel boards seem to have different EC registers and values to
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  425  	 * read/write.
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  426  	 */
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  427  	dmi_entry = dmi_first_match(dmi_table);
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  428  	if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  429  		return -ENODEV;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  430  
5d06ec4279a860 Joaquín Ignacio Aramendía 2023-04-29  431  	board = (enum oxp_board)(unsigned long)dmi_entry->driver_data;
3ca0f12a02582c Joaquín Ignacio Aramendía 2022-11-25  432  
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  433  	switch (board) {
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  434  	case aok_zoe_a1:
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  435  	case oxp_mini_amd_a07:
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  436  	case oxp_mini_amd_pro:
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11 @437  		ret = devm_device_add_groups(dev, oxp_ec_groups);
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  438  		if (ret)
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  439  			return ret;
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  440  		break;
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  441  	default:
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  442  		break;
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  443  	}
be144ee4912721 Joaquín Ignacio Aramendía 2023-06-11  444  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  445  	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  446  						     &oxp_ec_chip_info, NULL);
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  447  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  448  	return PTR_ERR_OR_ZERO(hwdev);
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  449  }
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  450  

:::::: The code at line 437 was first introduced by commit
:::::: be144ee49127216b456da26f1a32b6ba281ac505 hwmon: (oxp-sensors) Add tt_toggle attribute on supported boards

:::::: TO: Joaquín Ignacio Aramendía <samsagax@gmail.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
