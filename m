Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1117D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 04:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689742420; x=1721278420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BzzYIbJ8bvJ2F1vAa72WqUFDpBsa5Ygjfh6yfs8xawo=;
  b=ODyN3f3ozjjEsE+NnmZskJ/9ymdWPx1O9QxDPTBosY433xTj1eXXdPvB
   uLsn87YlTNqR9wwukEoJCZQAQggBfUWYglv2W0Yj3jngmnCknL53aG/hV
   Oi3iHpDTpY7dQ+wfshg1IKGdGtPoAR4lGvkrR1kfgcgVEEXn7W4VM2im5
   DMEMPPB8L4hB51QTVckYmBR1111bbWsvQlh7X7BQiPmNa+G9WVbjUTCKv
   2iQUx6S8GvXVNT940++SIGYYbGZ/pov0pXugnwBx/8k+WcaK6CPRRrPJE
   tkVNKgsisvn1YJhGtO0R52jGoEArROp9cePGJO6uhGjEghOG0tdYNNgEB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369929864"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="369929864"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 21:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970482617"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="970482617"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 21:53:38 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLzBv-00049t-0i;
	Wed, 19 Jul 2023 04:53:35 +0000
Date: Wed, 19 Jul 2023 12:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 2936/12467]
 drivers/input/touchscreen/vtl/vtl_ts.c:471:34: warning: 'vtl_ts_dt_ids'
 defined but not used
Message-ID: <202307191244.Td0wu1g5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alejandro,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   791ee62ff569635e685d84c09b2179f002c4e0bf
commit: 8457aa0d969d961d9c1c65182a84522589550c92 [2936/12467] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: i386-randconfig-i003-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191244.Td0wu1g5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191244.Td0wu1g5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191244.Td0wu1g5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/vtl/vtl_ts.c: In function 'vtl_ts_config':
   drivers/input/touchscreen/vtl/vtl_ts.c:65:24: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
      65 |         struct device *dev;
         |                        ^~~
   drivers/input/touchscreen/vtl/vtl_ts.c: At top level:
   drivers/input/touchscreen/vtl/vtl_ts.c:80:6: warning: no previous prototype for 'vtl_ts_free_gpio' [-Wmissing-prototypes]
      80 | void vtl_ts_free_gpio(void)
         |      ^~~~~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:90:6: warning: no previous prototype for 'vtl_ts_hw_reset' [-Wmissing-prototypes]
      90 | void vtl_ts_hw_reset(void)
         |      ^~~~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:228:5: warning: no previous prototype for 'vtl_ts_suspend' [-Wmissing-prototypes]
     228 | int vtl_ts_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:241:5: warning: no previous prototype for 'vtl_ts_resume' [-Wmissing-prototypes]
     241 | int vtl_ts_resume(struct device *dev)
         |     ^~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:278:6: warning: no previous prototype for 'vtl_ts_remove' [-Wmissing-prototypes]
     278 | void vtl_ts_remove(struct i2c_client *client)
         |      ^~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:364:5: warning: no previous prototype for 'ct36x_test_tp' [-Wmissing-prototypes]
     364 | int ct36x_test_tp(struct i2c_client *client)
         |     ^~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:380:5: warning: no previous prototype for 'vtl_ts_probe' [-Wmissing-prototypes]
     380 | int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
         |     ^~~~~~~~~~~~
>> drivers/input/touchscreen/vtl/vtl_ts.c:471:34: warning: 'vtl_ts_dt_ids' defined but not used [-Wunused-const-variable=]
     471 | static const struct of_device_id vtl_ts_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~


vim +/vtl_ts_dt_ids +471 drivers/input/touchscreen/vtl/vtl_ts.c

   470	
 > 471	static const struct of_device_id vtl_ts_dt_ids[] = {
   472		{ .compatible = "vtl,ct365", },
   473		{ }
   474	};
   475	MODULE_DEVICE_TABLE(of, vtl_ts_dt_ids);
   476	
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
