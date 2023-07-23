Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10074C7D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 22:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690152603; x=1721688603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YDYV9lOKgw1rNoDaVge5Ryrpwod1cHV7+06PAohDSzE=;
  b=mcD+5mBsQ17td3PR94xHbGVPb9NcsjteJZNFfX12KEYeIotxgqvd6/+e
   0UElMgc5bwbDOjJJOZNKXMoXrnOk4Q7yJPZ6TmmSEXoVXVT9Fw46IxN9L
   Mb3iDf44G6d4QLCoK/r1+BGVqliTIdnnFiHsX1mSCADPJlu1GMKacxYs5
   v0ixRUySDzekfrBmZ3SOO/Q37uLFdDu03C5qpjqHJmQCO/+vXo/OSDgpu
   vdXJaLCUbtc3w3TZqDcPUqkvYdgz9Jqq9bxLbR+E9QCWENBE312v237Tb
   rgY7t+3mh4Td29vjn+lLM2wak3/UfHxDwC9e5t9mrW6ACxEvCCXUsmKIb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="357310687"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="357310687"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 15:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="725497772"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="725497772"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Jul 2023 15:50:01 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNhtn-0009Jh-2n;
	Sun, 23 Jul 2023 22:50:00 +0000
Date: Mon, 24 Jul 2023 06:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:genpd_create_dir 8/18] drivers/genpd/qcom/rpmpd.c:78:16:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202307240616.e5TYhHbb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ulf,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git genpd_create_dir
head:   b43f11e5b453a9c48159d7121c88d79d81901276
commit: 84e9c58c21663b4008ddec3c431aef191c993ffd [8/18] soc: qcom: Move power-domain drivers to the genpd dir
config: arm64-randconfig-r083-20230723 (https://download.01.org/0day-ci/archive/20230724/202307240616.e5TYhHbb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240616.e5TYhHbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240616.e5TYhHbb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/genpd/qcom/rpmpd.c:78:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:78:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:78:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:87:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:87:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:87:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:96:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:96:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:96:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:105:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:105:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:105:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:114:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:114:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:114:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:123:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:123:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:123:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:132:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:132:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:132:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:141:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:141:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:141:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:150:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:150:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:150:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:159:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:159:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:159:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:166:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:166:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:166:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:173:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:173:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:173:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:180:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:180:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:180:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:187:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:187:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:187:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:194:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:194:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:194:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:201:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:201:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:201:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:209:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:209:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:209:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:216:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:216:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:216:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:227:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:227:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:227:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:238:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:238:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:238:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:248:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:248:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:248:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:257:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:257:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:257:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:266:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:266:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:266:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:275:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:275:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:275:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:284:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:284:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:284:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:293:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:293:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:293:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:302:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:302:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:302:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:311:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:311:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:311:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:320:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:320:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:320:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:329:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:329:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:329:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:338:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:338:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:338:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:347:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:347:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:347:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:354:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:354:16: sparse:     expected restricted __le32 [usertype] key
   drivers/genpd/qcom/rpmpd.c:354:16: sparse:     got int
   drivers/genpd/qcom/rpmpd.c:361:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] key @@     got int @@
   drivers/genpd/qcom/rpmpd.c:361:16: sparse:     expected restricted __le32 [usertype] key

vim +78 drivers/genpd/qcom/rpmpd.c

bbe3a66c3f5a65 drivers/soc/qcom/rpmpd.c Rajendra Nayak 2019-01-10  70  
91c0bcef25f985 drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13  71  /* CX */
07df05025eb4cb drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13  72  static struct rpmpd cx_rwcx0_lvl_ao;
07df05025eb4cb drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13  73  static struct rpmpd cx_rwcx0_lvl = {
91c0bcef25f985 drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13  74  	.pd = { .name = "cx", },
07df05025eb4cb drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13  75  	.peer = &cx_rwcx0_lvl_ao,
91c0bcef25f985 drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13  76  	.res_type = RPMPD_RWCX,
91c0bcef25f985 drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13  77  	.res_id = 0,
91c0bcef25f985 drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13 @78  	.key = KEY_LEVEL,
91c0bcef25f985 drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13  79  };
91c0bcef25f985 drivers/soc/qcom/rpmpd.c Konrad Dybcio  2023-03-13  80  

:::::: The code at line 78 was first introduced by commit
:::::: 91c0bcef25f985fd974b6f1ba3d3d7383ac032d2 soc: qcom: rpmpd: Expand struct definition macros

:::::: TO: Konrad Dybcio <konrad.dybcio@linaro.org>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
