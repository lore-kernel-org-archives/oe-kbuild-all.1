Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD51174ED2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720208465; cv=none; b=RGdR1lMeHzxxTSbNOPKgWuTG2D2jFiqXd95JYNKdu4/7JG4GzH9ovggqbK4/1Yso6NQUcaNSfxbOTmpKXHV4hwC1im4O7qhkpSdVGhVtYFQcquuAc9VALAQBKsisTWBkuHuhIXo9PD/rsZYzgUqtiFfHJ5rws69tCtf/CgCumw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720208465; c=relaxed/simple;
	bh=OQRXAKbY28e2b2tnuG/du/e+NBpEV0XVXbS9AGMvzdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=or+4+4595kD8RZg5oloA5/OnWXHN+Gm6p1ZNM6K8GrteC1/S8ZO9pq6iwKaH/VBXsnsmJz7D4YljkcNbkwhtzCorc4vXCscdj05W96Br5VYoyyvfm3jOhTx1ukoFZFJ7DM7OcSY+7GfgckHCR1t3qEfi47HLU1CViB6sjFIi8GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMEec9LN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMEec9LN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720208463; x=1751744463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQRXAKbY28e2b2tnuG/du/e+NBpEV0XVXbS9AGMvzdc=;
  b=YMEec9LNgZ/9RANS3H2T8U9BQU98jOZzvR8zaJIGWiyI18oLQMM9CHt8
   0jE4il2QqoUVAmNpR5Km1yPbGFn2Qq04YBP03bvNTq6sbs4Eh5A6fBymX
   2pHMAbLGO784OX4O6N0Xgnr1MkmzipDw5Kn57Z+lx1wSKyp7dpulhNoAg
   OXqoZF83v/sglg7BG8m5Xfl7VwINXOvmtVOraTwlGkWPnfFoPEzCWVnOC
   rcUMQvM3suGxb6Shsk9LpKuS0IMwCeI5SBt7bWZKEhnqwznlmohSxudO1
   cMSv+O0/YQxmo6Yqx/H4N9nl5vMXcRNy9/jL4fGXjIqiS8/Ho35CtVKaD
   A==;
X-CSE-ConnectionGUID: 6c8dupJfT/GA10X7xfw7gw==
X-CSE-MsgGUID: FebpmQ/5QHuEhifyYdKW1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="20408452"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="20408452"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 12:41:03 -0700
X-CSE-ConnectionGUID: V/Mnd8HfTQCgEwBr2t5OXg==
X-CSE-MsgGUID: bmdyPkXmTQSRCQPYB/3o9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="47600681"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Jul 2024 12:41:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPonj-000Smt-0z;
	Fri, 05 Jul 2024 19:40:59 +0000
Date: Sat, 6 Jul 2024 03:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/uprobes 9/11] kernel/rcu/srcutree.c:724:1: error:
 expected identifier or '(' before '{' token
Message-ID: <202407060308.fmNNfYAs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/uprobes
head:   b9867ee7d141bc8791e501495bafdfdb97283196
commit: 6b39b0e14b07a435cba021ae102a95ded6e6cab1 [9/11] srcu: Add __srcu_clone_read_lock()
config: i386-buildonly-randconfig-002-20240706 (https://download.01.org/0day-ci/archive/20240706/202407060308.fmNNfYAs-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060308.fmNNfYAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060308.fmNNfYAs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/srcutree.c:724:1: error: expected identifier or '(' before '{' token
     724 | {
         | ^


vim +724 kernel/rcu/srcutree.c

   722	
   723	void __srcu_clone_read_lock(struct srcu_struct *ssp, int idx);
 > 724	{
   725		this_cpu_inc(ssp->sda->srcu_lock_count[idx].counter);
   726	}
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
