Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4B632ED4D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 22:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012301; cv=none; b=J6A3sY9Yq2s6Fi1fWEqswJd0zYJsJ+h3U/MckqjIZjtUNuOClojy83cRWnMs4Md16dKacGQMiI9ZXGjEC11nHBCHtjy7cxkFmBPYKE/Bfczg2maKN9Q7d7/UHEqReQ8Axsa+85tUDcvaroTn+uxNML45F0jsvFtUv+gI+sr+HvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012301; c=relaxed/simple;
	bh=J41oUpDYg1ufG35W4VHSU7j/5wjty8FgN7S6sG9U0x8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PmtIdPclPNPbnLY1d9sli1ktJqNBVmCgSG1cmEn02R38TU/J2CxzabXw3bw7QZkOpq57RUjkNuDGjoNd/+/PDn5lnLFayd7R2LZ6O6Fvx29qXb9RntVQrQu8/1BpqZwPzHw+DjH8luuMSNsVfR0JqHNn6o852wYcDQHkgPAvQfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDOsQCrv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDOsQCrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766012300; x=1797548300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J41oUpDYg1ufG35W4VHSU7j/5wjty8FgN7S6sG9U0x8=;
  b=dDOsQCrvMU6K00wEH7Obohgukqy4SvZUQKTw1OO/wIf7x7kuJk/hqnR6
   ++EZj7h6AfIST9dDTXxN56i7INFAOd9G45TRVFZUr/NSwo3uhvCZf8Tvr
   MCcbGEccpO3UFKzYExK7eCOAGI22P2B5sMPbHk65EXsMtPoJMJGCOufEu
   IqN7Ld+2d+pZK5ygoi62Fu5SvgwNnuzwgXHeWIq7bSAZiOjTKXPHK2ohp
   oLU6oQXN74K/Pz6yMIzZOppnTwYZhQdU9frOm4fRAkYX3fs/g1iarSFdW
   YoCdDect6cwjDw0JOncit0MhX6jxd6stdB6NWVUGxHk0eAv3JJmx6n7D+
   g==;
X-CSE-ConnectionGUID: D5cY/9scTzKTAWLJtIYBug==
X-CSE-MsgGUID: 8NKBy/c2Tf6hCRC3OTVX/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68000458"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="68000458"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 14:58:19 -0800
X-CSE-ConnectionGUID: UGjTN4C3TLyZHyBElxXu+w==
X-CSE-MsgGUID: iX9DUy6SSxue/47ZJ0srlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="197556036"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Dec 2025 14:58:19 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW0TI-000000001K9-15Ik;
	Wed, 17 Dec 2025 22:58:16 +0000
Date: Thu, 18 Dec 2025 06:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] ld.lld: error: undefined symbol:
 lockdep_rtnl_is_held
Message-ID: <202512180610.decGJVaM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lee,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b052adb82e3f185c5fb33c80f75b29464b774bbf
commit: 1dfbe413d21f18f714cca818435299947bf5649a [2/2] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: arm64-randconfig-r122-20251217 (https://download.01.org/0day-ci/archive/20251218/202512180610.decGJVaM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180610.decGJVaM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180610.decGJVaM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: lockdep_rtnl_is_held
   >>> referenced by net_dim.c
   >>>               lib/dim/net_dim.o:(net_dim_free_irq_moder) in archive vmlinux.a
   >>> referenced by net_dim.c
   >>>               lib/dim/net_dim.o:(net_dim_free_irq_moder) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
