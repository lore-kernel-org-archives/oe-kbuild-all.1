Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24FF13FEA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 06:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMnJJ1Kr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701929289; x=1733465289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=afuMH9RHeuu1Nlem0Rpl8i/1WPnpTa8StZWPZfDNT08=;
  b=TMnJJ1KrY/srtpayyoAoXsvxuy+X6on0szCahWfvTKOjjPJPd3sGWM/A
   GIx0nWLTddKCwXJFSQDafm53xCe+rtlI/xT3KqyO6lKlF2UG2OrvYi7ny
   ZdU1NmdIDa9c+EYXNIgQda60dm9giTjINKrRnz4BUQWkT8QC3/XtuLoRa
   FDc9xPGRlFlm2ezAa6/FmUOMF2uMok1OVzcTA0LnviB0eXhqmwOx6yxjZ
   53vnkx/4vP454dpDO45zc4qSd4xUOGqPKnb75cRz2jNVVL5LgaxopPOTP
   3sgowZLfWhLxZSKvQbF03zqUt3z7JwzwREQXd+j/gmUpQvp6fYGfEIFfz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391352922"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="391352922"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 22:08:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="944915314"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="944915314"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Dec 2023 22:07:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB7Y9-000Btm-2b;
	Thu, 07 Dec 2023 06:07:53 +0000
Date: Thu, 7 Dec 2023 14:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	Georgi Djakov <djakov@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: Re: [PATCH 2/2] interconnect: qcom: Add MSM8909 interconnect
 provider driver
Message-ID: <202312071325.M9cg1wry-lkp@intel.com>
References: <20231206-icc-msm8909-v1-2-fe0dd632beff@kernkonzept.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206-icc-msm8909-v1-2-fe0dd632beff@kernkonzept.com>

Hi Stephan,

kernel test robot noticed the following build errors:

[auto build test ERROR on feaf241ae2da2a73cb421473f52a4732128a996f]

url:    https://github.com/intel-lab-lkp/linux/commits/Stephan-Gerhold/dt-bindings-interconnect-Add-Qualcomm-MSM8909-DT-bindings/20231206-223626
base:   feaf241ae2da2a73cb421473f52a4732128a996f
patch link:    https://lore.kernel.org/r/20231206-icc-msm8909-v1-2-fe0dd632beff%40kernkonzept.com
patch subject: [PATCH 2/2] interconnect: qcom: Add MSM8909 interconnect provider driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231207/202312071325.M9cg1wry-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312071325.M9cg1wry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312071325.M9cg1wry-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/interconnect/qcom/msm8909.c:1319:19: error: initialization of 'int (*)(struct platform_device *)' from incompatible pointer type 'void (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
    1319 |         .remove = qnoc_remove,
         |                   ^~~~~~~~~~~
   drivers/interconnect/qcom/msm8909.c:1319:19: note: (near initialization for 'msm8909_noc_driver.remove')
   cc1: some warnings being treated as errors


vim +1319 drivers/interconnect/qcom/msm8909.c

  1316	
  1317	static struct platform_driver msm8909_noc_driver = {
  1318		.probe = qnoc_probe,
> 1319		.remove = qnoc_remove,
  1320		.driver = {
  1321			.name = "qnoc-msm8909",
  1322			.of_match_table = msm8909_noc_of_match,
  1323			.sync_state = icc_sync_state,
  1324		},
  1325	};
  1326	module_platform_driver(msm8909_noc_driver);
  1327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
