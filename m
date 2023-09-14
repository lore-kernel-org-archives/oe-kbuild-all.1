Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B621266C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694725493; x=1726261493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1HFqFpn6qRMJmPH5QN0s5azNTELpxThwJWafI5yh5K0=;
  b=nj0Q95hFY375Ej0fJoUOA16s8qEXRFTLB/aLFiEPN81VNI4SUYX9VMAj
   OI4G8CcwnlkAmdp8ZpZBMnPAautrO5HJZajo+0mMzIsNCPyFCisrBtDin
   uVF3l3CQ0LbNMj6e63327KX1zC0Sl2PlWeXaG9DUGlzGWfemi8fZMJokU
   iZ+KQc9u7loMKjf69RuqAWfyZBctDw82Ew+VU2sHMIXaDYzr2hW7NALo2
   xaQkDKvXz3mpSILY4yt/ieBuP4ZXWA8SU7nJmVpFoCYmcsTH1EQLoLxIh
   pm5K5xx/cW07gDtlFYE5hM05usU0fKDa5vdh3gje/V8RyF9i5UA6YJ6T4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378996055"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="378996055"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 14:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918379557"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="918379557"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 14:04:49 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgtW3-00024N-1I;
	Thu, 14 Sep 2023 21:04:47 +0000
Date: Fri, 15 Sep 2023 05:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 83/152] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202309150511.kJuaaDOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   e510c064ef4961248313eb1adca5b08cec056708
commit: e2618ab264c9d17bb4c1909d9805341d800ddc02 [83/152] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309150511.kJuaaDOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150511.kJuaaDOi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
