Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A0267B88
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 05:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746768571; cv=none; b=rlHyvuaB5DoNHqhVW+/2QlpMzDNcDU/QTB8JYbVqRdGTeQiBuYKCV9GKvlZZIQqPEdZf8IPu7DSOflVy4lzS9Ce6KcI60VTm+DVODiLYx1cOK5QKfFFC5OQ1etHTJctwWRLVxA0ZZDJCpqZLVPKVrHJJX8NT2rczPTg7KpJl6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746768571; c=relaxed/simple;
	bh=lcXvMpFxCSZNvUMR8Z0c+VNHtRYU0iY8aHThQiz37C4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ux5+rQxzLmnf5fV2eOfBiInbEfj9wwJZNvv5BF94EibrqqK8AjhiNpJH/pfPlTnQ6YIQBl8YwSr9YHubOZ8skmpoeU+vmYA4vmuvvcGPK1bqh/cHWtmk39E2UWs476+EjiRmfFpD4c4dfYMkAj8361i+IJUS6xsKGVkvcKDWq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTVEqans; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTVEqans"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746768569; x=1778304569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lcXvMpFxCSZNvUMR8Z0c+VNHtRYU0iY8aHThQiz37C4=;
  b=WTVEqansZLwLxptR4V0fW783FTDHvN6gAA22cKMYErbVvbJ4kfxLgRiO
   rLKxTyTZCjGe3GJ62Pm4WvcnoaX8NN+cXDuzBC6TnSh0w7yIbPa9adbg+
   nBD1E47QzA5uTmYWdU8WSUdBo2UEHi/3vKDdpzuu2/1nv24vsdFiT04PC
   c85SeLxcZOYXanch6aiFrZZja/QXf5yWM9cktL34hNvIJ5zv0zrbTkfGv
   yolu//PDkvKTnv9tQvk3jSDOB6g9p8cZ0MGYMuXrr4wjsvqd3Mzt/rb1M
   nF2L/TGFc7M4jJJRPsSOb518XNIDUJ9t65MbkdJaG/BSrvxtP3ubn/Tgu
   Q==;
X-CSE-ConnectionGUID: T4H5JP1AQ+6vdB36H8L0zg==
X-CSE-MsgGUID: iYVE31nDTduyeh9hSD3mEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59985864"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59985864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 22:29:29 -0700
X-CSE-ConnectionGUID: WNreTPjMSM2OQE9UHiX8oQ==
X-CSE-MsgGUID: o750d2Z/QRKmTcX/Tcs22g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136472311"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2025 22:29:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDGIX-000Bgf-1Y;
	Fri, 09 May 2025 05:29:25 +0000
Date: Fri, 9 May 2025 13:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [andi-shyti:i2c/i2c-host-next 53/58] ERROR: modpost: "__udivdi3"
 [drivers/i2c/busses/i2c-mlxbf.ko] undefined!
Message-ID: <202505091323.dCeFrkmc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   26e670a049241c3b4363975a505515727dab6925
commit: 9927b17a5965f37cd7cc5d085b3f3e9d89ccedbb [53/58] i2c: mlxbf: Allow build with COMPILE_TEST
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250509/202505091323.dCeFrkmc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091323.dCeFrkmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091323.dCeFrkmc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/i2c/busses/i2c-mlxbf.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/i2c/busses/i2c-mlxbf.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
