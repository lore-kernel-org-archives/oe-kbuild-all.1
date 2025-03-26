Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9542A1B2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742995169; cv=none; b=ENunGat3rNjOB5XSnEnx7M80qTUQ4lX4wE9A+2oWpqfOwHFKhGJ2fjxFqIen95s8VrkO9iAkK8g74zYAbC6duaoDH/769u8rMgJjcNlXAhu9Dt4u6uyWQZqIazcxa52cO5zl1f8hXICI3GWOH3qryOkKNrDewdMD16JS3DYTqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742995169; c=relaxed/simple;
	bh=RbNINfroqiCuywW9HSKY1xVu1odzlXtAoKumRfi8WlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVz/D7BaHoZm4/QyTc5ofYjUsEqY1rFkFkU7jb19vm4jrQOl1UbqmnimHvCeRZBeFMsbKVVEpLqzrle+dgUY/8pPn4id/WYAqHtl0kTwbr1SHxMT5xtUJUUjI9OjgJSBOX0Hp0JRby3cRSW3+MqCNnpW5RhZHLUlw44TDBJBvuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoBSxfQM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoBSxfQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742995168; x=1774531168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RbNINfroqiCuywW9HSKY1xVu1odzlXtAoKumRfi8WlM=;
  b=eoBSxfQM+dxPnwfbE/A6EjS10qyxyb7ass4j3hgPZHTM8/utFpdnR3S6
   +8OztuxrzUj84Yx7FLoqK7RMjB/Zc6PMmXiQl7bZCXCtZF+G9zR1cJ5QF
   amg4yvTWWlt/zcUHZ7IPk6iqJ6G6Ra++eCCVcubecO9yhIFoSOyB4QhH+
   MRukdCz6MNnpq6n+TAw04zLpInNMo/SPHbgS4nkyAEPJ2k5xxAaV8ou2s
   q6E8mHUbrwPT9Gfq4l09XBUuB+UOPp39zSRHKy9ws06N/Ip+bnkSz4Xb+
   HscRll4POaXpA12kO2MubeTxem/XJ8ODbPgyB5z5nAQR27IHJdQa0mHwI
   g==;
X-CSE-ConnectionGUID: yxt4OXrGTWi86/6C/rs6PQ==
X-CSE-MsgGUID: 6+co/EEwShWExn7xcqF1dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44444090"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="44444090"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 06:19:28 -0700
X-CSE-ConnectionGUID: KXopDMDuTfC6FjLlRrAxJQ==
X-CSE-MsgGUID: v/9I6POWSJqWKsneIIa7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="124686297"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2025 06:19:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txQfE-0005kt-0h;
	Wed, 26 Mar 2025 13:19:24 +0000
Date: Wed, 26 Mar 2025 21:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <202503262013.maulUBMC-lkp@intel.com>
References: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build errors:

[auto build test ERROR on 23a708916ec7ab21c8c81d61bdb7cb933f6867d5]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/arm64-dts-amlogic-a4-add-pinctrl-node/20250326-131834
base:   23a708916ec7ab21c8c81d61bdb7cb933f6867d5
patch link:    https://lore.kernel.org/r/20250326-pinctrl-node-a4-v1-1-8c30639480f6%40amlogic.com
patch subject: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
config: arm64-randconfig-003-20250326 (https://download.01.org/0day-ci/archive/20250326/202503262013.maulUBMC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503262013.maulUBMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503262013.maulUBMC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts:8:
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:8:10: fatal error: dt-bindings/pinctrl/amlogic,pinctrl.h: No such file or directory
       8 | #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +8 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi

   > 8	#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
     9	/ {
    10		cpus {
    11			#address-cells = <2>;
    12			#size-cells = <0>;
    13	
    14			cpu0: cpu@0 {
    15				device_type = "cpu";
    16				compatible = "arm,cortex-a53";
    17				reg = <0x0 0x0>;
    18				enable-method = "psci";
    19			};
    20	
    21			cpu1: cpu@1 {
    22				device_type = "cpu";
    23				compatible = "arm,cortex-a53";
    24				reg = <0x0 0x1>;
    25				enable-method = "psci";
    26			};
    27	
    28			cpu2: cpu@2 {
    29				device_type = "cpu";
    30				compatible = "arm,cortex-a53";
    31				reg = <0x0 0x2>;
    32				enable-method = "psci";
    33			};
    34	
    35			cpu3: cpu@3 {
    36				device_type = "cpu";
    37				compatible = "arm,cortex-a53";
    38				reg = <0x0 0x3>;
    39				enable-method = "psci";
    40			};
    41		};
    42	
    43		sm: secure-monitor {
    44			compatible = "amlogic,meson-gxbb-sm";
    45	
    46			pwrc: power-controller {
    47				compatible = "amlogic,a4-pwrc";
    48				#power-domain-cells = <1>;
    49			};
    50		};
    51	};
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
