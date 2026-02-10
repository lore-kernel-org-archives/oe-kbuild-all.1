Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318643EBF16
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 00:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770682267; cv=none; b=Z8TwkGX5XJkLJ2XDz9KgfQ/PPCELam9e/dzJkzhCgvyF0/C98MrNJOPVzyLW7MafTYCjzBP2Ic73ClUS9Zv6KDbxU1yU/3urGDgbGFpGaQt9xTs44ijUt+LR3LT2+92miUzf/mXj2sr4Sb/tSjqJeJeknBzDe+TL0oN+TcLVqOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770682267; c=relaxed/simple;
	bh=+iWZ4VmXFvKFp+foycR6FtMj5WaPFAKfNxWwsqXMoaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CdnBK1LwZgCLy9nCVbztT5sCRzLqIcDeWHET+D8u/mjIli2Hgtt4tCqsc7XEbI0zD3oWj1CqxdG7QrFbVCk2K0DSD5VdhIV0yNsYGOD+n4a5SNwtNuHlUCuFi6vVWKLyT0wNAeP67NhtU7tnCmnEk5ynF3Wt7MRK8ewtiCxIlvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxUk0u1F; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxUk0u1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770682266; x=1802218266;
  h=date:from:to:cc:subject:message-id;
  bh=+iWZ4VmXFvKFp+foycR6FtMj5WaPFAKfNxWwsqXMoaU=;
  b=cxUk0u1Fj2RMT5pEbvi/bxcda+DaOqxzkoYsaGDodTF8ae5SOB9MTR9x
   GdxBzGGwUxH+u4q3iwUiB8Z6AEcmOZ4socqb2exAIQzUy5kUTvQnf8/x5
   nIsi6fbeAFyDZ5V8EW/aCLp0jYSHybL//zldiPBeZCUd15sCA37BGrcyh
   Ik35gkQnhzcPG5c34F2fGidJ9RJKy1GzWoO8+nyqK58ofQL/IiJ9oxUDx
   8LpguOener4k0cOGup2pfezVHpaK0W1aTLepg+QdiP/Jg5PL/cFoYBNwh
   nNWrriR8uXWiH6wV+ESm4ouNmIfEOnTc756JI+6s4JB3borRY+duFUly5
   Q==;
X-CSE-ConnectionGUID: R4eh+qcOQcWwxrXc3YtE4Q==
X-CSE-MsgGUID: XlMtsuuDR8iNUr8Iup5dzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70817729"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70817729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 16:11:06 -0800
X-CSE-ConnectionGUID: F48iSDnRT9yF34Aq4JpWyQ==
X-CSE-MsgGUID: mJWadstdT9Sj335mJtH4Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216261858"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 16:11:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpbLK-00000000oRE-09Yq;
	Tue, 10 Feb 2026 00:11:02 +0000
Date: Tue, 10 Feb 2026 08:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: drivers/tty/serial/ip22zilog: section
 mismatch in reference: ip22zilog_probe+0xf4 (section: .text) ->
 ip22zilog_prepare (section: .init.text)
Message-ID: <202602100850.UaDWSQbk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
commit: 3fc36ae6abd263a5cbf93b2f5539eccc1fc753f7 tty: serial: ip22zilog: Use platform device for probing
date:   6 months ago
config: mips-randconfig-r133-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100850.UaDWSQbk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100850.UaDWSQbk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100850.UaDWSQbk-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: indy_sc_init+0x8 (section: .text.unlikely.) -> indy_sc_probe (section: .init.text)
>> WARNING: modpost: drivers/tty/serial/ip22zilog: section mismatch in reference: ip22zilog_probe+0xf4 (section: .text) -> ip22zilog_prepare (section: .init.text)
WARNING: modpost: drivers/tty/serial/ip22zilog: section mismatch in reference: ip22zilog_probe+0xf8 (section: .text) -> ip22zilog_prepare (section: .init.text)
WARNING: modpost: drivers/tty/serial/ip22zilog: section mismatch in reference: ip22zilog_probe+0x100 (section: .text) -> ip22zilog_prepare (section: .init.text)
WARNING: modpost: drivers/tty/serial/ip22zilog: section mismatch in reference: ip22zilog_probe+0x108 (section: .text) -> ip22zilog_prepare (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
