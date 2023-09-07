Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B112B87
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694101204; x=1725637204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lx6tAGL7eivx6TgHeiONz/CkZWSordXJz8xIyJ6wDRY=;
  b=i9CzR1lghfSkygmGhlCV1wEhlwU5qbfpei9/fVYimdURzql3W/Lkxzub
   sLRdiPDMSXGeV1xsZEQoOEuHBVRZNM8O1QZ0KsZDc3rpObdKz1dbx1Oyh
   8PLpVjK3d+oyFgx9Goqx2eln0DnaxBOVtPqMryx64O7P3Jdp1zcZ/faSg
   PMYsU6f0ZWKVqgdRE863Rk8rzlIiNnrOzDs2A5mH8UT+4gvjxI61vBu7V
   Vvzvnkp/LFVRJq6b+pNPXUoz3WPv81gl2pvMaKdQ+IBPU9xAwGqQFPZmm
   zGMvAWCesTda2lnP8pcviB+tN1Ah61bVjnaOPCEtPxFYvqyPuSvaQWpv9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="362445746"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="362445746"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="1072930199"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="1072930199"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Sep 2023 08:38:08 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeH54-0001Kj-21;
	Thu, 07 Sep 2023 15:38:06 +0000
Date: Thu, 7 Sep 2023 23:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 445/618]
 drivers/interconnect/qcom/sm8250.c:280:3: error: use of undeclared
 identifier 'MASTER_QUP_CORE_0'
Message-ID: <202309072308.l98ibJeu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.5
head:   a369e6e4e96387fafd2686cb85ef80ebedec5909
commit: 6c9358a886b033ff4409781da011b957dab93dce [445/618] interconnect: qcom: sm8250: Fix QUP0 nodes
config: arm-randconfig-r016-20230907 (https://download.01.org/0day-ci/archive/20230907/202309072308.l98ibJeu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072308.l98ibJeu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072308.l98ibJeu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/interconnect/qcom/sm8250.c:280:3: error: use of undeclared identifier 'MASTER_QUP_CORE_0'
     280 |         [MASTER_QUP_CORE_0] = &qup0_core_master,
         |          ^
>> drivers/interconnect/qcom/sm8250.c:281:3: error: use of undeclared identifier 'MASTER_QUP_CORE_1'
     281 |         [MASTER_QUP_CORE_1] = &qup1_core_master,
         |          ^
>> drivers/interconnect/qcom/sm8250.c:282:3: error: use of undeclared identifier 'MASTER_QUP_CORE_2'
     282 |         [MASTER_QUP_CORE_2] = &qup2_core_master,
         |          ^
>> drivers/interconnect/qcom/sm8250.c:283:3: error: use of undeclared identifier 'SLAVE_QUP_CORE_0'
     283 |         [SLAVE_QUP_CORE_0] = &qup0_core_slave,
         |          ^
>> drivers/interconnect/qcom/sm8250.c:284:3: error: use of undeclared identifier 'SLAVE_QUP_CORE_1'
     284 |         [SLAVE_QUP_CORE_1] = &qup1_core_slave,
         |          ^
>> drivers/interconnect/qcom/sm8250.c:285:3: error: use of undeclared identifier 'SLAVE_QUP_CORE_2'
     285 |         [SLAVE_QUP_CORE_2] = &qup2_core_slave,
         |          ^
>> drivers/interconnect/qcom/sm8250.c:290:15: error: invalid application of 'sizeof' to an incomplete type 'struct qcom_icc_node *[]'
     290 |         .num_nodes = ARRAY_SIZE(qup_virt_nodes),
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:32: note: expanded from macro 'ARRAY_SIZE'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   7 errors generated.


vim +/MASTER_QUP_CORE_0 +280 drivers/interconnect/qcom/sm8250.c

   278	
   279	static struct qcom_icc_node *qup_virt_nodes[] = {
 > 280		[MASTER_QUP_CORE_0] = &qup0_core_master,
 > 281		[MASTER_QUP_CORE_1] = &qup1_core_master,
 > 282		[MASTER_QUP_CORE_2] = &qup2_core_master,
 > 283		[SLAVE_QUP_CORE_0] = &qup0_core_slave,
 > 284		[SLAVE_QUP_CORE_1] = &qup1_core_slave,
 > 285		[SLAVE_QUP_CORE_2] = &qup2_core_slave,
   286	};
   287	
   288	static const struct qcom_icc_desc sm8250_qup_virt = {
   289		.nodes = qup_virt_nodes,
 > 290		.num_nodes = ARRAY_SIZE(qup_virt_nodes),
   291		.bcms = qup_virt_bcms,
   292		.num_bcms = ARRAY_SIZE(qup_virt_bcms),
   293	};
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
