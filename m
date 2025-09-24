Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D20E26E165
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758698245; cv=none; b=TdnjK8OT1AJWJosA1DFzj55n4reuyImyJmW97+HKLBp1BCAEK4Q8fZQUdq0ORNeGwsnG4AgSfCRI4zLvB6Bcleu5GAZmA7BbJAlOnwkeOB/qmsttghqrD9GQQ3S6jMXn7X/EU/u7Z0CtM+s4/K7nQM6okTQVvZggGADclBntzac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758698245; c=relaxed/simple;
	bh=YxsdD/EFMczIbjOmk9Q5rjkwZxIsZQeUVrpfRDKqC+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WQUt3IwppRSN0pROFa9Fydy/BtKVHWw9eZ5+p0xjxHp9ZAm9BX8UuOcQqz+nifSRZ/j+Mmj+L0rnBd0R+0Ym7EJ1PJvzRaIbJwDAIS253zfxJLTy1ybk6xZ3X8AzbBHOzNuOtPPdKVKxcXqnvXg/MIuUgPNu6CbeSpqapg8afnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvZQX2Ed; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvZQX2Ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758698243; x=1790234243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxsdD/EFMczIbjOmk9Q5rjkwZxIsZQeUVrpfRDKqC+A=;
  b=nvZQX2Ed7AmGsX68e8zkdJ96vf3rvS3JiAbGRmdOtWrgAHg67GFAtNSM
   VgVEvapiepLn3LokT7uk576bLOH6Pd1RaEFUB2OUkUvjaWlWtMeAqIb/h
   Lcn9hDacP7QX/DaSu161CEj+EzC9ZNE1Um0jGtFbQPTMYXgF5cdXSrtkE
   BbjymK6zAs6MSDzU5Fnu2IrGXLOmulbFQwibefQ2WTprwQ54GrV5yQbPF
   7Tc2kTH21/MPn9l5ufobT4NBfFgEZ5a5SKOPS18ez7AxmDp0OxBe6igZS
   mfVUF18T+ZMVKB7BtQxPjBl2LWmJZtZMMDWcBpi3KnP6E7Xr14sOC2gWr
   Q==;
X-CSE-ConnectionGUID: 9f2W/0I2QjqNRyHJdxurjQ==
X-CSE-MsgGUID: n4DDDeoGRsirZqXYae7yOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71661194"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="71661194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 00:17:22 -0700
X-CSE-ConnectionGUID: AOKjNuIjQ0SK2amq10Yn4Q==
X-CSE-MsgGUID: Oa4gOgiPTU6p6WUifdl8Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176795055"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 00:17:21 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Jkc-0003t7-0s;
	Wed, 24 Sep 2025 07:17:18 +0000
Date: Wed, 24 Sep 2025 15:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:test 4/10] include/linux/ftrace.h:570: multiple
 definition of `modify_ftrace_direct_hash';
 drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first
 defined here
Message-ID: <202509241522.QEZDoJpQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git test
head:   1b7fc74c36a93e90816f58c37a84522f0949095a
commit: bbc3f1e07924e420b74b4bf49f1c3b0a924db927 [4/10] ftrace: Add modify_ftrace_direct_hash function
config: x86_64-buildonly-randconfig-004-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241522.QEZDoJpQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241522.QEZDoJpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241522.QEZDoJpQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/nouveau/nouveau_drm.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_drm.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_drm.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_hwmon.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_hwmon.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_hwmon.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_led.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_led.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_led.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_nvif.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_nvif.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_nvif.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vga.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vga.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vga.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo0039.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo0039.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo0039.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo5039.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo5039.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo5039.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_gem.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_gem.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_gem.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_mem.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_mem.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_mem.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_prime.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_prime.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_prime.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sgdma.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sgdma.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sgdma.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_ttm.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_ttm.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_ttm.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vmm.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vmm.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vmm.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_exec.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_exec.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_exec.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sched.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sched.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sched.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_uvmm.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_uvmm.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_uvmm.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_backlight.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_backlight.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_backlight.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bios.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bios.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bios.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_connector.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_connector.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_connector.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_display.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_display.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_display.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_dp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_dp.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_dp.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/arb.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/arb.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/arb.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/crtc.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/crtc.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/crtc.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/cursor.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/cursor.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/cursor.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dac.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dac.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dac.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dfp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dfp.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dfp.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/disp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/disp.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/disp.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/hw.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/hw.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/hw.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/overlay.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/overlay.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/overlay.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv04.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv04.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv04.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv17.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv17.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv17.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/lut.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/lut.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/lut.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:564: first defined here


vim +570 include/linux/ftrace.h

   568	
   569	int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
 > 570	{
   571		return -ENODEV;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
