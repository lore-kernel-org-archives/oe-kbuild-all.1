Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671510FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 07:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737703327; cv=none; b=lR3meDqxa1L6bk56/dF6d8RkLAi+plVEUZVnv2C1/nwWgu5mBCqpgMgfLdFcxBN9bb1Fd7GwOUiUo+VdJw/5RFzoVhU0U2nyJ39Qh8WJomg2bhMf4ocbWv543Tf2GeWAmoHOxLMymR7D0sKyHgrfjizk0g7E7YNO2gGxlkdsqZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737703327; c=relaxed/simple;
	bh=thWiMXVcbVGcsz2DZj3QSeHgYEcfjn1OG5zgXoHSgc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8JJr/H+uTCGhTccSFLYqjLzx82bPU/xx1Fg7YjCy2HHIx3cnCGjbgATfcNr0kjcagftzUYKJ2KxoCqVKdVLFKF/a/wSeLg0A4QzZ84Cgzm7PWOhyLZcWoKFQXBJepNv5txzFu15PC0aLlICcGIfxh5xCivp/k9THT7TD71juyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KejMUjyu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KejMUjyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737703326; x=1769239326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thWiMXVcbVGcsz2DZj3QSeHgYEcfjn1OG5zgXoHSgc0=;
  b=KejMUjyuLdr1r7BNXV5GS9Tza4ZTPNFo2Rfq1V/TtuKPha9Nt7Q8Q/Gi
   xaZ0MPp78a7DdKSR9WCTjJUslKYsmQTnFGOLtHo8UxEj5TJQs9RwJwb97
   3pUHrN9qBsObspIOWinUdI5RVDXEsKwE8Su6w64VgIegxGDt5sK6vWpS1
   7Pb91lbvfy2h4VVVmQeLJqGsEUV3hG5vFavoVPZyakpLYPX3ZBNKzupiU
   QCHSB446+m1RUhlSGZsn9nd33RhfXcH8hgjeaBtYX2s1SB4wfaw1ttPZe
   tnXS3Zm2qOVuNnmbn6Za9VApNzKl0sVjTWkp/epcrlMASu6co1TbapY6k
   g==;
X-CSE-ConnectionGUID: 7KxPsLHnQnqS78R7zXU8uw==
X-CSE-MsgGUID: 9tH+uGluSPmRyKtz/zXLKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41991982"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="41991982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 23:22:05 -0800
X-CSE-ConnectionGUID: oOPnxJmcTUShGn0XJPjEJA==
X-CSE-MsgGUID: q/hrpdVeQqGOphOX5uUHzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112834517"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jan 2025 23:22:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbE0w-000cKj-1J;
	Fri, 24 Jan 2025 07:22:02 +0000
Date: Fri, 24 Jan 2025 15:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 305/309] powerpc64-linux-ld:
 warning: discarding dynamic section .glink
Message-ID: <202501241516.aKfyJ61c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   b4a3ab4ac2ee1d85d136a81766a60a02ed348e2b
commit: 9f73221be57f43a312dec7cdbd8ae087006f8676 [305/309] sched_wakeup_backtrace debugfs
config: powerpc64-randconfig-001-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241516.aKfyJ61c-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241516.aKfyJ61c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241516.aKfyJ61c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: discarding dynamic section .glink
>> powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `__time_stats_update'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: kernel/sched/timestats_bt.o: in function `sched_wakeup_show':
   timestats_bt.c:(.text+0x3cc): undefined reference to `time_stats_to_seq_buf'
   powerpc64-linux-ld: kernel/sched/timestats_bt.o: in function `sched_wakeup_backtrace':
   timestats_bt.c:(.text+0xeb0): undefined reference to `__time_stats_update'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
