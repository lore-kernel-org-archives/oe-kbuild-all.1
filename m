Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B501E51C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695486474; x=1727022474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2EgNBjJKkDIylgKrJfdQAHWESh7j0MS+R2T8A6UuXSQ=;
  b=Dc74im1sQogK9GLlcNppJtSKEPEWXnkjQnH1PwcYpz6X68SA1+4VcpIR
   yszxJvDSvkRBHNdZ6ruY27kzE6UML7N4oE9JEV4JWYvEoOxGWlzoJBvR3
   t/teloBhTe2lVbZPwCmZq4Jkt+VK9KTsT4+yczRRfIh7SiYKTsAkd1GRw
   uu2dt/Jn2q7dWie4bHWJ16ngmFY9N24UKb8EzNTH/Eb0aLXJzVwz+IBrv
   wXroYxBv+qe9dMvYNesI6hurzWg9Eyc7bufP6e4ctgGbqUcmXcAXlAQSg
   Jl4eSYikz5CcNR/vexEKoNT7YZHFkT0DMC0ND4uPzwyebq3Vr7xDjPnb/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="379916304"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="379916304"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 09:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="697540892"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="697540892"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Sep 2023 09:27:49 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk5Tv-0002cs-2D;
	Sat, 23 Sep 2023 16:27:47 +0000
Date: Sun, 24 Sep 2023 00:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Add interconnect nodes for SDX75
Message-ID: <202309240033.AmuJpOkT-lkp@intel.com>
References: <1695383434-24705-2-git-send-email-quic_rohiagar@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1695383434-24705-2-git-send-email-quic_rohiagar@quicinc.com>

Hi Rohit,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohit-Agarwal/arm64-dts-qcom-Add-interconnect-nodes-for-SDX75/20230922-195140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1695383434-24705-2-git-send-email-quic_rohiagar%40quicinc.com
patch subject: [PATCH 1/3] arm64: dts: qcom: Add interconnect nodes for SDX75
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230924/202309240033.AmuJpOkT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240033.AmuJpOkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240033.AmuJpOkT-lkp@intel.com/

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
