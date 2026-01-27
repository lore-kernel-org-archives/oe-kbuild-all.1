Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D41357A3E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 22:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552640; cv=none; b=Zfo8qZ4Q/1+pACOSu3N9+NYjIyPOlKi8unKVOBwsJKbKhBJpUq/Y06Fw0PH7nQC3vBBlepuXuWCuRwkb9hYvmJ3bCQtc/Vu+2BPfqOcANQKmzMV+NxJ/L42/nfwQcH7ymOs9YmRLtyrm+Dgr2EVDqk7m76i4h8hXdyx1RC/CtWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552640; c=relaxed/simple;
	bh=EB3mSuDS1Sk8QBges5GOMeOTze8afRt8DT8JE1kTUl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxRAtEn+Hqza590X+47lsvgQYbmSRWwtgPvHsmD5VpdyS2sA0/JwLWEeXCiRYIy5NYRERBkdrnnFkjbDCn3Tz3leDS1+OhsiQeIgTy2B4nokjQUvFJGo4p1ihFPUSS5uMNITE3tqK83/E3t39brnfb1mtsod1An8dtzOnUMKzQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDXbiyu7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDXbiyu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769552639; x=1801088639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EB3mSuDS1Sk8QBges5GOMeOTze8afRt8DT8JE1kTUl0=;
  b=jDXbiyu7AEwIr3e+2L7IWViYHsooNz6fQk1H/uF8q8Tq9+4yEJ9OUCbc
   A4sCWGOVzgUCpJmyQNL9otX6QRHlpPZK3zPRSrRzcQnz7nq5f7qukiApk
   JRSsmMlC3GCAWuonWgalwNGDLxjhRjLrVlcBG8s+6PhwoR+5MKw+lRZ1i
   HfMXP8yAN1xWB1chriia5a+h1f+atmNx0VZBaJRrqWAtOPf333ezm0W5B
   ssYLuT0ZsV7dGyOuyWYs9o3+QpQP3Kbh2UaGNNV01DJlpMkTgHz5ixDSF
   OdVVIRdH03hi60QjrIsnR7ivfgypo4vBymhYBm0hm72Xt2AYozn35PAZC
   w==;
X-CSE-ConnectionGUID: myrNZ1uIR4Kt/caubcTHWw==
X-CSE-MsgGUID: jOBvtE1NR9qfyNxGCuPjxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70803376"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70803376"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 14:23:59 -0800
X-CSE-ConnectionGUID: W5hcZtolRKSR4Iz5vvSJWA==
X-CSE-MsgGUID: zNYtvbx1SJ+xObqXnClBRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212952144"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 14:23:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkrTV-00000000YyK-11q0;
	Tue, 27 Jan 2026 22:23:53 +0000
Date: Wed, 28 Jan 2026 06:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: victor.duicu@microchip.com, linux@roeck-us.net, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net
Cc: oe-kbuild-all@lists.linux.dev, marius.cristea@microchip.com,
	victor.duicu@microchip.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add support for MCP998X
Message-ID: <202601280635.9DHNZdk6-lkp@intel.com>
References: <20260127151823.9728-3-victor.duicu@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127151823.9728-3-victor.duicu@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0f61b1860cc3f52aef9036d7235ed1f017632193]

url:    https://github.com/intel-lab-lkp/linux/commits/victor-duicu-microchip-com/dt-bindings-hwmon-add-support-for-MCP998X/20260127-234206
base:   0f61b1860cc3f52aef9036d7235ed1f017632193
patch link:    https://lore.kernel.org/r/20260127151823.9728-3-victor.duicu%40microchip.com
patch subject: [PATCH v3 2/2] hwmon: add support for MCP998X
config: hexagon-randconfig-r071-20260128 (https://download.01.org/0day-ci/archive/20260128/202601280635.9DHNZdk6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280635.9DHNZdk6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280635.9DHNZdk6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hwmon/mcp9982.c:304 expecting prototype for struct mcp9992_priv. Prototype was for struct mcp9982_priv instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
