Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64970EC6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 18:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfdVS6GM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697223578; x=1728759578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EsdyqAMRIhj+nuI28f5pAZYuhBMa9I0ITCTO8KcjSjQ=;
  b=DfdVS6GMXYd42Acz0cdinNlFxTmZ9oU1vSAKEmAnk4OvdRIxGjPzs6xT
   8aBD0kwN4H6thwCuljB72PKgvNkqjAp0IvkquKwcoo6CnIfmP095rDmEw
   02G7IsWRCM09zStpufo+dwbPoSLpo7Byuj9qRMgmCv8SIQzA7g2K2uU9A
   EWpgs8+5v2y+nErn1TDwNH7ahKqOOlK8aW+SFQggWZdjq7lNVC6xx4xaY
   dxugSWanVGTHxQ2Q4REFHqIqPbFEZmwNsqAL+dOodwyh8MPxDw8L/xXID
   YKa+2Jak93yfmlGUcn3pN4JQwKHPM1mbRODyTSJJ6PfNb5/ninXHoKmk6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370308614"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="370308614"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 11:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1002055617"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="1002055617"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Oct 2023 11:59:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrNNY-0005Ht-35;
	Fri, 13 Oct 2023 18:59:20 +0000
Date: Sat, 14 Oct 2023 02:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org,
	nfraprado@collabora.com, u-kumar1@ti.com, peng.fa@nxp.com,
	quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
	quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
	kernel@quicinc.com, Tengfei Fan <quic_tengfan@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>
Subject: Re: [PATCH v5 RESEND 3/7] arm64: dts: qcom: sm4450: Add RPMH and
 Global clock
Message-ID: <202310140224.m4RecMup-lkp@intel.com>
References: <20231011031415.3360-4-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011031415.3360-4-quic_tengfan@quicinc.com>

Hi Tengfei,

kernel test robot noticed the following build errors:

[auto build test ERROR on 940fcc189c51032dd0282cbee4497542c982ac59]

url:    https://github.com/intel-lab-lkp/linux/commits/Tengfei-Fan/dt-bindings-interrupt-controller-qcom-pdc-document-qcom-sm4450-pdc/20231011-111816
base:   940fcc189c51032dd0282cbee4497542c982ac59
patch link:    https://lore.kernel.org/r/20231011031415.3360-4-quic_tengfan%40quicinc.com
patch subject: [PATCH v5 RESEND 3/7] arm64: dts: qcom: sm4450: Add RPMH and Global clock
config: arm64-randconfig-003-20231014 (https://download.01.org/0day-ci/archive/20231014/202310140224.m4RecMup-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140224.m4RecMup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140224.m4RecMup-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/sm4450-qrd.dts:8:
>> arch/arm64/boot/dts/qcom/sm4450.dtsi:7:10: fatal error: dt-bindings/clock/qcom,sm4450-gcc.h: No such file or directory
       7 | #include <dt-bindings/clock/qcom,sm4450-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +7 arch/arm64/boot/dts/qcom/sm4450.dtsi

   > 7	#include <dt-bindings/clock/qcom,sm4450-gcc.h>
     8	#include <dt-bindings/gpio/gpio.h>
     9	#include <dt-bindings/interrupt-controller/arm-gic.h>
    10	#include <dt-bindings/soc/qcom,rpmh-rsc.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
