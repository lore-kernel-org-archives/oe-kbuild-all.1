Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78CE199E9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 22:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713478991; cv=none; b=BEYpvwsSNoFa//eqjOA2G50f1VNuHH2chTn8IAA0Y1suuKpN/zQGkCENN0L16I0cV0tXcjBcjY/92ZR63UfDd6J1k5nb55Q80Z/dIINyvjUG1SeLuFInPbspMLKfrw1TI7i7/2ALTTzo2pzkaBXAIDfDbfN4Nb8xetGhDjQkBZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713478991; c=relaxed/simple;
	bh=hXuhka1BbEl3rO+5Wd+XnMZxdGtnIDm7rvd+c1O1mK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WrLRcbQUHqDyd4SlxTeDspZY2TiOWrdqcD76PAXx/gctYHNHgL+PoTOZEOHApnvXdnchp0zkt/lapXIFVmodC1dQKn6g3dbGNxmrqWjcEAzOW/WXtJAXM93MEi+Wo62R8Y4F0y59h+4IxgJ11BrIb+5bC+bF89nBL2pHW3FL9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZlwQ8wL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZlwQ8wL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713478989; x=1745014989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hXuhka1BbEl3rO+5Wd+XnMZxdGtnIDm7rvd+c1O1mK4=;
  b=eZlwQ8wLdhJP5NS1u3Smh2yTDfFU/SWmrpmwpcN9buGNEWA/b7m8Dzo+
   w2CeK1fI7yomH4KyppeNELxrs8XDnSgWmLYKR9P8vBxQFwkisVf/FcDe+
   lOCiBf0XtUzzU0UlO7gzsZ8km133euZm+sb2N7YzfredGGrBDlKItLYxv
   V+NQq6Rhk3rLUQDjAuBK3vDnXk6t66Hx8Ilto/DbcyfZtWTv0huTC/5eL
   +mXVism2saaJSjqHYDgYBqkTioiLmTs6Da0VQie7lGNvZpQAbHB1zG8aG
   f1N3Nsvv/1JpUzCZRXbBjB9y5y0S7dPkz3Ssnz1Qn3sv1ChjBZQk4Me4P
   g==;
X-CSE-ConnectionGUID: yXdXvCk4Q8SLuKqbWadrIg==
X-CSE-MsgGUID: 97Jgm7RxRjqHvFZgRARDZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8920738"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8920738"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 15:23:08 -0700
X-CSE-ConnectionGUID: duTvQtvaSSmUT6ZV02R+yQ==
X-CSE-MsgGUID: dVG31Ok+Ssy4C93XyofGzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23152417"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Apr 2024 15:23:07 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxa9p-0009I0-06;
	Thu, 18 Apr 2024 22:23:05 +0000
Date: Fri, 19 Apr 2024 06:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 27/36]
 drivers/gpu/drm/display/drm_dp_tunnel.c:1903: warning: Function parameter or
 member 'max_group_count' not described in 'drm_dp_tunnel_mgr_create'
Message-ID: <202404190650.FkqSoFCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   9e7768584e3a268327768165794ff55f7bbb94b4
commit: 138103e8979187d309ef9bcd5645825ed9170652 [27/36] UPSTREAM: drm/i915/dp: Add support for DP tunnel BW allocation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404190650.FkqSoFCt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190650.FkqSoFCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190650.FkqSoFCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or member 'tunnel' not described in 'drm_dp_tunnel_put'
>> drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or member 'tracker' not described in 'drm_dp_tunnel_put'
   drivers/gpu/drm/display/drm_dp_tunnel.c:1185: warning: expecting prototype for drm_dp_tunnel_atomic_get_allocated_bw(). Prototype was for drm_dp_tunnel_get_allocated_bw() instead
>> drivers/gpu/drm/display/drm_dp_tunnel.c:1903: warning: Function parameter or member 'max_group_count' not described in 'drm_dp_tunnel_mgr_create'


vim +1903 drivers/gpu/drm/display/drm_dp_tunnel.c

206294e561174f Imre Deak 2024-02-26  1891  
206294e561174f Imre Deak 2024-02-26  1892  /**
206294e561174f Imre Deak 2024-02-26  1893   * drm_dp_tunnel_mgr_create - Create a DP tunnel manager
206294e561174f Imre Deak 2024-02-26  1894   * @dev: DRM device object
206294e561174f Imre Deak 2024-02-26  1895   *
206294e561174f Imre Deak 2024-02-26  1896   * Creates a DP tunnel manager for @dev.
206294e561174f Imre Deak 2024-02-26  1897   *
206294e561174f Imre Deak 2024-02-26  1898   * Returns a pointer to the tunnel manager if created successfully or NULL in
206294e561174f Imre Deak 2024-02-26  1899   * case of an error.
206294e561174f Imre Deak 2024-02-26  1900   */
206294e561174f Imre Deak 2024-02-26  1901  struct drm_dp_tunnel_mgr *
206294e561174f Imre Deak 2024-02-26  1902  drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count)
206294e561174f Imre Deak 2024-02-26 @1903  {
206294e561174f Imre Deak 2024-02-26  1904  	struct drm_dp_tunnel_mgr *mgr;
206294e561174f Imre Deak 2024-02-26  1905  	int i;
206294e561174f Imre Deak 2024-02-26  1906  
206294e561174f Imre Deak 2024-02-26  1907  	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
206294e561174f Imre Deak 2024-02-26  1908  	if (!mgr)
206294e561174f Imre Deak 2024-02-26  1909  		return NULL;
206294e561174f Imre Deak 2024-02-26  1910  
206294e561174f Imre Deak 2024-02-26  1911  	mgr->dev = dev;
206294e561174f Imre Deak 2024-02-26  1912  	init_waitqueue_head(&mgr->bw_req_queue);
206294e561174f Imre Deak 2024-02-26  1913  
206294e561174f Imre Deak 2024-02-26  1914  	mgr->groups = kcalloc(max_group_count, sizeof(*mgr->groups), GFP_KERNEL);
206294e561174f Imre Deak 2024-02-26  1915  	if (!mgr->groups) {
206294e561174f Imre Deak 2024-02-26  1916  		kfree(mgr);
206294e561174f Imre Deak 2024-02-26  1917  
206294e561174f Imre Deak 2024-02-26  1918  		return NULL;
206294e561174f Imre Deak 2024-02-26  1919  	}
206294e561174f Imre Deak 2024-02-26  1920  

:::::: The code at line 1903 was first introduced by commit
:::::: 206294e561174f43d18b50823fc44a474890ff5a UPSTREAM: drm/dp: Add support for DP tunneling

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
