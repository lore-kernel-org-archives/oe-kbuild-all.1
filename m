Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2039235E926
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jun 2026 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781952398; cv=none; b=gzCnW2MGU3QyZby2i6amyLOBhRflvOzzhh2vLrzzNQE6cdZpxadw66yQt9AI5l6YmRJWGE5KreuSOJU87NqefUEtBBQLWfmFuTQIipIxDuxzVpQVzVhZXtJCpnt7+ydKcJ3SrTLK7xaHOBneZ/djrY8LHpBRsf/n5cd2YxvZkWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781952398; c=relaxed/simple;
	bh=CHRlM1ILjmxIh8Pu+dm3AnWZLIe4FvtcZumDHertSB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TP/cTEy1dFTM2U4Pb6DdS5df1HxnzZ3deNw8OalGZDwwfGpKqfyTH1Y3bXnpXD8dvn6MvougBYcdCznrQTs7KumhskKYbxxLsF9iljnZrKZ5o6S4/SOrZGxV6v17O8D5itDDjAA6cV0DgsVCFtgK5uUiogdL15AWZI40cYcWMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbmWflSH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbmWflSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781952396; x=1813488396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CHRlM1ILjmxIh8Pu+dm3AnWZLIe4FvtcZumDHertSB0=;
  b=NbmWflSHwAVOrFTBSHV5Iy14JIeMOfMAYO5YELP8lcZ7abLpXjwH78q1
   I+ZwhrbJy3Og2I9OhQxV7LqzFXs7Jwj6hkWM/R3INGPfq07EfEqO+ZoSO
   edgk7YyJoXcOXfe32LLTRUWPgLTJE8HgQC1NfojF06gBU7KYPMbfiN+EN
   6LBC1b3kxOMzklJkTVD02GwJBfkyjaQfnZq9YtO+l1n8SI3mzf9cW6y6s
   l+dNpKnp2yCKA0VD/4wpWsUtQ7pLMuqhC5hlwchfnXJ6b88gual2RsafC
   kAKUwsOEvUJ4kBxV5VHcBIRqH9EAHMJgQZBqvexA4Kycu92gHveAbXHzu
   w==;
X-CSE-ConnectionGUID: K51hq0kFRWeylXEAG2NsZA==
X-CSE-MsgGUID: P+VP2qepSAStmIA8fuk/QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="100315408"
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; 
   d="scan'208";a="100315408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2026 03:46:36 -0700
X-CSE-ConnectionGUID: 03S6fr59QFWgh+Svl7Gicw==
X-CSE-MsgGUID: nptyyiSCRBmu4wShYzSyVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; 
   d="scan'208";a="244654661"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jun 2026 03:46:34 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1watDb-000000005jV-47Br;
	Sat, 20 Jun 2026 10:46:31 +0000
Date: Sat, 20 Jun 2026 12:45:32 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:jb-fix 17/54] Warning: lib/dynamic_debug.c:668
 expecting prototype for param_set_dyndbg_classes(). Prototype was for
 param_set_dyndbg_module_classes() instead
Message-ID: <202606201258.KjIOTWeH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git jb-fix
head:   8ea652632bf8e167715e0cd51a14dbd2c0c8f992
commit: 57cbbbbefdcc4c03709c52a56a02722e7b6b1b15 [17/54] dyndbg: refactor param_set_dyndbg_classes and below
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260620/202606201258.KjIOTWeH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260620/202606201258.KjIOTWeH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606201258.KjIOTWeH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/dynamic_debug.c:668 expecting prototype for param_set_dyndbg_classes(). Prototype was for param_set_dyndbg_module_classes() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
