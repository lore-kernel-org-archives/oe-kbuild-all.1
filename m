Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FD82D592D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 23:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766273813; cv=none; b=lxVDgKQF6BO9nTzv3nmnsq6tX2OiBxwcKpaxn/uTam9UWKtOL0PDWtOcbQIobjyJHXwqj4Mcwm04/+QVSDaS89ca1Hkh9TrlWR/eE/d4rwrTNAMp+QANdpi//FMd2rm7fA1eZFJ3+B7dOg4WGiLp8yHbe/Iu+AUdTjo6UItymTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766273813; c=relaxed/simple;
	bh=DDritR3o9nD1aK9jUGxJ9p3OdeqGlW0Gknl5pRGp8JU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QWIldDtza9ZWNyvuz4tvUC2oq3w01VeaqsJ/akR1zlNkkezEfAUF5RymZATx8ix/HAVwa1iEqqikTfZGIwDM3IHOYsDbIDtBJXYXg5k2hbuyeJ9ddMU661/uxprN7ji9w99P3W4g6nNxl/WWmBKC3838uD7Yzv9cypbkey1SR90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCpQ/FEN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCpQ/FEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766273811; x=1797809811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDritR3o9nD1aK9jUGxJ9p3OdeqGlW0Gknl5pRGp8JU=;
  b=lCpQ/FENZYY6JVQM80uJ/62slfv3rNBJbGK0uFOUwU89cyivwHyC7wR4
   PljTuv1cuXwjGc8/GqANzP/f612jTZ+pUt4kcI56ebdKGNa4LeUST49hZ
   uUjdxRm5Cece5/0pFcP8Dl/KSK66SRea0rb/SgtY5BYqzy5xux6jw3e5h
   uIY6Ba7b/Jdv2bsUyLlNdduxlYBoLj3yLaCNPe8IPkqR1hByZ3suUq7gd
   KBc4IBGEZcKXyFDjOkgQpnPy69vrh1tSIVvrLVBe+X6h8baNOnrFPfJCa
   qhJxfiZ9eEqiGQjR0RIQ0WgItyDMY875YeL1RG4pxuWOTOEpXHZeWgYYI
   A==;
X-CSE-ConnectionGUID: NIoSxzHQRea/RvAaI7Yz3Q==
X-CSE-MsgGUID: VDDOuC0ITS64/0WkWHKfzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68125801"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68125801"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 15:36:50 -0800
X-CSE-ConnectionGUID: P1vYH41eQhOO1WoZrBErZw==
X-CSE-MsgGUID: vdns+M4kS9in1a8yCGd0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="200070629"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 15:36:49 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX6VD-000000004pc-1xj4;
	Sat, 20 Dec 2025 23:36:47 +0000
Date: Sun, 21 Dec 2025 00:36:42 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 26/26] kismet: WARNING: unmet direct
 dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
Message-ID: <202512210027.fq9rJuao-lkp@intel.com>
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
commit: ed1b6dfe39ba3a1a37a242d0ef4dfb7b5ec06987 [26/26] vfio/mdev: idxd: add virtual device emulation support
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210027.fq9rJuao-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210027.fq9rJuao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210027.fq9rJuao-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]
   
   WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
     Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
     Selected by [y]:
     - JOYSTICK_ADC [=y] && !UML && INPUT [=y] && INPUT_JOYSTICK [=y] && IIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
