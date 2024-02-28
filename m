Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3AE3BBC2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709120428; cv=none; b=KbhUttHq/HmFqbKdSLJU9tRCh35agKZnoVB7L42+KiEdmFKUp60FdIicvgMIvd5DMqDin0lrOHlXDly3o9quz2oraS6x7hOKNAyxEoRwad2qBL/ouYh6Yr9ZKx7KCuykP4i58aTHuZhN+1K5t1+T2dAE6/xiwvszF/BcjLy+azQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709120428; c=relaxed/simple;
	bh=qNxk2/ufE5cQPDQA/m8E5oDp8wTB+YuxeiooVxpWqJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oo8CaT6zppoEtV0IL/pz9lLDpbqvCU318IrETx/wxvV6yX4RsnJaCnw2wFIpobnYnGK2A5s3CY8dG+6tB1aIeufpJKaCA3nqnagBzDXPCKwcQxpqX1/cI8XTkL6YlHlphvBDfwl6xDXyBd+o961uoS5+gG4gaYIWJCb3A1L8qfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kctj80Pd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kctj80Pd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709120426; x=1740656426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qNxk2/ufE5cQPDQA/m8E5oDp8wTB+YuxeiooVxpWqJo=;
  b=kctj80PdTrJdIdcJ8AqdkiXdyv2JBUx5HEjlf81Z5rBAzr94asEWgGam
   h4CmfGVFmcQP9IQ93sBFIAs2e1TXDASNvhquYU8FBGK+vE1QAET8Mh5bt
   q9kvp6E+6ruPWkNjn7TeXOGnqOalUOXz5BEqHqYECBt8rwBYvrbNrU8o/
   r6El+kO+nIC1Dvrj13OfIYGGlBn4R0urO//jxZgMU+kTKCqKZH6OfQSdC
   79a+BR5kzewh46PnoRmvQTdwjGoTkQJWTJtzYthmvQyO86uqywSo1EiPr
   LrOAd92jpF/lRqCUes4CdyeRJ3CXX8B7IUSqNRRJbjpzH2yokwf0D1+9e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3369037"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3369037"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 03:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7264291"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Feb 2024 03:40:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfIIO-000C1D-2I;
	Wed, 28 Feb 2024 11:40:20 +0000
Date: Wed, 28 Feb 2024 19:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Uma Shankar <uma.shankar@intel.com>
Subject: [linux-next:master 10266/10830]
 drivers/gpu/drm/display/drm_dp_tunnel.c:1185: warning: expecting prototype
 for drm_dp_tunnel_atomic_get_allocated_bw(). Prototype was for
 drm_dp_tunnel_get_allocated_bw() instead
Message-ID: <202402281921.GR4Yw253-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Imre,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
commit: 91888b5b1ad2fda3f4c6b8de5dd42dbe8b90ac2c [10266/10830] drm/i915/dp: Add support for DP tunnel BW allocation
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240228/202402281921.GR4Yw253-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402281921.GR4Yw253-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402281921.GR4Yw253-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or struct member 'tunnel' not described in 'drm_dp_tunnel_put'
>> drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or struct member 'tracker' not described in 'drm_dp_tunnel_put'
>> drivers/gpu/drm/display/drm_dp_tunnel.c:1185: warning: expecting prototype for drm_dp_tunnel_atomic_get_allocated_bw(). Prototype was for drm_dp_tunnel_get_allocated_bw() instead
>> drivers/gpu/drm/display/drm_dp_tunnel.c:1903: warning: Function parameter or struct member 'max_group_count' not described in 'drm_dp_tunnel_mgr_create'


vim +1185 drivers/gpu/drm/display/drm_dp_tunnel.c

295654f7e554a9 Imre Deak 2024-02-26  1171  
295654f7e554a9 Imre Deak 2024-02-26  1172  /**
295654f7e554a9 Imre Deak 2024-02-26  1173   * drm_dp_tunnel_atomic_get_allocated_bw - Get the BW allocated for a DP tunnel
295654f7e554a9 Imre Deak 2024-02-26  1174   * @tunnel: Tunnel object
295654f7e554a9 Imre Deak 2024-02-26  1175   *
295654f7e554a9 Imre Deak 2024-02-26  1176   * Get the current BW allocated for @tunnel. After the tunnel is created /
295654f7e554a9 Imre Deak 2024-02-26  1177   * resumed and the BW allocation mode is enabled for it, the allocation
295654f7e554a9 Imre Deak 2024-02-26  1178   * becomes determined only after the first allocation request by the driver
295654f7e554a9 Imre Deak 2024-02-26  1179   * calling drm_dp_tunnel_alloc_bw().
295654f7e554a9 Imre Deak 2024-02-26  1180   *
295654f7e554a9 Imre Deak 2024-02-26  1181   * Return the BW allocated for the tunnel, or -1 if the allocation is
295654f7e554a9 Imre Deak 2024-02-26  1182   * undetermined.
295654f7e554a9 Imre Deak 2024-02-26  1183   */
295654f7e554a9 Imre Deak 2024-02-26  1184  int drm_dp_tunnel_get_allocated_bw(struct drm_dp_tunnel *tunnel)
295654f7e554a9 Imre Deak 2024-02-26 @1185  {
295654f7e554a9 Imre Deak 2024-02-26  1186  	return tunnel->allocated_bw;
295654f7e554a9 Imre Deak 2024-02-26  1187  }
295654f7e554a9 Imre Deak 2024-02-26  1188  EXPORT_SYMBOL(drm_dp_tunnel_get_allocated_bw);
295654f7e554a9 Imre Deak 2024-02-26  1189  

:::::: The code at line 1185 was first introduced by commit
:::::: 295654f7e554a9f089bdab0b2bb9a9aad7c402c0 drm/dp: Add support for DP tunneling

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Imre Deak <imre.deak@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
