Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2BF23A562
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777774199; cv=none; b=PoUHrL3MghynisztBUSqLsQpxQ+L09SLV2058Ruep8dtC7YOEeTcxH+7UpVjTyiKKBNxE2/7mkVyEvznpMVdM9UfZz2U/JhSt9y4drH6cPfwCpCMAWiUF7GYD/Rt/weoLSisDUI7y3DOuELLojOPJGuPSZUF71hc0N0Xx8AzV54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777774199; c=relaxed/simple;
	bh=DPllzNMxrAToKlR7COPVOH3YD5LZGlUYjbk2bArNQo8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZaCCoNZxvJAv7dlQAdsU10RcjR/GRPy2+84hQArGSPeS81rHK7aRfSDzyLQLsda16cEufFbJqmeB5tMse0vvsbTaBif1dE9Uxexub0SCCSKffxZL+/c0JgI6tQzD7NFpkHUxncSLEuqcRVN8MOBcJCeYaTdG6glCQFt7xrfqzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cn+xsmGL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cn+xsmGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777774196; x=1809310196;
  h=date:from:to:cc:subject:message-id;
  bh=DPllzNMxrAToKlR7COPVOH3YD5LZGlUYjbk2bArNQo8=;
  b=cn+xsmGLDKGFTnNbD4z3rjlNliB+ARtBYd9zR2giMC3AZgiM8froHzTx
   01IY9BwR8c4ENa5E+A0yRK2o9zlTSQPEVkfvni96s14uWiIZ8pGwmNqFU
   X7DmMkPFLxsItzvxzRG09i0KSzbVgH7QceoMP7XsIzLpMTerNaHwnRyDg
   06wVwR9I+udNd59cDVVbC5816vKQigH591ETRtvAkuYUeAVMTx2K9lYB3
   HRT1KI2OwXN4CPCFGeiqdA8Xa/J58y9WQEypoafFkUqg9VEx9Atx/V4Ep
   Kzm0LGHNRzjC3R0Rz282gYfu11YfEBVljpJgsnz/OAnk45zwESGhe2ySe
   A==;
X-CSE-ConnectionGUID: N+FYo3JGSiSIF8oUPb8GwA==
X-CSE-MsgGUID: uxyqApxjQ3y+SF1jzVI9zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89371246"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89371246"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 19:09:55 -0700
X-CSE-ConnectionGUID: Ml/lQbDeQ261xr0Qt2X5lA==
X-CSE-MsgGUID: ynM8CSL2TY+xXEoMjJbu6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="230593698"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 May 2026 19:09:54 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJMHH-0000000021x-3UaK;
	Sun, 03 May 2026 02:09:51 +0000
Date: Sun, 03 May 2026 10:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:kvfree-rcu-improvements-rfc-v2r1-wip 7/9] Warning:
 mm/slab_common.c:1345 struct member 'defer_call_rcu_head' not described in
 'kfree_rcu_cpu'
Message-ID: <202605031025.Xs4EIhGv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kvfree-rcu-improvements-rfc-v2r1-wip
head:   1e4fd024c798fbeff0b5a3c5f55cdcf710367c59
commit: 0f991a4617a587dc421a4d8a7dd824a972f5df41 [7/9] mm/slab: introduce deferred submission of rcu sheaves
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031025.Xs4EIhGv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031025.Xs4EIhGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031025.Xs4EIhGv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: mm/slab_common.c:1345 struct member 'defer_head' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'defer_free' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1345 struct member 'defer_call_rcu_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1345 struct member 'defer_call_rcu' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'sched_delayed_monitor' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'run_page_cache_worker' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'defer_head' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'defer_free' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1345 struct member 'defer_call_rcu_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1345 struct member 'defer_call_rcu' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'sched_delayed_monitor' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'run_page_cache_worker' not described in 'kfree_rcu_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
