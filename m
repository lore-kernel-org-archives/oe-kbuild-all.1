Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9561A256E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 22:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754086831; cv=none; b=OmTiRnzE0UdZsDXCP66QLtT9ikb9Q/7i5dYnxbE2PpVVUOkwwQfH5REvdtfX/rB0OD4O5Fy5m3y3ldCEE2RANpSv4xyvM7pN49+UT1hYcdv3P7oSBZXjOdLzehR2vTWYiNc4LFHE1IspXLN+g/a/LCvimo8haRBSTBCBA4PEt6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754086831; c=relaxed/simple;
	bh=m6VQhjjCTeAIYTUD4NEUkz5skfvDbfGucXLsGU9p/Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8hvxMJrGMdDhiLJoHzq5o+vlYKMAKYaBXqsTDJFSwv/XCDWanSTb5q6U2RXL/Z60+PsArVZ5LhYT9/ajBKcLSqL2ep6+QqVZOm9f8tbwd5AtfTfgoqm+O3w0L0Jz6lM7uBr6law3ZHuE5B9KMZMvlrzjNcaWL9jYkQK7c1jz/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EygxQZuS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EygxQZuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754086829; x=1785622829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m6VQhjjCTeAIYTUD4NEUkz5skfvDbfGucXLsGU9p/Cg=;
  b=EygxQZuSkIKRdRwj725SpVWHQOeM7RPo5T96bwrFgka6ejM9Nvk5Sf3Z
   zUBtpr4oz+dHC1CNKbvXQ3SBXZ5wfsr+I5/IxT9C9Aau7icIhfHV8Y8pq
   WHndpZKJPMqNsBLpel8T28zC07TyPzar+2tdWpYDGsW4ZMauZDvAh1o7C
   efIn+eTUWwesvwCCQqQT5vjnOOWhbgxGK5G/lls/exvAb48VyB39TYtcT
   vQiYtN3WcyBPsaamx/ALVC7tgSHHbSyteIdWMaqXeT1iyy4mKmzYMpaeV
   MKE4Fl+Dcy8/go8W66sNZZPCRAkPtrR0NhdSrpUuLT8EnUjm3DLIoIoNt
   A==;
X-CSE-ConnectionGUID: CTgq+9QyRJ2LXmpwsfdepg==
X-CSE-MsgGUID: Jgju1Yy2T0iCxzgqWyFqEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55643633"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="55643633"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 15:20:29 -0700
X-CSE-ConnectionGUID: U/iualhXQ8Kg3s/pboWwEA==
X-CSE-MsgGUID: /z7AkACPTH+Zxnll/WyJlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194616597"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 01 Aug 2025 15:20:28 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhy6z-0001Id-1C;
	Fri, 01 Aug 2025 22:20:25 +0000
Date: Sat, 2 Aug 2025 00:20:11 +0200
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 20/51]
 drivers/gpu/drm/drm_atomic.c:1844:33: warning: variable 'obj' set but not
 used
Message-ID: <202508020055.M0biybQs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/state-readout
head:   f8f58ab7e9eac7e5daa40ab3f03b67f54ee9e9a4
commit: d344588371072ab215db01e25f7a6f67724be731 [20/51] drm/atomic: Implement drm_atomic_print_old_state
config: i386-buildonly-randconfig-2004-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020055.M0biybQs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020055.M0biybQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020055.M0biybQs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic.c: In function 'drm_atomic_print_old_state':
>> drivers/gpu/drm/drm_atomic.c:1844:33: warning: variable 'obj' set but not used [-Wunused-but-set-variable]
    1844 |         struct drm_private_obj *obj;
         |                                 ^~~
   drivers/gpu/drm/drm_atomic.c:1838:27: warning: variable 'plane' set but not used [-Wunused-but-set-variable]
    1838 |         struct drm_plane *plane;
         |                           ^~~~~


vim +/obj +1844 drivers/gpu/drm/drm_atomic.c

  1834	
  1835	void drm_atomic_print_old_state(const struct drm_atomic_state *state,
  1836			struct drm_printer *p)
  1837	{
  1838		struct drm_plane *plane;
  1839		struct drm_plane_state *plane_state;
  1840		struct drm_crtc *crtc;
  1841		struct drm_crtc_state *crtc_state;
  1842		struct drm_connector *connector;
  1843		struct drm_connector_state *connector_state;
> 1844		struct drm_private_obj *obj;
  1845		struct drm_private_state *obj_state;
  1846		int i;
  1847	
  1848		if (!p) {
  1849			drm_err(state->dev, "invalid drm printer\n");
  1850			return;
  1851		}
  1852	
  1853		drm_dbg_atomic(state->dev, "checking %p\n", state);
  1854	
  1855		for_each_old_plane_in_state(state, plane, plane_state, i)
  1856			drm_atomic_plane_print_state(p, plane_state);
  1857	
  1858		for_each_old_crtc_in_state(state, crtc, crtc_state, i)
  1859			drm_atomic_crtc_print_state(p, crtc_state);
  1860	
  1861		for_each_old_connector_in_state(state, connector, connector_state, i)
  1862			drm_atomic_connector_print_state(p, connector_state);
  1863	
  1864		for_each_old_private_obj_in_state(state, obj, obj_state, i)
  1865			drm_atomic_private_obj_print_state(p, obj_state);
  1866	}
  1867	EXPORT_SYMBOL(drm_atomic_print_old_state);
  1868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
