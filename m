Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CAB376
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 02:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691549150; x=1723085150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dw7Z82mrna/pwAIi3OaabiM4HH9+hjghJwDMqGVaIzs=;
  b=VFZiYAYgvMQ/d/o6I0nAkhdaJpTR/CPVHghOQ0uHrcgWw/rPVsUW97oR
   HQLH4ll5shp1d9nqdOreSjDxkGqRLLiHly4ZclTBcV1SJvp1ZoCUguetC
   OY4zCAjrlxqEKVAtvoihFkEFf+MXxda+CAYn/Qn0/EbWSmLuPLh3vDIZj
   vuG8aILXfYHFCIDUZ0dpgdsDmr9ffgbTtDNr++cIUIV/rcGC+WCt8V2B8
   h7vGrLGUCOFduW7RmCZNHgpz+sET2Um7ETktuEUKr2zHk0AgrZSpGFbOm
   yuZZ/lV+rzNWCrhaUdNB77TOaWuHc+HgP4gxXplOXubFYpoPoqs6KmVwu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457385722"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="457385722"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 19:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731633609"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="731633609"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Aug 2023 19:45:20 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTZCJ-0005ko-1u;
	Wed, 09 Aug 2023 02:45:19 +0000
Date: Wed, 9 Aug 2023 10:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [jejb-scsi:misc 36/37] drivers/ufs/host/ufs-qcom.c:64:3: sparse:
 sparse: symbol 'ufs_qcom_bw_table' was not declared. Should it be static?
Message-ID: <202308091030.L5JrOBJB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git misc
head:   6cae9a3910ac1b5daf5ac3db9576b78cc4eff5aa
commit: 03ce80a1bb869f735de793f04c9c085b61884599 [36/37] scsi: ufs: qcom: Add support for scaling interconnects
config: arm64-randconfig-r071-20230808 (https://download.01.org/0day-ci/archive/20230809/202308091030.L5JrOBJB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091030.L5JrOBJB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091030.L5JrOBJB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ufs/host/ufs-qcom.c:64:3: sparse: sparse: symbol 'ufs_qcom_bw_table' was not declared. Should it be static?

vim +/ufs_qcom_bw_table +64 drivers/ufs/host/ufs-qcom.c

    60	
    61	struct __ufs_qcom_bw_table {
    62		u32 mem_bw;
    63		u32 cfg_bw;
  > 64	} ufs_qcom_bw_table[MODE_MAX + 1][QCOM_UFS_MAX_GEAR + 1][QCOM_UFS_MAX_LANE + 1] = {
    65		[MODE_MIN][0][0]		   = { 0,		0 }, /* Bandwidth values in KB/s */
    66		[MODE_PWM][UFS_PWM_G1][UFS_LANE_1] = { 922,		1000 },
    67		[MODE_PWM][UFS_PWM_G2][UFS_LANE_1] = { 1844,		1000 },
    68		[MODE_PWM][UFS_PWM_G3][UFS_LANE_1] = { 3688,		1000 },
    69		[MODE_PWM][UFS_PWM_G4][UFS_LANE_1] = { 7376,		1000 },
    70		[MODE_PWM][UFS_PWM_G1][UFS_LANE_2] = { 1844,		1000 },
    71		[MODE_PWM][UFS_PWM_G2][UFS_LANE_2] = { 3688,		1000 },
    72		[MODE_PWM][UFS_PWM_G3][UFS_LANE_2] = { 7376,		1000 },
    73		[MODE_PWM][UFS_PWM_G4][UFS_LANE_2] = { 14752,		1000 },
    74		[MODE_HS_RA][UFS_HS_G1][UFS_LANE_1] = { 127796,		1000 },
    75		[MODE_HS_RA][UFS_HS_G2][UFS_LANE_1] = { 255591,		1000 },
    76		[MODE_HS_RA][UFS_HS_G3][UFS_LANE_1] = { 1492582,	102400 },
    77		[MODE_HS_RA][UFS_HS_G4][UFS_LANE_1] = { 2915200,	204800 },
    78		[MODE_HS_RA][UFS_HS_G1][UFS_LANE_2] = { 255591,		1000 },
    79		[MODE_HS_RA][UFS_HS_G2][UFS_LANE_2] = { 511181,		1000 },
    80		[MODE_HS_RA][UFS_HS_G3][UFS_LANE_2] = { 1492582,	204800 },
    81		[MODE_HS_RA][UFS_HS_G4][UFS_LANE_2] = { 2915200,	409600 },
    82		[MODE_HS_RB][UFS_HS_G1][UFS_LANE_1] = { 149422,		1000 },
    83		[MODE_HS_RB][UFS_HS_G2][UFS_LANE_1] = { 298189,		1000 },
    84		[MODE_HS_RB][UFS_HS_G3][UFS_LANE_1] = { 1492582,	102400 },
    85		[MODE_HS_RB][UFS_HS_G4][UFS_LANE_1] = { 2915200,	204800 },
    86		[MODE_HS_RB][UFS_HS_G1][UFS_LANE_2] = { 298189,		1000 },
    87		[MODE_HS_RB][UFS_HS_G2][UFS_LANE_2] = { 596378,		1000 },
    88		[MODE_HS_RB][UFS_HS_G3][UFS_LANE_2] = { 1492582,	204800 },
    89		[MODE_HS_RB][UFS_HS_G4][UFS_LANE_2] = { 2915200,	409600 },
    90		[MODE_MAX][0][0]		    = { 7643136,	307200 },
    91	};
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
