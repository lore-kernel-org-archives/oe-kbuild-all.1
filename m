Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5372907
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692277012; x=1723813012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+4QV5apohsYGybwggq4arjrA8KPRXKg4qUHp1H8pHE=;
  b=JScpJ1yfBf7G+K2hfVvsRjnmvZriADQ+7C0ZifMEnsmk/59gxhQVoico
   xUQrZVsrELS3VFCrMp3OqgNbe8L5w+O82qY8uQ2y5SWmfmVenoWtSDo4X
   wOa4JyLre0OzLR87i5AmrrEiJwg+CKFj91NgEInMYc6m91wAWFOhS+5PN
   7KCNJFG7of/fpQGAtI5Id23evDP0QlwB2g+ez7yePnfS8bILM8hZH/Wb1
   S+uQyR023fCTsnwql7NTOllRxVprN8FqwF5G21SDjDCzeTz+aNunNAdR/
   266s4pXqhy8zr13IU3/vm89tTugaiy2yMGkEs0qYQ/kZ0X+5T5w61n8Hf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370269257"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="370269257"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 05:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="764069198"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="764069198"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 05:56:50 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWcYK-000199-21;
	Thu, 17 Aug 2023 12:56:45 +0000
Date: Thu, 17 Aug 2023 20:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>
Subject: [phy:next 67/74] drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2378:38:
 error: redefinition of 'qmp_pcie_offsets_v5_20'
Message-ID: <202308172039.Ua2Ef3B8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   a11ecceaf41d2dd542228007940652fea7532276
commit: 64adc0bf06ad5855da5a02b9653fb7cfda289c50 [67/74] phy: qcom-qmp-pcie: populate offsets configuration
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230817/202308172039.Ua2Ef3B8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172039.Ua2Ef3B8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172039.Ua2Ef3B8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2378:38: error: redefinition of 'qmp_pcie_offsets_v5_20'
    2378 | static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2357:38: note: previous definition of 'qmp_pcie_offsets_v5_20' with type 'const struct qmp_pcie_offsets'
    2357 | static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~


vim +/qmp_pcie_offsets_v5_20 +2378 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c

269b70e85282e7 Abel Vesa      2023-02-08  2377  
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14 @2378  static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2379  	.serdes		= 0x1000,
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2380  	.pcs		= 0x1200,
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2381  	.pcs_misc	= 0x1400,
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2382  	.tx		= 0x0000,
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2383  	.rx		= 0x0200,
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2384  	.tx2		= 0x0800,
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2385  	.rx2		= 0x0a00,
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2386  	.ln_shrd	= 0x0e00,
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2387  };
a05b6d5135ec3e Mrinmay Sarkar 2023-07-14  2388  

:::::: The code at line 2378 was first introduced by commit
:::::: a05b6d5135ec3e65520ae0eaa1b24d4c6549424e phy: qcom-qmp-pcie: add support for sa8775p

:::::: TO: Mrinmay Sarkar <quic_msarkar@quicinc.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
