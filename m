Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B343725A657
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 00:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737072077; cv=none; b=CUAKjmDGtldjrGCT6zsrX57FIfv05tzxHQGHz9/3KGEST1lRnmsnesKU+4eBEFeEXUc5Wtpeg6ycA4E6MaWxpNnYmB5rvPq3GWLbvtO6p1buGmABdBj4QaJiAz+uCd1bI6gREpbY2GR6PYE92ckG7t9IdxrDxyec7Ro7RXm16Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737072077; c=relaxed/simple;
	bh=IAOzdw0KOwZ5ZOeZpoP0BtHX7L8fNS8nrDSLxBR9IyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hn5WwSzkJiV49/ndjxmPxcE02KJueb4eNJWktOB+dEJzEG8erm7/M6IwjYASwAzyIoBsJtI/pmXwFqCooseDb/eZ5nS1E5gh17g2enV+QB01K9X9y55ysnvyi+U86sEkoBFdTguyWs9S7DWqEf8QDDqvzPdnaweg007oe66nb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfvZJEqN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfvZJEqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737072076; x=1768608076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAOzdw0KOwZ5ZOeZpoP0BtHX7L8fNS8nrDSLxBR9IyE=;
  b=VfvZJEqNtLukTcJtesXlZyQmc47i3sbUnWGUvtB9IGK0Rh7M/UoolrgL
   ycPqceJU8CTuuTUdH1vQozljxI2k37sJO1eWTpCuKf8wWhH2apnei+9ua
   mkTgc8CbpXvOfxx98I+YIaqCutnIRXeyBQ5wdWyk2a266QVIuJwTe5ICt
   FsAICD/hn1n0eyTAUC72lTDc4W20S2K4f0kec6OrC95kaqmMVA2IHAlC/
   M++DtrkLYDxadz0gHxicTQs4BpiS9knU2QuA47x49/gTrsecKY/kmCgS1
   cQYcKpQdoKORHJDdBf3pjmlrhmAaw7VAEpLcljFFhmRolYtcoOlgsic4N
   A==;
X-CSE-ConnectionGUID: Yx8LQeCxTkKDqW/aCGKvVA==
X-CSE-MsgGUID: TtfsqI3lShSWWvCIbyhpbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37604591"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37604591"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 16:01:16 -0800
X-CSE-ConnectionGUID: tMiA6qBwRwmQ7qRgpWfxcg==
X-CSE-MsgGUID: Ea9JPJDQQuirkQE8pNCv7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110276651"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jan 2025 16:01:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYZnT-000SWV-1F;
	Fri, 17 Jan 2025 00:01:11 +0000
Date: Fri, 17 Jan 2025 08:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>, Kees Cook <kees@kernel.org>
Subject: traps.c:(.init.text+0x4c): relocation truncated to fit: R_ARM_PC24
 against `copy_from_lma'
Message-ID: <202501170704.nZMdKMXp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce69b4019001407f9cd738dd2ba217b3a8ab831b
commit: 0043ecea2399ffc8bfd99ed9dbbe766e7c79293c vmlinux.lds.h: Adjust symbol ordering in text output section
date:   7 weeks ago
config: arm-randconfig-r013-20230520 (https://download.01.org/0day-ci/archive/20250117/202501170704.nZMdKMXp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501170704.nZMdKMXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501170704.nZMdKMXp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/traps.o: in function `early_trap_init':
   traps.c:(.init.text+0x10): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   traps.c:(.init.text+0x2c): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   traps.c:(.init.text+0x3c): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
>> traps.c:(.init.text+0x4c): relocation truncated to fit: R_ARM_PC24 against `copy_from_lma'
   traps.c:(.init.text+0x5c): relocation truncated to fit: R_ARM_PC24 against `copy_from_lma'
   arch/arm/mach-imx/avic.o: in function `mxc_init_irq':
   avic.c:(.init.text+0x14): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0x48): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0x58): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0xc8): relocation truncated to fit: R_ARM_PC24 against symbol `irq_domain_add_legacy' defined in .text section in kernel/irq/irqdomain.o
   avic.c:(.init.text+0xe4): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0x104): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
