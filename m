Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954ED3939AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 02:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774839203; cv=none; b=NHzk+0lgZGTdt0RB9iUqY1crcK5pg27jGIr0jK0PsS83YxddXO8GTMyEpuusOIDZ+SLHWjae2whgJnQv0Vc2u5rW4iFcebdRAKSVkn0pi9Kfqh400CawQfOaW1pnLQ0BA2+vYk1/ZcdoPgdc3JtvnHhrjpVwXAFmbohm18bPfPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774839203; c=relaxed/simple;
	bh=tfbepM8W/GqyPM/r+8M3yzka7RjStN//uYlRUCBBves=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OmrgIB7pUe0OC8no+9cYdvu13+i19WXv2YqwpoBD37jqEO3K3lTKk17uWziRdbZEZD2iHQJnkHTe9c3GzAff+hXqJBc02Gj7vBRerUI9npm+FmMKZztb1/iUgBZTSTLNJebDPauTKt8BxOPJzbOtixuOE6cGmFPfl0grNxbOuA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEw/UVzX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEw/UVzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774839201; x=1806375201;
  h=date:from:to:cc:subject:message-id;
  bh=tfbepM8W/GqyPM/r+8M3yzka7RjStN//uYlRUCBBves=;
  b=IEw/UVzXDh4q6BIzK+GozbvkEZ9IWJLvf/EONux6ybe9U4jgbOQkUlJu
   6srg9FKjYAbcXFNl5Wh/2IKlo0rE8FnkSwwOMQXDzfuzZoXflukHQ43Hs
   Mpz5VA8qC7t33nRq6PRTeAVdbABTMzeHszyaT7iDg/25Sw2ML1xfnBJXq
   bebY4Swt24vWHsYKowWBUb9HSu5RaSCo+id0dlQpzL+ymyIT0TH3kb3LI
   kT+YoPQ5fbUdUe/TLeG9WtT73pb2nsH/IGSvyX2cFYN7qTzDC726zzGtv
   rRVEd4U42TAMDpaIwJQfObxaZHUpnPDJ61X1QzdOG90g/LSLS3zF46q+S
   A==;
X-CSE-ConnectionGUID: IUMlbLZ8QNOo/GI5LLXTbw==
X-CSE-MsgGUID: QX12Y4ZKRFO62WWMKtUqxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79688604"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79688604"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 19:53:21 -0700
X-CSE-ConnectionGUID: A7vf/REBQX2JbTckhR8Log==
X-CSE-MsgGUID: FNSFnZScRLaSqmXNdCMtiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230720052"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Mar 2026 19:53:20 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w72ke-000000000aH-30RB;
	Mon, 30 Mar 2026 02:53:16 +0000
Date: Mon, 30 Mar 2026 10:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: kernel/cpu.c:607:21: warning: variable 'cpu_smt_max_threads'
 set but not used
Message-ID: <202603301003.dnx2tDpD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 4496e1c1354bd4837bcc1414f6e1a4d042857903 crash_dump, nvme: select CONFIGFS_FS as built-in
date:   10 months ago
config: s390-randconfig-r072-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301003.dnx2tDpD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301003.dnx2tDpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301003.dnx2tDpD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cpu.c:607:21: warning: variable 'cpu_smt_max_threads' set but not used [-Wunused-but-set-global]
     607 | static unsigned int cpu_smt_max_threads __ro_after_init;
         |                     ^
   1 warning generated.


vim +/cpu_smt_max_threads +607 kernel/cpu.c

3f9169196be555 Michael Ellerman 2023-07-05  605  
0cc3cd21657be0 Thomas Gleixner  2018-06-29  606  enum cpuhp_smt_control cpu_smt_control __read_mostly = CPU_SMT_ENABLED;
447ae4ac41130a Michael Ellerman 2023-07-05 @607  static unsigned int cpu_smt_max_threads __ro_after_init;
447ae4ac41130a Michael Ellerman 2023-07-05  608  unsigned int cpu_smt_num_threads __read_mostly = UINT_MAX;
bc2d8d262cba57 Thomas Gleixner  2018-08-07  609  

:::::: The code at line 607 was first introduced by commit
:::::: 447ae4ac41130a7f127c2581a5e816bb0800b560 cpu/SMT: Store the current/max number of threads

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
