Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA560B8A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758623787; cv=none; b=pR1RhRHXNrKtv9xPXgKOb/vu1MBvlGw1xQ5Gl46c3aSPF+cVJYUqKx65nPX4rKUPJS30Dakq36o1rTrshbpLcTBVnBUimA6WEc2CXuQN5nA4DLvIVFAlXUOwJXunSZ/fFPYzIMMfBORs3oT5C03Sb9Acg6aEt4eDYrHH8YSJ0CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758623787; c=relaxed/simple;
	bh=se6U+gaIb9PMlRDhQaB9WQSBxQoVoIKXQPd/Ovg8Q2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFdF145L9a6M+Dzra7rDuJWprlCd2jX9AAZ5KufrDiRDear0DfcFkxF+yy8X7pg0XX1dN/pTNPHHiCU6CkuVTu5N2BpDyrNiu/b5l0SP6Ekl9Qq+cXhsn6L7T5ni1oC6KXwXENrw6dTd09UULBM6pYvkQb44oqXktaG3Y35Qw30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KV+AMVtp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KV+AMVtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758623785; x=1790159785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=se6U+gaIb9PMlRDhQaB9WQSBxQoVoIKXQPd/Ovg8Q2U=;
  b=KV+AMVtpFIK6wIEJBs9XbTcGCmi+zwVafqY9LqIZn85F4QMcnG7+PHjN
   CTC9etjSqrVd31ZrXX7h/x2nzS7oxUrCYZqLDpvhNdG+jLh5QKOJ0pLoj
   tus0pZFWALzz7a9v5+YlOMdEwcp/PczM7v6Tb7fTuObo+l7O3Ivzfa7nv
   fTJ5Xlx8BjqQCbS4LMiow92FDK1OeW5Mxn5xX3q2knDOgz2NNX5c9iQbv
   2nNF5q3s4TqC3b2rfN3WG2+9orFmKfoULZxxo6XO7eWKSm7Cc6WF+8ckg
   mg2CH1bfSK+neqjeLepgux3xu1W0Be3cliuUh51QbNjzDkaMcoXhJWIZ0
   A==;
X-CSE-ConnectionGUID: tu88roITSdKRh1UAUiGqMQ==
X-CSE-MsgGUID: 8e4sTmaISsG5QaIUh2ocTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71521440"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="71521440"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 03:36:24 -0700
X-CSE-ConnectionGUID: TmuzJSI2SXCQxRvkSAXsTA==
X-CSE-MsgGUID: Q0KfgbClRIy9w48RZEbU7Q==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2025 03:36:24 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v10Nh-00031A-2d;
	Tue, 23 Sep 2025 10:36:21 +0000
Date: Tue, 23 Sep 2025 18:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:b4/clk-rate-negotiation 11/14] WARNING: modpost: vmlinux:
 section mismatch in reference: clk_use_v2_rate_negotiation+0x13 (section:
 .text) -> clk_v2_rate_negotiation (section: .init.data)
Message-ID: <202509231831.JJPK3zqM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/masneyb/linux b4/clk-rate-negotiation
head:   70078cae25bccf95d1f2db0315cfee47ee516f9a
commit: 5a0c0093987c56686827652d980784eb850c5868 [11/14] clk: add support for v2 rate negotiation
config: i386-buildonly-randconfig-004-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231831.JJPK3zqM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231831.JJPK3zqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231831.JJPK3zqM-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: clk_enable_v1_rate_negotiation+0x5 (section: .text) -> clk_v2_rate_negotiation (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: clk_enable_v2_rate_negotiation+0x5 (section: .text) -> clk_v2_rate_negotiation (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: clk_use_v2_rate_negotiation+0x13 (section: .text) -> clk_v2_rate_negotiation (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: clk_calc_subtree+0x46 (section: .text) -> clk_v2_rate_negotiation (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: clk_calc_new_rates+0x151 (section: .text) -> clk_v2_rate_negotiation (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
