Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9810148EC73
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404409; cv=none; b=lkGy2cjLyDdvszlRKPLLBa3Q6WwEgzTuqdH1DAD2yWXN8bHIhrbOAB7I8FKzndwIK1L1f8Io6qUR+fbhtnLj9GXuSzL0Kr4Gs5TPGo/L+rJmqv927Lnm/GbCgS3eE+J2tA0CKv3NsRW6O4RfskjBlfrbXDhDrg6cg+CScrGyrqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404409; c=relaxed/simple;
	bh=v0YQFF1oj3qXPN5FZYQ9MZD20SNUb4wM+WQTMk8KFnw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tEb+7NwvcY4zO5sQxvDM+olaSLsbNqNTq/YsUwSYKBCjQo2dRGTPlyGdF2r1AmCypsFa2A3WbJiGLYadQbAAzkGCWAExNmufMeLKEOlEqRBC80fE8oj3u9DsLwUeF35SWeT5qbLQYZNtIEhh8jqHgueaN1bGtZhhbZMNzBFZkd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEji7h4T; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEji7h4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789404408; x=1820940408;
  h=date:from:to:cc:subject:message-id;
  bh=v0YQFF1oj3qXPN5FZYQ9MZD20SNUb4wM+WQTMk8KFnw=;
  b=IEji7h4T3EfsZkzeUgTGOU536JWhwIE6f3e5WR4ob33Xq7lgi8LYYiqM
   8ESSWyr3DpAp3TM04rx8TCrwcvdkUG3G3e+AcAxL39ltiQVldSFALISYA
   8tmQdD7JhEJmPsIoejvyA2ZGey+IaX5Qx74V82fow3DEDLjSPPzUyLWWS
   xitVIEvcU0q+1Ai50JhquYJNTZhJrbwCGUqT5SIfTLvGPcVNDAz4/zmbX
   FBDgiEShrJDkKhJiLlNhGLVUyB1ksg3grfZZLNZ4k6I7I3MNIqi7e0zdz
   ExB5WAlcBjFd3QA8qMvTjwAfCK5zMDrV5TT4oZ+SgLJ6jexWpxA897m1T
   w==;
X-CSE-ConnectionGUID: qg+aCRDKSb6hwBqiBxFE+g==
X-CSE-MsgGUID: Y9YNf/pbRACk/E1PUZ2b5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112529718"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112529718"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:46:47 -0700
X-CSE-ConnectionGUID: Kl6ENvwkRi2swwLDt1xi7A==
X-CSE-MsgGUID: +XpC3OCfQG+/zYtDBr/uwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="901657"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 14 Sep 2026 09:46:46 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x69pL-000000000E7-426F;
	Mon, 14 Sep 2026 16:46:43 +0000
Date: Mon, 14 Sep 2026 18:46:19 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 2/22] ERROR: modpost:
 kernel/irq/refcount_interrupt_test.ko: symbol 'local_interrupt_disable_state'
 undefined!
Message-ID: <202609141842.caBbNKPJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   60735555f9a14d6c3e0a576e9ea7bcdb883ce747
commit: c056c0ad20a894eb3c65f5c61d03cb00441243d5 [2/22] irq: Move local_irq_enable/disable() into Rust
config: i386-randconfig-051-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141842.caBbNKPJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141842.caBbNKPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141842.caBbNKPJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: kernel/irq/refcount_interrupt_test.ko: symbol 'local_interrupt_disable_state' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
