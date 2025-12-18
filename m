Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B683F23A994
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766085977; cv=none; b=DXaMLbhitQTMNnxkZeYpukFfFjd8iJL1SDw3J/beDOkNH3qWqHSEYVUe7P3ngGW2c4302f2QVPEnPMN0jo76t+xTIBZ9SF5ZCMMBtoiab9+wJjRAG0yoiHidgN0OQbjRo/0y9TGgZgTXBdawdoK9S+q2OBOClwUI3DUv5GDHoTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766085977; c=relaxed/simple;
	bh=9KTAhlN7YnGqnogX0MhwnXlkCpKIAfu4vmieMHHvX9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e568HrhrmIk67PHl9N+1xvhPYiB4qkLGqX/mDt7LRAzWaXsO7Lth1cOheL6y53sygcI4YwHpxkAcFxa9jj/HRhjTRQ1lQ/9jeWy5wf9vdwQRpxdq+BgD2R836apBaQIL/IyoTPe1V8uK1scfAf78zhBksOkWD+aYrJ63vfv6Y/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCYvlDCN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCYvlDCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766085975; x=1797621975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9KTAhlN7YnGqnogX0MhwnXlkCpKIAfu4vmieMHHvX9Y=;
  b=kCYvlDCNU+OKe62f0sKJLgPaoIND5M7kfoHXlsb+0zFLNNxJWooga6Vz
   xJE+4jGkk8QXh78WiqgQdH57kDCqeKEQs43ljUwP9HK9XnsMQEEGN+TkF
   iIgXe7l2eyfGR0vA8laNU4LEn3QIY3DhY8plAZaY4VQsMq5R0wLiu1Cds
   1+kKQqne/hO9w3Pmq8lNYIRBKGUbRFFYWZ6DIds7jN1r2kBE9ukWr/s8E
   NVCde9mSdkiskm7NT2WodZDtBcPPauUy8lrCTi9Pk9d71MPv3Gl7uowAt
   C3hH9kq5eoN2nynZiBwfuDRDju2u+IExhCP5NvcLJugfs7/Tn6cFzs1Od
   Q==;
X-CSE-ConnectionGUID: 53DPemOkRXSmZoHUyP0ojA==
X-CSE-MsgGUID: fHm4FP4LTaWtR/odYvPEAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="55628578"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="55628578"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 11:26:15 -0800
X-CSE-ConnectionGUID: v6kJsLniSC23ade8z11KIQ==
X-CSE-MsgGUID: DCE5LYfsSQ64WWZowXw56g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="222078254"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 11:26:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWJdb-0000000043I-3P8m;
	Thu, 18 Dec 2025 19:26:11 +0000
Date: Thu, 18 Dec 2025 20:25:21 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] mm/vmalloc.c:2490:14: warning:
 no previous prototype for 'get_vm_area_page_order'
Message-ID: <202512182053.lo2fKkPp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5d719013902eb006756873427de3fc5cc5566531
commit: c331f3e9d0bb0872f05c4e55269bac3b27418062 [50/50] kho: add support for preserving vmalloc allocations
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251218/202512182053.lo2fKkPp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512182053.lo2fKkPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512182053.lo2fKkPp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:2490:14: warning: no previous prototype for 'get_vm_area_page_order' [-Wmissing-prototypes]
    2490 | unsigned int get_vm_area_page_order(struct vm_struct *vm)
         |              ^~~~~~~~~~~~~~~~~~~~~~


vim +/get_vm_area_page_order +2490 mm/vmalloc.c

  2489	
> 2490	unsigned int get_vm_area_page_order(struct vm_struct *vm)
  2491	{
  2492		return vm_area_page_order(vm);
  2493	}
  2494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
