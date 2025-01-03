Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C31DDC1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 06:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735886241; cv=none; b=YbRuj2fcOBpcB9fm7F1iaKNzyHKBRTPT7VLgGejve69mYIEnioPoCybi8sJ0X11yIN0ckML20yhaiXlZQZB5WhG8/ibTfnbvNd7PPvoCyqksnBuhS6JUTqqRYghO2n+xRpe9A9E5rCxpwwDzCuRZ+oxus4wMiil4wuNGjgCJeDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735886241; c=relaxed/simple;
	bh=LOhQuVsSK0DBzavamSjh+54Ig3yKGZf7Q4DZoKAoEw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3mrCMUu5xw7iwfRK5r2pMVvRwE54oYUELyviwg8mjIzzjRorU2+oNjKFrDHj10UMgRsnKLQxy0FptjQK0xt6tVFhOOy47D9uw7ptTx3h5OLeOLYJwEucmSgWMMWYymwIsySbu2Vw3WC7j7iyuMDXXfkFvRJy2L9W2gqLCUc0/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsRuGcAY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsRuGcAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735886239; x=1767422239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LOhQuVsSK0DBzavamSjh+54Ig3yKGZf7Q4DZoKAoEw0=;
  b=QsRuGcAYeQOLl67eMSEkZgH/FK2dAV24L1qg7cbM5Kae35sHsFV4z096
   SocEVi50ps10JtR34HtzJlZqd9Eo+yO+9ELD30lsBmIvQR4A5edapBPAx
   xCGSzgZ+wTe7lrAfcO+2mrx0HQyA1MfWH6asigm91IY7Yc0pbFjVh0lKX
   Mz4GvpUCPAJwalJNFqE8Jth0RNNZdV8oZCBBHKmIMdeS4CVKyxeeQCPql
   c1uUvy2sROQXeb3XN8+zN95zD7Rv2gEImirjPDWRDbi3EmJounxixe2gG
   g5rjx6iLO4XBUkYG97o20MB4ImMGiS4T4WL/ivtUjkI3icR8BLFLAS0zQ
   Q==;
X-CSE-ConnectionGUID: PMXVN2YfRBq+VcXUj7+Q2A==
X-CSE-MsgGUID: 4VhBGPlcT9KVixX7V0GeeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="40058569"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="40058569"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 22:37:19 -0800
X-CSE-ConnectionGUID: XiwMSAFnQw+kCt7+3a/rUw==
X-CSE-MsgGUID: zRIUDX1YTvSuTu0LFIUZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101550873"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jan 2025 22:37:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTbJ5-0009KJ-2j;
	Fri, 03 Jan 2025 06:37:15 +0000
Date: Fri, 3 Jan 2025 14:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: JP Kobryn <inwardvessel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/9 v2] cgroup: separate locking between base css and
 others
Message-ID: <202501031446.qoZWRX6U-lkp@intel.com>
References: <20250103015020.78547-6-inwardvessel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103015020.78547-6-inwardvessel@gmail.com>

Hi JP,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tj-cgroup/for-next]
[also build test WARNING on akpm-mm/mm-everything axboe-block/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/JP-Kobryn/cgroup-change-cgroup-to-css-in-rstat-updated-and-flush-api/20250103-095314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20250103015020.78547-6-inwardvessel%40gmail.com
patch subject: [RFC PATCH 5/9 v2] cgroup: separate locking between base css and others
config: i386-buildonly-randconfig-003-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031446.qoZWRX6U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031446.qoZWRX6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031446.qoZWRX6U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/rstat.c:88: warning: Function parameter or struct member 'css' not described in 'cgroup_rstat_updated'
   kernel/cgroup/rstat.c:88: warning: Excess function parameter 'cgrp' description in 'cgroup_rstat_updated'
   kernel/cgroup/rstat.c:378: warning: Function parameter or struct member 'css' not described in 'cgroup_rstat_flush'
   kernel/cgroup/rstat.c:378: warning: Excess function parameter 'cgrp' description in 'cgroup_rstat_flush'
>> kernel/cgroup/rstat.c:408: warning: Function parameter or struct member 'css' not described in 'cgroup_rstat_base_flush_hold'
>> kernel/cgroup/rstat.c:408: warning: expecting prototype for cgroup_rstat_flush_hold(). Prototype was for cgroup_rstat_base_flush_hold() instead
>> kernel/cgroup/rstat.c:420: warning: Function parameter or struct member 'css' not described in 'cgroup_rstat_base_flush_release'
>> kernel/cgroup/rstat.c:420: warning: expecting prototype for cgroup_rstat_flush_release(). Prototype was for cgroup_rstat_base_flush_release() instead


vim +408 kernel/cgroup/rstat.c

0fa294fb1985c0 Tejun Heo              2018-04-26  396  
6162cef0f741c7 Tejun Heo              2018-04-26  397  /**
2ca11b0e043be6 Yang Li                2021-05-26  398   * cgroup_rstat_flush_hold - flush stats in @cgrp's subtree and hold
6162cef0f741c7 Tejun Heo              2018-04-26  399   * @cgrp: target cgroup
6162cef0f741c7 Tejun Heo              2018-04-26  400   *
6162cef0f741c7 Tejun Heo              2018-04-26  401   * Flush stats in @cgrp's subtree and prevent further flushes.  Must be
6162cef0f741c7 Tejun Heo              2018-04-26  402   * paired with cgroup_rstat_flush_release().
0fa294fb1985c0 Tejun Heo              2018-04-26  403   *
0fa294fb1985c0 Tejun Heo              2018-04-26  404   * This function may block.
6162cef0f741c7 Tejun Heo              2018-04-26  405   */
d0b90e95826c89 JP Kobryn              2025-01-02  406  static void cgroup_rstat_base_flush_hold(struct cgroup_subsys_state *css)
d0b90e95826c89 JP Kobryn              2025-01-02  407  	__acquires(&cgroup_rstat_base_lock)
6162cef0f741c7 Tejun Heo              2018-04-26 @408  {
0fa294fb1985c0 Tejun Heo              2018-04-26  409  	might_sleep();
d0b90e95826c89 JP Kobryn              2025-01-02  410  	__cgroup_rstat_lock(css, &cgroup_rstat_base_lock, -1);
6f15a01d35d342 JP Kobryn              2025-01-02  411  	cgroup_rstat_flush_locked(css);
6162cef0f741c7 Tejun Heo              2018-04-26  412  }
6162cef0f741c7 Tejun Heo              2018-04-26  413  
6162cef0f741c7 Tejun Heo              2018-04-26  414  /**
6162cef0f741c7 Tejun Heo              2018-04-26  415   * cgroup_rstat_flush_release - release cgroup_rstat_flush_hold()
97a46a66ad7d91 Jesper Dangaard Brouer 2024-04-17  416   * @cgrp: cgroup used by tracepoint
6162cef0f741c7 Tejun Heo              2018-04-26  417   */
d0b90e95826c89 JP Kobryn              2025-01-02  418  static void cgroup_rstat_base_flush_release(struct cgroup_subsys_state *css)
d0b90e95826c89 JP Kobryn              2025-01-02  419  	__releases(&cgroup_rstat_base_lock)
6162cef0f741c7 Tejun Heo              2018-04-26 @420  {
d0b90e95826c89 JP Kobryn              2025-01-02  421  	__cgroup_rstat_unlock(css, &cgroup_rstat_base_lock, -1);
6162cef0f741c7 Tejun Heo              2018-04-26  422  }
6162cef0f741c7 Tejun Heo              2018-04-26  423  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
