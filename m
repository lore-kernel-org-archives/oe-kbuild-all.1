Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2352AD00
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724364; cv=none; b=nWmPCVwJLKktxwBhD17DxIVbh3C6l4t+RZI7k1V3+izj/gVz7tCNFIUl8DNxC56hR1iiguAj11c7bFsBSHj/FEEGK0bXR+AIZrxLnsv9pxJEjlRI+5ebaZa03tvEUOdxPPvIJoKCfVmuJHPIwN4LP402P39LUGelF/xGyGAGgCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724364; c=relaxed/simple;
	bh=dKhqVE4VToXxrsRHvr49Sb7j3Rwav5DZCeoUXOd6mZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbq1CRHvq63vw8ruOiDA+ldrmYh2wdUjYpLrJbxxsCIjOVK/mfIlluCWfITtHvBAghiqX05cpF/gDgIOm9r4bLq5R6fwOC5YlyVkC7f9N0awgCttk8du7D5nwW5IqprdhfMSXQZl0hczgIw5F8iT80RtKYnjugpZ8tfDhfcw2OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8azuekQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8azuekQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751724362; x=1783260362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKhqVE4VToXxrsRHvr49Sb7j3Rwav5DZCeoUXOd6mZg=;
  b=G8azuekQUylB2XiLXBTpRTN4xBbfLW/saOrOo+mmGq9uxgDktqwzqw2X
   upaVSccKkCeIfsxwWyulLmh8Cnoo53X8uV9dh9rd9scWWjOCuGS2tczmg
   DSFRgmnSp2KLHfNCfptgEkPAO2UDKE/sADcIoHUxyR2CtLXZVjQyEz1+v
   WmNyxHEMwcW7yOx8nU5H3mi8QeU7wTRDSxd/V+ggU9Eu198vXIxWvj96o
   xPc68KjTaysxKBeO9OZYuXsMnE875XkKdENZGOAkQggZe0XFBVpktc71E
   0q9pcV4nHmZtyzInxBnXWthRIsSY/TDUBybB+Yfw0LhhPD6EFp9wR3+0X
   g==;
X-CSE-ConnectionGUID: zOVUXrO0QtyvE5GA10DJXQ==
X-CSE-MsgGUID: Zkjh/pwYSpqFk6lBqDyNbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53880093"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="53880093"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 07:06:01 -0700
X-CSE-ConnectionGUID: qbOqj1HaRcCpT9tCQ5zbRQ==
X-CSE-MsgGUID: 5dIko2TqTqyKfUyvxIKgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="160370302"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jul 2025 07:06:00 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY3Wg-0004Wl-1T;
	Sat, 05 Jul 2025 14:05:58 +0000
Date: Sat, 5 Jul 2025 22:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
Message-ID: <202507052124.aYASTzcm-lkp@intel.com>
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
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [1/1] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250705/202507052124.aYASTzcm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250705/202507052124.aYASTzcm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507052124.aYASTzcm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
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
