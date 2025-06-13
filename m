Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A8D255E23
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749853767; cv=none; b=WconslgMM+i5dUpVjuCRKYEy3XSPJkfHAYe7gYehsud0gJA8dz6NXtjLTXzlwq7cRTbM3lUFLnBsc3blLlLYgfp75r2DGJxoUbItqYzYolsAzE6Fmx/zlNEHw6zCc2WWbIL5XnvqlqmlRub+2zaag1DIsxTbZzY2/3bE2pjB20Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749853767; c=relaxed/simple;
	bh=beOn01RbZCHkyxR8nSIQ/U8BS9C2v5xAVc3seBfGCs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J55+Rpi8zu+BlZF+TfPLpHE5WB+zsvBF0DZaU5fgb2EFQRuH6VLdgLX2F6nAVVV5mZdGNqEos1WlIPEkW32CRGOg49Sg06UtNigAAQsMWtaGJe3wgmAmR1VvsOfVVuxkmWzKOsjn6+AzArDjAETUu7WMn4Xy0sSb4B46NAZ+1Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxrPMdsd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxrPMdsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749853766; x=1781389766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=beOn01RbZCHkyxR8nSIQ/U8BS9C2v5xAVc3seBfGCs8=;
  b=jxrPMdsdXB6olVCjG5Wr4GIKeHIpXTPJubAWiqSkxYUvFFyG7GK6+Br8
   84uzWlBGcTMH4vD1q3NUSECVCSpCoxmBqRoDwnHlovpMDxUfBa8YW1wWN
   vGkj3FRq62vWJJJXiBVbidM3kEouZg7FWNHerrLAqTJeX6WwAc11Sdh/D
   y3gi8Ls5ng+76vZCD1ileugJYbe1acbi9ic1RItLpS4cqn4pqyHp/8h52
   2ICKxBBN97R8VIdyrb4o4bqyadvbVyMqVz3EbDFyo4ZuZecnd3kTGchMH
   A0wK/zrhaD+umFwxLq0i3qotSGy2L6UIoKRKai5t0wh9/oN/VBvotg3WS
   Q==;
X-CSE-ConnectionGUID: o6KpAwiFQ66yFqN5nB5ZiA==
X-CSE-MsgGUID: QVF+z7JPRoORXItXky87Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51958803"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="51958803"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 15:29:25 -0700
X-CSE-ConnectionGUID: hvGElY5+SqCgxH2QzzT03Q==
X-CSE-MsgGUID: 7AZ/9g5LSjaYSuB2joIv6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="152830017"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2025 15:29:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQCtl-000D2s-2l;
	Fri, 13 Jun 2025 22:29:21 +0000
Date: Sat, 14 Jun 2025 06:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 35/45] dir.c:undefined reference to
 `fuse_dax_break_layouts'
Message-ID: <202506140656.ouxEPGzy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   62857bad704590b8ed2cc579b4a859b953b93d5f
commit: 4d6c3ddc277189d02a8be37998eea5931a24f956 [35/45] fuse: implement buffered IO with iomap
config: arm-randconfig-001-20250614 (https://download.01.org/0day-ci/archive/20250614/202506140656.ouxEPGzy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140656.ouxEPGzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140656.ouxEPGzy-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/traps.o: in function `user_debug_setup':
   traps.c:(.init.text+0x14): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   arch/arm/kernel/traps.o: in function `early_trap_init':
   traps.c:(.init.text+0x40): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   traps.c:(.init.text+0x5c): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   traps.c:(.init.text+0x6c): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   arch/arm/mach-imx/avic.o: in function `imx_avic_init':
   avic.c:(.init.text+0x14): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0x2c): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0x34): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0x60): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0x70): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0xbc): relocation truncated to fit: R_ARM_PC24 against symbol `__sanitizer_cov_trace_pc' defined in .text section in kernel/kcov.o
   avic.c:(.init.text+0xd0): additional relocation overflows omitted from the output
   arm-linux-gnueabi-ld: fs/fuse/dir.o: in function `fuse_do_setattr':
>> dir.c:(.text+0x49f8): undefined reference to `fuse_dax_break_layouts'
   arm-linux-gnueabi-ld: fs/fuse/file.o: in function `fuse_file_fallocate':
>> file.c:(.text+0x5a8c): undefined reference to `fuse_dax_break_layouts'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
