Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F4431984B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755195456; cv=none; b=nVlyssF14SYKqUcLzeGddVGOkIMgkQKVew9HaX4SQfz02GMUjCgZDEL4lE5TH88dwmmPZ1d9KL0iqvchxyfUva7GCe89wQLX1QmhF6KyydIjkmxnWsu43jhki9+1XIeMTEvdSf21mnEjD2d0RP0+7aWnNRyU0Qp3Vwfowggdf3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755195456; c=relaxed/simple;
	bh=+l0dsGNXogQsWwx7ojzYoLkQ027t6PnyWRHQ9CgXUvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELcu5TPtb/Btz5h7vU90AcPSWcYX0YlLcFf2Y7UO7q2Fq0nS/F28QpIOcPOrn/JioPc5fDkl0LdkypYWEI1UUdc+SzCxWnUIMX+Qk0/CCnhDb/xlKJHpJ/Ww4uGHWkDdacgF/kI+UOkWV8wvDoGRh3+rV9JheveDHFGt/8PrFFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qt4IQlJc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qt4IQlJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755195455; x=1786731455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+l0dsGNXogQsWwx7ojzYoLkQ027t6PnyWRHQ9CgXUvw=;
  b=Qt4IQlJcVVMk/1JSABckuMK1JWh0ah8dlxnQ5ExnjTgwl/R37RN/EcI/
   QtEawdElIj7BJWzLYReeDmqMDtGtUwHaA+4xyZeSR3sXaBT/pgZ8CNOO9
   vz7AfEJqJqB7sUUKugCAc5t+2++n5GaVBgOaOw5oQfCSSQ+YrSHNmvMdy
   ZviCcwCjtOXRXMDAHhXJTRc8veSTbzYEm4td7McTqVEjaBki3olzcEo/u
   8Vx5QChksWRkVaLYRb8f10sUXL/KfbLV33lClk2p3TACF0lRqMl1RdAUx
   Lkv0bXNPW123Mpgmmjm7rIjWYexp7BSOyCYzLs+04G5mqoctdTO1R+s16
   g==;
X-CSE-ConnectionGUID: so9JyRlmTzCSlzidfL6StQ==
X-CSE-MsgGUID: +Z1AmoU0TXuJWjhQaBjgjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57593704"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57593704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 11:17:34 -0700
X-CSE-ConnectionGUID: ZbAlZ/tGRs2t1LVzaSVSow==
X-CSE-MsgGUID: mmJdgdRvRm+GuISNzMYOVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204003871"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2025 11:17:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umcW1-000BES-1J;
	Thu, 14 Aug 2025 18:17:29 +0000
Date: Fri, 15 Aug 2025 02:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 2204/2527]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: mdp@ae01000
 (qcom,sc8180x-dpu): $nodename:0: 'mdp@ae01000' does not match
 '^display-controller@[0-9a-f]+$'
Message-ID: <202508150253.wFvCsKUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   931e46dcbc7e6035a90e9c4a27a84b660e083f0a
commit: 965a710f980b401d4ac286676e550cfca4a8074c [2204/2527] dt-bindings: display/msm: describe DPU on SC8180X
config: arm64-randconfig-051-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150253.wFvCsKUQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150253.wFvCsKUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150253.wFvCsKUQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2641.31-2686.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: mdp@ae01000 (qcom,sc8180x-dpu): $nodename:0: 'mdp@ae01000' does not match '^display-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-dpu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2641.31-2686.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: mdp@ae01000 (qcom,sc8180x-dpu): $nodename:0: 'mdp@ae01000' does not match '^display-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-dpu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
