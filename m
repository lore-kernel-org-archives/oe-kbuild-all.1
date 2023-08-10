Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C221ADF9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691657227; x=1723193227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IN8dBoHmf3m09TM3IfwdxHPSfi7iW7puo/XoxQ0v/bs=;
  b=D5wEBW0lZZj0O2hAYKtjTHo9c/Pivdg35h9yjDQoHatAHAM5snkh4qex
   dqP/b6cMriKAO/iZlHaCVQ/jVqjN+qHySUN55OR8tMqeVpahEtyl9q5P6
   VPvz5HeGwRAqM6YPtSi2mt+QEBrS8TFcwKmdH6KNyfW24G5Z+yHFovfrT
   f8c1w3tOTsEgcwynJe1flb1Rt6pxsT7THmaQIIlpO9V6a7CKsoMkIMtgZ
   g1t6ya2NnLfIbBDrX+7pIzuRY1eRPuJYapUFsVFvRwnI9traHCIF0LiJq
   GssZB7Y+pdf4IaWX+Zxe8g60aaCT79AgsNlzlE8Y6be9dac3hqgd+4YVj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375057711"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="375057711"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 01:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="875615028"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Aug 2023 01:47:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU1Jv-0006s8-39;
	Thu, 10 Aug 2023 08:47:03 +0000
Date: Thu, 10 Aug 2023 16:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.5-rc5-clover 64/115]
 include/linux/firmware/qcom/qcom_scm.h:133:5: warning: no previous prototype
 for 'qcom_scm_qseecom_app_get_id'
Message-ID: <202308101642.5t1fn71P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.5-rc5-clover
head:   5d47ba475cde92b762751035d1d4faa8f696eec7
commit: 5edf9aaedeb63806137481219aa793fd06dd5afe [64/115] firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface
config: arc-randconfig-r043-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101642.5t1fn71P-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101642.5t1fn71P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101642.5t1fn71P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/qcom_scm-smc.c:11:
>> include/linux/firmware/qcom/qcom_scm.h:133:5: warning: no previous prototype for 'qcom_scm_qseecom_app_get_id' [-Wmissing-prototypes]
     133 | int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/firmware/qcom/qcom_scm.h:138:5: warning: no previous prototype for 'qcom_scm_qseecom_app_send' [-Wmissing-prototypes]
     138 | int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size, void *rsp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/qcom_scm_qseecom_app_get_id +133 include/linux/firmware/qcom/qcom_scm.h

   132	
 > 133	int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
   134	{
   135		return -EINVAL;
   136	}
   137	
 > 138	int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size, void *rsp,
   139				      size_t rsp_size)
   140	{
   141		return -EINVAL;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
