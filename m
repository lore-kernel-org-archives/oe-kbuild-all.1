Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91A288C26
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756112408; cv=none; b=YSgaKt5Jr7s+El+gwVoW2pzS7RNxFFFSvDycykPLhbQlYwDFtiQk4w40dWfYucuKUd09ANpEnaOsWfJpGa70mc7P1lNPcIFvF/A3dNtHHdXKJ2Kb+QzD5jRMH2U4XIfIk0Pw6q923DNVT6RYY1mdWljr+r8I/H/qwMmwgQySt9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756112408; c=relaxed/simple;
	bh=HI/LBSiIf0qIIwpKOXwX4w7gqzkJAm94RFPn5Mxw6po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLfN8fHuxE9IvC++0VzmA7eNIa+wWqMuoX06b1aRTW3cRO/YLjY8FLlRRjK+/C6Zz5+QW3Zot/GETccZZz2IFILOQmQobCoEiZHaViPavXwsbLR7OnFqXF6nlsrRV8eVzMiUEI/ACVPPsJo85/tuvl8jpRj1TcMdQDM0IUyVq5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAO1brE6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAO1brE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756112406; x=1787648406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HI/LBSiIf0qIIwpKOXwX4w7gqzkJAm94RFPn5Mxw6po=;
  b=XAO1brE6H7otYscYrWIMbk23jWxvHFpqqBqdFMSvMpaXiUhz1e8KP5Ze
   lkRduwFULU4Cm+W06hkOQxkB4mMGBnV/2VrL5hy0Z5HDNQpJIJJG5+mmC
   hWfBxOw4vu0F92FZUJoGT/to8XwTX9zmOEIocwtZTTaRg1JDV/mgaLo0+
   L3aL/GyX271XcLt/EUilyvK3bBVAjayhb2XFWpTM1r3o4bYydD8hf3BAm
   UzKoTr9kS9tCN34nFmnCnfv77NRUZtMb7nrBm9InHnJDY6HLDT9M5oyVi
   xHZgdhXWb627VkTAwi17rQjmy7abPAL/yhDm8MkCP6PCppHaosI1o2CWs
   Q==;
X-CSE-ConnectionGUID: 6GwPSUQgR2yIpN1gUdzA2g==
X-CSE-MsgGUID: Bm/aF2lKRGm+ctF2FScEdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="45892920"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="45892920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:00:05 -0700
X-CSE-ConnectionGUID: LBYbLsL0Q56lRCJpDfg6qg==
X-CSE-MsgGUID: 1H61aeLJQ9yzdF+D9gklGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206412826"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Aug 2025 02:00:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqT3T-000NXL-0e;
	Mon, 25 Aug 2025 08:59:59 +0000
Date: Mon, 25 Aug 2025 16:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] Input: Add driver for Elan eKTP1059 Touchpad
Message-ID: <202508251658.hNeCM85Y-lkp@intel.com>
References: <20250825-ektp-submit-v1-2-1dd476c1277b@kemnade.info>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-ektp-submit-v1-2-1dd476c1277b@kemnade.info>

Hi Andreas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1b237f190eb3d36f52dffe07a40b5eb210280e00]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-input-elan-Introduce-Elan-eKTP1059-Touchpad/20250825-061128
base:   1b237f190eb3d36f52dffe07a40b5eb210280e00
patch link:    https://lore.kernel.org/r/20250825-ektp-submit-v1-2-1dd476c1277b%40kemnade.info
patch subject: [PATCH RFC 2/3] Input: Add driver for Elan eKTP1059 Touchpad
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250825/202508251658.hNeCM85Y-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251658.hNeCM85Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508251658.hNeCM85Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/mouse/elan_ektp1059.c:234:12: warning: 'elan_ektp1059_resume' defined but not used [-Wunused-function]
     234 | static int elan_ektp1059_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/input/mouse/elan_ektp1059.c:228:12: warning: 'elan_ektp1059_suspend' defined but not used [-Wunused-function]
     228 | static int elan_ektp1059_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/elan_ektp1059_resume +234 drivers/input/mouse/elan_ektp1059.c

   227	
 > 228	static int elan_ektp1059_suspend(struct device *dev)
   229	{
   230		disable_irq(to_spi_device(dev)->irq);
   231		return 0;
   232	}
   233	
 > 234	static int elan_ektp1059_resume(struct device *dev)
   235	{
   236		enable_irq(to_spi_device(dev)->irq);
   237		return 0;
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
