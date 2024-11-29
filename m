Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F214D430
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 18:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732905644; cv=none; b=bzBPq9Foge78aGGzPeD7oDCbM0FTHFaFiXwT8r14lXC7yKAMabSxcjXoyDsk69beYEO4rPYPA3scYzsi4VrhxEvO2l5IA6LvAbGRaUImCNQ8d5szGw+jft6RCIACOSFsdJhekHBOMkLS1qhinx+bfz9gCv5lTkzvNfQXTnxxVmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732905644; c=relaxed/simple;
	bh=oveEbaDDv8cfGDywrefGRbwmTesxQHQpFwhEt85V5Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=to94XxKTFsuXN7x6/N4SCYpSZV4+MVhcBeTnSh0z2WGc9zN5LOjf0we4sOmL3ASNmSvcUg8V9Bm63pMdTWWa1dMCadOfW1d+r4H2y9JnQrSz7PPZpkM/DxZ4QWjFvqB4ICb190jn3VnZ0n3tFHMlmbiA0Mtl7vrzWWDYaAnEFWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibDH5XfJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibDH5XfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732905643; x=1764441643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oveEbaDDv8cfGDywrefGRbwmTesxQHQpFwhEt85V5Rw=;
  b=ibDH5XfJji8vxfsRqBS+dtiTUYetn5OzPb9gASUp82/BKp0OANh18Xkj
   KF32EbCfY35L+SnpjKXt8ZA4z85Ikx2YgkvYXklpHu+eLI3aUJSmgMBZk
   nB8A+8KIayjWekQstvp7Ezd2E53OiADU6whlhtcOkejuNDwjYpT54uoCx
   owTRTGDDVIj+5cehpoivaX1cmqoexXT/oD8eSBu4WRydTvvzF4OhQmDT4
   Cq7L053fVffLFZ6kRXtrvDOFnNl9RoSfsowLAmy/OrCzkfp8U/aoiFQdg
   n/nRE7PpA/g2/3SHuYLyopkNQ/RLsHX/W2gdo5T7SN5+7CQmMb11zNC3L
   Q==;
X-CSE-ConnectionGUID: JKgJ9gc6Qe64BTDEzAFY5A==
X-CSE-MsgGUID: pYwMp9mlR8CA/BMXo+IQxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36928710"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="36928710"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 10:40:42 -0800
X-CSE-ConnectionGUID: t+/txqviQseDgjzp+YYHag==
X-CSE-MsgGUID: 9ERKUN7YSqiMi9VgYPrcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97587114"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Nov 2024 10:40:40 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH5uw-0000cm-0i;
	Fri, 29 Nov 2024 18:40:38 +0000
Date: Sat, 30 Nov 2024 02:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Salyzyn <salyzyn@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: socket.c:undefined reference to `wext_handle_ioctl'
Message-ID: <202411300200.rRtehhf7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
date:   5 years ago
config: i386-buildonly-randconfig-005-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300200.rRtehhf7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300200.rRtehhf7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300200.rRtehhf7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: net/socket.o: in function `sock_ioctl':
>> socket.c:(.text+0x46f): undefined reference to `wext_handle_ioctl'
   ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
>> net-procfs.c:(.text+0x12c): undefined reference to `wext_proc_exit'
   ld: net/core/net-procfs.o: in function `dev_proc_net_init':
>> net-procfs.c:(.text+0x211): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
