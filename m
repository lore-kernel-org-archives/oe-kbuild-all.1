Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397926217B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301114; cv=none; b=gDU+016vIXz2ZawQsktPc5LLWwEbuC05Hl9m8Bly4E4GfvImeB3ssERdT6s+Rgd0GCATet8yoEOgWsG4bNGvhsMh7GeIWHY+0zeh/QkrYFTGUS2hb+Tw8TltkLDbejRjcqSFWgFa5QwJCqusqbxETVK3SidPieGMd893YiaWodg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301114; c=relaxed/simple;
	bh=ey3qrhrfOFKYpHXFmqyyYpTf+jsSk11goyh+f3wDWaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2cu6eajxul8D2tQlMfhIu4Ge/6HdX1teGUN1C/YYVikw695Z9M/zKU1XuAa3cD1cU/m5QQuMqLtNBKi0dqWSlav77Ser24g3kEOMbq78DZyWTQanp3ozhNDx3dbNOCxFAnFUk/JDTUh1B3eBllJyPeEFvhiqQiW2mmG33mcCtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGRU9CFy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGRU9CFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739301113; x=1770837113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ey3qrhrfOFKYpHXFmqyyYpTf+jsSk11goyh+f3wDWaQ=;
  b=KGRU9CFySAiMF6NvDz0ZJzx+O4KMeDFmjS43oGpeY2el+5G2RuEUHHxG
   feWk+K69iEQdyOkWiidH5usGm5eO1tKY2NWBvtgJGdf08E4GOLcJJEzTH
   GoODWJ6XxArFmFGmDFFDuew5fzvxfXdsDDVEdcTKo2tioRnza6WmR4hWn
   d1gR/9ONMNMrlh+WG1LXSGfi6kaK9NVvk4fw3ZTP98XqN5y2CdsjP6M9O
   kaFMcjjoyvP0iv+Okj+mrEYGFyR0CAa4S2VJYg/1aq1MeHHOi/6AgJn5p
   X2k4iOWCfutIcwB5UzbDR3y8/2vS90ZPz7RPT5n74rJtPXfYe2cdb0wyy
   g==;
X-CSE-ConnectionGUID: La2hhyugT3qxEXRnwZeWqw==
X-CSE-MsgGUID: Xx/7APf5SvKgZV0ZerzU9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39851643"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39851643"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:11:52 -0800
X-CSE-ConnectionGUID: e1UKLQb+QtKnx76MEbaJxA==
X-CSE-MsgGUID: 0eNs+4VWRTuk63Wn0BhHyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112357454"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2025 11:11:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thvfg-0014al-18;
	Tue, 11 Feb 2025 19:11:48 +0000
Date: Wed, 12 Feb 2025 03:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 26/26] srcutree.c:undefined reference to
 `_raw_spin_trylock'
Message-ID: <202502120307.VoQfXAGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   0030818ee37e806a78ceb9e303142eafe34a2a80
commit: 0030818ee37e806a78ceb9e303142eafe34a2a80 [26/26] compiler-capability-analysis: Remove __cond_acquire() function-like helper
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250212/202502120307.VoQfXAGT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120307.VoQfXAGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120307.VoQfXAGT-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: kernel/rcu/srcutree.o: in function `srcu_gp_start_if_needed':
>> srcutree.c:(.text+0xbac): undefined reference to `_raw_spin_trylock'
   s390x-linux-ld: kernel/rcu/srcutree.o: in function `spin_lock_irqsave_ssp_contention':
   srcutree.c:(.text+0x2bde): undefined reference to `_raw_spin_trylock'
   s390x-linux-ld: arch/s390/kernel/debug.o: in function `debug_event_common':
>> debug.c:(.text+0x1572): undefined reference to `_raw_spin_trylock'
   s390x-linux-ld: arch/s390/kernel/debug.o: in function `debug_exception_common':
   debug.c:(.text+0x1862): undefined reference to `_raw_spin_trylock'
   s390x-linux-ld: arch/s390/kernel/debug.o: in function `__debug_sprintf_event':
   debug.c:(.text+0x1c30): undefined reference to `_raw_spin_trylock'
   s390x-linux-ld: arch/s390/kernel/debug.o:debug.c:(.text+0x2020): more undefined references to `_raw_spin_trylock' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
