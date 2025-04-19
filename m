Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0271F94A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745057721; cv=none; b=ZYpDm2ngPAVmXaILFHCogVLOJYOsTUkhazOQWv84LFBtCu9AEZ/c/mjWWaE3Uijk4+j/GibUsJwNTldD9tlvDXj+uQzUme/Ubfp0i108MYHewmptk7Pf+aRzYbW47NNqtW5rTQmiahZgQxuW/G3zmXQ3DM7JXZUznzdOm3bvZ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745057721; c=relaxed/simple;
	bh=ETMFSmlM5JyxGSqI9vhMkLd3Kdbzr4bodyOLaBcNsdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdqhBQNTrWfdXoLhSH6/y8+gaVJE0ACB7BTu645Ho2NRX+ZWd6Ri7t3B+AcH18bjnK40zVQr6ELAbh3jFT1WjS3VGuSvt+NWxmMcGatytZ4SfA2P88Y9pIxrmKqKqJih87H6tejS4d2MvDV9P6sUarQeU1Npahf6b8AaRrOyNM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMna0It/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMna0It/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745057719; x=1776593719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ETMFSmlM5JyxGSqI9vhMkLd3Kdbzr4bodyOLaBcNsdg=;
  b=GMna0It/jjywLWgRQb2j9zy2e/4hmHArAuDW5ILXXTLftvmOr+fjbiwD
   ISAOmnCxXUt6t4/N3isISjoqZFPAIKQfIeQWnfsksFfOYgkDeyIhQY8qo
   OltV2i38r8S84R6l+ObEor3NRoh40Sst3ceBXxTfqbOwoxAQc1dBBm0ET
   Yv+1qO/8qEhdDBr7QFW5/Bu0W7QA+CdgkAU2JVB5H4h+fD9c7WNtQxxZ5
   fNxRmu2Fjf0aF4VR4TqA5XTb83l9Fa5GpRqG5+hxRDlKB69oAa7MHEXEM
   KYSUrvUuI+1/cNvXQXGj8zlqbhXDKdN7k5JvOH7iag8jPYdjrgYv4Bxfe
   Q==;
X-CSE-ConnectionGUID: lP0vJM3+T7Sx4oaF1DDTTQ==
X-CSE-MsgGUID: O/eOtS/GRVG6mDj7W9YkOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="34286099"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="34286099"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 03:15:18 -0700
X-CSE-ConnectionGUID: h/syMLkrQFim+3B+xEx+Sg==
X-CSE-MsgGUID: oTwgfb4MSdm6w2iMtPiFmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="136412549"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Apr 2025 03:15:17 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u65EB-0003mu-0V;
	Sat, 19 Apr 2025 10:15:15 +0000
Date: Sat, 19 Apr 2025 18:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/5] ERROR: modpost:
 "timekeeping_inject_sleeptime64" [drivers/virtio/virtio_pvclock.ko]
 undefined!
Message-ID: <202504191855.rJLpzoYN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8bd031991dd0031896009ee49e1ce247d639c653
commit: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 [0/5] CHROMIUM: virtio_pvclock: port driver impl from Android
config: i386-randconfig-052-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191855.rJLpzoYN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191855.rJLpzoYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191855.rJLpzoYN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "timekeeping_inject_sleeptime64" [drivers/virtio/virtio_pvclock.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
