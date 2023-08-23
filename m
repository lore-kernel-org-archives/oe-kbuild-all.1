Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A633BA956
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 11:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692788602; x=1724324602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3i0AifbvHp2OjTqxmuAdiUVky/xt2gksjIf0uGoa9/A=;
  b=TK/AMOgNdrSK0PvaeNTTr1om26530GPR7i2tT5MrlR8Sceqxyd3O0Mxd
   pnO5RGKTZWAsZYe6VpIXY09CuQZqWoNZknW91m5OlYJfHDHkT1DGM1daY
   vBI5BlFBJ1uIXqkwfRWu4X4Ql1YRypmIE8gOsBFW/NXOsWUNNlZzAM9gA
   TAFhxUwo1webfCiAYDAjKetvZfovPAGMWssDY3KPVKdqpg3HdGIdnnDEc
   T54rkS2tb9WcUXeiuLN0PB5xCwmj2aA/K9Mh507Shclp6qjOK/2V8zqLx
   RLKE+S3KkqeFLqQbjJMpbopEGkxRmvLUFA1KXdz9DivHxH0RHVabezPNr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460500130"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460500130"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 04:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="730175868"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730175868"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 04:03:20 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYldv-00017k-0m;
	Wed, 23 Aug 2023 11:03:19 +0000
Date: Wed, 23 Aug 2023 19:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.5-rc7 63/129]
 include/linux/firmware/qcom/qcom_scm.h:133:5: warning: no previous prototype
 for 'qcom_scm_qseecom_app_get_id'
Message-ID: <202308231857.gycpjXoC-lkp@intel.com>
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
config: sparc-randconfig-r031-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231857.gycpjXoC-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231857.gycpjXoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231857.gycpjXoC-lkp@intel.com/

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
