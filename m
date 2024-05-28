Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA2713E032
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 22:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716934799; cv=none; b=Wltao41ilST1u5PMkS9awNfYmg8y6qx2LE3d31CvqKhPYfn53hx1QHCo9mxN8cYHgK+pdiZMaDMLU1DyKcbW5lz5c7V/6nYbHsN3t8vMKDRY17vcLbRvSaK+ihx4aZH/5iZnLiBpMUdcRvOugjergbKD+3GEwVoaIpzzFSKm1/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716934799; c=relaxed/simple;
	bh=YHNnKhDBl7U6bA5Lo49KueOTpVAW/UhJjT4JAywJ714=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tu3qyj7+AotTlkKnzQADv41hvknqPMoX6EFKvV9X2VcvBhZ3KhJG95H5Zm4PV4h4M4GMAwrKd+pqzwwhgTjEmC8L6sC47f8kX+7KVIFoVkqGzIUnmiTfrC1ZQO1rfAkgZYaBwkojO3Gh20I5sa8W6i83QIfyG57rnfCVZudjPi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaJiJGds; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaJiJGds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716934799; x=1748470799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YHNnKhDBl7U6bA5Lo49KueOTpVAW/UhJjT4JAywJ714=;
  b=iaJiJGdsjcvr2YP8Z8HrvuZG4PW7Un1r3nh0fVW1xgMtYv+RixDzAoJT
   RY5UQX5ytwTcr0dRh7RVJRd9YKK5wgFJJargB+RR94rSnGvEwZOmD56Iq
   utkaW5lHQOVId8rUR54jhc64tYNCS+eqCTj2HqlRTY3FV9LVEheR7sACa
   4nV+MNuW6J2/G0+AWU55618FTVLPUVN70SN8Ta5MumUzQTgXpJ3n9yHVW
   u7dM6L4dUQGG3A5dBJNwAWrMEhGDbS/6MOQri0vAf/xMvKwFZz3xafESO
   t9+IDO+XHaa/1hLmxhvMqTpN8usTFM39ZdJyHSqf17Zob+GFlAcCpAv4D
   w==;
X-CSE-ConnectionGUID: 6r4N9XaQQKiMqCPL45uFqA==
X-CSE-MsgGUID: 7VrxTpqPSN6ZbPimlsn4rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30812121"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="30812121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 15:19:58 -0700
X-CSE-ConnectionGUID: jrNcMNMLRy24gWvK2CDhdA==
X-CSE-MsgGUID: qoXJdFzqRbOUM2oJvZgIhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="40090690"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2024 15:19:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC5Ag-000CoV-1R;
	Tue, 28 May 2024 22:19:54 +0000
Date: Wed, 29 May 2024 06:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v5 11/13] kernel/exit.o: warning:
 objtool: __ex_table+0x0: special: can't find orig instruction
Message-ID: <202405290629.oaN9XxEz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v5
head:   5fe53a7c019262862519bf2365207b2caf7773cf
commit: eb68d59203696da1dd122ad0eaecdb3afe821f3e [11/13] net: replace page_frag with page_frag_cache
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240529/202405290629.oaN9XxEz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290629.oaN9XxEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290629.oaN9XxEz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/exit.o: warning: objtool: __ex_table+0x0: special: can't find orig instruction


objdump-func vmlinux.o __ex_table:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
