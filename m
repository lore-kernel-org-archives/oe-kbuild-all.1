Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53ED215055
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766300158; cv=none; b=FG4q6Ooef4AFczrPx7Ju+hrC0MznnOi/5vSwVZwsgdLBMZxeOmmqi21rWvUsr4+szMnLtsNcfQINlz5i2aUXUJbM+xmvJo/faRPKAY24BL0cF7PeTiCurkpvTNRMA017cYitSax+LKjE18oC84oY723blW4u/p0jU+wr5Q1XYBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766300158; c=relaxed/simple;
	bh=UT6bz3DbXDNtv4IdmgkHy8EMlbm9vWDhH9+ESxeNyDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gye2J6zUPHxdRvHmWk1ODG6RYj/O75IH1kCmAnYOliCiAJYjrZQ6FLX1lPKkx5EyhPqs9GsY7GSlu6Nfy50SZeWPvxLLT6RhG5b+uFWIPsqWHyBw5zrPKii5xxm0lJYlsGYiFFO5UAxmcSIfLiDgdwCDxmbZR9fIp7iGu61UUZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xd71HlWO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xd71HlWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766300157; x=1797836157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UT6bz3DbXDNtv4IdmgkHy8EMlbm9vWDhH9+ESxeNyDc=;
  b=Xd71HlWOv+ussjac+UciIH+HQkviV5sUN7lxDYJTTpcQ4FOHIlRg0Nsu
   NCFGxz0vSlyaAlNeLMxZlqTQsLu6UjLAYDNMfKICrmfsjpo56QLG6E2yA
   FPLBixIt3D7WI9ozzW9p5odBrRXmN/ZEojbs6Ue/blhnpmh8J89AbnLZg
   f1+qX4DeKR0dLl/nfvNgTp9hF8KmazSd4G7e/CyOb/4tCfkrN7kuIUQUv
   Jl+tSS49404IY3t1kEoF5JJYUqCI9SIKcxyWbvBWJWOrgMfxSQPhXRLTl
   cIcNkv1W+YH8w62NoUmNw0OuA7k/NTWSbPpx6PehvkwJ3YtEaQZgDbAzg
   Q==;
X-CSE-ConnectionGUID: rSulT7HVSYSoxAAlr4OMCw==
X-CSE-MsgGUID: JJAlItDrQxOgMt9nAADI1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72056992"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72056992"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 22:55:56 -0800
X-CSE-ConnectionGUID: kLUSJ2jzTPSN8r1vNrixWg==
X-CSE-MsgGUID: lRiiOVchQzGEt0Vti3tRnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199759465"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 22:55:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXDM9-000000004xU-1lzg;
	Sun, 21 Dec 2025 06:55:53 +0000
Date: Sun, 21 Dec 2025 07:55:21 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 26/26] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by
 X86_CPU_RESCTRL
Message-ID: <202512210704.5owO0sQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a9d28381f95a89bdcdd37365e033274ba5247458
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [26/26] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS_PSEUDO_LOCK-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210704.5owO0sQe-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210704.5owO0sQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210704.5owO0sQe-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
