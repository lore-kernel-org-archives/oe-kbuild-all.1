Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396CE13ADD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 08:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691050684; x=1722586684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dAj0t1epnU7drScZhZOWQ9SbnC9aKieN0yfqW2Swjhk=;
  b=BnXdCFpAV9a9iAchMC93HgjwuHuW2F6us4tSW2Bo3sKAnoHo80U7t811
   bQ71tR5b+OuWgVHk6eiM1NyqkIWpZKBzVcOa3bjmNer5gRL9/w8905yxD
   JOJE5eqHEPx8IGrOPqtadsAwwc9uX8A7+GPBFD2Lv4fUxxD8FRSh5FvF/
   P8nA/8TXeWm9XirJp3tvmB51RIJmAZdOUkbTJgWOBfnt8wkXy7jZSWbkJ
   biAoZSX/Kie6HUH/dDTPru3qVtJgbkVSQ/TN9wfGjbJCwa50woW6sw/Sc
   q2TYzLR+uwLRtMrM3vCIrhJ34ESgf6a2nxH3APfR7ylHP7povQvDDM34T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="400742294"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="400742294"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764506353"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="764506353"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Aug 2023 01:18:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRTWy-0001tb-39;
	Thu, 03 Aug 2023 08:18:00 +0000
Date: Thu, 3 Aug 2023 16:17:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Babu <ramesh.babu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Guneshwor Singh <guneshwor.o.singh@intel.com>
Subject: [intel-lts:4.19/android_s 3772/30000]
 drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not
 used
Message-ID: <202308031637.7RWslT6N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ramesh,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: 90f1d221943f2adfc6a62813733d6dc0347ab20c [3772/30000] ASoC: mfd: Intel changes for WM8281 integration on K4.0
config: i386-buildonly-randconfig-r004-20230731 (https://download.01.org/0day-ci/archive/20230803/202308031637.7RWslT6N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031637.7RWslT6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031637.7RWslT6N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/idr.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:16,
                    from include/linux/i2c.h:30,
                    from drivers/mfd/arizona-i2c.c:14:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/mfd/arizona-i2c.c: At top level:
>> drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not used [-Wunused-const-variable=]
     115 | static const struct arizona_micd_range micd_ctp_ranges[] = {
         |                                        ^~~~~~~~~~~~~~~


vim +/micd_ctp_ranges +115 drivers/mfd/arizona-i2c.c

   113	
   114	/***********WM8280 Codec Driver platform data*************/
 > 115	static const struct arizona_micd_range micd_ctp_ranges[] = {
   116		{ .max =  11, .key = BTN_0 },
   117		{ .max =  28, .key = BTN_1 },
   118		{ .max =  54, .key = BTN_2 },
   119		{ .max = 100, .key = BTN_3 },
   120		{ .max = 186, .key = BTN_4 },
   121		{ .max = 430, .key = BTN_5 },
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
