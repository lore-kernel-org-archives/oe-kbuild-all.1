Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300FB3174D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 22:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705616979; cv=none; b=qqcoWif2WaUZRRUsbpXh4F8yYiS+ef8JBasxGROQlZMEXF9N9/t/5NKSGMb+AtU8OKj9iUu4Nu/KvxqWVEvPkhm6SjvcBLxv/RJ0rO1IILsNC+SFz9WzXjRlRdVQSsuXpswUXfNXykkDh9c26TWSXPczDOM+p7InYnI9lBW5Jbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705616979; c=relaxed/simple;
	bh=lXdEVdYT6JTJjyFWudFyndszSQS9zPZmmcLm8NE4FQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sGjMB36hy6no4zES9gCDF1QDHHXNWj9jbfqBrnM4HxW6+pb1avMyFuTi6llcMbzNL1KVehX2w4iX4uXIXuHAyWhibnr4qqUnrIZ6j124tVpgbCP8jjGTj4ABODfRYBVLo+tgP5/uGCscvIv1L2i/d2e5uV2qPeK8Pv2XVpKsFYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvulZtkQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvulZtkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705616977; x=1737152977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lXdEVdYT6JTJjyFWudFyndszSQS9zPZmmcLm8NE4FQ4=;
  b=QvulZtkQh+GBWj31rGxlyzgcWOk+B5GYkX7QI6V9liIuUE/TVe1LR6/r
   G+VEgmhHjB51Oqli5fdwFA+gbVfqrR3X/GjDoNebhX28Y4jCwBI0nUOgZ
   RgkiCdiPPCAGqbJ4gPvZXKdb8TbliSIeffu3M+WtsuFOsGCYC7AHcOTcI
   RMbRQubmBGWP+WBaUaV53BOI64i+H0evdT5Xen+K9hUXEmIqTcJZSqSk5
   Q/OOopWiPyENhNH/UM3/s1ByHbIrYQViIKHg/R0yJVUDj4HzrSXqKPlYH
   ElrKyzewweiLxh3g1lms6r5m0T3L+BvRGIeqOIzIvQiQ9z++XqBA2elNK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7349781"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7349781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 14:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="19230937"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jan 2024 14:29:35 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQatB-0003Oe-10;
	Thu, 18 Jan 2024 22:29:33 +0000
Date: Fri, 19 Jan 2024 06:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 15/30] sound/soc/qcom/lpass.h:43:14: error: 'LPASS_CDC_DMA_RX0' undeclared
Message-ID: <202401190656.0tH51yre-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
head:   5cac1bb64a0300d340c5e369489c731b30aa5e79
commit: 09ac587b4c3759cc859d282118bf963cbdfc17ac [15/30] UPSTREAM: ASoC: qcom: reduce number of binding headers includes
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240119/202401190656.0tH51yre-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190656.0tH51yre-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190656.0tH51yre-lkp@intel.com/

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
