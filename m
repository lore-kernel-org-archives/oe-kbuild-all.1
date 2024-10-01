Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF121CC89D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727814346; cv=none; b=pu+TZvOaot46IzOJ8hpA76esCjR07rkUtrgJKXZfZBL+l8mUoALqs4Hj0x5RPZcPwBM7VLu4aoHWku0lf4oSqZ60WHL+LLm2O3qyIaLjsRU5dKoPPlxGo2GfsSTLKM+237lXp6rproMrrrEVW4YwaH065IrP0uFMXAKNfziGmWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727814346; c=relaxed/simple;
	bh=mp+lm5hUxFP3ANvJgpvzARseWtwWiGxyBqDDSbB3PmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N67x6qErDdroUG+ZP1F61LBYHJrDJoRZtovJyCm8RLFtzAZkkhosHzhj5GEkXsOZwGLAoSPEQqyRCLwmkkqTxN+xEyAoxaFFtzJiSxTMXa06nde2L9fOmpvx2ndw1eyUgKw1SUQT2RpP5StUSEPYrc6J4UOtVCR0lPXhSPIfdgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoX6c3B1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoX6c3B1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727814345; x=1759350345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mp+lm5hUxFP3ANvJgpvzARseWtwWiGxyBqDDSbB3PmM=;
  b=FoX6c3B1xbNp9gR6/SO4g9H7+Z6JiQk638dbUw89SwZ/4n20hI5eGi0l
   dtNUYo+WEtGpikRwRH0SJzedldjOyEyGWFpUCdMR91P6rj055fcRAQYQ9
   bjmDrd99ilS/xYendFxryP1MnSoEfvyzXUQyMtxoWdrS5wjos/2T2u7DL
   QZjfTN6snVUS+5s/ZP5vIr+6hIDzP6ZnYPwE0GR3dSvINxTXHdLF6KnXk
   HbcO4G2dJCUcsRpeALKeo383kqvNAPZv+I8m5UzQUv4Mto7CapLwOh0OW
   zZOAfZsYyjhZvNNPsliUwRIJ29Btj/uqqL8AzAId2vwaAcWgY+NYnV6nl
   g==;
X-CSE-ConnectionGUID: BFxpljmtSEebX7KQs15eQQ==
X-CSE-MsgGUID: IWq7aPn/Sg+wzbil04LygA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30763045"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="30763045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 13:25:42 -0700
X-CSE-ConnectionGUID: 0LHMtLaoQDaQ8Ojf9aJXcA==
X-CSE-MsgGUID: 5HhhKnM0Qn2v+coc9GjqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="74215265"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Oct 2024 13:25:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svjRC-000R97-0Z;
	Tue, 01 Oct 2024 20:25:38 +0000
Date: Wed, 2 Oct 2024 04:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [linux-next:pending-fixes 45/157] rust/helpers/mutex.c:11:6: sparse:
 sparse: symbol 'rust_helper___mutex_init' was not declared. Should it be
 static?
Message-ID: <202410020426.l22GnLwB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   f81ef06dcf9050528fdb863afc5c8834fd96f8f9
commit: d065cc76054d21e48a839a2a19ba99dbc51a4d11 [45/157] rust: mutex: fix __mutex_init() usage in case of PREEMPT_RT
config: um-randconfig-r133-20241001 (https://download.01.org/0day-ci/archive/20241002/202410020426.l22GnLwB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020426.l22GnLwB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020426.l22GnLwB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
>> rust/helpers/mutex.c:11:6: sparse: sparse: symbol 'rust_helper___mutex_init' was not declared. Should it be static?
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/spinlock.c:16:6: sparse: sparse: context imbalance in 'rust_helper_spin_lock' - wrong count at exit
   rust/helpers/spinlock.c:21:6: sparse: sparse: context imbalance in 'rust_helper_spin_unlock' - unexpected unlock

vim +/rust_helper___mutex_init +11 rust/helpers/mutex.c

    10	
  > 11	void rust_helper___mutex_init(struct mutex *mutex, const char *name,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
