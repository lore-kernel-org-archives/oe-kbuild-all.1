Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6EA1FC8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 00:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770768548; cv=none; b=ju8aVn+NARnwOkgD9ER3hBCzbJY1VCQ9o6IqmrIR6wSpVVCrfSES+InjTEWN+KFSlKFX5jIVwNOxwqxbP0Wb8Myko+6eeJyh+DWhVyMqPYLXcEGMENnUBC2nis4QpXGJ97ETKYoyxeEYWh7qDi/PdvV0VO2EH8Z5RWrchZHsfnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770768548; c=relaxed/simple;
	bh=c3lZDlkBNCEzp3r2qWgAjhm4w0DuNLIrZpz6FxJetHM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jtK7m39+G/I/3X2ZQOIqC6baSoJNHizDydeb3aSePu2KDWeejRxF2Z/EhmKU66Ldu6ghNCsGbioD2WnXZry42zDish8U1v33xbwcAtthy383peIanWuJFLLr0IH9//9Y7lj7eOBWjBOy/2QY/c82wFromu3kc1alWhd4mnrrmHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ae2Sx3/s; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ae2Sx3/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770768547; x=1802304547;
  h=date:from:to:cc:subject:message-id;
  bh=c3lZDlkBNCEzp3r2qWgAjhm4w0DuNLIrZpz6FxJetHM=;
  b=Ae2Sx3/sUTLbPe5nYnDdJRPoPudFnZCpEcQXYzjl46DozxboTHJsxCtb
   oM2Wsl/v9uh9pa57WwUk/gE/Twu+57ScgdvHdpAc7ODza1x5E/+YjYOVA
   TPC26osNzOQb55yFOj/GcgAeSSFNVI4WukkcGTcMGbiHMH+b3nGV+RamK
   EzqI0mZc800XXX06j880zJXp1Ruqm2Jete0qiMEL7JQzXRfbDMCq+LRV3
   v0fDxmz0a6DtqOl0lwLQqzy8bVTrMvxOPtnmP/WA5NLTsj8ld2+QgHiPe
   B+v/xvmg/TVqH6nF1DaDGMr9UGw79yUF3ZUngmZwyA09lZWzW5EbA7fZz
   g==;
X-CSE-ConnectionGUID: v6HzTvMNSjqow6bEzsBZkQ==
X-CSE-MsgGUID: 0EyUzzbXTaiAsh9FdXD0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71808706"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71808706"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:09:06 -0800
X-CSE-ConnectionGUID: I3TMYvOoSdGIIAEjwvp5Sg==
X-CSE-MsgGUID: w6Ga0EfESEu77vzOLFKWzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216391829"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Feb 2026 16:09:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpxmw-00000000pWy-3IJS;
	Wed, 11 Feb 2026 00:09:02 +0000
Date: Wed, 11 Feb 2026 08:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 13/24] ERROR: modpost:
 "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202602110814.qHi6LZ2R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   ab82ce180a346bc50223092e6d94b2aa7c863322
commit: a0638944d0de668162a22ef2e5e5723df61e1112 [13/24] nfsd: add notification handlers for dir events
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260211/202602110814.qHi6LZ2R-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110814.qHi6LZ2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110814.qHi6LZ2R-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
>> ERROR: modpost: "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
