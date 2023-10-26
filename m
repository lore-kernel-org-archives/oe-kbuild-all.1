Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8418AF9E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 07:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1csWaBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698304090; x=1729840090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wgkTK3o8uIRSVX8N8OZ23Y6mbJDxaKxrUGHGokrrngg=;
  b=X1csWaBFBR/Wa/HxTWFcIJR39IRnQG37bdgqaaJTeSedwslQg6O/ZJzw
   Mn5FKCNAlWdnIvT8uFuJGAUNWmtGxw1cy3gPDQqlOk+K5i/+158ep5sP4
   czUW8naoZaAacrVUtePEJPBVwvwPA5YHOiHQgINhbsZP9m8f3x+pILRAi
   YHQcp6D5gaGTpn530bHMYB6M/TEQ0kawzP5m/K4usw32/uq78RG6eTMZ4
   jQduC52V9nLujVp9ueUUxncPKtJ+Ww5AVAsxMiWGcZZ/G4VhtD2V2mAVM
   9PI/nv1LVh5yEmWW7+vOCGin12flhS5OkudZWPrRi58K4guBlFlb67LlH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390333863"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="390333863"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752612174"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="752612174"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Oct 2023 00:08:06 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvuTM-0009Zr-06;
	Thu, 26 Oct 2023 07:08:04 +0000
Date: Thu, 26 Oct 2023 15:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/8] arm64: dts: qcom: sm8650: add initial SM8650 MTP
 dts
Message-ID: <202310261402.WLUAPuKe-lkp@intel.com>
References: <20231025-topic-sm8650-upstream-dt-v1-4-a821712af62f@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025-topic-sm8650-upstream-dt-v1-4-a821712af62f@linaro.org>

Hi Neil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fe1998aa935b44ef873193c0772c43bce74f17dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/dt-bindings-arm-qcom-document-SM8650-and-the-reference-boards/20231025-155725
base:   fe1998aa935b44ef873193c0772c43bce74f17dc
patch link:    https://lore.kernel.org/r/20231025-topic-sm8650-upstream-dt-v1-4-a821712af62f%40linaro.org
patch subject: [PATCH RFC 4/8] arm64: dts: qcom: sm8650: add initial SM8650 MTP dts
config: arm64-randconfig-004-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261402.WLUAPuKe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261402.WLUAPuKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261402.WLUAPuKe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/sm8650-mtp.dts:9:
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:7:10: fatal error: dt-bindings/clock/qcom,sm8650-dispcc.h: No such file or directory
       7 | #include <dt-bindings/clock/qcom,sm8650-dispcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +7 arch/arm64/boot/dts/qcom/sm8650.dtsi

3b68f55356c303 Neil Armstrong 2023-10-25  @7  #include <dt-bindings/clock/qcom,sm8650-dispcc.h>
3b68f55356c303 Neil Armstrong 2023-10-25   8  #include <dt-bindings/clock/qcom,sm8650-gcc.h>
3b68f55356c303 Neil Armstrong 2023-10-25   9  #include <dt-bindings/clock/qcom,sm8650-gpucc.h>
3b68f55356c303 Neil Armstrong 2023-10-25  10  #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
3b68f55356c303 Neil Armstrong 2023-10-25  11  #include <dt-bindings/dma/qcom-gpi.h>
3b68f55356c303 Neil Armstrong 2023-10-25  12  #include <dt-bindings/firmware/qcom,scm.h>
3b68f55356c303 Neil Armstrong 2023-10-25  13  #include <dt-bindings/gpio/gpio.h>
3b68f55356c303 Neil Armstrong 2023-10-25  14  #include <dt-bindings/interrupt-controller/arm-gic.h>
3b68f55356c303 Neil Armstrong 2023-10-25  15  #include <dt-bindings/mailbox/qcom-ipcc.h>
3b68f55356c303 Neil Armstrong 2023-10-25  16  #include <dt-bindings/phy/phy-qcom-qmp.h>
3b68f55356c303 Neil Armstrong 2023-10-25  17  #include <dt-bindings/power/qcom,rpmhpd.h>
3b68f55356c303 Neil Armstrong 2023-10-25  18  #include <dt-bindings/power/qcom-rpmpd.h>
3b68f55356c303 Neil Armstrong 2023-10-25  19  #include <dt-bindings/reset/qcom,sm8650-gpucc.h>
3b68f55356c303 Neil Armstrong 2023-10-25  20  #include <dt-bindings/soc/qcom,gpr.h>
3b68f55356c303 Neil Armstrong 2023-10-25  21  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
3b68f55356c303 Neil Armstrong 2023-10-25  22  #include <dt-bindings/thermal/thermal.h>
3b68f55356c303 Neil Armstrong 2023-10-25  23  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
