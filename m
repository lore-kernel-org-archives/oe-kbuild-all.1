Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5D20B26
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aw8A+YF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696603770; x=1728139770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ls4VkimTOVrFvW0MKJV3HoKVItCCEU0Bs2/H222NV1k=;
  b=aw8A+YF9SdIuYrB/idzYxJ4jICz8EtYCLjrOrbhSVnVD2YSdh+of1/OW
   n5hDgKE4koWUJJ0+P5CdschyjoC4khV/WD5I8+i1wHB4PINI3C3QC3oFk
   cCY8X3D7BltBxgWmTFhM9BOp+yDafAU2p+DNY7jp4nnQTN9pOK9xNUQDt
   NVOgZpH+ZFPQvtHvLR2yINYcy7BAKkaUp92PwHsSm2vukTZoJ0PWRME73
   UeEuSz5Wmn+68J+dYknrb19wHqdm72Sif7qlASLXEN7c/BukaE19EDLWs
   /HomrpcoGmF+3nW6vtNapn3OLTw6jjrtlSSCOoLn9u4SHjklvi2IZyHKC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="386589924"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="386589924"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 07:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="842853647"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="842853647"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Oct 2023 07:49:27 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qom8q-0001SH-2Q;
	Fri, 06 Oct 2023 14:49:24 +0000
Date: Fri, 6 Oct 2023 22:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Komal Bajaj <quic_kbajaj@quicinc.com>, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	luca.weiss@fairphone.com, Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcm6490: Add qcm6490 dts file
Message-ID: <202310062256.LQAdaNZV-lkp@intel.com>
References: <20231003175456.14774-3-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003175456.14774-3-quic_kbajaj@quicinc.com>

Hi Komal,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231003]
[cannot apply to robh/for-next v6.6-rc4 v6.6-rc3 v6.6-rc2 linus/master v6.6-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Komal-Bajaj/dt-bindings-arm-qcom-Add-QCM6490-IDP-board/20231004-015725
base:   next-20231003
patch link:    https://lore.kernel.org/r/20231003175456.14774-3-quic_kbajaj%40quicinc.com
patch subject: [PATCH v3 2/2] arm64: dts: qcom: qcm6490: Add qcm6490 dts file
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231006/202310062256.LQAdaNZV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310062256.LQAdaNZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310062256.LQAdaNZV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/pm7325.dtsi:9.11-33.3 Label or path spmi_bus not found
>> Error: arch/arm64/boot/dts/qcom/pm7325.dtsi:35.1-15 Label or path thermal_zones not found
>> Error: arch/arm64/boot/dts/qcom/pm8350c.dtsi:9.1-10 Label or path spmi_bus not found
>> Error: arch/arm64/boot/dts/qcom/pmk8350.dtsi:26.1-10 Label or path spmi_bus not found
>> Error: arch/arm64/boot/dts/qcom/qcm6490-idp.dts:249.1-13 Label or path pm8350c_pwm not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
