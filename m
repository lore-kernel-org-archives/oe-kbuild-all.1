Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135773D96A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 02:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736562339; cv=none; b=S+5BcP9na6NzjsMwmjLrRmDSWhIdDI2omNaZmOHHbI6L+06SUpjM6ucphI104oq+XIFhvHhBW/oqvonRa07TfOqvynopjGlZCIUiRf89hpEJdaP0x9couJY1SzgsGTjcQkrQsSq3mF7KC5rMr6Tz4g+ymbqcX7h04QBGuZMxX/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736562339; c=relaxed/simple;
	bh=nyEzWa3yTPeWtx/mhf3wPoZDle9miUNF022seFAwbag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZFO0o4bU1hLVogY6Q821KAAhSf8luqdJJ2Dcyi2QIYEOIneP6eHbqaO3k+kZ+SkAuUNHb7sTM6DM+0ZrELRBlaJ6awzG8Rqsm9nwW3FvWcfHeRSS5Ih+/HAVamboxmNEhZupghdnqdIx+rgF8g1dXHF1viRmbD5jjh6d+bZzhew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnTEQgTB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnTEQgTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736562338; x=1768098338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nyEzWa3yTPeWtx/mhf3wPoZDle9miUNF022seFAwbag=;
  b=UnTEQgTB/9Q44sV/AskjHrkhoC+Ubm5OodGVW7b5ebHgP+ymuANwmqIg
   2dGYW9yr4HtDD4kgzRO6BxF7AfgnF0TXLXiFaQpWpNGywyr4SkZPgtjiT
   kNoPDZIoO/jPbtEqX1XKh/VjvgEk/YEq315E/H80r9D2W7pRpy4b8oGCQ
   5d67GmFD6lwiGN6VT8AhxEIqC42reFgBJrLt3BRWUfeNSkQR0Dz6J24vQ
   LYCu7ByrXPYofPOi4LPiqQDXYoBrD7GM9EFhVToTpCaesa4Gyi3z4AsJU
   AwxaemFqXucdbJZnld4U+Lyqoy1z/nEevgX+3tPbPnCYtkYpwgJMzyAMn
   Q==;
X-CSE-ConnectionGUID: 2yVtcP8ISiKkGn1lc169cg==
X-CSE-MsgGUID: Wj0yQQL4TAaCE4+NJEg+zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36553337"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="36553337"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 18:25:37 -0800
X-CSE-ConnectionGUID: Ga7r1r1MT3yjbvO0mIk3Hw==
X-CSE-MsgGUID: Z175bIW+SwOyCfJEOc5UMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="104455018"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2025 18:25:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWRBr-000K2o-1e;
	Sat, 11 Jan 2025 02:25:31 +0000
Date: Sat, 11 Jan 2025 10:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Song Liu <song@kernel.org>
Subject: [mdraid:md-6.14 1/3] make[5]: *** No rule to make target
 'drivers/md/md-linear.o', needed by 'drivers/md/built-in.a'.
Message-ID: <202501111057.DCFE0zUR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mdraid/linux md-6.14
head:   f319855a3b385a69aecb0a398cfc4855b9d8d999
commit: 7ad00dd67641fd509fff206f70eecb1364593eff [1/3] md: reintroduce md-linear
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501111057.DCFE0zUR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111057.DCFE0zUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111057.DCFE0zUR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/md/md-linear.o', needed by 'drivers/md/built-in.a'.
   make[5]: Target 'drivers/md/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
