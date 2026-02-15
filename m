Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1CA2C21FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771149591; cv=none; b=qq901y3NqnVicOU3CTdXjM4QqF8pSQZzJTTWpRfLpAKzUwWUxQaTmHlIsW5F4MFbHqka0Ff6F1o/nLldwTMq+U9rYngWVaTAE1oOxsJwjbrxaRbudVIE888MaXE+Qv4SlpquekDo7gIWKTpBPPfc4Qipv2B5wrMXiwSR8yDIXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771149591; c=relaxed/simple;
	bh=9nr+XrvjRZObhUukMmPkrBaKHhAKuE4AOaJn11u4crY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=meVutuXG+b+m87SE6nUgXxpbBEm7tJOLshipPbzPmeNDj/NY2v0QLAshLCL9bXbZHscW1gECo/pSwi7b+nZA4ssalonlajPPHbzpHWDdEter/1uUECQWG1eOGn/vsGZ48ZFTzrEmDc3lYY7P4pLsEFAHUwHXnazgRC3FMMPCYKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SB9VdopN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SB9VdopN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771149590; x=1802685590;
  h=date:from:to:cc:subject:message-id;
  bh=9nr+XrvjRZObhUukMmPkrBaKHhAKuE4AOaJn11u4crY=;
  b=SB9VdopNCshHR2RJBapgTuNAAoKo/QEQ04CtUUeZXlaKBf56BaCgUnJf
   DKCADNlpUiQ9xQHB4U/2Vd4y0UuT9H0kGbh63qx+aLGzuParAiA0jEYgE
   2P/xyhaAh+5pyFL51VnJU5SBpqUN8tYhikM/dlfGOUuHVy/Q7vUC8AsNb
   qmT7pNL7iQE1yGtfLBKnb7gc8arjmbE7chBcoqInQ+BDSauDbwPkhlfCZ
   Ubpei9ynHUy5VqghXXLpCbyzIHt0Pz+dtnbrB8WTOqX7c+xFbNDFh8Kpv
   zG1hVEdO6umLFmt0MG9QZIIvfofjwaYVheM5OTOzHZg6cGagPHquAefNd
   w==;
X-CSE-ConnectionGUID: KbrtzNz4QbWz+n8i1q7GcA==
X-CSE-MsgGUID: ncGUDqboR1WPMXnHvxGJIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="59837053"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="59837053"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 01:59:49 -0800
X-CSE-ConnectionGUID: cS+9wN1pQ+yaRGCKCDdCFg==
X-CSE-MsgGUID: Q262h5YXQRexZWLGJ70F0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="213167224"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Feb 2026 01:59:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrYun-00000000yFj-2U2s;
	Sun, 15 Feb 2026 09:59:45 +0000
Date: Sun, 15 Feb 2026 17:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Subject: hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x40580): cannot
 reach 00001f51_trace_event_buffer_reserve+0, recompile with
 -ffunction-sections
Message-ID: <202602151746.Wmbw7jfF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca4ee40bf13dbd3a4be3b40a00c33a1153d487e5
commit: 5eb4cb18e445d09f64ef4b7c8fdc3b2296cb0702 xfs: convey metadata health events to the health monitor
date:   4 weeks ago
config: parisc-randconfig-r052-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151746.Wmbw7jfF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151746.Wmbw7jfF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151746.Wmbw7jfF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x40580): cannot reach 00001f51_trace_event_buffer_reserve+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x40580): cannot handle R_PARISC_PCREL17F for trace_event_buffer_reserve
   hppa-linux-ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
