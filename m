Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962CBF9DA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 03:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731207735; cv=none; b=JUDSem+vlffEN9sZyM6r1sbEmd+MlyDbVt0PZf1RHOZ3Dl/wcY5snKhng3UTWLg21ncmSrvoPHurrYwiiKL3XTB/5JwpTE9lyj6MWhgCdBJVQa9sfjHVLtun8STFXJMBKY9zO1XRjXp+DfwNQFtjffgynPQwNonrP6Q9ZCWkkJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731207735; c=relaxed/simple;
	bh=n9czydkhfnOCUi6Dnx4NGqqo7BEFKAPF10HcKTqhhrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TV7i4wb8VGGRRzWPhuandC8bDyJdog8JX0vA5PRxsM0HqNs/XnHafLW+6kMnyit/40i/ImPGyDfwQTZbL+neV7F5OU+WKE3qs14RdncmPUYwwc1JPvQrfEPfzgiTVeMw218Zx3jrOtS1vawpAum43gSxVVMCkgPjTO/rWhHxJbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OaoFOu6z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OaoFOu6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731207734; x=1762743734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n9czydkhfnOCUi6Dnx4NGqqo7BEFKAPF10HcKTqhhrM=;
  b=OaoFOu6zbGjBs413Yc8IdjTHQq8nQyoJI7PIa2kJKz3trdsVUCBnEkkl
   CrsCOV609t3fCRzX/c11Afe9PRLLus25bybURRdrK6GKdSeZ5pCwpCqsf
   9+QBkF/iDBK8aG1VKIzWuNIie6/4qytCnUYL5f5knYwAshkWA+cedRJSk
   +ZKe338G+QPMol5fDANnUNuAeFSadrjQ5z3gA6dj9DeZT99cCU2fwqgYp
   xo648pPIngEyW2NI/gPxdKA4kVSB/G7Jrx+wfjl+ojV1Uxv9gSkWbNqra
   OG4O0mqdgpfiqfN1glJzISWl9rtA6nOXfJOtYjKZV0CHD7ymZeoAi1G7z
   g==;
X-CSE-ConnectionGUID: A3A2N3eVSti+nzR9sAtPOQ==
X-CSE-MsgGUID: kfVDfigLSY+HSmKHtyk33w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41611846"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41611846"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 19:02:11 -0800
X-CSE-ConnectionGUID: FLrBp8X7SMi4fNzD7kH7ug==
X-CSE-MsgGUID: Elh9O2/nQNaLB4me8vbS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="90189036"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2024 19:02:09 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9yDH-000sro-14;
	Sun, 10 Nov 2024 03:02:07 +0000
Date: Sun, 10 Nov 2024 11:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1244/1265]
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2182: warning: Function parameter
 or struct member 'inst' not described in
 'amdgpu_device_ip_set_powergating_state'
Message-ID: <202411101047.SmfLBvDk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   51898784baa73c81c9401a271cf94e9ae1d026e1
commit: 585279e00796a46da19b64d5a131c3b5facab8bc [1244/1265] drm/amdgpu: set powergating state by vcn instance
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411101047.SmfLBvDk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101047.SmfLBvDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101047.SmfLBvDk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2182: warning: Function parameter or struct member 'inst' not described in 'amdgpu_device_ip_set_powergating_state'


vim +2182 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

d38ceaf99ed015 Alex Deucher  2015-04-20  2166  
e3ecdffac9ccdb Alex Deucher  2018-03-15  2167  /**
e3ecdffac9ccdb Alex Deucher  2018-03-15  2168   * amdgpu_device_ip_set_powergating_state - set the PG state
e3ecdffac9ccdb Alex Deucher  2018-03-15  2169   *
87e3f1366eaa82 Darren Powell 2018-06-25  2170   * @dev: amdgpu_device pointer
e3ecdffac9ccdb Alex Deucher  2018-03-15  2171   * @block_type: Type of hardware IP (SMU, GFX, UVD, etc.)
e3ecdffac9ccdb Alex Deucher  2018-03-15  2172   * @state: powergating state (gate or ungate)
e3ecdffac9ccdb Alex Deucher  2018-03-15  2173   *
e3ecdffac9ccdb Alex Deucher  2018-03-15  2174   * Sets the requested powergating state for all instances of
e3ecdffac9ccdb Alex Deucher  2018-03-15  2175   * the hardware IP specified.
e3ecdffac9ccdb Alex Deucher  2018-03-15  2176   * Returns the error code from the last instance.
e3ecdffac9ccdb Alex Deucher  2018-03-15  2177   */
43fa561fd07fe7 Rex Zhu       2018-03-28  2178  int amdgpu_device_ip_set_powergating_state(void *dev,
5fc3aeeb9e553a yanyang1      2015-05-22  2179  					   enum amd_ip_block_type block_type,
585279e00796a4 Boyuan Zhang  2024-09-29  2180  					   enum amd_powergating_state state,
585279e00796a4 Boyuan Zhang  2024-09-29  2181  					   int inst)
d38ceaf99ed015 Alex Deucher  2015-04-20 @2182  {
43fa561fd07fe7 Rex Zhu       2018-03-28  2183  	struct amdgpu_device *adev = dev;
d38ceaf99ed015 Alex Deucher  2015-04-20  2184  	int i, r = 0;
d38ceaf99ed015 Alex Deucher  2015-04-20  2185  
d38ceaf99ed015 Alex Deucher  2015-04-20  2186  	for (i = 0; i < adev->num_ip_blocks; i++) {
a1255107212675 Alex Deucher  2016-10-13  2187  		if (!adev->ip_blocks[i].status.valid)
9ecbe7f506d36f Alex Deucher  2016-06-23  2188  			continue;
c722865a19f97a Rex Zhu       2017-02-22  2189  		if (adev->ip_blocks[i].version->type != block_type)
c722865a19f97a Rex Zhu       2017-02-22  2190  			continue;
585279e00796a4 Boyuan Zhang  2024-09-29  2191  		if (block_type == AMD_IP_BLOCK_TYPE_VCN &&
585279e00796a4 Boyuan Zhang  2024-09-29  2192  				adev->ip_blocks[i].instance != inst)
585279e00796a4 Boyuan Zhang  2024-09-29  2193  			continue;
c722865a19f97a Rex Zhu       2017-02-22  2194  		if (!adev->ip_blocks[i].version->funcs->set_powergating_state)
c722865a19f97a Rex Zhu       2017-02-22  2195  			continue;
c722865a19f97a Rex Zhu       2017-02-22  2196  		r = adev->ip_blocks[i].version->funcs->set_powergating_state(
c9188ea9675f46 Boyuan Zhang  2024-09-29  2197  			&adev->ip_blocks[i], state);
d38ceaf99ed015 Alex Deucher  2015-04-20  2198  		if (r)
c722865a19f97a Rex Zhu       2017-02-22  2199  			DRM_ERROR("set_powergating_state of IP block <%s> failed %d\n",
c722865a19f97a Rex Zhu       2017-02-22  2200  				  adev->ip_blocks[i].version->funcs->name, r);
d38ceaf99ed015 Alex Deucher  2015-04-20  2201  	}
d38ceaf99ed015 Alex Deucher  2015-04-20  2202  	return r;
d38ceaf99ed015 Alex Deucher  2015-04-20  2203  }
d38ceaf99ed015 Alex Deucher  2015-04-20  2204  

:::::: The code at line 2182 was first introduced by commit
:::::: d38ceaf99ed015f2a0b9af3499791bd3a3daae21 drm/amdgpu: add core driver (v4)

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
