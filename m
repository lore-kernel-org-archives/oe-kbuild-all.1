Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C12371DD7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 19:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581298; cv=none; b=lYt7KLJLAljPJSmnHLEiJ4JXJBOYhYT11ZkQb3RYuahlxFxj0KLyWQGIZqIN89VAf+AvtN3PlCwOZC0KjWGIxhVyBRYrz0zlZ6mM8EXdwAcdMSi8ratSVSl38tkBXaFq9MVO1vgsHIXXkfJ6hhtV6CfCnZ9Rfe3Vghw77GiRI94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581298; c=relaxed/simple;
	bh=hDMQAHc9RVb5AJEaEAQLuugyJLi+svbEpdJT56L2hjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJ1tLD9bKP5D9mkq0covJ2oiDxl31NScSP9w3nM/Ue1iJnA+4gZeRX0vNPgsK9peCICVG9f9+Pgs+InbYETOb0d1ilx45KSxX5SqZdtJeHQ0xJwCVkkvjh3HkgRmpK4gJ/2pNjehb5qVkUUDicmx2eMV/oRWhX/Ju8fZG7LQehQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGOL0WkQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGOL0WkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763581296; x=1795117296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hDMQAHc9RVb5AJEaEAQLuugyJLi+svbEpdJT56L2hjE=;
  b=TGOL0WkQSYZxoJumAW0z21lSizDeXgsaXYPTtTDizvO5R0GNAL6rzNM3
   EI09H8BU0EYid2qqYM+9rjLB0dI3Tsg65585dUCbCYwN9AXOL99pJPNM0
   2OYIsemBtS/Ibvdfw9j0aOeOnpuoTXDNG+JYsSeWZ68RlFq1hyLbwKPk0
   JGcWkPsEcE321+pijphg72dEanl7FRJsJFvKiEdbLGRq2H1YI+jb1HiWF
   Hcmp1zsdCFtKXljXrU9TiH6iT/Q16rY4oVOX64hH/uOEsUy4MxTv+FKUk
   f1pqSvXXVJOHBMTUvNu+OdrEyklIgfrSvxU+Zz3r8r3QQGJXBh4mZnb7p
   g==;
X-CSE-ConnectionGUID: veh5kRyTTIeTkB3rIxrCPw==
X-CSE-MsgGUID: T0hTozHjQ0eguhnQghNGEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68241820"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="68241820"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 11:41:35 -0800
X-CSE-ConnectionGUID: XXtY/oFRS+GEeYDacQLZpg==
X-CSE-MsgGUID: 9TiGho1CQ32AEy1MZXDQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="190940103"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2025 11:41:31 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLo3V-0003Ex-1A;
	Wed, 19 Nov 2025 19:41:29 +0000
Date: Thu, 20 Nov 2025 03:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sander Vanheule <sander@svanheule.net>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Sander Vanheule <sander@svanheule.net>
Subject: Re: [PATCH v7 4/6] pinctrl: Add RTL8231 pin control and GPIO support
Message-ID: <202511200318.xcfHOO5R-lkp@intel.com>
References: <20251117215138.4353-5-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117215138.4353-5-sander@svanheule.net>

Hi Sander,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-mfd/for-mfd-fixes lee-leds/for-leds-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sander-Vanheule/dt-bindings-leds-Binding-for-RTL8231-scan-matrix/20251118-055707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20251117215138.4353-5-sander%40svanheule.net
patch subject: [PATCH v7 4/6] pinctrl: Add RTL8231 pin control and GPIO support
config: x86_64-randconfig-122-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200318.xcfHOO5R-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200318.xcfHOO5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200318.xcfHOO5R-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pinctrl/pinctrl-rtl8231.o: in function `pinconf_generic_dt_node_to_map_all':
   include/linux/pinctrl/pinconf-generic.h:235:(.text+0x6e4): undefined reference to `pinconf_generic_dt_node_to_map'
>> ld: drivers/pinctrl/pinctrl-rtl8231.o:(.rodata+0x248): undefined reference to `pinconf_generic_dt_free_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
