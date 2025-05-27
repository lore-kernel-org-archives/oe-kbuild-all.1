Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D972DCBF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 19:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375668; cv=none; b=Fjz4anmsQ3DXObIybRCEnJIJAxS2glLK7mcxcqcyzfeM3xEtodrSRXShx8AHE6M/fzD2YZzHLNluOaOTg5iJv3MGa2Mb22FJ16Q44kskjb0APsxRB9V1ZjnhU/uF2UX08YVF6+CHHtLqQXemVjfpZw68mpTEQzIiMcZhqve0/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375668; c=relaxed/simple;
	bh=URPYyAExkbLONCDj7jVhAIiAVm2HMlI+8k8h9J/MYh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iUyVy7dU83MnZvylCLwZK/rbmdxtpgCCtJPT+fAQ5rkITDDn2LeTAGwfzprEx0VhOAeSCooXK4VxITHjQnhyGhSxWqXYGa6SjAUFHp7p01/mRMi7MFe9uL7Pks6h926qQ3l7EdDLQ3ecgxFSnO5jvZ4TU7uVHlbhi8xOFZGjLKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpkzMv3J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpkzMv3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748375667; x=1779911667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URPYyAExkbLONCDj7jVhAIiAVm2HMlI+8k8h9J/MYh0=;
  b=WpkzMv3J8R3b7pGoS9HHv/laMfS4G6F+PQAvDqUHUb4ANS4L6pZIC2MU
   NFKVEhF710QcX9QB4KLCY0ikVzt7X1ZziMrniuZ7G64wVTzIli91SBesy
   goDoBUHtlCQFZysTSCGth2CeH7eLO8Mi7dEuLuXnZ506P8x+63UCuuldw
   +Ske90ryh+hLOaF4XkFo499qcJzpuGlvuUVeceBF9trNKNJW12u8mYSKz
   2mtT13VSya54tdTktBBOacawUbB68LbZg/LnYD58rjNb5vj3X8T0gGa6/
   pJO/j34ZmXidAiV5u9lcSx83MiiKkKVTDgwuM41N01rLfg/xYgKUNm9gR
   A==;
X-CSE-ConnectionGUID: WKBaAv/1SXiz3aSlDcCtnQ==
X-CSE-MsgGUID: k5Vu5WWqR2qLzSXvVXZktA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60635883"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="60635883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:54:26 -0700
X-CSE-ConnectionGUID: R9lUw77fTHmF1n7aRPIGdg==
X-CSE-MsgGUID: feXnpx41QrO71+OJCQaBVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="173846582"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2025 12:54:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK0NT-000UyE-0l;
	Tue, 27 May 2025 19:54:23 +0000
Date: Wed, 28 May 2025 03:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core 14/15] cpuset.c:undefined reference
 to `lockdep_is_held'
Message-ID: <202505280357.8Epxp8MO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core
head:   5f864154521cea5391361b58372298785bc43639
commit: 5b99b635317a0332ec927264a45c091cb7f603a9 [14/15] cpuset: Provide lockdep check for cpuset lock held
config: arm64-randconfig-001-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280357.8Epxp8MO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280357.8Epxp8MO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280357.8Epxp8MO-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: kernel/cgroup/cpuset.o: in function `lockdep_is_cpuset_held':
>> cpuset.c:(.text+0x3268): undefined reference to `lockdep_is_held'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
