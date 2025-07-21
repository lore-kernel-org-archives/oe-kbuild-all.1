Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD91D63E8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 23:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753140335; cv=none; b=o64E0GFlWAqMyWwy5GxfZ1+39XoYYSE314WJNuYtrO5lBvkB4olLQ4NLFKHFBaT3AqHB8hBRiuesV9C5R/bLPfMiVpHeNtT1na3ugiUjbjg5cuqNbrUlXbwHZDGcMajMw2IQngkplPNzAMS6fkK74ZHZlZB5UEI6feXlBPw3TmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753140335; c=relaxed/simple;
	bh=43nNfm8w+Z5N0MoqkzKGKNZdeWikgMojI+OkzJRWjSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PHuHaqOqo64mBPNsuu1bxhdWDD0lyLJgqViKuCoVDwt/rnYzfV2Nohdn61saFqsZPwWskMCEmRbijBexWuwmM5SHa5tQ/RMKsdAVjIqTekWJaIclqm1p4ChDO15gm71BHz4pWHgRFhgrbWD4/wQAyl4p3owdHIZpkfXpWzPPs6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1I9o6pF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1I9o6pF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753140334; x=1784676334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=43nNfm8w+Z5N0MoqkzKGKNZdeWikgMojI+OkzJRWjSQ=;
  b=M1I9o6pF1KS0vCag0khMueEsQVaG1o4Dc4RHeX6CCePW3O1iHIQwK4Ew
   HzDJ4qVkbhaVO6m3sA23/VsXxWLiAzxqXVK7EC32esXPpkSybo8gtYDZP
   5oUWnauWcsx0dnC9ydaQ+HnBwaQ67L9pmejPi7MBLoTq5wl0YFpLmjqeJ
   Uys5+iGA8WbDgPr4azu00A5d4AF1/RnLn/dhyOmrs8D6SFMOIgLcnqq26
   cRp7Ilo96HO/T0GPdOfd7maa6lrx5Zj7T1+kI8hZs2zdrshu+UIsdOObo
   F1GO9fd4c6a90atLkMMgY4XBUBi85wY4YqLP/+IRi8VizrUQlPmjgjIbA
   w==;
X-CSE-ConnectionGUID: uZ++dL4lRyi5bdwH/PcvNw==
X-CSE-MsgGUID: ABCxcoXPS/qkowYaDTd7mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55254072"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="55254072"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 16:25:33 -0700
X-CSE-ConnectionGUID: EGVfpQPeQmKOFfLitJH8ag==
X-CSE-MsgGUID: wA84R72qSwicSYRBQCnuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="163024329"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jul 2025 16:25:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udzsv-000HEr-1R;
	Mon, 21 Jul 2025 23:25:29 +0000
Date: Tue, 22 Jul 2025 07:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [linux-next:master 288/11398] kismet: WARNING: unmet direct
 dependencies detected for STACKTRACE when selected by STACKDEPOT
Message-ID: <202507220705.n9m6UpDd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: 16b7e65d299d56442879405ac85800877fa51355 [288/11398] drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from
config: m68k-kismet-CONFIG_STACKTRACE-CONFIG_STACKDEPOT-0-0 (https://download.01.org/0day-ci/archive/20250722/202507220705.n9m6UpDd-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507220705.n9m6UpDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220705.n9m6UpDd-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for STACKTRACE when selected by STACKDEPOT
   WARNING: unmet direct dependencies detected for STACKTRACE
     Depends on [n]: STACKTRACE_SUPPORT
     Selected by [y]:
     - STACKDEPOT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
