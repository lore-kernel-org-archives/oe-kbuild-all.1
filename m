Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BEF1F4E3B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 00:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747701694; cv=none; b=lWf6oop+QCMIMC0J8nKcHWrA1uSqc2pck32bNzue7D9mZ6XXIxxNnqrb1YgVPmFklIm5WKMqE9V5A7+/ylU0tepYO98EyW0LdEN7plYjA+iPxQw5b7KcSIdgrBYBAgfV4/XQuQP1IGKZzrD206XfbSxf+uBTI9VSJRF5WdXBiRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747701694; c=relaxed/simple;
	bh=3yycBl/zY8X2lXOzRZ8dR0S8qgsBRsppqzz+TA9PTf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBnXn5g4yDerW+6TVHAu5C1qDjK179hEJt2rHM1yvRtFVLbV+Rl9kijRNKd+LIEqLdA63vslZtI4aYcc+72U1q5XqD0ymBQyPcv2LV4kWpPCWtSyoYTyXKDNtTcUNqp/yp/a9MfydrrvbYSpoYdJp6F8jhBnviYlUQM+o0Q4568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3kiY7CX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3kiY7CX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747701692; x=1779237692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3yycBl/zY8X2lXOzRZ8dR0S8qgsBRsppqzz+TA9PTf8=;
  b=c3kiY7CXGC9w4gRq9usxIhlF8qwBenvUlgNbNeSh3YhiWF1AccrDnqIH
   y/5ucZ/Ru+ypKHKWEOlODBAj/Y8qFx5cw2PpJxzTWRQwDm01qLn3JNjVv
   yWE8PYbRB0UKizv47Ar0ShiUN4KakXuVqBNLLGIOA56mxpsImuvZZQ6J4
   XG60jpRrUZADdJXG+hMGEAQnPgMwjmwmAP28cbFqLz+vls/ulzw4HGA6/
   bNSyLTY1UM4XSO6RqHvSpeFHFudqJ8x/LzldblZmD2YP2/6VUN7ku3hSo
   UpbuOWlf0m3WJqWKg2U7T7gsElHIP21IXOs+9GXcV34wXfpUI3PWpufX4
   Q==;
X-CSE-ConnectionGUID: pDedysZwQw6irGrXBZaFVA==
X-CSE-MsgGUID: RHyDx5ueS/mncT5SARKo7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52249538"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52249538"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 17:41:32 -0700
X-CSE-ConnectionGUID: gqcRaprWR3+HcCRxrkzwgA==
X-CSE-MsgGUID: nN8kF0VgTvSZ5kM/W0ov+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144520504"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2025 17:41:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHB2r-000M1U-1x;
	Tue, 20 May 2025 00:41:25 +0000
Date: Tue, 20 May 2025 08:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 2/2] Allow for riscv-clock to pick up mmio address.
Message-ID: <202505200822.Av88hkk5-lkp@intel.com>
References: <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>

Hi Aleksa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9c32cda43eb78f78c73aee4aa344b777714e259b]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Paunovic-via-B4-Relay/dt-bindings-timer-mti-gcru/20250514-165347
base:   9c32cda43eb78f78c73aee4aa344b777714e259b
patch link:    https://lore.kernel.org/r/20250514-riscv-time-mmio-v4-2-cb0cf2922d66%40htecgroup.com
patch subject: [PATCH v4 2/2] Allow for riscv-clock to pick up mmio address.
config: riscv-randconfig-r121-20250520 (https://download.01.org/0day-ci/archive/20250520/202505200822.Av88hkk5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505200822.Av88hkk5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200822.Av88hkk5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zabha'
>> drivers/clocksource/timer-riscv.c:58:16: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/clocksource/timer-riscv.c:58:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/clocksource/timer-riscv.c:58:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/clocksource/timer-riscv.c:58:16: sparse:     got unsigned int [usertype] *

vim +/__iomem +58 drivers/clocksource/timer-riscv.c

    55	
    56	static u32 __maybe_unused mmio_get_cycles_hi(void)
    57	{
  > 58		return readl_relaxed(((u32 *)riscv_time_val) + 1);
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
