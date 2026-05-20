Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F97D33E35B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259322; cv=none; b=ithmdqd2miOzyWDuMiXy0sJOMOgaLzfEjujp3nWIjlDDp/d15806IphpTdia0WnB/v2+plYJJA4/7NEKgwWgdxIobcybNFdWBqJMkN/DCcvYz359KinZ/Kh7Bp+a/oX0v6IaXSBFOr1wc+tak9JNRm5308tx5O5Kzc7uEkKxNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259322; c=relaxed/simple;
	bh=V3a6P/bN5zaXFGdm48v3VvGnKvBgs4/r/ZREuZ8+20w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FSljayl5pXZuKCFjeoNzB2hA4BfO8wLQFegRKMUTlOVbEfQFDkTeej1Z8r25XLfKAp0tX7Q0IloNaAvso3YovIqt/lzLON1woq16iU8RiPn2Ogl6KimJCsD8nkt0e+/JoSTRmpq9r1IZWY6q4zTETiivq3IbGRD4p0WSJrW8qNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7f/egDF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7f/egDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779259319; x=1810795319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3a6P/bN5zaXFGdm48v3VvGnKvBgs4/r/ZREuZ8+20w=;
  b=Q7f/egDFuUOOvJVxjrQ8O0DLzY7EQrJ0ZvMuZOhvS4qwCFHyUwkWsWsD
   fqOrD26DbXuaFoTRMB32fxK8sQvFsyAnLiMqstLVotcya4ecca5sxcgJY
   INk1uD9KyKEmGEzjzSD6g2VcZphKZ2h+ktyn287LuZ5W6AvHH5lbz9Lbb
   Lfq2wPCYQNPVxPxszlfqZWCMo/At23Z+OnooPiWqDHR2UqA31KtuNeRa3
   3oGWUWPy/x30oYrJs7fYmPWt/E9WgZPoX0SxYtpWUNnrAgUOWrGuzOegA
   Vv/zB51lgfqJkX6LX0RO/J6BfQyhYW8HBQO6un28+RQt1XSH4OvV5jVtK
   w==;
X-CSE-ConnectionGUID: vlsKK17rRhmG17k2xvJyLg==
X-CSE-MsgGUID: KdyEVDj3SYq3aoNMW2Q0GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80052819"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80052819"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:41:49 -0700
X-CSE-ConnectionGUID: fgFn0BJcTyquIecv/q0xEQ==
X-CSE-MsgGUID: Ue5LEP3CQ42lFFCKtC2EWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="240304528"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 May 2026 23:41:48 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPacj-000000002f3-2Cmo;
	Wed, 20 May 2026 06:41:45 +0000
Date: Wed, 20 May 2026 14:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix 39/40] lib/dynamic_debug.c:77:1:
 sparse: sparse: symbol '__pcpu_scope_ddebug_call_count' was not declared.
 Should it be static?
Message-ID: <202605201454.BFwHbPfR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmap-fix
head:   747914d1d51200efff2706de4b876006d1b7af8d
commit: 6797fce47079517fb44f3068c0f1fcb20c16bc8d [39/40] dyndbg: add +c flag to demonstrate advantage of classmaps for DRM
config: csky-randconfig-r122-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201454.BFwHbPfR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201454.BFwHbPfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201454.BFwHbPfR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:77:1: sparse: sparse: symbol '__pcpu_scope_ddebug_call_count' was not declared. Should it be static?

vim +/__pcpu_scope_ddebug_call_count +77 lib/dynamic_debug.c

    76	
  > 77	DEFINE_PER_CPU(unsigned long, ddebug_call_count);
    78	EXPORT_PER_CPU_SYMBOL(ddebug_call_count);
    79	void ddebug_increment_call_count(void)
    80	{
    81		this_cpu_inc(ddebug_call_count);
    82	}
    83	EXPORT_SYMBOL(ddebug_increment_call_count);
    84	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
