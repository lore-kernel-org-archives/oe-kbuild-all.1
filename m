Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD681FDA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 18:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690741974; x=1722277974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sL6d6P8UdR2lr8TfBXgD65skcHcUh5ufDhWMwFPHioQ=;
  b=GJMIQ2hbJg8K4M/3ZDVrIRb39Vibq3biI0SALRgn2ydKWzd33qBL9fQ+
   MqIlHt4JuJB+DBqlWvFbilY61+8uSSZim7QwBkIkcJRrPFt0ghTb57CgR
   baveVmVT08qtnJyT1GsAb8Zsv2XfpIIvC42dMR6+oakFtgW/oIiCd7BFe
   L7sNLeMu5DxdYjo5hnNFNKzenG4mZTx2rfQxVuyYUAVH0cKUsuBuS8TV4
   yuEFcPaG6PBaAouTzTOf9qwTYx2GQMX4nNE/Wc0pwQtlhiZAzrFu1A9rV
   EeRviXs2YkbvJPmPn54pvj2mR7timvbJkWAhlPm2dMvsGKBCbS4nZYg1h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="367758200"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="367758200"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 11:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="841955619"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="841955619"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2023 11:32:52 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQBDo-0004jf-04;
	Sun, 30 Jul 2023 18:32:52 +0000
Date: Mon, 31 Jul 2023 02:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/3] firmware: qcom_scm: Add support for Qualcomm
 Secure Execution Environment SCM interface
Message-ID: <202307310244.vaA3izJB-lkp@intel.com>
References: <20230730161906.606163-3-luzmaximilian@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730161906.606163-3-luzmaximilian@gmail.com>

Hi Maximilian,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc3 next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maximilian-Luz/lib-ucs2_string-Add-UCS-2-strscpy-function/20230731-002132
base:   linus/master
patch link:    https://lore.kernel.org/r/20230730161906.606163-3-luzmaximilian%40gmail.com
patch subject: [PATCH v5 2/3] firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface
config: arc-randconfig-r023-20230731 (https://download.01.org/0day-ci/archive/20230731/202307310244.vaA3izJB-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310244.vaA3izJB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310244.vaA3izJB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/qcom_qseecom.c: In function 'qseecom_client_release':
>> drivers/firmware/qcom_qseecom.c:24:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
      24 |         kfree(client);
         |         ^~~~~
   drivers/firmware/qcom_qseecom.c: In function 'qseecom_client_register':
>> drivers/firmware/qcom_qseecom.c:50:18: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      50 |         client = kzalloc(sizeof(*client), GFP_KERNEL);
         |                  ^~~~~~~
>> drivers/firmware/qcom_qseecom.c:50:16: warning: assignment to 'struct qseecom_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      50 |         client = kzalloc(sizeof(*client), GFP_KERNEL);
         |                ^
   cc1: some warnings being treated as errors


vim +/kfree +24 drivers/firmware/qcom_qseecom.c

    19	
    20	static void qseecom_client_release(struct device *dev)
    21	{
    22		struct qseecom_client *client = container_of(dev, struct qseecom_client, aux_dev.dev);
    23	
  > 24		kfree(client);
    25	}
    26	
    27	static void qseecom_client_remove(void *data)
    28	{
    29		struct qseecom_client *client = data;
    30	
    31		auxiliary_device_delete(&client->aux_dev);
    32		auxiliary_device_uninit(&client->aux_dev);
    33	}
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
