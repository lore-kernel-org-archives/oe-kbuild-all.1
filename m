Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1733A9CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342655; cv=none; b=oOMqbYKElBrf3RrSbM2LMZHruUBmPxXPu27uLUyfTqXVLKZoorucmCmAlS2fREfebY5l+DpCoZSvxfWRqN8bMwoKWQAdwLGd2Y3+EUUHXTOnEu/skbg3nTCnv3CWHnQnQq6XE+trujodsEfKKqobO36RzDmoauTWB8qqBgbVEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342655; c=relaxed/simple;
	bh=ElfiIqRXtnSYVWAC07g2x3M9J/UzhKUuPTB1XlzFMm8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XcDJzfN2enutUNBvWjprB+hilGUI5DnrZyC86rRUK4VuvKaNUuPSCG6OtRNsuRGf36Kmbyw2s5+MpQmMCIELslXDkLfgm2q9m2yLHJVUBiWYMQ8ak94b5YhL4xXOc5hRUGOpw/0XDPBBZiSBlS9s/UPJ7CNI5G1SE8+vJ3fgXxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYHD1ub9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYHD1ub9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779342654; x=1810878654;
  h=date:from:to:cc:subject:message-id;
  bh=ElfiIqRXtnSYVWAC07g2x3M9J/UzhKUuPTB1XlzFMm8=;
  b=gYHD1ub9h8mM0HAc88ithSVWkUtdjV8ROvjNS9W/K1N1W9Q9SJbhO8bG
   RYFwsLqK9EbCazhDFwZE0cLIAj0c3VIzv5Jh3N/XyaQPh66QOyQUMErMH
   21PN+jaioUTKlWoYbB4l0fzi5UGWu2rPM2OYvykysSwRLP8Eqbww9v/+W
   0w3dWYzeRUj5QpfmQtLuBsAajDZjOYcVsxAOOmaE4zQ+I3oSams3rUrpp
   kv9Uv8SpcdC1id2y0UxiVU99I4WOdCrUjLSZqIV7xq9DoR7hARfCCGsVI
   7qb0K4oKBwNl2AIKII6ZayWPE2T8uIkRtN9R1xFa8WHUIbZAnALyLjZA3
   A==;
X-CSE-ConnectionGUID: fJhcZUavT9WautIfdB7Rng==
X-CSE-MsgGUID: pQotVNFeSc2hcCDbgYn4uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80287392"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80287392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:50:54 -0700
X-CSE-ConnectionGUID: 8SoOUZUESsmAh3P7bYGYtA==
X-CSE-MsgGUID: hKfQqQJPTKCbuzy5Z5moMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="239573851"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2026 22:50:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPwIz-00000000Amb-3DaU;
	Thu, 21 May 2026 05:50:49 +0000
Date: Thu, 21 May 2026 07:50:35 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/sphinx/parse-headers.pl
Message-ID: <202605210755.hOofEt7t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f26b61355a1b5a3b8286d5bddc7a3fa5a5191317
commit: aebcc3009ed55564b74378945206642a372c3e27 [2/2] docs: sphinx: drop parse-headers.pl
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260521/202605210755.hOofEt7t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: aebcc3009ed5 ("docs: sphinx: drop parse-headers.pl")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210755.hOofEt7t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Using alabaster theme

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
