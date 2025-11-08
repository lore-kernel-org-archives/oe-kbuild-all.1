Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAF721FF4C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762571403; cv=none; b=LnVuqibH+ccJEkIAXU7pzGCMFNW+5jRP0o7i5Sqiu5uUWZvHcM1aegMIWzGFmGaw1XOVTbM6754ElPQXrPkCLdbpGOUDzBLyGhJ1W/MRrwFNvOizW2S+h3PVnrLu2eANIAyUnypBoSP5UHTBxzTyUoFQo+gBPi2fcRusE18XL9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762571403; c=relaxed/simple;
	bh=3KemVDjE4Mm/US+YRUud6h/UiFK2pZEnDnUiPIkmXS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDcst5Xa24mDtdxKjViOI3vRSZV8h4DtGhSE0TEUZK+Uonq0ZfI0L/JfGc1PGMc1z3d5cH/dq9GGj00v7lA79le+l27hFtih6N4Deq7sUfDT6K8DDN1MypHNOMwkpadSLrjlDN5rG6SdkyOsV3n9qqpaWx56qE/MsXVwTxKzK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIiX4RA8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIiX4RA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762571402; x=1794107402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3KemVDjE4Mm/US+YRUud6h/UiFK2pZEnDnUiPIkmXS0=;
  b=OIiX4RA8MLp+9e0mtwKnUBDisrr52y61H5BmMVG8I3lfoqtses3u4NwJ
   wObUfPdulfRrZDVg54qIYA8rlYa4YPEDifPNFKNeDKaMeL4L9chQi4gQ0
   6BOtDvJ01wc3MsVfO4aS6205vfLtES59RyEF36+F5xkXpI5wnd8WA5tws
   enDvaBw7UsR9snBw8rnDKtzKlP1Ap8UV32gXMWytgBX/QkR9yDfncdFkU
   dPE3xmKRXE7+dwtLtLQ/hJtyKHVJOeFeQOwguq9CM96EtfEX4nQjhw9iS
   4UKXMJhiJRNhkwTxSYgRfOdPUefnIOMGFznPgOdXDH8Y3Fo68Zuby20xU
   Q==;
X-CSE-ConnectionGUID: nJ6ruS3kSUe1qALBI6ihxQ==
X-CSE-MsgGUID: VCT98ZMsRYyYJs8zHiFljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64813996"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="64813996"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 19:10:02 -0800
X-CSE-ConnectionGUID: 20gdvBPdQqmHieLkLgNKSA==
X-CSE-MsgGUID: qkKEEY2PSO6vfaJdZc1sMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="188917820"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Nov 2025 19:10:00 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHZKw-0000eb-27;
	Sat, 08 Nov 2025 03:09:58 +0000
Date: Sat, 8 Nov 2025 11:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_prolog 4/8] arch/x86/kernel/uprobes.c:1457:36:
 warning: 'sub_xol_ops' defined but not used
Message-ID: <202511081118.T3v3UNhW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_prolog
head:   0a54bb564fac2eaf528c88c5d6abc55213a4f073
commit: 7c946ecd37c7b9b7f90d3f722aac2f3a85486763 [4/8] emulate sub
config: i386-buildonly-randconfig-006-20251108 (https://download.01.org/0day-ci/archive/20251108/202511081118.T3v3UNhW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081118.T3v3UNhW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081118.T3v3UNhW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:1457:36: warning: 'sub_xol_ops' defined but not used [-Wunused-const-variable=]
    1457 | static const struct uprobe_xol_ops sub_xol_ops = {
         |                                    ^~~~~~~~~~~
   arch/x86/kernel/uprobes.c:1453:36: warning: 'mov_xol_ops' defined but not used [-Wunused-const-variable=]
    1453 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~


vim +/sub_xol_ops +1457 arch/x86/kernel/uprobes.c

  1456	
> 1457	static const struct uprobe_xol_ops sub_xol_ops = {
  1458		.emulate  = sub_emulate_op,
  1459	};
  1460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
