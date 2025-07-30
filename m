Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B554221CC48
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 20:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753907233; cv=none; b=QBVuRibRANn+uTOUwXDT3RlGKWhVLSpFjJfRzSq/zT+pbIv8R4sl3xP9VW1ULAVgDSb9DKLnGKAhRv+fBfpwt9M628tfspI/VcPnAeeR3CMzDVJ4SZL5NYyAJSmUbBUlsP/qLkcUECnG7NFe7mOCGRw0IOcdRV2isYzHRwNY0+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753907233; c=relaxed/simple;
	bh=ADflULACI/Xmrqa+8gQxsJYJLbsB0uncDmia7Wik/P8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KDeehjCwnsCp4yoSdKOiNJuQFDlotAXyaAax2SWyJXz/VPWOAVwyaNnUpfktQW6QXLkj+7wvnUyT2f4qnWpJAz8vD24h8V0rraWuGdpN1fbKlqPgGI0MJyTf/FDkQWp5p6B0jT/A4/h/siQ0AETmk8XAZd6xU8Mjx5vbLhpFWfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1NdYRzp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1NdYRzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753907232; x=1785443232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ADflULACI/Xmrqa+8gQxsJYJLbsB0uncDmia7Wik/P8=;
  b=B1NdYRzpIVMc2Rqxkc9wH3Q94zuwke31ePeS0/Aubr50Mt50NueIsBHv
   Q9zGemI13rrcDYDEXIobjDzfGoestb9IL5JD0DhfDG0sTM4XDdSWJuZ0b
   F/vvZfmArf4lVHJQXx/YvkThlELhNGURgt3wb7gXVctoZAu0g0KRRW5pe
   Ab5FKrfWzSt/QzUsHcF+WI7Xk2NKgS+EACQJPT0kvCaYkStbvsOyGE7wj
   fmDqiK5EI3z+Cz7DZMD9ex0G6kWw9mjk8+xJkTeI4bp/QDA5LKMMRMNll
   OxP4bDbS9+a45DE9NwLsdMa8NyjBGNES4ObhiXq9C9bU3n9Ac7JrlZCoY
   Q==;
X-CSE-ConnectionGUID: 0pAA3HP/RzW0zr8oboTlxQ==
X-CSE-MsgGUID: IrUdYHdeRsupat4MbscFjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56311363"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56311363"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 13:27:11 -0700
X-CSE-ConnectionGUID: UtLKX8IhQdKstrnH9sUdWw==
X-CSE-MsgGUID: el2y2JmXS9OBpTKEvdRyCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162667449"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2025 13:27:10 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhDOG-00037w-0F;
	Wed, 30 Jul 2025 20:27:08 +0000
Date: Thu, 31 Jul 2025 04:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [mtd:nand/next 12/18] Warning: drivers/spi/spi-mem.c:594 function
 parameter 'mem' not described in 'spi_mem_calc_op_duration'
Message-ID: <202507310409.fnuQ21qb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
head:   fb2fae70e7e985c4acb1ad96110d8b98bb64a87c
commit: a11a51896572273d04a9f6011ad22738c52ba554 [12/18] spi: spi-mem: Take into account the actual maximum frequency
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250731/202507310409.fnuQ21qb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310409.fnuQ21qb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310409.fnuQ21qb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/spi/spi-mem.c:594 function parameter 'mem' not described in 'spi_mem_calc_op_duration'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
