Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2A43101B8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772994118; cv=none; b=j/x8Y3YuGWsI8nT6DhZOAHCUqv7YFIXvFDJJrfIUG7uiwLleq/ADu2Ncx0pLKaGRm5jxOb5/dW+eSX7lOF1/qEC5AfCdpdjXL+a86IOAupcONRgnJB9MzfQGYrYPzQ6eSazTwHGzN16r8Rt0vKtZangm8BtVPPtdZxuiJqfpXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772994118; c=relaxed/simple;
	bh=3YpNhUfzjzCw0De09ObtjWaJqfKCcNvO8n38A1P2vdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzogaOcJ5VsBqVEMJJd1tTGf6mPubynQmTe+zYUhvaU9ACT1YIqHtDV8TN4SPcqWnZuhm7tXJWq3SKEUvBOi/BymjJiQoQIZ8GvmMWkJMWWcw540R29u28VJH+Xxib1DHiWg4CVcO0sfqFTyD/cYWVAjTTWGqwPtigze5t2Dmno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfCiZhvq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfCiZhvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772994117; x=1804530117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3YpNhUfzjzCw0De09ObtjWaJqfKCcNvO8n38A1P2vdU=;
  b=WfCiZhvqG305e5K6bOvIuZqVvTZLsQF7gloGW0iAxoxaCm2C97J8x51H
   cZ+xWyoETO2crTbHgKOTjY5s2mrcbkC4nQfzn/DNlS0vNH7m4k74h6oBp
   2EbzGCgTw1ILYRMDYqRLYw/3RIcmBUeINKPE7aqzH+k2cfvMh068q0d+p
   lPxU79g03/YRfyHk1KftQQ31fUXMD4mQVs51FAOSf1xQEJxOci6m5wX7S
   nv6FBA5WzfClDy+GjjOidaDWDPNy61L87unvCFYBmgUqfSyROW7+E1G4W
   +cq4rp9nGwgBfAIOTls/5Fs3Tnx11+OiRkVorY/RAoAD76Br4LiqNXSvX
   A==;
X-CSE-ConnectionGUID: UQliRb1wSGm4aZ+TUYxmFA==
X-CSE-MsgGUID: XkfNuBpuTXGEdUHes5vY+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74219103"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74219103"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 11:21:57 -0700
X-CSE-ConnectionGUID: uwj9rQQyS86OEypkWMiXbg==
X-CSE-MsgGUID: OFGAQOw9QbSgG4PaQe0C1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="217633731"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2026 11:21:53 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzIlB-000000003Jw-3Snu;
	Sun, 08 Mar 2026 18:21:49 +0000
Date: Mon, 9 Mar 2026 02:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Abel Vesa <abelvesa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/5] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
Message-ID: <202603090214.7xup4lZa-lkp@intel.com>
References: <20260308-qcom-ice-fix-v5-1-e47e8a44b6c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-qcom-ice-fix-v5-1-e47e8a44b6c4@oss.qualcomm.com>

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam-via-B4-Relay/soc-qcom-ice-Fix-race-between-qcom_ice_probe-and-of_qcom_ice_get/20260308-143016
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260308-qcom-ice-fix-v5-1-e47e8a44b6c4%40oss.qualcomm.com
patch subject: [PATCH v5 1/5] soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
config: arm-randconfig-r111-20260308 (https://download.01.org/0day-ci/archive/20260309/202603090214.7xup4lZa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090214.7xup4lZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090214.7xup4lZa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/ice.c:117:1: sparse: sparse: symbol 'ice_handles' was not declared. Should it be static?
>> drivers/soc/qcom/ice.c:736:49: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *entry @@     got void [noderef] __iomem *[assigned] base @@
   drivers/soc/qcom/ice.c:736:49: sparse:     expected void *entry
   drivers/soc/qcom/ice.c:736:49: sparse:     got void [noderef] __iomem *[assigned] base

vim +/ice_handles +117 drivers/soc/qcom/ice.c

   116	
 > 117	DEFINE_XARRAY(ice_handles);
   118	static DEFINE_MUTEX(ice_mutex);
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
