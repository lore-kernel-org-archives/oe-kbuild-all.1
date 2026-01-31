Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC11CEADB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769899942; cv=none; b=H3BCTDSiwRhS09HlnIFpP0gHAUwMdhq1LEaHAXzoabe6KmS0EqHHraBqxMaeCEVbsyxql9dcvYgxWPg3RJMy5YWATzFLL75AVrOyN4J/7yNyswM9xnSGVILJWj87ZHgF/4a+kYVof9q4b3W7qkrNgRSAhlq5nBE7RyIfMRZzPAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769899942; c=relaxed/simple;
	bh=BKcB/lz3VlJ1LxyxFa4LdgfLGTZtWveWU88dAvxCHnI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PjIz4Tk1Lqpt95VO+1ldb4jT2aXVPA95EEb73QK+bIrVZpMg/gwm27kNxj50vCNQTZ+/59Wel9jsEh3/Xk0UlZTJKlXp0n6DQEn4himI4EASplZv3RZv+DgUJJZ9MoWkx19vTs/Vm2WsFREjGsRIzu2sVWh+L0y9aQZQWTrMIkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOAS4/Ig; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOAS4/Ig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769899940; x=1801435940;
  h=date:from:to:cc:subject:message-id;
  bh=BKcB/lz3VlJ1LxyxFa4LdgfLGTZtWveWU88dAvxCHnI=;
  b=VOAS4/Ig4iqNVoHNKJhbBCdr6XG7Q9GgAkxTbEvQuaG3eCAVIUMokW+T
   aL5IJ3RMEIQMRoJE6kjxact5ey8CrTZffVj/BHowlameIa7jrtxpfnMAS
   rPAEjuT7goxzCnY2JiUhYsfuGkiB4eBS6s5HBBnFrE1b/a/1kn9ZB1oys
   wKIR57vayPzE7nteGroKn5EC3wsOkSxE4mabJy4N8BeTzAQhP+1tOnJeo
   eEnkDHfobgJI6qUuwk4IGLK7SWVK3/OfqWfGqI0wjLz/z1hzW+oRAA6hB
   2HKf5mYF5QpM08yoW+t0Vt5rpTEGqSp6TODkRtfHEt13+9kG3Nmr1ACgg
   Q==;
X-CSE-ConnectionGUID: onSvh8DEQdeiB9vO1JYHrw==
X-CSE-MsgGUID: uTcRpP9tRKybxOWYPGzMRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71148843"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="71148843"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 14:52:19 -0800
X-CSE-ConnectionGUID: /gG2zm1KR2Cr/W28j8x/8g==
X-CSE-MsgGUID: 5On9W5ZZTqyAhAeN40eGsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="208398382"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 31 Jan 2026 14:52:18 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmJpA-000000002kr-08ya;
	Sat, 31 Jan 2026 22:52:16 +0000
Date: Sat, 31 Jan 2026 23:51:44 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/3] htmldocs:
 Documentation/admin-guide/perf/ampere_cspmu.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202601312318.1hpYE0pe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ilkka,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8f3dc34debe1467cc2306963037f0db6b36e1729
commit: dc765eee4bf576658a5cc14e647dfed7765b5405 [0/3] perf: arm_cspmu: ampere_cspmu: Add support for Ampere SoC PMU
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601312318.1hpYE0pe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601312318.1hpYE0pe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
   Documentation/scheduler/sched-bwc.rst:127: ERROR: Unexpected indentation. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
>> Documentation/admin-guide/perf/ampere_cspmu.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/arch/x86/hygon-secure-virtualization.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/gpu/hydcu-fixup-header.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/coco/csv-guest.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/vm/memcg_zombie_reaper.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
