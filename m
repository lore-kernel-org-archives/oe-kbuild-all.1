Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F012E5D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 05:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733377265; cv=none; b=J8EA12LIJTwrlvkFzexPDlTK5gE+XjhXe2wpsB0CRXrXe2udfcvlzO3xCafh7sg29K9h15ANjwQID8+gUDhng/HaXKppzjM4DjdJfWh7+JlbQGLjyg8KRxjQ6QQwTgWmw3w23M+CKzJIRSsREQOLiVzkI0RMpNaVt9RuSWe1peE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733377265; c=relaxed/simple;
	bh=rvCGlLdQwvwTy3fqBLRZw4wJi8hAe1Ki/YY8CTv0yOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dt0sLOhNNSyqp15tr15XHCx+0DaoB41taGOmKDA5CtFMkt7wCY++7g/BVrc/v1yhhoDrFZZhAUgL/jz3enOlb6Tt0Cs1EaHO9cz+0zZoU0RMRG//w1WhNU1y0x+Y9UVXqZxjBjmdahfcq6ByULd74HCZgGwXa9RBGWSS9CUC31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dg6aq0iF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dg6aq0iF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733377263; x=1764913263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rvCGlLdQwvwTy3fqBLRZw4wJi8hAe1Ki/YY8CTv0yOU=;
  b=Dg6aq0iFZYyvljUlIb6PPMDw6IRbQQ1JIeSI8KFeTlhfhPAnkPWQnToQ
   0jLhI9/g0/W8vgnbWO/H5y98i1qCyw0FqOWuZwWd4GBVkdutKJjMvsiXs
   Bfm+UgCi4Lu8kLcitDvN5moCKDKKhQdU1HvIHBTadtUfvC4JJD0EsZGPB
   iJYw3M5dmDf7wDtYfTXObzYUpLEFkOrYfSt+QxBAfok/YzfZ/7A2SfTRp
   uVD7cc5TFEKQxmqkZ26OsFhQs9ROIoD2g1slcbq6Emn3Zr0AHfBYgga97
   84/Dp+TDYjNQ9dx7DQLzq9Pry8hqez5e83MPf+I6L6njrS0iI5SBYQQWE
   A==;
X-CSE-ConnectionGUID: NhtZWXotRvmEqOzeyM/CzQ==
X-CSE-MsgGUID: mr4/tuApTguRpBc/dD/L1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56148640"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="56148640"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 21:41:03 -0800
X-CSE-ConnectionGUID: 0c4Ian18SPuC8IHv31/YQA==
X-CSE-MsgGUID: 9BglbnOySU6pyO6yzzWnLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93670372"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Dec 2024 21:41:01 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ4be-0003qx-1d;
	Thu, 05 Dec 2024 05:40:56 +0000
Date: Thu, 5 Dec 2024 13:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:8250-cleanup 13/13] kismet: WARNING: unmet direct
 dependencies detected for SERIAL_8250_LEGACY_ISA when selected by
 SERIAL_8250_ISA
Message-ID: <202412051348.aXnruolo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git 8250-cleanup
head:   babed7b34c5946d07f915c7e4aab26fa2470ff86
commit: babed7b34c5946d07f915c7e4aab26fa2470ff86 [13/13] serial: 8250: split out legacy isa driver
config: alpha-kismet-CONFIG_SERIAL_8250_LEGACY_ISA-CONFIG_SERIAL_8250_ISA-0-0 (https://download.01.org/0day-ci/archive/20241205/202412051348.aXnruolo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241205/202412051348.aXnruolo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051348.aXnruolo-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_8250_LEGACY_ISA when selected by SERIAL_8250_ISA
   WARNING: unmet direct dependencies detected for SERIAL_8250_LEGACY_ISA
     Depends on [n]: TTY [=y] && HAS_IOMEM [=y] && SERIAL_8250_CONSOLE [=n]
     Selected by [y]:
     - SERIAL_8250_ISA [=y] && TTY [=y] && HAS_IOMEM [=y] && (X86 || ISA [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
