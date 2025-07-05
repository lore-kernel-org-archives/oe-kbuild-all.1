Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703C82E36FB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751716314; cv=none; b=FmCzztJNlD5J2H3W+puip6Uzv30P5Vtig7wm2zfJ3EbaStl5Y0haFG/hR7dfHPT5p4XqfoHlidebdJMMZJ5S78E/UKcccxoXhVTqn7/HMKop+kmstyZ6QAB4gX7E7sqx6diQqS5ztsDBQGhBAvhnps98uJTgl3ptB1l3Lr0VOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751716314; c=relaxed/simple;
	bh=O3D0aj6BaJhzyP0G+FHpz8HVJoj9/v1+SiOpf39rK+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mmcdc3PS4fTKgCZas+xDjSRboeo/qtbgD+yuPHZXtr4WEXslVjb4N3mA1aeSQ6xhjwnvSgVyiLKA2j5C3aWfM6hTlTp+xuNw6EcyoBhwn8Vg/7Yv5mAdQAipuuI5+EZusxVdqThyDs636iLhE2WxohHMfnNfziA/bOiFwyWZugo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAD+MzI1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAD+MzI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751716312; x=1783252312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3D0aj6BaJhzyP0G+FHpz8HVJoj9/v1+SiOpf39rK+o=;
  b=aAD+MzI1zMqqOLhV//VvZchgbNOrehZ/wYMdWj1x92hgsRHmPfUp9hH/
   qdqoZb7UIchF+I3VcpGcNgb8y72cPlbaN10w29jv1zSG7Wa3qedGK+QE5
   KCxMUx/nhY92yspFBupuPBQydSyA9ZvcbbBCVwQlc6pUwClH3c/Bfg6ct
   3hQwr5i7LWgSzd33e0RgKZTlJcIZVEFKm+ThoHqkjbMqFpwLWubTAnRH7
   vpO1Eo7G4ILUfRbabn7sj0QuYSouoVAikKuEtqb3HDuXAbXr/lDRLBTzB
   IcyEsrUFbORE0EtqaEy/VXyqOljztgeEbEsY/wxyS7ZT8u/4pQlKMuj0C
   w==;
X-CSE-ConnectionGUID: gZ6Va6EIRemNlGcH0sC0rQ==
X-CSE-MsgGUID: j3VediRkTUC/piZ61FOVXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57816166"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="57816166"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 04:51:52 -0700
X-CSE-ConnectionGUID: mfLhjc09QIuRXSW+sUm2lQ==
X-CSE-MsgGUID: +BPA+L6nST+7Aa/eFUB+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="154557528"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Jul 2025 04:51:51 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY1Qq-0004TX-1s;
	Sat, 05 Jul 2025 11:51:48 +0000
Date: Sat, 5 Jul 2025 19:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kismet: WARNING: unmet direct
 dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
Message-ID: <202507051942.2MLDQwEg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   d969457e60e9ea507680a1751a06b04ed0e952fa
commit: ed1b6dfe39ba3a1a37a242d0ef4dfb7b5ec06987 [1/1] vfio/mdev: idxd: add virtual device emulation support
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20250705/202507051942.2MLDQwEg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250705/202507051942.2MLDQwEg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051942.2MLDQwEg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
