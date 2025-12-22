Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26632E72B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418444; cv=none; b=R3DptAuIOTKR6DVbIDooqWn8ggJBxkSmvAUQLdqDGlumUv48eYVGIQo5bVohFd2qJcJXJbkUezmgtvJDVgFpJl6X+bsL2QdQveZJFIj9JMEwnCU5xMFvoauve/rP3z2kHuo6tZhmxaHBDQiDpFfnNAUqxr+ZiZGWnMtMQSKSqcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418444; c=relaxed/simple;
	bh=qannHwJRKccbelyqSfw6rf55tHww8+nFViInD5DgECI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jeGwgJvOj77xub6XvFBjbX89oY0qp5fu7+XLs23quHMKvD2chdCYu+7897dyacs+FTsxTgUlPvI3lR+18k+5+H1XqBgKYOppsZUU26RRZaQVz5laUrJEksk2v3CNGSPeW8MvCjZxn4T5bsj7e0qQLvgnNzVsw4wtzaFVWDflVmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbyjdZDy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbyjdZDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766418443; x=1797954443;
  h=date:from:to:cc:subject:message-id;
  bh=qannHwJRKccbelyqSfw6rf55tHww8+nFViInD5DgECI=;
  b=fbyjdZDy7v4gLD4LxuoWA+1LRBcI08m5U3fYgwA5JndOAW9zMh/TchXp
   qzNt73Ex+GiQQyxibNpQ0hC1ZnewxZBgUxklr0Q5kcLq4XEaT8jUgMJI4
   Q/TPQ0VTRvcCVtOjLfYpbv+FW+v2IcStCSlERC/e9wNK4sao/soUXvYuk
   /qCbYdHBmicso2+R1eGNhdxr3GGwc1xMj5AIvA6xN5obez2iNcK1X+SbJ
   I9zvrLaLDF7mQ4cBx4XvX29NjZ38QQm0EiBQIxdlNr0LPXJva153usyRm
   Np3tpWJFdMzA+Ccj5PODeqtZvUbELtSwD8yjb0M4d22F+2gV2uE93LyLq
   Q==;
X-CSE-ConnectionGUID: xdbg+o1RQECqr9V0NPUYjg==
X-CSE-MsgGUID: SVw631mlQIKd403qN6d5EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68213029"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68213029"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:47:19 -0800
X-CSE-ConnectionGUID: abFwPPbERd6R7/SVKfYc4Q==
X-CSE-MsgGUID: +UXd/qquTASSE68CdYkyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204604998"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 07:47:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXi7v-000000000ln-141k;
	Mon, 22 Dec 2025 15:47:15 +0000
Date: Mon, 22 Dec 2025 23:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3418/3418]
 drivers/acpi/numa/hmat.c:726:6: warning: no previous prototype for
 'hmat_restore_target'
Message-ID: <202512222339.MPuLnpUs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 2e1b00fcf1e3152a1e73846f5f9ec37cef088a65 [3418/3418] ACPI/HMAT: Add missing locality information for hot-added device
config: x86_64-randconfig-122-20251217 (https://download.01.org/0day-ci/archive/20251222/202512222339.MPuLnpUs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222339.MPuLnpUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222339.MPuLnpUs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/numa/hmat.c:726:6: warning: no previous prototype for 'hmat_restore_target' [-Wmissing-prototypes]
     726 | void hmat_restore_target(int nid)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/hmat_restore_target +726 drivers/acpi/numa/hmat.c

   725	
 > 726	void hmat_restore_target(int nid)
   727	{
   728		struct memory_target *target;
   729		int pxm;
   730	
   731		pxm = node_to_pxm(nid);
   732		target = find_mem_target(pxm);
   733		if (!target)
   734			return;
   735	
   736		mutex_lock(&target_lock);
   737		hmat_register_target_cache(target);
   738		hmat_register_target_perf(target, 0);
   739		hmat_register_target_perf(target, 1);
   740		mutex_unlock(&target_lock);
   741	}
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
