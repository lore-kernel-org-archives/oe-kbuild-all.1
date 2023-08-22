Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CAF2B544
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692726229; x=1724262229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yamNnLdY8jW9piBcT7ht5yQlfTiWqtgQ4dE3wT48Fv0=;
  b=FVjkwh7RBzw9iXp4iao/akqAcTjErS1t3VDoJhg76MS/6Jmh2BO5aVkR
   f+R3xPS5W+ebDFaCecopJAq/INmXrqsYmSeL/v+ifhLhS3lz03CxKNC1R
   lgQBvTYoC8xD2Ol0D2cLgsFGcAe7jbf6WR6o8J8r5e1gknd+WibOlcKPN
   Xrx64jwjEz6rKZtCzG3MkqVaSEBQdmXMcWqRYmkpr711xT1+KbHsNVUzB
   9v3pqDpvqGNce63KUxvrVAX0aUKAscUrRZI1zqG/eYfOndxuJ6RczcGad
   Emq+2cti5BEIyQDEkwYmwF9Wi4A86nmvuWrYaqbA5qe1jQUk5EDnj3kSu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376687928"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="376687928"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 10:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="860014058"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="860014058"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 10:43:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYVPt-0000Nq-1n;
	Tue, 22 Aug 2023 17:43:45 +0000
Date: Wed, 23 Aug 2023 01:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.5-rc7 63/129]
 drivers/firmware/qcom_qseecom.c:50:16: warning: assignment to 'struct
 qseecom_client *' from 'int' makes pointer from integer without a cast
Message-ID: <202308230153.RmOR8Z9U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.5-rc7
head:   68f425346397c1806f828d4ee58e9468c924f408
commit: defc461d679dad2ed03d8e760f2e39af95e320c5 [63/129] firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230823/202308230153.RmOR8Z9U-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230153.RmOR8Z9U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230153.RmOR8Z9U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/qcom_qseecom.c: In function 'qseecom_client_release':
   drivers/firmware/qcom_qseecom.c:24:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
      24 |         kfree(client);
         |         ^~~~~
   drivers/firmware/qcom_qseecom.c: In function 'qseecom_client_register':
   drivers/firmware/qcom_qseecom.c:50:18: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      50 |         client = kzalloc(sizeof(*client), GFP_KERNEL);
         |                  ^~~~~~~
>> drivers/firmware/qcom_qseecom.c:50:16: warning: assignment to 'struct qseecom_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      50 |         client = kzalloc(sizeof(*client), GFP_KERNEL);
         |                ^
   cc1: some warnings being treated as errors


vim +50 drivers/firmware/qcom_qseecom.c

    34	
    35	static int qseecom_client_register(struct platform_device *qseecom_dev,
    36					   const struct qseecom_app_desc *desc)
    37	{
    38		struct qseecom_client *client;
    39		u32 app_id;
    40		int ret;
    41	
    42		/* Try to find the app ID, skip device if not found */
    43		ret = qcom_scm_qseecom_app_get_id(desc->app_name, &app_id);
    44		if (ret)
    45			return ret == -ENOENT ? 0 : ret;
    46	
    47		dev_info(&qseecom_dev->dev, "setting up client for %s\n", desc->app_name);
    48	
    49		/* Allocate and set-up the client device */
  > 50		client = kzalloc(sizeof(*client), GFP_KERNEL);
    51		if (!client)
    52			return -ENOMEM;
    53	
    54		client->aux_dev.name = desc->dev_name;
    55		client->aux_dev.dev.parent = &qseecom_dev->dev;
    56		client->aux_dev.dev.release = qseecom_client_release;
    57		client->app_id = app_id;
    58	
    59		ret = auxiliary_device_init(&client->aux_dev);
    60		if (ret) {
    61			kfree(client);
    62			return ret;
    63		}
    64	
    65		ret = auxiliary_device_add(&client->aux_dev);
    66		if (ret) {
    67			auxiliary_device_uninit(&client->aux_dev);
    68			return ret;
    69		}
    70	
    71		ret = devm_add_action_or_reset(&qseecom_dev->dev, qseecom_client_remove, client);
    72		if (ret)
    73			return ret;
    74	
    75		return 0;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
