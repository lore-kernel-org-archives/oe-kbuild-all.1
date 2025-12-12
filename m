Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E657261D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765524760; cv=none; b=cemnGa2XwHKfTeGdnR8vqWPEiDQLC7CqW2EbDkiLY2vBwkMXPf6z0/fFrHLZqhhaPQoeCvelOg5w3PbjU3k02wWwZCb1GKDpJ5aFVgiCCnSrLleNu93Hvx6A0zP2Gb3aSP/yOl/EtDiWDoDMWfbELvyiZGdbDjJhIeDW1zO32KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765524760; c=relaxed/simple;
	bh=UHU1ZkO3s5m7jvMDRe/C/TubCPXk+WpqkhBFnjFGpvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhxaaQiAZR8cgRiLwWKNt2u3b892kmZJmzuksXOKzne0aHeawTBx7biHFXzZJSXAWiHUNtGf2ttyqUAGeYh3fAalcJPyKY8mUE4Woxp0ErgONce3cFrOytbDyok8WL1eYRXXzxcG7cYP3NSQbpLwWfpxYDhSk+C8m/0yVsbXIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijXrDAfj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijXrDAfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765524758; x=1797060758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHU1ZkO3s5m7jvMDRe/C/TubCPXk+WpqkhBFnjFGpvw=;
  b=ijXrDAfj+LB2ErWpJGdC3tJVKiiGoS5gi+WEDNE9XCWc+mDHsXeXgS3m
   xs25rzR0i7BWcq9VXDA7GWKyvAq8ecQAB9RXCLt6cHYbTg8x7wdufXcqI
   mM/7adzudpZsIviiz+uzo7Af+O53YZWMQ2kR1Ntj+2zZIcHzMuQSf6/N+
   XSfUYLdeojuME/2aBYt27HliWsqLhmvmi8mWSFzVJbK3x5typLwpfOler
   5B6MmQNMl49z00Ol0TrF99h/7jQ30nZ1MhndVR5RA7RmuuDtdWf+vDoEZ
   qUNXLoau5J5UrTcspSaZLLkUtCHCVY/aTCRaOjkACzmSi9oZgyagTz0hS
   Q==;
X-CSE-ConnectionGUID: bumrTv01Qf6ajnd8Elryug==
X-CSE-MsgGUID: 5OxqHoCJT96Hq5lb8DXg/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71382966"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="71382966"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 23:32:37 -0800
X-CSE-ConnectionGUID: b+TDFlxFTLajQqNqeljqmQ==
X-CSE-MsgGUID: 5koGpVjaTIm+qWVlGSXwng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196299072"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2025 23:32:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTxdh-000000005jf-0s9w;
	Fri, 12 Dec 2025 07:32:33 +0000
Date: Fri, 12 Dec 2025 15:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3406/3406] kernel/cgroup/cgroup.c:6734: warning:
 Function parameter or member 'fd' not described in 'cgroup_get_from_fd_v2'
Message-ID: <202512121532.9swcl8n5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   58f07869576fac9de85244333864fb34fb7df411
commit: 56fee14453059f894b018d08071826d47e634800 [3406/3406] cgroup: make cgroup_bpf_prog_attach work when cgroup2 is not mounted
config: arm64-randconfig-003-20251211 (https://download.01.org/0day-ci/archive/20251212/202512121532.9swcl8n5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121532.9swcl8n5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121532.9swcl8n5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/cgroup.c:6217: warning: Function parameter or member 'f' not described in 'cgroup_get_from_file'
   kernel/cgroup/cgroup.c:6369: warning: Function parameter or member 'kargs' not described in 'cgroup_can_fork'
   kernel/cgroup/cgroup.c:6430: warning: Function parameter or member 'kargs' not described in 'cgroup_post_fork'
   kernel/cgroup/cgroup.c:6716: warning: Function parameter or member 'fd' not described in 'cgroup_get_from_fd'
>> kernel/cgroup/cgroup.c:6734: warning: Function parameter or member 'fd' not described in 'cgroup_get_from_fd_v2'


vim +6734 kernel/cgroup/cgroup.c

  6729	
  6730	/**
  6731	 * same with cgroup_get_from_fd, only add cgrp_dfl_visible check
  6732	 */
  6733	struct cgroup *cgroup_get_from_fd_v2(int fd)
> 6734	{
  6735		struct cgroup *cgrp = cgroup_v1v2_get_from_fd(fd);
  6736	
  6737		if (IS_ERR(cgrp))
  6738			return ERR_CAST(cgrp);
  6739	
  6740		if (!cgroup_on_dfl(cgrp)) {
  6741			cgroup_put(cgrp);
  6742			if (cgrp_dfl_visible)
  6743				return ERR_PTR(-EBADF);
  6744	
  6745			cgrp = &cgrp_dfl_root.cgrp;
  6746			cgroup_get(cgrp);
  6747		}
  6748		return cgrp;
  6749	}
  6750	EXPORT_SYMBOL_GPL(cgroup_get_from_fd_v2);
  6751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
