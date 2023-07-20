Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505A91DDDE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 22:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689891868; x=1721427868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IB/OfbWoIsDuu3NBmEtwSUYPdT6dBT30Vk9Mo60BtgU=;
  b=E07mZjB6ihCZ/1SnJbuDzCKrL/n8C0iCYoftBruzOLrQOKo+ZC5VrNhs
   eJEH8vysXCbmYji7NWk/WEuEXRmOxHMw04pRGuotvIbZZdsccjmhf6RMq
   e8eisBjNa5xRaWqLruBNcQ9Wr1mDk7MkVeYOhQUqmF9EAuTx1URa65vwG
   kKCBALehiCKDMtU3O9JiLHU0Ka+QOxsZ/AnY+RJhy3Qg8NXmkvtqUNmgZ
   lTcX6TJEB30ke1EF5wUG+XCO5LXoGshnvJq5CIkjO32Abmzdy4gUYVT6u
   ZsvydM6F/difcgi7NzIGoItBz5Tqe33Nlo2eLXNLL1VN8FpLZrVQJaotx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346471117"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="346471117"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 15:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701818958"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="701818958"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 15:24:25 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMc4O-0006Zt-1p;
	Thu, 20 Jul 2023 22:24:24 +0000
Date: Fri, 21 Jul 2023 06:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 4877/12470]
 drivers/pwm/pwm-adp5585.c:213:25: error: 'adp5585_of_match' undeclared here
 (not in a function); did you mean 'adp5585_pwm_of_match'?
Message-ID: <202307210602.iJvKTmW7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   b872b1170fc8843b55e9f8838dd373ff43bb7552
commit: b2a8faf2b13f5346016ac80c42173ac714536584 [4877/12470] Merge branch 'pwm/next' into next
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230721/202307210602.iJvKTmW7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210602.iJvKTmW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210602.iJvKTmW7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from arch/powerpc/include/asm/io.h:27,
                    from include/linux/io.h:13,
                    from drivers/pwm/pwm-adp5585.c:10:
>> drivers/pwm/pwm-adp5585.c:213:25: error: 'adp5585_of_match' undeclared here (not in a function); did you mean 'adp5585_pwm_of_match'?
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/module.h:243:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:243:21: error: '__mod_of__adp5585_of_match_device_table' aliased to undefined symbol 'adp5585_of_match'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/pwm/pwm-adp5585.c:213:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +213 drivers/pwm/pwm-adp5585.c

92c8b45586c1491 Clark Wang 2022-03-16  208  
92c8b45586c1491 Clark Wang 2022-03-16  209  static const struct of_device_id adp5585_pwm_of_match[] = {
92c8b45586c1491 Clark Wang 2022-03-16  210  	{.compatible = "adp5585-pwm", },
92c8b45586c1491 Clark Wang 2022-03-16  211  	{ /* sentinel */ }
92c8b45586c1491 Clark Wang 2022-03-16  212  };
92c8b45586c1491 Clark Wang 2022-03-16 @213  MODULE_DEVICE_TABLE(of, adp5585_of_match);
92c8b45586c1491 Clark Wang 2022-03-16  214  

:::::: The code at line 213 was first introduced by commit
:::::: 92c8b45586c149160a8a29356d97cdd721d9717a MLK-25922-1 pwm: adp5585: add adp5585 PWM support

:::::: TO: Clark Wang <xiaoning.wang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
