Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27DA36B071
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051464; cv=none; b=tKU3YLjRyQV+EEJtnBE+yCYHD+hU4qKpDWqAIlfGEgH4EXi5kJPgT7nqXD2oXHwWFpXTMDdc2BdUMaE+yYgcW7CVVKU33J25Qe+GQJMUjsucynVxRAQ7LGYl3JQMH4guuvtidbSnugqG/fEeSVuxcQlWR5VtLLlxiNZEmAYZWwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051464; c=relaxed/simple;
	bh=IHFHOBmXYBPm5KTZiarU0GfsN2kwgiTDNhjCA27wrEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U/J+6oUNztJrbnvyArmRd3kH3ALDHd8+mKFltQmPstEbjuBXG2hFaBGT9bVWq552rI4xBFkR5PbT/oIhYho0c040SLzRAtAtRJXvQT+lJGy7JB8VtE+etOiID1zZpbE5X1rM8fSW3r+/6Sy/Kck/cKjrmqShFV+IdC3DSd6Jpsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qmluxh7Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qmluxh7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778051463; x=1809587463;
  h=date:from:to:cc:subject:message-id;
  bh=IHFHOBmXYBPm5KTZiarU0GfsN2kwgiTDNhjCA27wrEc=;
  b=Qmluxh7ZQZjPmE+NiWHupGWdLeEyn3THuUoEmB1Nwzus/qSH+DTu0D3c
   9NtnXetdSlzBNZxq5qkFmnsdhRIVMZ0HMGxs/C8rOkkKEaYxj+Y9vEil8
   UyjalE/K/W1NJKjY7XVOQi0Pua3dJNAoIHkvGY/ODtAuhIVm2LKfxHSdt
   JWrqHybjCz2RqtI/J0Az7L97iP0t+EwFRem2EPHyETqLZ3jZUsFbnn3MP
   fthnHd6AIKT9+20EvLpA28AtsymaoCldX90KtBjTv+53eAThyo4Cw0vBJ
   z+xzqXDsHuUEXQEgCsQop/S1z2LCFZncaWQeh6uS5Fiy+3RwKPxm+oM5C
   w==;
X-CSE-ConnectionGUID: 2qXo04c5RF+Mfq26Jfsygw==
X-CSE-MsgGUID: G42SoyNwSyOxDmBicN8LkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78861842"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78861842"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 00:11:02 -0700
X-CSE-ConnectionGUID: L+ropou7Sv+A7pLNphVvDQ==
X-CSE-MsgGUID: SgBf4SRCSnqtAQhZNZQQ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="274188907"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 May 2026 00:11:01 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKWPK-000000000my-0W4Z;
	Wed, 06 May 2026 07:10:58 +0000
Date: Wed, 06 May 2026 15:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>
Subject: [linusw-pinctrl:ib-mux-pinctrl 1/5] Warning:
 drivers/mux/core.c:783 function parameter 'np' not described in
 '__devm_mux_state_get'
Message-ID: <202605061502.ullLjmtN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   34acc5a8adfb76f2de63c8b8317397fb72b0aec8
commit: 05e58da46d8e8f8b29bc9b47053bb0637891c06f [1/5] mux: add devm_mux_state_get_from_np() to get mux from child node
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260506/202605061502.ullLjmtN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061502.ullLjmtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061502.ullLjmtN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mux/core.c:783 function parameter 'np' not described in '__devm_mux_state_get'
>> Warning: drivers/mux/core.c:783 function parameter 'np' not described in '__devm_mux_state_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
