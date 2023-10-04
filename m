Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF12C14AA5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBTy8hGo"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696460158; x=1727996158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cuiFnkkxdOFiEQT7Ev2cQoAzXoY4o+NbVxWHdOX1fbY=;
  b=bBTy8hGog8wC68jmLUnauRTi6GAwCUff6SVaInrQIfrYVOWVbt6EsWMt
   ne8u/HiRMrbjNOGehcgZt7d3zEcnVpfFnI2ziDEMurmWQ4ozc7DRf4rfi
   yR9KpXL8SQJW7Iw2fBXGf4kzr0Tuj+j4B3cuj4L0p6inzNHuVLI1HbqDR
   kNbvB79QGXHueZ+9xKZH4Lu7BkKzuJiFOgQbIfdsbIFov1+VLCnF1p92y
   KNYe9R+aIjQMv0xI1BcWy4rnn79oHB8XiJYKylNWHIfEIX1pJVZLsPnUR
   Y+PC/nA+h+9zg3knW7RFopRnOyn5aOTOWrqz0DBURM0Tat61y8YeBFSDw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="387200868"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="387200868"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 15:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082713678"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="1082713678"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Oct 2023 15:55:47 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoAmO-000Ki8-29;
	Wed, 04 Oct 2023 22:55:44 +0000
Date: Thu, 5 Oct 2023 06:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/sound-name-prefix-widget 5/5]
 sound/soc/qcom/lpass.h:43:14: error: 'LPASS_CDC_DMA_RX0' undeclared
Message-ID: <202310050601.kCCcyd5t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/sound-name-prefix-widget
head:   45ba8d7dfc402f1987b96f4753f22a283a2b529c
commit: 45ba8d7dfc402f1987b96f4753f22a283a2b529c [5/5] ASoC: qcom: reduce number of binding headers includes
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20231005/202310050601.kCCcyd5t-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050601.kCCcyd5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050601.kCCcyd5t-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/qcom/lpass-ipq806x.c:21:
   sound/soc/qcom/lpass.h: In function 'is_cdc_dma_port':
>> sound/soc/qcom/lpass.h:43:14: error: 'LPASS_CDC_DMA_RX0' undeclared (first use in this function)
      43 |         case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
         |              ^~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass.h:43:14: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/qcom/lpass.h:43:36: error: 'LPASS_CDC_DMA_RX9' undeclared (first use in this function)
      43 |         case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
         |                                    ^~~~~~~~~~~~~~~~~
>> sound/soc/qcom/lpass.h:44:14: error: 'LPASS_CDC_DMA_TX0' undeclared (first use in this function)
      44 |         case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
         |              ^~~~~~~~~~~~~~~~~
>> sound/soc/qcom/lpass.h:44:36: error: 'LPASS_CDC_DMA_TX8' undeclared (first use in this function)
      44 |         case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
         |                                    ^~~~~~~~~~~~~~~~~
>> sound/soc/qcom/lpass.h:45:14: error: 'LPASS_CDC_DMA_VA_TX0' undeclared (first use in this function)
      45 |         case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
         |              ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/qcom/lpass.h:45:39: error: 'LPASS_CDC_DMA_VA_TX8' undeclared (first use in this function)
      45 |         case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
         |                                       ^~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass.h: In function 'is_rxtx_cdc_dma_port':
   sound/soc/qcom/lpass.h:54:14: error: 'LPASS_CDC_DMA_RX0' undeclared (first use in this function)
      54 |         case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
         |              ^~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass.h:54:36: error: 'LPASS_CDC_DMA_RX9' undeclared (first use in this function)
      54 |         case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
         |                                    ^~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass.h:55:14: error: 'LPASS_CDC_DMA_TX0' undeclared (first use in this function)
      55 |         case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
         |              ^~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass.h:55:36: error: 'LPASS_CDC_DMA_TX8' undeclared (first use in this function)
      55 |         case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
         |                                    ^~~~~~~~~~~~~~~~~


vim +/LPASS_CDC_DMA_RX0 +43 sound/soc/qcom/lpass.h

7cb37b7bd0d3c9 V Sujith Kumar Reddy    2020-10-08  32  
7cb37b7bd0d3c9 V Sujith Kumar Reddy    2020-10-08  33  #define QCOM_REGMAP_FIELD_ALLOC(d, m, f, mf)    \
7cb37b7bd0d3c9 V Sujith Kumar Reddy    2020-10-08  34  	do { \
7cb37b7bd0d3c9 V Sujith Kumar Reddy    2020-10-08  35  		mf = devm_regmap_field_alloc(d, m, f);     \
7cb37b7bd0d3c9 V Sujith Kumar Reddy    2020-10-08  36  		if (IS_ERR(mf))                \
7cb37b7bd0d3c9 V Sujith Kumar Reddy    2020-10-08  37  			return -EINVAL;         \
7cb37b7bd0d3c9 V Sujith Kumar Reddy    2020-10-08  38  	} while (0)
cd59f13823ae65 Kenneth Westfield       2015-03-03  39  
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24  40  static inline bool is_cdc_dma_port(int dai_id)
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24  41  {
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24  42  	switch (dai_id) {
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24 @43  	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24 @44  	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24 @45  	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24  46  		return true;
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24  47  	}
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24  48  	return false;
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24  49  }
dc8d9766bc03ef Srinivasa Rao Mandadapu 2022-02-24  50  

:::::: The code at line 43 was first introduced by commit
:::::: dc8d9766bc03efee4d1b6dd912659858fdf981de ASoC: qcom: Add register definition for codec rddma and wrdma

:::::: TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
