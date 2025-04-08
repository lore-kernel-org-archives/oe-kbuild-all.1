Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81420330
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115510; cv=none; b=ap24ZhudBgC3lZn78hroLr2Mn0qIVHaT9Gl3UlMP5EHyioFL4IhsD+zi9jsPuf1r3vklcRcekyUXbjAL3KQuOAOLf/isczve7ACF04X3LD1e/fMkJ5bu2flYgXcKW8vLLS2LRHz38godqEGdTeL5QyV9jI3khtU3IzqPQw2DIFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115510; c=relaxed/simple;
	bh=zBbh+OG9+5GtjIqDgtLx9PPHEU0YUIW/suoqNt5o1+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWNaY5oUKhZynHkgKIxD/lSE5C1BjrK2In7cZbPTBOK4oJIzvvbR/tgzIBu+Wk8nKWtJH81VasyollTtPvRyf08QFE3/v0XjB9JEkBvau79JeyTxf9uVGk+f5Al+qP6XU+QpcMyDi4d/N+UKRkaCya5gu3kyqVOoVx99ybW3rw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hs+7hlqm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hs+7hlqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744115509; x=1775651509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zBbh+OG9+5GtjIqDgtLx9PPHEU0YUIW/suoqNt5o1+c=;
  b=hs+7hlqmcZLKmwSjzXOJrCsgCzGTkhz3MusJzS9GXEMbdHeEySJMiGWL
   yvYdBqxTDiHUmIRk+e9uUt365dv3buQMhhMTBNEBJFGOiyTiZSxwocsyN
   XfR352f5T04rhiMmsUMyGuXPcovlAAYjjdN0Besd0FnCqn/h7JonA7KMT
   PMuU5f+NQKymzQMx2yyg3Ity0K+Z59ODg5dQYUnyaJLPvTXqLgukNsoq9
   PRxIevt4mNDkx22o6MLl5m8W9iK0S49pt42+CpkUo98XOL+slCK2R02Ud
   PetX27AsKc79hzccD+Kmy2UVTY/fL1f3Ux7FTlwu19HFx9utw5d9yevvf
   w==;
X-CSE-ConnectionGUID: jrm2fLSIT+a0v9p3ei5jug==
X-CSE-MsgGUID: +fpZ0VEXTbyc0FT4fe3qzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56914329"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56914329"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:31:19 -0700
X-CSE-ConnectionGUID: L9gM72ZtQ3u6tLaIwevy7w==
X-CSE-MsgGUID: PXzh/IxpS9SE1Mfe4dpRVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128590484"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Apr 2025 05:31:17 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u286l-0006Ud-1m;
	Tue, 08 Apr 2025 12:31:15 +0000
Date: Tue, 8 Apr 2025 20:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>
Subject: [linux-next:master 1418/1936]
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:103.6-597.4: Warning
 (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit
 name
Message-ID: <202504082019.fsTTMJoE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
commit: 3a1883f32b9b5083883624f9b39a3c6edfa6d490 [1418/1936] arm64: dts: allwinner: a523: add Avaota-A1 router support
config: arm64-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250408/202504082019.fsTTMJoE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504082019.fsTTMJoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504082019.fsTTMJoE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:103.6-597.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

vim +103 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi

35ac96f79664934 Andre Przywara 2025-03-07   10  
35ac96f79664934 Andre Przywara 2025-03-07   11  / {
35ac96f79664934 Andre Przywara 2025-03-07   12  	interrupt-parent = <&gic>;
35ac96f79664934 Andre Przywara 2025-03-07   13  	#address-cells = <2>;
35ac96f79664934 Andre Przywara 2025-03-07   14  	#size-cells = <2>;
35ac96f79664934 Andre Przywara 2025-03-07   15  
35ac96f79664934 Andre Przywara 2025-03-07   16  	cpus {
35ac96f79664934 Andre Przywara 2025-03-07   17  		#address-cells = <1>;
35ac96f79664934 Andre Przywara 2025-03-07   18  		#size-cells = <0>;
35ac96f79664934 Andre Przywara 2025-03-07   19  
35ac96f79664934 Andre Przywara 2025-03-07   20  		cpu0: cpu@0 {
35ac96f79664934 Andre Przywara 2025-03-07   21  			compatible = "arm,cortex-a55";
35ac96f79664934 Andre Przywara 2025-03-07   22  			device_type = "cpu";
35ac96f79664934 Andre Przywara 2025-03-07   23  			reg = <0x000>;
35ac96f79664934 Andre Przywara 2025-03-07   24  			enable-method = "psci";
35ac96f79664934 Andre Przywara 2025-03-07   25  		};
35ac96f79664934 Andre Przywara 2025-03-07   26  
35ac96f79664934 Andre Przywara 2025-03-07   27  		cpu1: cpu@100 {
35ac96f79664934 Andre Przywara 2025-03-07   28  			compatible = "arm,cortex-a55";
35ac96f79664934 Andre Przywara 2025-03-07   29  			device_type = "cpu";
35ac96f79664934 Andre Przywara 2025-03-07   30  			reg = <0x100>;
35ac96f79664934 Andre Przywara 2025-03-07   31  			enable-method = "psci";
35ac96f79664934 Andre Przywara 2025-03-07   32  		};
35ac96f79664934 Andre Przywara 2025-03-07   33  
35ac96f79664934 Andre Przywara 2025-03-07   34  		cpu2: cpu@200 {
35ac96f79664934 Andre Przywara 2025-03-07   35  			compatible = "arm,cortex-a55";
35ac96f79664934 Andre Przywara 2025-03-07   36  			device_type = "cpu";
35ac96f79664934 Andre Przywara 2025-03-07   37  			reg = <0x200>;
35ac96f79664934 Andre Przywara 2025-03-07   38  			enable-method = "psci";
35ac96f79664934 Andre Przywara 2025-03-07   39  		};
35ac96f79664934 Andre Przywara 2025-03-07   40  
35ac96f79664934 Andre Przywara 2025-03-07   41  		cpu3: cpu@300 {
35ac96f79664934 Andre Przywara 2025-03-07   42  			compatible = "arm,cortex-a55";
35ac96f79664934 Andre Przywara 2025-03-07   43  			device_type = "cpu";
35ac96f79664934 Andre Przywara 2025-03-07   44  			reg = <0x300>;
35ac96f79664934 Andre Przywara 2025-03-07   45  			enable-method = "psci";
35ac96f79664934 Andre Przywara 2025-03-07   46  		};
35ac96f79664934 Andre Przywara 2025-03-07   47  
35ac96f79664934 Andre Przywara 2025-03-07   48  		cpu4: cpu@400 {
35ac96f79664934 Andre Przywara 2025-03-07   49  			compatible = "arm,cortex-a55";
35ac96f79664934 Andre Przywara 2025-03-07   50  			device_type = "cpu";
35ac96f79664934 Andre Przywara 2025-03-07   51  			reg = <0x400>;
35ac96f79664934 Andre Przywara 2025-03-07   52  			enable-method = "psci";
35ac96f79664934 Andre Przywara 2025-03-07   53  		};
35ac96f79664934 Andre Przywara 2025-03-07   54  
35ac96f79664934 Andre Przywara 2025-03-07   55  		cpu5: cpu@500 {
35ac96f79664934 Andre Przywara 2025-03-07   56  			compatible = "arm,cortex-a55";
35ac96f79664934 Andre Przywara 2025-03-07   57  			device_type = "cpu";
35ac96f79664934 Andre Przywara 2025-03-07   58  			reg = <0x500>;
35ac96f79664934 Andre Przywara 2025-03-07   59  			enable-method = "psci";
35ac96f79664934 Andre Przywara 2025-03-07   60  		};
35ac96f79664934 Andre Przywara 2025-03-07   61  
35ac96f79664934 Andre Przywara 2025-03-07   62  		cpu6: cpu@600 {
35ac96f79664934 Andre Przywara 2025-03-07   63  			compatible = "arm,cortex-a55";
35ac96f79664934 Andre Przywara 2025-03-07   64  			device_type = "cpu";
35ac96f79664934 Andre Przywara 2025-03-07   65  			reg = <0x600>;
35ac96f79664934 Andre Przywara 2025-03-07   66  			enable-method = "psci";
35ac96f79664934 Andre Przywara 2025-03-07   67  		};
35ac96f79664934 Andre Przywara 2025-03-07   68  
35ac96f79664934 Andre Przywara 2025-03-07   69  		cpu7: cpu@700 {
35ac96f79664934 Andre Przywara 2025-03-07   70  			compatible = "arm,cortex-a55";
35ac96f79664934 Andre Przywara 2025-03-07   71  			device_type = "cpu";
35ac96f79664934 Andre Przywara 2025-03-07   72  			reg = <0x700>;
35ac96f79664934 Andre Przywara 2025-03-07   73  			enable-method = "psci";
35ac96f79664934 Andre Przywara 2025-03-07   74  		};
35ac96f79664934 Andre Przywara 2025-03-07   75  	};
35ac96f79664934 Andre Przywara 2025-03-07   76  
35ac96f79664934 Andre Przywara 2025-03-07   77  	osc24M: osc24M-clk {
35ac96f79664934 Andre Przywara 2025-03-07   78  		#clock-cells = <0>;
35ac96f79664934 Andre Przywara 2025-03-07   79  		compatible = "fixed-clock";
35ac96f79664934 Andre Przywara 2025-03-07   80  		clock-frequency = <24000000>;
35ac96f79664934 Andre Przywara 2025-03-07   81  		clock-output-names = "osc24M";
35ac96f79664934 Andre Przywara 2025-03-07   82  	};
35ac96f79664934 Andre Przywara 2025-03-07   83  
35ac96f79664934 Andre Przywara 2025-03-07   84  	pmu {
35ac96f79664934 Andre Przywara 2025-03-07   85  		compatible = "arm,cortex-a55-pmu";
35ac96f79664934 Andre Przywara 2025-03-07   86  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
35ac96f79664934 Andre Przywara 2025-03-07   87  	};
35ac96f79664934 Andre Przywara 2025-03-07   88  
35ac96f79664934 Andre Przywara 2025-03-07   89  	psci {
35ac96f79664934 Andre Przywara 2025-03-07   90  		compatible = "arm,psci-0.2";
35ac96f79664934 Andre Przywara 2025-03-07   91  		method = "smc";
35ac96f79664934 Andre Przywara 2025-03-07   92  	};
35ac96f79664934 Andre Przywara 2025-03-07   93  
35ac96f79664934 Andre Przywara 2025-03-07   94  	timer {
35ac96f79664934 Andre Przywara 2025-03-07   95  		compatible = "arm,armv8-timer";
35ac96f79664934 Andre Przywara 2025-03-07   96  		arm,no-tick-in-suspend;
35ac96f79664934 Andre Przywara 2025-03-07   97  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
35ac96f79664934 Andre Przywara 2025-03-07   98  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
35ac96f79664934 Andre Przywara 2025-03-07   99  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
35ac96f79664934 Andre Przywara 2025-03-07  100  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
35ac96f79664934 Andre Przywara 2025-03-07  101  	};
35ac96f79664934 Andre Przywara 2025-03-07  102  
35ac96f79664934 Andre Przywara 2025-03-07 @103  	soc {

:::::: The code at line 103 was first introduced by commit
:::::: 35ac96f796649346c9b0440413dc6c5138249b3e arm64: dts: allwinner: Add Allwinner A523 .dtsi file

:::::: TO: Andre Przywara <andre.przywara@arm.com>
:::::: CC: Chen-Yu Tsai <wens@csie.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
