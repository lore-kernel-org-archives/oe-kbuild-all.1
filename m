Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64852441C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696193867; x=1727729867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=758DrSEcuFaG2JVSDrnKrxCHgbC5DHZC/ey5mhM5Dx0=;
  b=H2OOruPZnha5kZzTjWSDW+Sww0gesDJ5HRLRSeCpJ5xjuNN6zCME5UPY
   LbxgUlQt4JEm6o75jKa9u4/N5b4v1YfwBw+OC8PNAsHWAle2XiuF6HhXv
   MVW4niMxRq4Jlxfufrjq+olMU/ANIa9/E41qjr+LKNUlrTNvcnYKbRqt1
   BIeUcintNMIGdqd1ydQc1363DlaYZckHgmS/uvFqSCJnRQeEwxrrVJ9qJ
   SqFG0EAZGcqWDBK067Swv7vFWp10W/+ZPFZs4XTsDMnGrhJVZoKYUFEdH
   Pe9ikdSOxbrWQT1weQ9QsZsfLRiy6/20fNCuHEvd0WjIrg6ix4Dm2BoOt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="372902412"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="372902412"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 13:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="785612314"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="785612314"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Oct 2023 13:57:43 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn3VT-0005Ow-0Z;
	Sun, 01 Oct 2023 20:57:39 +0000
Date: Mon, 2 Oct 2023 04:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: Add interconnect nodes for SDX75
Message-ID: <202310020405.aU033fMG-lkp@intel.com>
References: <1695720564-2978-2-git-send-email-quic_rohiagar@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1695720564-2978-2-git-send-email-quic_rohiagar@quicinc.com>

Hi Rohit,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohit-Agarwal/arm64-dts-qcom-Add-interconnect-nodes-for-SDX75/20230926-173336
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1695720564-2978-2-git-send-email-quic_rohiagar%40quicinc.com
patch subject: [PATCH v2 1/3] arm64: dts: qcom: Add interconnect nodes for SDX75
config: arm64-randconfig-002-20230930 (https://download.01.org/0day-ci/archive/20231002/202310020405.aU033fMG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310020405.aU033fMG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310020405.aU033fMG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/sdx75-idp.dts:9:
>> arch/arm64/boot/dts/qcom/sdx75.dtsi:11:10: fatal error: dt-bindings/interconnect/qcom,sdx75.h: No such file or directory
      11 | #include <dt-bindings/interconnect/qcom,sdx75.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 arch/arm64/boot/dts/qcom/sdx75.dtsi

  > 11	#include <dt-bindings/interconnect/qcom,sdx75.h>
    12	#include <dt-bindings/interrupt-controller/arm-gic.h>
    13	#include <dt-bindings/power/qcom,rpmhpd.h>
    14	#include <dt-bindings/power/qcom-rpmpd.h>
    15	#include <dt-bindings/soc/qcom,rpmh-rsc.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
