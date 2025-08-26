Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87B3260586
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756218573; cv=none; b=ljAZsuC5RrB9Vbw/oA31DBLUtkXF/nUxa/ILCuPEdAOyCeBSHkovyXpq8VJDTO94vHoFSUNqpDExY53uFsqdt1WlA2ZyLHtnhxETI4VGXYHE3EVnthxsZ4xb8jXyXtLdZsa+DkkRuCq5b1aAr/29mH9hMJIpSpbCGtRHH65+FlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756218573; c=relaxed/simple;
	bh=I75PfQCp4SuMmVXGL2y3vvwUmfvx/McDNIQzO2t8zcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTqWvkpZuVZ7h6l9S9HzTn/68z9iowBz1glozVVhiVPrTLMn3GNTkdTSnVRFK126Gy0Dcd/oXb7SCN6Py/f5FIIZ+KAQwirPttDjEWZYRnjYHenTBcjQ14U2u+t3FeqsEn6hFwd6BowK2ZrCLx6DLu/qQz2J30qKAo5pSStBbU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAO89Cs5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAO89Cs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756218573; x=1787754573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I75PfQCp4SuMmVXGL2y3vvwUmfvx/McDNIQzO2t8zcI=;
  b=GAO89Cs5n/a6E/NEjRN9Kp6nS/Z/jLyngQdI+rNgSWQinwJumabHU5+x
   np88BjyK85ES362aW35aCDtyke1DjspYk+HP24xjfZCv/GMC5wRM5RG0R
   dB1xL+5OUoxQ2rIcYpe9CzYyuPOg5wDyK9KVR0K/ql5TRv1crcWQpfb6c
   ZrI/sQTpwMPZUEMuPICUkKcrP66hNwQupSp/lWmRQDKiLaGxFwKdR120s
   oTQA9kzx84T8vl+L9q74f8IXS3mvvd3y4ck4bMvlL10Cl5HEf95cflDla
   R1vPY94NgxAQxDmH1jBXlrjurLHPpXJoAzk3JkEwSMgWdy3meJ08Ooejl
   Q==;
X-CSE-ConnectionGUID: 4cPwWNWtSf26dZdkx6fHLQ==
X-CSE-MsgGUID: /SESQhPjTje0MJDyPproGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62289272"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62289272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 07:29:32 -0700
X-CSE-ConnectionGUID: CVNs1/4GRMGO6cKpCLwwGQ==
X-CSE-MsgGUID: UkBfLk4QT8aIxjvwz779zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="174851594"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 26 Aug 2025 07:29:30 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqufw-0002SB-0W;
	Tue, 26 Aug 2025 14:29:28 +0000
Date: Tue, 26 Aug 2025 16:28:38 +0200
From: kernel test robot <lkp@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miklos Szeredi <mszeredi@redhat.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 2926/4534] htmldocs: Warning:
 Documentation/translations/zh_CN/filesystems/sysfs.txt references a file
 that doesn't exist: Documentation/filesystems/fuse.rst
Message-ID: <202508261621.EaNMWVjm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d0630b758e593506126e8eda6c3d56097d1847c5
commit: 2261d49b134e3ab84533e258a5fe13a75c4ae981 [2926/4534] Documentation: fuse: Consolidate FUSE docs into its own subdirectory
reproduce: (https://download.01.org/0day-ci/archive/20250826/202508261621.EaNMWVjm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508261621.EaNMWVjm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: Documentation/translations/zh_CN/filesystems/sysfs.txt references a file that doesn't exist: Documentation/filesystems/fuse.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: Documentation/translations/zh_TW/filesystems/sysfs.txt references a file that doesn't exist: Documentation/filesystems/fuse.rst
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
>> Warning: fs/fuse/Kconfig references a file that doesn't exist: file:Documentation/filesystems/fuse.rst
>> Warning: fs/fuse/dev.c references a file that doesn't exist: Documentation/filesystems/fuse.rst
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
