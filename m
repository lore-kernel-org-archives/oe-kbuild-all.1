Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844A11117
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 16:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687021066; x=1718557066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mpP2Rwz0X8x/cD36DXBLTa9/ZrULmbxkPlEnIOXUNJ0=;
  b=a0qlQ12Zv59Mce+CZvk1vz95BQfb4WQCOpCLUu93Hjl0GHCvD6xCNgh7
   enF5RfqXiqE3crz5xqBrAr2gp8RxYXpKRQ7TC162webbRlodDJLGc1ylU
   OMsuFMU46rVDG0/C4UHcpMftm/QIMdG3SVSbbnhXXnB+fvknYTOI6pQDj
   8A76UrK77ACDl5sjgQ+J+1PT7mI35647Y/aNCJUCsBbId1S2vI37jkkAy
   uluNhBjHXrn6oR4+O56MIqhqoCNnpqVeUo2FKmTdpo+wqsV/OCLhfTPse
   jq9i4QVNMvdVKt/wIQX/YZIQVXJNzveZuVrDThGqr5VxNSTII6hIwaCLz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="359416022"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="359416022"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 09:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="742983536"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="742983536"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Jun 2023 09:57:44 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAZF9-0002x4-0M;
	Sat, 17 Jun 2023 16:57:43 +0000
Date: Sun, 18 Jun 2023 00:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 9/9999] drivers/mfd/atmel-flexcom.c:108:32:
 warning: 'atmel_flexcom_pm_ops' defined but not used
Message-ID: <202306180021.vMJsVpKq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Claudiu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   471e639e59d128f4bf58000a118b2ceca3893f98
commit: 6b6e7150c18becf39038245123ee07931149a105 [9/9999] mfd: atmel-flexcom: Use .resume_noirq
config: i386-randconfig-r033-20230617 (https://download.01.org/0day-ci/archive/20230618/202306180021.vMJsVpKq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180021.vMJsVpKq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180021.vMJsVpKq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/mfd/atmel-flexcom.c:10:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1358:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1358 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1344:27: note: 'mem_section' declared here
    1344 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/mfd/atmel-flexcom.c: At top level:
>> drivers/mfd/atmel-flexcom.c:108:32: warning: 'atmel_flexcom_pm_ops' defined but not used [-Wunused-const-variable=]
     108 | static const struct dev_pm_ops atmel_flexcom_pm_ops = {
         |                                ^~~~~~~~~~~~~~~~~~~~


vim +/atmel_flexcom_pm_ops +108 drivers/mfd/atmel-flexcom.c

   107	
 > 108	static const struct dev_pm_ops atmel_flexcom_pm_ops = {
   109		.resume_noirq = atmel_flexcom_resume_noirq,
   110	};
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
