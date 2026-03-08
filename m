Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431FE33D4FF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772992193; cv=none; b=bIKb1JF14oN9fHvIrDe44ipF27z+GFSUPdJqvmjf/ySqbNsp9Rzndd4XgFBwn/fnrKn0pnQQW9vKzvvV7GqFV2FUdvzMwwCoeyJn1lDS4gYRnjNsNgD4rcRbUFXvWkW/8xaCmb3hai2tTOuWLN6rvHI4FYX1Nfk/UzZdqzDMzrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772992193; c=relaxed/simple;
	bh=/RE7AfJY5/7dq6XX4kcllJpNfks/QQ0dN603rQStqeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHLBqLmN4CJCfhOzeYtgafc8dDMa7CzJBvCVbyjiEgfals7kNH2Hpz4WGgeHmunL8CihXMNf01Qu/eD8dcTuzr5lVGIC0c2LDeRxa1JfWIOq/biALTAV+NuJAfxfy+WqFG0n+K7W5mzNZ7kK+9nu8RFfDq4DcyHaNUEaWHtggRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndYcWZPm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndYcWZPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772992191; x=1804528191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/RE7AfJY5/7dq6XX4kcllJpNfks/QQ0dN603rQStqeg=;
  b=ndYcWZPmZ4O0hixf9rdDqGSSsZBpnE76YOVOZHjPrls1Fa4TkiW+x1hD
   0YfvloN7vGeD8XnOGFeacQP8LOtA/wkCveN29Fv3/effvqAP+DdF4qETx
   2AyUYu63KPPTS9uoCgVXqoInHaLTPXwU/4O8nzzbtdkXz3WnJ7ePAojTR
   EMxsN/t1pMILVIwT5Dr88D7FyVpzfqRpGXXnEMlXSPp5jkmVK16F7hU5U
   TjTQzmiAL28Tri/ZK5+ePbu0nCkuUrJ5A3t6FsH07DjhhNapgjAfTTqgm
   P1baki4mDZNVdeSlHZNBZT+J+jlx9j+tcDPumzMvgI/1Ha9HZWSyx1WHQ
   Q==;
X-CSE-ConnectionGUID: GtN15yyDQouDoo6lOViwLg==
X-CSE-MsgGUID: tZkhvChJSnaiGQCfcj76VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85502176"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85502176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 10:49:51 -0700
X-CSE-ConnectionGUID: EApTpOylSxqY3MdwiKswuw==
X-CSE-MsgGUID: RFJYv/2OTee1Kniv6e7pbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="257459127"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Mar 2026 10:49:51 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzIGB-000000003IK-1j4c;
	Sun, 08 Mar 2026 17:49:47 +0000
Date: Mon, 9 Mar 2026 01:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 3/3] pinctrl: aspeed: Add AST2700 SoC1 support
Message-ID: <202603090103.w4I9rCKV-lkp@intel.com>
References: <20260306-pinctrl-single-bit-v2-3-79918cfab641@aspeedtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-pinctrl-single-bit-v2-3-79918cfab641@aspeedtech.com>

Hi Billy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-mfd-aspeed-ast2x00-scu-Support-AST2700-SoC1-pinctrl/20260306-212717
base:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
patch link:    https://lore.kernel.org/r/20260306-pinctrl-single-bit-v2-3-79918cfab641%40aspeedtech.com
patch subject: [PATCH RFC v2 3/3] pinctrl: aspeed: Add AST2700 SoC1 support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260309/202603090103.w4I9rCKV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090103.w4I9rCKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090103.w4I9rCKV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:700 cannot understand function prototype: 'const int aspeed_g7_soc1_drv_map[ASPEED_G7_SOC1_NR_PINS] ='

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
