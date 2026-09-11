Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C93DC4C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 02:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093994; cv=none; b=reynUUiFrTiKcTeH5yeb9h22XbvmG4QDynZ1zIy8lI4ampElgVWZT0eabfs2SFlHLqMn6ILv83WBPJWZRVbP6XcuSax8IiWFyPEV4F9t0Z1570edFmNGaqCypRK75D55ZtUe4c0QygejDh60fgJSMFbEM9+jeNlg8ZV5l1r0jVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093994; c=relaxed/simple;
	bh=iGntS7/5pum9U0llTRYYO0bTfaLYWpvdw0ia/gHGGyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IjHxku2KUHcJGnV7wUGbXEdWMGoEKQSXBmhMJF50PbOKGwFzys7LfldTl/ltyRWqsQiaslEITzGiy9CWhkF+jHB/FixtGQOoJWH8+GHGne7Hc2yL0KwR5QbOtHEBn7QMvr7gH97ajOikMddJsYcBPJYl5tNdYhApI6S+Ztb3rAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWYDw/Nf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWYDw/Nf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789093993; x=1820629993;
  h=date:from:to:cc:subject:message-id;
  bh=iGntS7/5pum9U0llTRYYO0bTfaLYWpvdw0ia/gHGGyE=;
  b=FWYDw/NfHAUW6WIOInAZJuZPmpTXjcWbZnLVoYwc3eLRhDe7za6Kgcam
   wpS3QzX4aWkWMb27tO9x41DOgHdEcW99e5jjn9wizEPZc+vnQijF9yPDp
   ulXC4x90tvlmWesn07BMdJcunOTb8L2bzF27yC7O5qxVLVoH/GTEkCjx4
   G/Gn7W7TC2bKzFzcYGWIH2X+5dL9mmKh3ysAMRIDXhsPzx7SSfFTfFfPR
   ImrjxYVX2DkEGE9nBM5nv2quu+IH8xggZUfuyGvYJEioEOdCInPLdWIEm
   Wlm4YTHZQqsZtWMeWkhuTrccQg4uY8jL/lwgt1F/OTj5y8mfKmX7NrDb7
   g==;
X-CSE-ConnectionGUID: BgSYJX6AT6Sx/HUMHUCHAA==
X-CSE-MsgGUID: 9kd1A0ggTbmw+2IMbLK7VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="107070722"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="107070722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 19:33:12 -0700
X-CSE-ConnectionGUID: G/w14PFvQWKUP+yMjMIcWQ==
X-CSE-MsgGUID: fmocZ+g1SuS5+F4opGk0ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="295270044"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 19:33:10 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4r4W-000000000sH-1WLF;
	Fri, 11 Sep 2026 02:33:02 +0000
Date: Fri, 11 Sep 2026 10:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/acpi-static-table-gsi-deferral 6/13]
 drivers/clocksource/arm_arch_timer_mmio.c:208:8: error: call to undeclared
 function 'acpi_register_gsi'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609111011.7NQxSpZ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/acpi-static-table-gsi-deferral
head:   57e5c004a108c62e38be743a8e66e3cae00ca521
commit: cb41cb5a5932af1185e1b4c865abc9116e3d7e63 [6/13] clocksource: Implement arch mem timer deferred probe
config: arm-exynos_defconfig (https://download.01.org/0day-ci/archive/20260911/202609111011.7NQxSpZ0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111011.7NQxSpZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111011.7NQxSpZ0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clocksource/arm_arch_timer_mmio.c:208:8: error: call to undeclared function 'acpi_register_gsi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     208 |         ret = acpi_register_gsi(&pdev->dev, gsi, trigger, polarity);
         |               ^
   1 error generated.


vim +/acpi_register_gsi +208 drivers/clocksource/arm_arch_timer_mmio.c

   194	
   195	static int arch_timer_mmio_map_gsi(struct platform_device *pdev, u32 gsi,
   196					   u32 flags, int *irq)
   197	{
   198		int trigger, polarity, ret;
   199	
   200		if (!gsi || *irq)
   201			return 0;
   202	
   203		trigger = (flags & ACPI_GTDT_INTERRUPT_MODE) ? ACPI_EDGE_SENSITIVE
   204							     : ACPI_LEVEL_SENSITIVE;
   205		polarity = (flags & ACPI_GTDT_INTERRUPT_POLARITY) ? ACPI_ACTIVE_LOW
   206								  : ACPI_ACTIVE_HIGH;
   207	
 > 208		ret = acpi_register_gsi(&pdev->dev, gsi, trigger, polarity);
   209		if (ret < 0)
   210			return ret;
   211	
   212		*irq = ret;
   213	
   214		return 0;
   215	}
   216	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
