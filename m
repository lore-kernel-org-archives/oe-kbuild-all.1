Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF221E51F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691661609; x=1723197609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zZ1J7SHtimgldWJq6l7B1H7kRqNAgvI7nnt1lWdqV1E=;
  b=BLGXTqazE32o23HRLQnKJeAvMZsYFIKBYg+NXVvtMF5pqi0rJooYQwV2
   HRtb+YXQ3N2+WlvBRsSdSXQo8SAlCwnDy0JLvTHtXSnmfHMg5JvuegDJv
   OuU62jSCcuHbcz4MVOA7rTlz9PYegaZEw96gTdQz7Y5BHXYZiN0IPckyX
   Nr51/i1u3FQ0ApDOGj3nuJVKy9KFW3Ewv7eQzvPYsxWIV4ZLwf8POmJlt
   2tvHFOg4GeLrofAU+naEGMq+R0U6068drAxRO34NAMEKy0pNyAhHmfeiR
   UlKE35cNI/d7t9WtlT9/HnaHOMVJhRLiAKzcETSGZMLh2Og8oxu6L6xyh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356323989"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="356323989"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 03:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="822183369"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="822183369"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2023 03:00:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU2Sc-0006uu-0h;
	Thu, 10 Aug 2023 10:00:06 +0000
Date: Thu, 10 Aug 2023 17:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.5-rc5-clover 64/115]
 qcom_scm.c:(.text+0x121c): multiple definition of
 `qcom_scm_qseecom_app_get_id';
 drivers/pinctrl/qcom/pinctrl-msm.o:include/linux/firmware/qcom/qcom_scm.h:136:
 first defined here
Message-ID: <202308101747.FlUaA2dQ-lkp@intel.com>
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
config: arm-randconfig-r011-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101747.FlUaA2dQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101747.FlUaA2dQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101747.FlUaA2dQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/firmware/qcom_scm.o: in function `qcom_scm_qseecom_app_get_id':
>> qcom_scm.c:(.text+0x121c): multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/pinctrl/qcom/pinctrl-msm.o:include/linux/firmware/qcom/qcom_scm.h:136: first defined here
   arm-linux-gnueabi-ld: drivers/firmware/qcom_scm.o: in function `qcom_scm_qseecom_app_send':
>> qcom_scm.c:(.text+0x1222): multiple definition of `qcom_scm_qseecom_app_send'; drivers/pinctrl/qcom/pinctrl-msm.o:include/linux/firmware/qcom/qcom_scm.h:142: first defined here
   arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-smc.o: in function `qcom_scm_qseecom_app_get_id':
   qcom_scm-smc.c:(.text+0xc): multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/pinctrl/qcom/pinctrl-msm.o:include/linux/firmware/qcom/qcom_scm.h:136: first defined here
   arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-smc.o: in function `qcom_scm_qseecom_app_send':
   qcom_scm-smc.c:(.text+0x12): multiple definition of `qcom_scm_qseecom_app_send'; drivers/pinctrl/qcom/pinctrl-msm.o:include/linux/firmware/qcom/qcom_scm.h:142: first defined here
   arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-legacy.o: in function `qcom_scm_qseecom_app_get_id':
   include/linux/firmware/qcom/qcom_scm.h:136: multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/pinctrl/qcom/pinctrl-msm.o:include/linux/firmware/qcom/qcom_scm.h:136: first defined here
   arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-legacy.o: in function `qcom_scm_qseecom_app_send':
   include/linux/firmware/qcom/qcom_scm.h:142: multiple definition of `qcom_scm_qseecom_app_send'; drivers/pinctrl/qcom/pinctrl-msm.o:include/linux/firmware/qcom/qcom_scm.h:142: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
