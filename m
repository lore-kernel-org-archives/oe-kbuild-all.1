Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082C37CB6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 18:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695752218; x=1727288218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFLfskOH/8iOnNqH6wEVUMvB6O+qGysumy1USy2NmxE=;
  b=QrgHpek0niD++d3UIT1uZC3Jo6CQ4nyP4QZYSie1qL8ahxq4dWjhkzXP
   ZpezRB2UAb8Et7eohc1hEfX7cSbR1FuFTnc2HacjV1ai0aQ8VeRBOf2vL
   x5xVwvdEmww+7NZbrEHvW5NnwepS8ZvzDzklhNwN5+WIgnH9MQa0mcpkL
   dRNxw7zsqC85VRzIqxDJvoVDiPnQ3CV0omLCDJPgOB+8t2F8NSa+B0o0R
   617ZhXs0McsnfUSB15zdepxlVI7aQ/nDs3fLY8WsOGtn+NIvPn0+RHRSt
   AHH32EPs5qCWV4sODuFgMJ3C0NXS5j4wmRukgCSHavQbdrIqeIqK8z78O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361013385"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="361013385"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 11:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="839105311"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="839105311"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2023 11:16:56 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlCc9-0003Dw-3D;
	Tue, 26 Sep 2023 18:16:54 +0000
Date: Wed, 27 Sep 2023 02:16:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:master 1000/1123]
 drivers/staging/xilinx_hdcp/xlnx_hdcp_rng.c:33:20: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202309270250.WbYmtZxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: f5e31866859a5b682c6668e40f17b5f760dca9c1 [1000/1123] drm: xlnx: Add HDCP2X TX support
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20230927/202309270250.WbYmtZxJ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270250.WbYmtZxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270250.WbYmtZxJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/xilinx_hdcp/xlnx_hdcp_rng.c: In function 'xlnx_hdcp2x_rng_cfg_init':
>> drivers/staging/xilinx_hdcp/xlnx_hdcp_rng.c:33:20: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      33 |         reg_read = FIELD_GET(XHDCP2X_RNG_MASK_16, reg_read);
         |                    ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/xilinx_hdcp/xlnx_hdcp2x_cipher.c: In function 'xlnx_hdcp2x_cipher_cfg_init':
>> drivers/staging/xilinx_hdcp/xlnx_hdcp2x_cipher.c:54:20: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      54 |         reg_read = FIELD_GET(XHDCP2X_CIPHER_MASK_16, reg_read);
         |                    ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c: In function 'xlnx_hdcp2x_downstream_capbility':
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:411:17: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     411 |         return (FIELD_GET(XHDCP2X_TX_RXCAPS_MASK, rxcaps[0]) & HDCP_2_2_RX_CAPS_VERSION_VAL);
         |                 ^~~~~~~~~
         |                 FOLL_GET
   cc1: some warnings being treated as errors


vim +/FIELD_GET +33 drivers/staging/xilinx_hdcp/xlnx_hdcp_rng.c

30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  26  
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  27  int xlnx_hdcp2x_rng_cfg_init(struct xlnx_hdcp2x_rng_hw *rng_cfg)
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  28  {
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  29  	u32 reg_read;
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  30  
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  31  	reg_read = xlnx_hdcp2x_rng_read(rng_cfg->rng_coreaddress,
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  32  					XHDCP2X_RNG_VER_ID_OFFSET);
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03 @33  	reg_read = FIELD_GET(XHDCP2X_RNG_MASK_16, reg_read);
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  34  	if (reg_read != XHDCP2X_RNG_VER_ID)
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  35  		return (-EINVAL);
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  36  
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  37  	return 0;
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  38  }
30529035b0856a1 Lakshmi Prasanna Eachuri 2023-02-03  39  

:::::: The code at line 33 was first introduced by commit
:::::: 30529035b0856a1fa7c3d5022a727dbd0a1a115a staging: xilinx_hdcp: Add HDCP common functionality for Xilinx devices

:::::: TO: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
