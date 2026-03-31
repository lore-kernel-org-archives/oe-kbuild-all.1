Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A6433F399
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972917; cv=none; b=LuDcEtqUY0hscalHSJbgOMU1KZU56TXyWYEfQmzDxKse1qpeCEMjN4jTlTB3ByiPCkT6OnVFI2eOBfhuLHvSO1tHWYByXthJh+UVkcP9uebNspktcCznlpB/55bqBoFuOXptY9vN9oYOIcBLxrN/HbTaUHqpGniiYkDhW4zBKIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972917; c=relaxed/simple;
	bh=1L9aMAIAZztejhNDSVWbtCMufIZlJGalW1E9B9WRS7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WcvzyJicCCu1sjNrNIqRBoseNrhTE31Kbbqb70MBxPnnm29MJG4jwx8KBbHRCJA79NKRmRmXHv++9P79RRnPW6LBwFKWAXkbQXoiZQitfmvD9MXrrCDUoN1xdFz3F8C09FykVCNi9uLDeZgTnstWcY3vLyxKG3El4Tvx64XPfik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hb84HFXp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hb84HFXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774972915; x=1806508915;
  h=date:from:to:cc:subject:message-id;
  bh=1L9aMAIAZztejhNDSVWbtCMufIZlJGalW1E9B9WRS7k=;
  b=Hb84HFXp3TKtatWXn51RwPxcKOF87pvxo7dQEqx1KRKETPY7dRHA7Atr
   7OQp7DWmJxddlh1JVS7972VDHH/8a5F2ONxh0k2UK6k3c+WwahjSmSylG
   2BiilV0/7RT4FXeoTc/ShbAvDRncvDg4uXNeEiCd3/MCOzdVqeR1P4FaL
   C7M+y14PAiTf4huoWBfZ4zYzljnko4wAAZz6pN8yiwMtIdw4C090SrbSD
   BggHa9/NDnuOQ43VvYUyYXlFouCT3WfzGnVFcVzFfBnkJSP0tDreMgjNF
   OoQrdOM3dI270sP3fmslyXDBRPtv6qN7VogDHba3aiPsiGVCw4eqOIk42
   Q==;
X-CSE-ConnectionGUID: hXECBR+VTSmlL/AZ+wNGwQ==
X-CSE-MsgGUID: VJ3gOkU3QGW21nlv4Uf+Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98601414"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="98601414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 09:01:48 -0700
X-CSE-ConnectionGUID: jMGg25hLRGSgB2zcvrPXhg==
X-CSE-MsgGUID: Q7GDfsg9Qam8z85k7agr6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="249456907"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Mar 2026 09:01:46 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7bXD-000000002qX-3xLp;
	Tue, 31 Mar 2026 16:01:43 +0000
Date: Wed, 01 Apr 2026 00:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/pinctrl/pinctrl-amd.c:40:25: warning: variable
 'pinctrl_dev' set but not used
Message-ID: <202603312338.tTeBLiWB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: 179db1909c5c4b5300cce626507b0f843f7d2cc2 pinctrl: amd: Add an LPS0 check() callback
date:   12 months ago
config: mips-randconfig-r061-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312338.tTeBLiWB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312338.tTeBLiWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312338.tTeBLiWB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-amd.c:40:25: warning: variable 'pinctrl_dev' set but not used [-Wunused-but-set-global]
      40 | static struct amd_gpio *pinctrl_dev;
         |                         ^
   1 warning generated.


vim +/pinctrl_dev +40 drivers/pinctrl/pinctrl-amd.c

    39	
  > 40	static struct amd_gpio *pinctrl_dev;
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
