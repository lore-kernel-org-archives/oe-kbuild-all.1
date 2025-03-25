Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E11A0714
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 03:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742872385; cv=none; b=CBYM9sAjus8RpVFvBtiI1wqZQwJfXZthHJSsZBe+2fkdo8TVbUra1xxbQxAdpnKJ9+j0zBs+GDF4o0Yv6R9IyqrAvp7TbtGoPZ8Z9+7uddY3vrQ/nv2j1SZG+2ke1arcqF25UPHAFZqpO9lltInjayke3hy/PATUVVUG2LkoPtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742872385; c=relaxed/simple;
	bh=ggXbSmRJVBxS4iP+GgQIo1uSXaZZvulr1fgAAePXWuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bFDSBbk9wmWtGdRVIuiDyBZkEMu2aw3d5OY7fAxgEK+O5kDbbXmOh+tDCgDZOiCazxfpq+q6kMdSzYqeF7KBn7uCWDWQjKgGWXd6WWnA/aQAFeCG7i90401MQXMLp0laidLQREixRgWrtTrAW26VJjEzqkFz21b7z7HhOZSeJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4qxU9iG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4qxU9iG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742872384; x=1774408384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggXbSmRJVBxS4iP+GgQIo1uSXaZZvulr1fgAAePXWuc=;
  b=M4qxU9iGM+pcxQNSJPVHSQHRaSWZhuCs9viv8rw2/+cuEmnSyIgrRe5Z
   z2IR1hzOQzGMa5C3n+82WHGtOy25JFAdaDiDxoBEGVxQcPtdsJBMaxNkp
   5u0STpYyzcnwuSwN3rdT1Gwk72BUzKZ7Z2KlVw9LG08HZ0py4bvkq+rXZ
   0eTabYh3nLZAmnDeeoFOTnjf9bwK5tXN/bvP2DvdYUsET91KYI8ZgG2cq
   /tOBTJsMctSEPcryj1yDi1FvELdwG1uOomn2AtQP72ZsExhc+nII/v4j0
   Y0Jkm55QR+rh/8uFx5MaJt267l7zusWmoprCL4I+2UdujKGhGxnW8Mmcu
   Q==;
X-CSE-ConnectionGUID: JuGnuoetSfu5yniuSEES3g==
X-CSE-MsgGUID: +QTjUdjZTUuqid7LCggneg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54768014"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="54768014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 20:13:03 -0700
X-CSE-ConnectionGUID: XJf0yg+6Szmw6+cX0FXCSg==
X-CSE-MsgGUID: zce9D2vrTQClOZRaY0kdqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="161455684"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Mar 2025 20:13:03 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twuip-00046j-2d;
	Tue, 25 Mar 2025 03:12:59 +0000
Date: Tue, 25 Mar 2025 11:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/hooks/dmabuf.h:25:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202503251140.dx9yNymc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   8a625f475caa4e029dfbbe7fa253e895f71c08a3
commit: 549f6fcc90a8a3a2640805bf1753de21a074c17f [1/1] ANDROID: dma-buf: Add vendor hook for deferred dmabuf sysfs stats release
config: i386-randconfig-r113-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251140.dx9yNymc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251140.dx9yNymc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251140.dx9yNymc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-buf-sysfs-stats.c: note: in included file:
>> include/trace/hooks/dmabuf.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +25 include/trace/hooks/dmabuf.h

    13	
    14	DECLARE_HOOK(android_vh_dmabuf_page_pool_free_bypass,
    15			TP_PROTO(struct page *page, bool *bypass),
    16			TP_ARGS(page, bypass));
    17	DECLARE_HOOK(android_vh_dma_heap_buffer_alloc_start,
    18			TP_PROTO(const char *name, size_t len,
    19				u32 fd_flags, u64 heap_flags),
    20			TP_ARGS(name, len, fd_flags, heap_flags));
    21	DECLARE_HOOK(android_vh_dma_heap_buffer_alloc_end,
    22			TP_PROTO(const char *name, size_t len),
    23			TP_ARGS(name, len));
    24	struct dma_buf_sysfs_entry;
  > 25	DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
