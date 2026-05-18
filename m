Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A97E391E7F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 20:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136910; cv=none; b=tbjAGR0ZDLWYMgWW3/sqVjh3Gm77UgEG7+qBO/zSLuwTu9EgkD/u0xsiANQ89qOdVLy1u4tEbqv/M07Iwrg52XYMHuEjwtqM4gjbMruINO5xmyVAkeklEotLb+VmYfdPWftU5OaTvaoLspSnePEhiU1XUv6qMXZgNh3Og6sk5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136910; c=relaxed/simple;
	bh=MXcxFNIMKYULCVji/zdMpXdFo3xWHbhCcMyf65dX8BU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cAbr+13Q6BT29euO9IgIKJzwGvmjFiNsZiSdb1RqbbGJX9+cfmu0K8nmY63M9vedVgwU9fr4xiNYnpG/URQLBWPgEEwDMhXS3QFpK+FHYP5fRb9gl8Ni9MYVYa2XQjf2l3bzntdAMF4O0Q5Q7WZo4STtMG5m76s65NVFxLUe10U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBJcouQi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBJcouQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779136909; x=1810672909;
  h=date:from:to:cc:subject:message-id;
  bh=MXcxFNIMKYULCVji/zdMpXdFo3xWHbhCcMyf65dX8BU=;
  b=UBJcouQiwIeGIOP1OwZlsK8zbV5Pc7OJquyuT4Z0Co0tGOY9VU8u5zHn
   j/cIWeS/V7xRERpcKiagPKNN50zMJ0ikT0wYTMR1sVwzsaJ4RNu95CnFt
   VBlV7aSerqU6gyxPtF1UhhB6ELOLf8eorp8AglNCuMOC5C3q314/E5js/
   aQvGYmufCiB7HQw84tal/vSeetlkfBI9CZH2B6i3Dh5DwjzfkKr5EMJgZ
   ienSVViwZtCkE81hbJ4qTQ32ObHmkhtxCt1/m3VvU1ax/Db+Gs1vxwlRY
   7iLhKqJpMRq7izbdVECHbjJnEhqwEgUu1BC8Bcr0C0E1YcCuf21blLTLQ
   Q==;
X-CSE-ConnectionGUID: ZIn8m3XMTCKQObzbJ81N6w==
X-CSE-MsgGUID: cFiwNt2AQmqcm9O3uhW9Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83859608"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="83859608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 13:41:48 -0700
X-CSE-ConnectionGUID: lw8MSyHfT5W7SS4rbMZx2g==
X-CSE-MsgGUID: HYB2+jb8SBCchBB3/iM3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="236918900"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2026 13:41:47 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP4mW-000000003Ng-37Yv;
	Mon, 18 May 2026 20:41:44 +0000
Date: Tue, 19 May 2026 04:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 22/238]
 drivers/cpufreq/amd-pstate-ut.c:566:23: error: unterminated argument list
 invoking macro "DEFINE_FREE"
Message-ID: <202605190416.zz1TURho-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 378df8f85b52efc8ab80beabeb3d4a7d8290840c [22/238] cpufreq/amd-pstate-ut: replace __get_free_page() with kmalloc()
config: i386-buildonly-randconfig-004-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190416.zz1TURho-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190416.zz1TURho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190416.zz1TURho-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate-ut.c:566:23: error: unterminated argument list invoking macro "DEFINE_FREE"
     566 | MODULE_LICENSE("GPL");
         |                       ^
>> drivers/cpufreq/amd-pstate-ut.c:46:1: error: expected '=', ',', ';', 'asm' or '__attribute__' at end of input
      46 | DEFINE_FREE(cleanup_page, void *, if (_T) kfree((void *)(unsigned long)_T)
         | ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +/DEFINE_FREE +566 drivers/cpufreq/amd-pstate-ut.c

14eb1c96e3a3fd Meng Li 2022-08-17  563  
14eb1c96e3a3fd Meng Li 2022-08-17  564  MODULE_AUTHOR("Meng Li <li.meng@amd.com>");
14eb1c96e3a3fd Meng Li 2022-08-17  565  MODULE_DESCRIPTION("AMD P-state driver Test module");
14eb1c96e3a3fd Meng Li 2022-08-17 @566  MODULE_LICENSE("GPL");

:::::: The code at line 566 was first introduced by commit
:::::: 14eb1c96e3a3fd9cd377ac9af3c7a410f8bf1015 cpufreq: amd-pstate: Add test module for amd-pstate driver

:::::: TO: Meng Li <li.meng@amd.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
