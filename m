Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C723ACA44
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770391488; cv=none; b=r6xqEGAoW4uzRQlWfLsF1dI8iUFY4feKxyibPBnABcrjEHXU+SjqYXNR33zTAh7ClnOWTfSIHECJDhqIUulc4TFRFaMTkqIqkJng1B43Nch8VQGkMDowYT2DZxXUWbGnd5UbPii7eI8dgztobqhxHmgOSF+lSRNUPb+6vdsICnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770391488; c=relaxed/simple;
	bh=S4AqLf9MCAdNJmz+KGl+FvkxOBV1tfTLEra9G6tBiUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j8vRjSGkrQQIHHRldUo00L7BuzpAWNxM9YT7BEHFNK0KLEpd+0/FBzOLt3kvn67tvQzcSyUqnKHBzese5txlJhgSB2+hWbPwVFR/qcjlPCrLYQEDuqv36RamXKI9H47GsjPjBOJAStOVgQ6nkFyR+PVoMSI8R2PCCnt/iJTQv04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9O8IWBS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9O8IWBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770391488; x=1801927488;
  h=date:from:to:cc:subject:message-id;
  bh=S4AqLf9MCAdNJmz+KGl+FvkxOBV1tfTLEra9G6tBiUw=;
  b=E9O8IWBSuikkVTT/R9Jn9VJ9yMRiq1o0U2czMZ3MJ+V/1iwI/K7x4Wcp
   SC72f0x7RjkVQj0UPyht3Vov2tALtAMolMsTIqZ//mvVi2E2Tq4mWaAli
   DM92NlkjdejyvjIaM56jMVKlmC3gEUfwvKNgGlcfiWnIhougjiiumDxll
   /ewy41sGgf0PIr33w9Tv2OvKZlYJtLaXlCsa/SyTkMDYLMZvKKZHgA6it
   WdlixPMJ041wrFVL0ZV1EKC2v6Bp6m3dfC6ZeeSeSXx9cnuvcOuuFL0Mj
   NcsQezJH6W6lA/T3FDxdSQxwIQn4QHhHESCcJ4vSQ2Fcpf/EIMVJlS9Xy
   Q==;
X-CSE-ConnectionGUID: jGTGJxLVTmKPQPQnvjvU+w==
X-CSE-MsgGUID: c2E3Qjr3TnWoKJCbWbKZxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82231729"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="82231729"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 07:24:47 -0800
X-CSE-ConnectionGUID: /H1oXDotSV2W+uxQ4T9j5g==
X-CSE-MsgGUID: mlxpViK/Svyka9Ynz6iorA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="241557846"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 06 Feb 2026 07:24:46 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voNhL-000000004an-14as;
	Fri, 06 Feb 2026 15:24:43 +0000
Date: Fri, 06 Feb 2026 16:24:41 +0100
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Williamson <alex@shazbot.org>
Subject: [linux-next:master 5430/14265] /usr/bin/ld:
 tools/testing/selftests/vfio/libvfio/vfio_pci_driver.o:undefined reference to
 `dsa_ops'
Message-ID: <202602061626.yzYrIsun-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9845cf73f7db6094c0d8419d6adb848028f4a921
commit: a52b1a71120bac2cac691f11b8fd2f64254570f0 [5430/14265] vfio: selftests: Store libvfio build outputs in $(OUTPUT)/libvfio
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260206/202602061626.yzYrIsun-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061626.yzYrIsun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061626.yzYrIsun-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: tools/testing/selftests/vfio/libvfio/vfio_pci_driver.o:(.data.rel+0x0): undefined reference to `dsa_ops'
>> /usr/bin/ld: tools/testing/selftests/vfio/libvfio/vfio_pci_driver.o:(.data.rel+0x8): undefined reference to `ioat_ops'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
