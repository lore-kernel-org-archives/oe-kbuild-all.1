Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803AF1DB548
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742037695; cv=none; b=Km5OAKSaTKZRoVV6hYAdnc0/5oEcCmHXyeRMDd5VyKD/VbiUTO62ig5iGvzVAV/NrwZh7mGEafNMLb8L5N9ZA3gDIlqfNQYQxeBqEU/HIpugnDUt1Xrztd7nWGyR6ulHBodEq2FNgJCPv725J2+eGkZ80XcAxRTa0fy8Sm7RmkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742037695; c=relaxed/simple;
	bh=+XwWh5R0u79kkj0AjBBWDujUAV1GyVGJXNmhKE3Gc+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WJjWaDheX0SPOY3mZXSeqDccNkc5rmjh7tDw9oj9jQoLWivq7jNLVu5duzXJaTZipGvYMHz8nJiU8K0WTlY0nEMkpesTekKGokE7kKO+mPmTihk9CQIbfX1apDYVnTQAEHKwUyWSJItTmU+ruFULSAlMKNlGTbV6yyzYxluAdjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYTOM6aI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYTOM6aI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742037694; x=1773573694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XwWh5R0u79kkj0AjBBWDujUAV1GyVGJXNmhKE3Gc+c=;
  b=KYTOM6aIrX08iDHLzj5qy0601M2nqp5kub/3KqJODDZ6r+OpWsMRjflD
   NLb0lsoV8Pq8QtHI0yuza/vkkCrvq1GzDx29e2+zh21Ll1xZn4JcwW068
   Urly63YBeVwy9O7UGsPfMW+nvqmBnMRFz3EGehNupoGX++nMih3jBYby1
   RibQG+QxDU/Uio7c/RkIV83RqL1TB9HiczojB6OdCwFR4WHcMyBdY+qZu
   0L96xgFl6F90Rnr/Vt6hj3DBQMBg6Qt7bZZOYuccmG6OlUZmvRBa4GZtP
   rPVq0hTQsecee/u8S+bFpmdoy29njd+DHjBaR5qWLWLDgQKztLmFqhB2o
   A==;
X-CSE-ConnectionGUID: 6pFWLiUxQFySi6MtCmtAPA==
X-CSE-MsgGUID: MZS6lf9HQFaIuzJexRVV8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43365325"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="43365325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 04:21:33 -0700
X-CSE-ConnectionGUID: AgtDNYYgSaC/aVaH/GUB/A==
X-CSE-MsgGUID: 4wOeW14RShy2rj5HbXQcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="158664176"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2025 04:21:32 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttPa5-000BIl-2D;
	Sat, 15 Mar 2025 11:21:29 +0000
Date: Sat, 15 Mar 2025 19:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 1/1] WARNING: modpost: vmlinux: section mismatch in
 reference: debugfs_init+0xa4 (section: .init.text) -> debugfs_netns_exit
 (section: .exit.text)
Message-ID: <202503151908.aL0n0wIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   e49cf6cefb96a0e88d003b105617aec9d07e139f
commit: e49cf6cefb96a0e88d003b105617aec9d07e139f [1/1] net: add a debugfs directory for showing refcount tracking info
config: i386-buildonly-randconfig-001-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151908.aL0n0wIK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151908.aL0n0wIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151908.aL0n0wIK-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: debugfs_init+0xa4 (section: .init.text) -> debugfs_netns_exit (section: .exit.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
