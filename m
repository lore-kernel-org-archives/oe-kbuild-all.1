Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6F1C04
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 05:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549594; x=1711085594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eeT9vjKxfyxeoOujdGKUe8wwlJyUy/Cg24s6iyjLyNw=;
  b=lE0yELnper5heyabGlZYMqUKwFHjpoUsiLOpcHIp9UdFbaHYRhIklUg8
   QuKYF6+/LP+5km+uM8RZhDww5svfzBYVlgq7Dgk+iAjkQDOA32D0GAQfR
   gaeej2wHpDPKrBxR2qaQv9mLzf6E3HqL1QYwCDfLXr8MrqkgBZA7nqed2
   uI4ZK0En2eK55irmLRSQOlF0YXztrHjjdYv/ifAfqaOm4lJuvdlw0YUMP
   ee2q5ZpOgtWA0UeWujEqkRXFgTojLBc2Ncmo2aPH260JgRMlYAuQI6Dn6
   bXH/xIqdhwDZMQdS0xzCBlzYnts+Jqjwvk1OhjWyVXdHBeqDastpMiXm4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="425682978"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="425682978"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 22:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659455875"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="659455875"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2023 22:33:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfDZW-000E0C-1y;
	Thu, 23 Mar 2023 05:33:10 +0000
Date: Thu, 23 Mar 2023 13:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Clark <robdclark@chromium.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [linux-next:master 5004/6100] kismet: WARNING: unmet direct
 dependencies detected for PM_GENERIC_DOMAINS when selected by DRM_MSM
Message-ID: <202303231357.22x4kn3m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0aa250ce67a2697327415132a0aa4e9f1f0fe000
commit: c11fa1204fe9405d2a82a714d021360b865cf8bc [5004/6100] drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse
config: riscv-kismet-CONFIG_PM_GENERIC_DOMAINS-CONFIG_DRM_MSM-0-0 (https://download.01.org/0day-ci/archive/20230323/202303231357.22x4kn3m-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c11fa1204fe9405d2a82a714d021360b865cf8bc
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c11fa1204fe9405d2a82a714d021360b865cf8bc
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_PM_GENERIC_DOMAINS --selectors CONFIG_DRM_MSM -a=riscv
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=riscv olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231357.22x4kn3m-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS when selected by DRM_MSM
   
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
     Depends on [n]: PM [=n]
     Selected by [y]:
     - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
