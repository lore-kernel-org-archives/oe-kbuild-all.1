Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FDE5254
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 12:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694177954; x=1725713954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VrPMYgQ16pTtZlBVSNm737aoWB5stO3oQMVdp8PvDig=;
  b=KH4Tp0xMCQT3zA8akF1TURHgIpI8WLCjvgvGioMYAmxxHCp52tgbtzzB
   LWu7K0ZMO8EiyrqtPSENiJt/XrSR98GV8sdAg5MdRGrDktxLAhaEYRsMD
   XgR6401xgyOQND6dqyANEcXKUkMUbizRikHZ1WfL5gTxMGOTqRyIrMVA4
   +foRyMnUryZ2Y9nRn+zAoqlMs7Ihm1haPwlCHM7T27bu02DPrpdwBUHYT
   PS30bh2tgndU+5G7foZm8hTiK82OPNO+P8Hu40RBy+FiAjSd4v8OjWJlY
   pt5/1wwkWRr8iyY79FHTsPrkq1nEZ42iYGGM9D90IMqUQ1JnHMqtp+QHq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357943098"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="357943098"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 05:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="916165808"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="916165808"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Sep 2023 05:59:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeb4j-0002Gx-02;
	Fri, 08 Sep 2023 12:59:05 +0000
Date: Fri, 8 Sep 2023 20:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	tglx@linutronix.de, maz@kernel.org, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robimarko@gmail.com,
	quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
	quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
	kernel@quicinc.com, quic_bjorande@quicinc.com,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm4450: Add RPMH and Global clock
 controller
Message-ID: <202309082044.62LHUCGY-lkp@intel.com>
References: <20230908065847.28382-6-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908065847.28382-6-quic_tengfan@quicinc.com>

Hi Tengfei,

kernel test robot noticed the following build errors:

[auto build test ERROR on a47fc304d2b678db1a5d760a7d644dac9b067752]

url:    https://github.com/intel-lab-lkp/linux/commits/Tengfei-Fan/dt-bindings-firmware-document-Qualcomm-SM4450-SCM/20230908-150308
base:   a47fc304d2b678db1a5d760a7d644dac9b067752
patch link:    https://lore.kernel.org/r/20230908065847.28382-6-quic_tengfan%40quicinc.com
patch subject: [PATCH 5/6] arm64: dts: qcom: sm4450: Add RPMH and Global clock controller
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230908/202309082044.62LHUCGY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309082044.62LHUCGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309082044.62LHUCGY-lkp@intel.com/

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
