Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E71342151
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766075057; cv=none; b=SuK/S7n+u1SP7wcmhisvDdbP8lY/QA4S52kBLSckFA/CWwfVTgn5cE+/shLwj686jJqVBvr6tRY/3y5lk2QULrwTG27Hkt5REAE7bDKGIbwfi7T56rE+TLSI9etXZtdRwGW5pkS/cnh5VBs8pIwk003v8LFdLUBb5WiRT6If/Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766075057; c=relaxed/simple;
	bh=nkd/Jxfr73opUkDfiPQmAT2h5JbOPMzlZnq+TRepdIo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NV1IhtE3KQ9CSQzK3IW/lj626+U0tjG13y1E+3XSZQcxqqGFkrhWRIP4wNfvQCpvX5s/xaSHUkBy68wCvrEuT5AKVQXyf7XEaBRPI2XO3TEn2naFGFLDiuiUMxh+nc5eSdOwXpJsJ0i6VCcDkM1uwLS+1AC0icbylaK4D9UQRqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwWTK9Un; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwWTK9Un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766075056; x=1797611056;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nkd/Jxfr73opUkDfiPQmAT2h5JbOPMzlZnq+TRepdIo=;
  b=OwWTK9UnWgM7sFfe/lQh4LE2pu6kP1B/2Z3Gkn/N/CyxfXOz2ZXo/jR0
   MhBYHHALUOljTRtGytPk1QewxcLTqkvdDYOFFlfBlwBe/kCfkmZOKN73M
   +CMeIxkjGIYGVbBPTLggdPWfKOLKqBDlOHK6hpTltx7nsHJSqGiOPWVIn
   XoYnpfDyNJ6CYcf472klvld2bKdptBv6Aej2DnwhpSNmEiL43oVknhwyq
   85f6t9bz0fuxdaIknMjNvj2Fj8H99YVjF/8KhH8hcmKU8DY0k1TeCLgKX
   RwoTqEamzBEliY4oeYv881eiJwTUE/R3tak4CZoLOZOyA7uDQ/mblCnah
   w==;
X-CSE-ConnectionGUID: EY0nwa3gRwW4IqiUZpwkZQ==
X-CSE-MsgGUID: dCwpvIfnRPuj/uV79BkWNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85451421"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="85451421"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 08:24:16 -0800
X-CSE-ConnectionGUID: /ReywabITrCYYBRooIA5wA==
X-CSE-MsgGUID: XLeharRGRAeIYybhCKkDrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="222038096"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 08:24:14 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWGnU-000000002In-1LDI;
	Thu, 18 Dec 2025 16:24:12 +0000
Date: Fri, 19 Dec 2025 00:23:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: xe_hw_engine.c:undefined reference to
 `xe_configfs_get_engines_allowed'
Message-ID: <202512190052.YotdSgRk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 58b51df807d7394a09ddb95b47099d59465e3777 drm/xe: Allow to disable engines
date:   7 months ago
config: powerpc64-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190052.YotdSgRk-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190052.YotdSgRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190052.YotdSgRk-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xe_configfs_get_engines_allowed'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
>> xe_hw_engine.c:(.text+0xf64): undefined reference to `xe_configfs_get_engines_allowed'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   xe_survivability_mode.c:(.text+0x260): undefined reference to `xe_configfs_clear_survivability_mode'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x2cc): undefined reference to `xe_configfs_get_survivability_mode'
   powerpc64-linux-ld: xe_survivability_mode.c:(.text+0x304): undefined reference to `xe_configfs_clear_survivability_mode'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
   Depends on [n]: PPC_RADIX_MMU [=n]
   Selected by [y]:
   - PPC_POWERNV [=y] && PPC64 [=y] && PPC_BOOK3S [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
