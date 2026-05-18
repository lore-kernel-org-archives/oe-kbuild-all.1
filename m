Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971BD472792
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119645; cv=none; b=hIqz2eTNseewCM+5WbR0vOVSqhV+i2k9lp1hopWhMomia7tR8/M6xcUNr6T0fV0b0o3qDXN79uWDZlTARn7hJl2KiloDpJJJ3NoNXrwLEPqe0I3tB5PmoWVu3XEDgBvND748BOE13q//3/9yvFSfwSydrCTGb+GxJzZgn8IGFJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119645; c=relaxed/simple;
	bh=PgGU2QHZtBYYkhvoZJcFyJth4JWJSCisQ1eN9dajdkc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IyQRw/m9j5fYTse6zmTjm2hU2t55n17QTQvkrBP6KlnV19bp9WKpwkDKMPU/F6y+n/XNySb2i/8h+i+fuu8s9I1z5Z1xDb+B85mwMrPlZcUeVJT6mnI/bX9xkSSNX8oZMPo6YScMwIWN1LGubOFGuQwj9/HE8ktJ+l/jGeKjkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNQweKvd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNQweKvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779119629; x=1810655629;
  h=date:from:to:cc:subject:message-id;
  bh=PgGU2QHZtBYYkhvoZJcFyJth4JWJSCisQ1eN9dajdkc=;
  b=jNQweKvdkCdqXsLGVxwo5tQZLnoXnwxOxzTPUMAQ94YbIxS1htePDtYn
   XpMSTwbpPn6WkOBLtKeGHejNyDmMDWd/vp1/HLrxAILWGaMIT9rPD8Cp9
   prb2cARdZizEfmrhsocsmzDcbdhzvyG2F3watWEajI9aOaoB7Na/UGpsB
   s2NAGXvPSwa6PJKmzuQ392U0cEL8MQQKgMd5pXJa4b2qqcULcXtNagGY5
   Yf9Ma0Gpn+pYLnHD93WbebhIZrntVQcJFlDoa1uZrYzPGVNe10uTNNc4U
   fRdxjVEqLwmpJEIzdcus4bjwtSOD2Xp/dAQa229dHZyuzW8058jUD+PNZ
   A==;
X-CSE-ConnectionGUID: 6QsT3TqJRX2tBaTH5JGx5Q==
X-CSE-MsgGUID: 8BX/wUgiRjSqw2ICaebB1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91436580"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="91436580"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 08:49:22 -0700
X-CSE-ConnectionGUID: d0EaLwHPQAui+JImJFQxvg==
X-CSE-MsgGUID: qWJ0SG2yTtKBohZ81PxjSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="236452637"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2026 08:49:20 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP0DW-0000000030U-0rsa;
	Mon, 18 May 2026 15:49:18 +0000
Date: Mon, 18 May 2026 23:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:spacemit-pinctrl 5/5]
 drivers/pinctrl/spacemit/pinctrl-k1.c:226:12: warning: 'spacemit_dt_get_pin'
 defined but not used
Message-ID: <202605182323.cdYaUKVn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git spacemit-pinctrl
head:   9f8d2e4ec4a6062b361eeab3c052ed9e81b752e1
commit: 9f8d2e4ec4a6062b361eeab3c052ed9e81b752e1 [5/5] pinctrl: spacemit: move over to generic pinmux dt_node_to_map implementation
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260518/202605182323.cdYaUKVn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605182323.cdYaUKVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605182323.cdYaUKVn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/spacemit/pinctrl-k1.c:231:12: warning: 'spacemit_dt_get_pin_mux' defined but not used [-Wunused-function]
     231 | static u16 spacemit_dt_get_pin_mux(u32 value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/spacemit/pinctrl-k1.c:226:12: warning: 'spacemit_dt_get_pin' defined but not used [-Wunused-function]
     226 | static u16 spacemit_dt_get_pin(u32 value)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/spacemit_dt_get_pin +226 drivers/pinctrl/spacemit/pinctrl-k1.c

a83c29e1d145cca Yixun Lan 2024-10-16  225  
a83c29e1d145cca Yixun Lan 2024-10-16 @226  static u16 spacemit_dt_get_pin(u32 value)
a83c29e1d145cca Yixun Lan 2024-10-16  227  {
a83c29e1d145cca Yixun Lan 2024-10-16  228  	return value >> 16;
a83c29e1d145cca Yixun Lan 2024-10-16  229  }
a83c29e1d145cca Yixun Lan 2024-10-16  230  
a83c29e1d145cca Yixun Lan 2024-10-16 @231  static u16 spacemit_dt_get_pin_mux(u32 value)
a83c29e1d145cca Yixun Lan 2024-10-16  232  {
a83c29e1d145cca Yixun Lan 2024-10-16  233  	return value & GENMASK(15, 0);
a83c29e1d145cca Yixun Lan 2024-10-16  234  }
a83c29e1d145cca Yixun Lan 2024-10-16  235  

:::::: The code at line 226 was first introduced by commit
:::::: a83c29e1d145cca5240952100acd1cd60f25fb5f pinctrl: spacemit: add support for SpacemiT K1 SoC

:::::: TO: Yixun Lan <dlan@gentoo.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
