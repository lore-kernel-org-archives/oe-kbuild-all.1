Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD85820CA8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 19:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691696851; x=1723232851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3MY3s53UZKWpq2GKsgaQvwwSJQbcz1LyovPuyGXZ4w=;
  b=fc07Ed3WPG3dq26fWeoOnpKchhJh/ENyFzWYOJYvXT9EjtLfYSMIPjeh
   6pfyRTkrPSP5eIjcMl26gcXrNkyok6Y2DwKb+viTXbC71eTxDJDX1/sLw
   wZhTXWFlExijfaDXV9G/scJ/tOZ/DziyVPikikUAdo/xXVhX8GYT4Nz7s
   J20zRY3OIhSbwOlHECsDc3B894/dTi9gPm8zBcCfDTfUu9IZrlTzHsFZ7
   yrx6EgTmA8jstDXSk/0zHXry+oktWo/tmT+RmJswd6SewPXuVVwT6F9Hd
   1OfLhYsXje6Z9wTPk4TN4WfZNBkbE/xPltvLBWWJZQ68JSIWgo4yU6tvs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="371512694"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="371512694"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 12:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="856024227"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="856024227"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Aug 2023 12:47:18 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUBcs-0007DU-02;
	Thu, 10 Aug 2023 19:47:18 +0000
Date: Fri, 11 Aug 2023 03:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.5-rc5-clover 64/115] (.text+0x0): multiple
 definition of `qcom_scm_qseecom_app_get_id';
 drivers/firmware/qcom_scm.o:(.text+0x2a28): first defined here
Message-ID: <202308110333.CRtNeGNO-lkp@intel.com>
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
config: microblaze-randconfig-r006-20230810 (https://download.01.org/0day-ci/archive/20230811/202308110333.CRtNeGNO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110333.CRtNeGNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110333.CRtNeGNO-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/firmware/qcom_scm-smc.o: in function `qcom_scm_qseecom_app_get_id':
>> (.text+0x0): multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/firmware/qcom_scm.o:(.text+0x2a28): first defined here
   microblaze-linux-ld: drivers/firmware/qcom_scm-smc.o: in function `qcom_scm_qseecom_app_send':
>> (.text+0x8): multiple definition of `qcom_scm_qseecom_app_send'; drivers/firmware/qcom_scm.o:(.text+0x2a30): first defined here
   microblaze-linux-ld: drivers/firmware/qcom_scm-legacy.o: in function `qcom_scm_qseecom_app_get_id':
>> (.text+0x0): multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/firmware/qcom_scm.o:(.text+0x2a28): first defined here
   microblaze-linux-ld: drivers/firmware/qcom_scm-legacy.o: in function `qcom_scm_qseecom_app_send':
>> (.text+0x8): multiple definition of `qcom_scm_qseecom_app_send'; drivers/firmware/qcom_scm.o:(.text+0x2a30): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
