Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0A61974FE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717686252; cv=none; b=H4t/KjdCA4jjxNZ6FW00OjlZzfzh3eyuY80wFM1yYL4QIOsiwiIGX8Fnve9JEL/AhOUj3+xaSJU/MT+pUTZt/OHgcWSv0LW2SvLIUJw+RvBDMsb9GuUZmfn2FJnaoophJiDLJkgUK92ajR2/GpFAXmixMYOpCDptyi12JirVDtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717686252; c=relaxed/simple;
	bh=3Wok1qP5nFJAPwvDJ/CErJatW/YSn6vpxppKhmyknr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIaFh06srBQ1PeIrPcBsH036aK75Y4fF/SuLqFGdcRai2ZouWfBq/byjBRGQgbj7k7uUpw8oXtnqMQ5Cyx7TxLuedhjVqeGaNMTLA6ZFc6Kx4ODr6urGXVdTrtD/AnYtk/INQgWXLE3j9bMh2dXD5DkBAknJthnSH2+aaTLwuSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+DscV+p; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+DscV+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717686251; x=1749222251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Wok1qP5nFJAPwvDJ/CErJatW/YSn6vpxppKhmyknr4=;
  b=n+DscV+pNpaCoAgpVBVfWwbNK1R41kAJ+w1peQiHJ8nsGOWv1DmOB56Y
   +potMzxSSVfgrOYFkq6+zeAld/4Lw7kz5v1UpR+sU8BTMzGRTlsNZmpUf
   wtG0RE6Qn9R2tyexM7XX8lWzYq3ydmU25s2+YtM9ArKilINidI1ecSWhA
   jzcxq1ssHHHVTpn6vQwEpKJlqAhw/K5YaSF18/R7rCqkhgG4KNh+U1wUg
   2fxMYHc5bVtylNU33ndAr8kcoItaqdlryT4lEtM0FQ0uRSKQ4D6Q0DmUM
   CI6X/iVwgcalro9hrH66xXv8ONR2ZauFWmAA40+oOCzfsQIf/s28BPwdK
   w==;
X-CSE-ConnectionGUID: Uk/J+y0qQzaHmIawOu2EgQ==
X-CSE-MsgGUID: NIgBhl/BTDi/8SrbzAg2CA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14202446"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14202446"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 08:04:10 -0700
X-CSE-ConnectionGUID: 32lQ6Sz0SUmgANrsCSGeFg==
X-CSE-MsgGUID: MVmnGs33SA2pzZZO2cC9Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="42926191"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Jun 2024 08:04:08 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFEes-0003GG-0o;
	Thu, 06 Jun 2024 15:04:06 +0000
Date: Thu, 6 Jun 2024 23:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 7/20] error[E0425]: cannot find function
 `of_find_property` in crate `bindings`
Message-ID: <202406062213.ASteyibb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   752ce52ee06e34673e16ec3f203be65936b522db
commit: c3ccc67439f73b149c9efa4bd76559c180733457 [7/20] rust: of: Implement property and device_node
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240606/202406062213.ASteyibb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406062213.ASteyibb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406062213.ASteyibb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `of_find_property` in crate `bindings`
   --> rust/kernel/of.rs:162:23
   |
   162 |             bindings::of_find_property(self.0.get(), name.as_ptr() as *mut _, ptr::null_mut())
   |                       ^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
