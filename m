Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2142F8E83
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 20:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778185781; cv=none; b=J6XFRQCQEtnwWt3FSL1k1r90IkkhDxENZR+Ndswap8te2fJB/nzzxHW7gopQLPnnTPZsq08+HZxrhQDYCl5JslkNuYSknMKQt9kjDdWQ8zP9VKzeMObJq1wMbk7+3srr+emY1IgFTh5ae7cV4sbWx3XwiPpIVzzWTP86yYNNk9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778185781; c=relaxed/simple;
	bh=M6cN1Z7SwrrdGhrDLebdU80qXV4nfOaDfgn3pxcueX0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XFOOoTs4w4ZYevOi7ot3bYi/BDICTT9+3TdUUNw9Fs9TCjj4EtWubzdb6e/5kgvi8q2Dxi+me5Q/Ov8QGTQBPbkJzpiVDLcKISGhnTQStqFcBaYeD3bC1SAgPdM1dAsCMQUMIyF3HTDC9GrkG8pjv0RwvXaLzGPBfnAEmmXbfCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHpNzpVz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHpNzpVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778185780; x=1809721780;
  h=date:from:to:cc:subject:message-id;
  bh=M6cN1Z7SwrrdGhrDLebdU80qXV4nfOaDfgn3pxcueX0=;
  b=gHpNzpVzyTVzBkd9HwWP/PFAP6BMXdS5nQ6SqdzF4JxEiD4HnVnz0Taa
   SEjnkuG8ikvQ1S17bAsFtr3IfBLewBGLGY9h+tmQApgVjZjD28rZ53jpt
   RZxljOmV779fNrDWh6dVc/i1jv5wX8sDu2n3qijLCN4ICthdKneADxFEw
   kQWR46VmadwDLeXMruNM3ZqO19kkEesJwQ4c3WG/OZuXU7QVZLj2lPrmy
   AbmpnTEqxtIWPh6QsCYEExlRJfqxdxmNFW+pRC7fucgE/mcU6mgNo2WVH
   50Oh7aT1F5My2zxIZE08b4DUNIdqERGUXjRjG73oP0AwaYDajCFWy46eh
   g==;
X-CSE-ConnectionGUID: PfYAy9TcRK+SG0wc3tMJUw==
X-CSE-MsgGUID: Dms9aRW7SleskK1tQml6hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96576827"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="96576827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 13:29:39 -0700
X-CSE-ConnectionGUID: RkQ9B+GqRmuo4iHstdNxHw==
X-CSE-MsgGUID: Wxi6+uHiQqehljJCRw65nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="241545322"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2026 13:29:38 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL5Lj-000000000QT-2zyi;
	Thu, 07 May 2026 20:29:35 +0000
Date: Fri, 08 May 2026 04:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 0/1]
 mm/shmem.c:5234:undefined reference to `ashmem_memfd_ioctl'
Message-ID: <202605080447.H1oT0PXn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   b6efc422db8bb6c0be63ff6ef8df7879dfadd9bb
commit: 3f06e745a13c92ac95fda0fde0266cda407f73ae [0/1] ANDROID: ashmem: ensure that tmpfs file is memfd in ioctl
config: i386-buildonly-randconfig-003-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080447.H1oT0PXn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080447.H1oT0PXn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080447.H1oT0PXn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/shmem.o: in function `shmem_ashmem_ioctl':
>> mm/shmem.c:5234:(.text+0x491): undefined reference to `ashmem_memfd_ioctl'
   ld: lib/dim/net_dim.o: in function `net_dim_free_irq_moder':
   lib/dim/net_dim.c:157:(.text+0x301): undefined reference to `lockdep_rtnl_is_held'
   ld: lib/dim/net_dim.c:156:(.text+0x341): undefined reference to `lockdep_rtnl_is_held'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +5234 mm/shmem.c

  5228	
  5229	#ifdef CONFIG_ASHMEM
  5230	static long shmem_ashmem_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
  5231	{
  5232		if (!(SHMEM_I(file_inode(file))->flags & SHMEM_FL_MEMFD))
  5233			return -ENOTTY;
> 5234		return ashmem_memfd_ioctl(file, cmd, arg);
  5235	}
  5236	#endif
  5237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
