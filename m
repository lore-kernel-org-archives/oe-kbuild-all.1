Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856A388874
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782024; cv=none; b=b52QMMGHMPhmk4eaIJvzhYOKGkBK1H6JSJmeBwc4TZONsoFr/o1YcMdNkn+SuJUsghumGtb55ITmwm2IHQT3Q5P7GqaKsOWDXSrp4le7mo+xpKquaxRc1nRa6d3OESX14ogh5FkqJ53SMXbTJI/p11pk+sAHFozufSEUCO8DnBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782024; c=relaxed/simple;
	bh=EmaFkslMR/YNXIie1TgA5eYCd7YlbeRWaFyGJcn8bsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gnQKsBv4AEQ1gmVNSpy6Hru8g0boWP1XAe/wJU/LUEDVzsKEKKtabP5BS+C1zb54DKUebxiv/ImyCocFI013wXyiWVgYJ5VKhJ+r4WmeSv7nRA40bvPEZksNLZmgneHbr6MotpjkDNfnOOJPx7/MW4KQZTObWyyBM1Bq1eWPG9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQZgFEln; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQZgFEln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778782023; x=1810318023;
  h=date:from:to:cc:subject:message-id;
  bh=EmaFkslMR/YNXIie1TgA5eYCd7YlbeRWaFyGJcn8bsc=;
  b=TQZgFEln8kFxpSMlVb3x88gLXRvF1M9AIjOD7us9Ku1KfR2F+U9QxVK1
   irS4WLop7bCQJMzN2uNKscT54j4a+aM0NRJcBpYtrNAyn+JC52h+HuL4U
   3Am9e7ytlhbSnSJyM0VYrUYCZwJtVLaY+1uLR06d4bZ0PP48xg8kTntg6
   eCG6nVkiKXzHbR7GiZ6E6+juxkVecoyOkj4DHmuiIYQuOIsKuAAx6Gkz+
   gNbVgOoaXdmnLcodSWjzrIEMFdGCLQkOLpIwQypP+2hSWtRUeUhRemfDA
   efTYx+IqlHiNZbEwKLzwQL+tXagKOWaPQtI4NYJPGm8Gf12bdcDChYq6k
   A==;
X-CSE-ConnectionGUID: X/LnKuNvTgygwaKblqUcgg==
X-CSE-MsgGUID: +kDajaDGSEyRnQPFp4qUxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105191654"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="105191654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 11:07:02 -0700
X-CSE-ConnectionGUID: fcQ58vcwS3WDbZ/FiuXQww==
X-CSE-MsgGUID: t3hY3rlMQ+KiE617R7jJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242456830"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 11:07:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNaSY-000000008qr-1EeC;
	Thu, 14 May 2026 18:06:58 +0000
Date: Thu, 14 May 2026 20:06:26 +0200
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:timers/el2-vtimer 1/17] Warning:
 drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in
 'acpi_gtdt_descriptor'
Message-ID: <202605141925.PkUUh1mk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git timers/el2-vtimer
head:   e793e78f4ead18e3dfe5a3a1be912a7ec5bc55d8
commit: c58180850debdd9b2306a86238860769137f40cd [1/17] ACPI: GTDT: Account for GTDTv3 size when walking the platform timer descriptors
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260514/202605141925.PkUUh1mk-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141925.PkUUh1mk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141925.PkUUh1mk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in 'acpi_gtdt_descriptor'
>> Warning: drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in 'acpi_gtdt_descriptor'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
