Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459806FD9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694098515; x=1725634515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QtHc55YranH6Ei3rJ3m5hCA03q6yM6caJHhQLFIUmsU=;
  b=bQso8KvaZ/c6+dia6U0dQM6CcpdeC3Jx1TF+Ep+AASAtTO+B97pj17j4
   cXLdOucFMKeVnFOEPcbuej2ObBzH+4ebIAYViN2k9ZyLCCv2myC0cHwp4
   jD6i/6wi7iDazjc7wVvzKfgFdtUrfnOV/VHZ/ImK1c0mnUzaQh20hknYN
   ThEPYRhtnd6p7Fm3oN6Ztt6CGLkHabVaNkdY7IOLsYwW6AsVKKZp+MdYL
   r9Hh0lPFtByNiWqcPuC0qgJ1rWqoKSLcPmgaD28r5WpfbvWibObAWMGb1
   5tuwS6onmWM3LaVVbLeGGOHKY9TQAT9XU5y4itfjbb9HNcnnMPTtj+BMA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="408370376"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="408370376"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="691821327"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="691821327"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Sep 2023 07:55:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeGPR-0001IR-0Z;
	Thu, 07 Sep 2023 14:55:05 +0000
Date: Thu, 7 Sep 2023 22:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 445/618]
 drivers/interconnect/qcom/sm8250.c:280:10: error: 'MASTER_QUP_CORE_0'
 undeclared here (not in a function); did you mean 'MASTER_QUP_0'?
Message-ID: <202309072231.k8R6Sbjk-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230907/202309072231.k8R6Sbjk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072231.k8R6Sbjk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072231.k8R6Sbjk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/interconnect/qcom/sm8250.c:280:10: error: 'MASTER_QUP_CORE_0' undeclared here (not in a function); did you mean 'MASTER_QUP_0'?
     280 |         [MASTER_QUP_CORE_0] = &qup0_core_master,
         |          ^~~~~~~~~~~~~~~~~
         |          MASTER_QUP_0
>> drivers/interconnect/qcom/sm8250.c:280:10: error: array index in initializer not of integer type
   drivers/interconnect/qcom/sm8250.c:280:10: note: (near initialization for 'qup_virt_nodes')
>> drivers/interconnect/qcom/sm8250.c:281:10: error: 'MASTER_QUP_CORE_1' undeclared here (not in a function); did you mean 'MASTER_MDP_PORT1'?
     281 |         [MASTER_QUP_CORE_1] = &qup1_core_master,
         |          ^~~~~~~~~~~~~~~~~
         |          MASTER_MDP_PORT1
   drivers/interconnect/qcom/sm8250.c:281:10: error: array index in initializer not of integer type
   drivers/interconnect/qcom/sm8250.c:281:10: note: (near initialization for 'qup_virt_nodes')
>> drivers/interconnect/qcom/sm8250.c:282:10: error: 'MASTER_QUP_CORE_2' undeclared here (not in a function); did you mean 'MASTER_QUP_2'?
     282 |         [MASTER_QUP_CORE_2] = &qup2_core_master,
         |          ^~~~~~~~~~~~~~~~~
         |          MASTER_QUP_2
   drivers/interconnect/qcom/sm8250.c:282:10: error: array index in initializer not of integer type
   drivers/interconnect/qcom/sm8250.c:282:10: note: (near initialization for 'qup_virt_nodes')
>> drivers/interconnect/qcom/sm8250.c:283:10: error: 'SLAVE_QUP_CORE_0' undeclared here (not in a function); did you mean 'SLAVE_QUP_0'?
     283 |         [SLAVE_QUP_CORE_0] = &qup0_core_slave,
         |          ^~~~~~~~~~~~~~~~
         |          SLAVE_QUP_0
   drivers/interconnect/qcom/sm8250.c:283:10: error: array index in initializer not of integer type
   drivers/interconnect/qcom/sm8250.c:283:10: note: (near initialization for 'qup_virt_nodes')
>> drivers/interconnect/qcom/sm8250.c:284:10: error: 'SLAVE_QUP_CORE_1' undeclared here (not in a function); did you mean 'SLAVE_QUP_1'?
     284 |         [SLAVE_QUP_CORE_1] = &qup1_core_slave,
         |          ^~~~~~~~~~~~~~~~
         |          SLAVE_QUP_1
   drivers/interconnect/qcom/sm8250.c:284:10: error: array index in initializer not of integer type
   drivers/interconnect/qcom/sm8250.c:284:10: note: (near initialization for 'qup_virt_nodes')
>> drivers/interconnect/qcom/sm8250.c:285:10: error: 'SLAVE_QUP_CORE_2' undeclared here (not in a function); did you mean 'SLAVE_QUP_2'?
     285 |         [SLAVE_QUP_CORE_2] = &qup2_core_slave,
         |          ^~~~~~~~~~~~~~~~
         |          SLAVE_QUP_2
   drivers/interconnect/qcom/sm8250.c:285:10: error: array index in initializer not of integer type
   drivers/interconnect/qcom/sm8250.c:285:10: note: (near initialization for 'qup_virt_nodes')


vim +280 drivers/interconnect/qcom/sm8250.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
