Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39FD28DBB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtCrEG/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699283183; x=1730819183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZ3yu+uHCkKV1X3WfLizM2al0tfzH4DCEQZyLaaoKDc=;
  b=RtCrEG/6DU+VboReGOVvFYMLFwmgauu77+QZGhdwrPe327b33j3kwkYG
   XM5TR+nWZwcOGM2FUAh6YQ1vLSZ4XlWdF7Arn1ZxMdhUVyL+qkStkoHDJ
   m9OBgAgJqshJKpbOkOJjDN37UY5TIi6ww1fam8hI6enfG2ZhwM5sHe0tA
   Bnk1om3y02+BOUWDCjTkMItK6Q3gG62ki0AapZ5XYRRiYVOb5ySHTFW3n
   gM/531OgKyzlvczmnNv/iD4M9J+psO5Sl+v4hLAVAOg5dm5wcQSzzeUTO
   pVKczAN0A29/Yo/ycVS7BDdCUv+jy42wLuCRtMOEYdfoujB1KDLwVyTen
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="7923900"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="7923900"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 07:06:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="3468537"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2023 07:06:20 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r01BB-0006Ui-2U;
	Mon, 06 Nov 2023 15:06:17 +0000
Date: Mon, 6 Nov 2023 23:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: kismet: WARNING: unmet direct dependencies detected for SM_GCC_8550
 when selected by SM_CAMCC_8550
Message-ID: <202311062309.XugQH7AH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: ccc4e6a061a21d75b96d82fc4b084a8d96df6eb4 clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
date:   7 weeks ago
config: arm-kismet-CONFIG_SM_GCC_8550-CONFIG_SM_CAMCC_8550-0-0 (https://download.01.org/0day-ci/archive/20231106/202311062309.XugQH7AH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062309.XugQH7AH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311062309.XugQH7AH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SM_GCC_8550 when selected by SM_CAMCC_8550
   .config:7280:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for SM_GCC_8550
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_CAMCC_8550 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
