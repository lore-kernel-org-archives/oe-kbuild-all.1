Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9F17CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1c4eHlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697337020; x=1728873020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BUwl6/usmRlti/+3fPO0RhkKrPW43T4KsDphTzMcrXo=;
  b=V1c4eHlC1puqC1ljiWRo3pMXrhY/Gw+TntD7az2UT4X5LLs2WlDVLAYg
   GbNCjLsgRwtt3hxMYhs43slgEUa6eJNc6jGTGKlQJRrfX229nSYXjSvSK
   9LQNkkW2AYz+0W5Rzsk4ezh+a+sVSEc85R+QJj8kmilZXkGpJFJJ0kvRS
   pmyCTqAobxrIAWe6TE6RMrJRd8GQxG7Zbk/fPzGo/Sx+ofNmixdbeDN2u
   kvc0iIq/zKaymUOHWjqEf76zniJ+e4yIsT5+rcq7/ElQEux3VHsH4llnP
   9fNKwYlUgFIQswN0TUfrlw295PmtaV7PWRXSereGaVUb1Yl+2PAmZtPyp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388217592"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="388217592"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748833713"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="748833713"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 19:30:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrqtQ-0006wJ-0q;
	Sun, 15 Oct 2023 02:30:12 +0000
Date: Sun, 15 Oct 2023 10:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, andersson@kernel.org,
	agross@kernel.org, konrad.dybcio@linaro.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jonathan@marek.ca, quic_tdas@quicinc.com,
	vladimir.zapolskiy@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp: Add in CAMCC for
 sc8280xp
Message-ID: <202310151043.01L92wwx-lkp@intel.com>
References: <20231011185540.2282975-2-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011185540.2282975-2-bryan.odonoghue@linaro.org>

Hi Bryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/arm64-dts-qcom-sc8280xp-Add-in-CAMCC-for-sc8280xp/20231012-025807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231011185540.2282975-2-bryan.odonoghue%40linaro.org
patch subject: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151043.01L92wwx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151043.01L92wwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151043.01L92wwx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/sa8540p.dtsi:7,
                    from arch/arm64/boot/dts/qcom/sa8295p-adp.dts:13:
>> arch/arm64/boot/dts/qcom/sc8280xp.dtsi:11:10: fatal error: dt-bindings/clock/qcom,sc8280xp-camcc.h: No such file or directory
      11 | #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 arch/arm64/boot/dts/qcom/sc8280xp.dtsi

  > 11	#include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
    12	#include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
    13	#include <dt-bindings/interconnect/qcom,osm-l3.h>
    14	#include <dt-bindings/interconnect/qcom,sc8280xp.h>
    15	#include <dt-bindings/interrupt-controller/arm-gic.h>
    16	#include <dt-bindings/mailbox/qcom-ipcc.h>
    17	#include <dt-bindings/phy/phy-qcom-qmp.h>
    18	#include <dt-bindings/power/qcom-rpmpd.h>
    19	#include <dt-bindings/soc/qcom,gpr.h>
    20	#include <dt-bindings/soc/qcom,rpmh-rsc.h>
    21	#include <dt-bindings/sound/qcom,q6afe.h>
    22	#include <dt-bindings/thermal/thermal.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
