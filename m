Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35EC14B977
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 13:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783777679; cv=none; b=D6YebCeT9rMfNss/Uw3DpMZSgOkH09YagCH8rUGVdWAA5+2goLtrm6UN2YslykSxLdMxWM91CwMl84PF1707yDjRXHQc/s5HmFLod1BmjbCS9vYNRIwkUUcIZVODw+rNCV1BYCYEe6WR2Me4CQAyN+4AOrJ1JDHg800yzk9CF3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783777679; c=relaxed/simple;
	bh=lhbAy/f0Z/xQ+0Do27/1+VFeyBUy4Ruy2NK7jTSGZuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tk5pXFIwouoIa3JqAxfzVb5px3CUBN5iap8HoLKJGp0bZYc0vzKKQJIfkYSYLFRiCbOwuM5N3dlbc54mQwFz1ObyR2K+MpXS8XCRbWPHaaZcw816DKFJmav/kfiJEoudp5LYDutsk3qBagYavvzSKIK3Iv4Wyw3Sqc5hkCaOp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MciR5LkU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MciR5LkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783777677; x=1815313677;
  h=date:from:to:cc:subject:message-id;
  bh=lhbAy/f0Z/xQ+0Do27/1+VFeyBUy4Ruy2NK7jTSGZuo=;
  b=MciR5LkULF4w7bEOxpgs+CaF54DtmbMmdswv/Sl/WEkI0R/7gTCXgxyq
   Y+B3AFNDqJXa0V4ogvS500XhrlVNc0qtU8EE9H0gIY+VkLuAJ5MxqBK30
   n7ObgLZajWbnTnTGJXmNJMrYK49TibpB7nEBvvGdKRclJz1J7UhB7FFqb
   gx/WPh37goPNvPivDFWsW0itfysNRh/D8s/GVDdd+CKDiQfVcqNRyOMxP
   S5sQunBVvsWZ1IZnb3P4s/qokYoHZMos7q1Mvpy9DglrrDSvZYhUFH4co
   De5Viqe+Yi6giPsonWCQFaHQYM1Ff9HLJ0KTaxBiX9hrMqH1cEHUIrG5R
   w==;
X-CSE-ConnectionGUID: bvyR9wTRQL+W/gisNYuFCQ==
X-CSE-MsgGUID: 6Jubvu+pTMizjmUYFzWfGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95970727"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95970727"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 06:47:47 -0700
X-CSE-ConnectionGUID: ruq3oyWeQieKrzw/mjM1ig==
X-CSE-MsgGUID: V/KKlcolTYG+ylNRUGUp5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255778294"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Jul 2026 06:47:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiY3S-00000000K5B-09o5;
	Sat, 11 Jul 2026 13:47:42 +0000
Date: Sat, 11 Jul 2026 21:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:apei-sashiko-fixes 5/5] ERROR: modpost: module
 acpi_extlog uses symbol cxl_cper_post_prot_err from namespace CXL, but does
 not import it.
Message-ID: <202607112109.2QMSlQ13-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git apei-sashiko-fixes
head:   477881d6ab1d71be7860a41b4979a5d8817d3caa
commit: 477881d6ab1d71be7860a41b4979a5d8817d3caa [5/5] ACPI: extlog: Defer CXL protocol error handling to avoid lock inversion
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260711/202607112109.2QMSlQ13-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607112109.2QMSlQ13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607112109.2QMSlQ13-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module acpi_extlog uses symbol cxl_cper_post_prot_err from namespace CXL, but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
