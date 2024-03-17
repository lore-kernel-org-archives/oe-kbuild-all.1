Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40C18026
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710665718; cv=none; b=l7BBqxKyRpR4QjBLhg52apzjwh1bnPxw4+DsoE2zm4VGYCCModl/8wxJBY7+sluSYhA0yWcycc1EFuqdozFiWLnVHquffffre56XOkq9z03lYlkyrj6raWnE1aCwWQvZSvnr9vRZlkQJrb/CeBq/b+wPl1VJeCWbXTki/MAyXGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710665718; c=relaxed/simple;
	bh=rOMAXCxZlZpRsqBHskBgIKu7Hl0tHtKqdwgX3GMeqA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bL0DBFeZ3iH0NtOBBMkU8DZXXgUdwd7ScwMnBP0B8nHs1QvoRq797LDUIAjDMQzVSsOYKUkppNv3DORSOQTLsfetAranp1YNTbSQZx6hO6EXnHyqJPRhcnACv6xwp6msd04jowPxh9DSJFfyhc7UAd8X6vBAtVTkmMyu6UPzna4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npCyXuGH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npCyXuGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710665717; x=1742201717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rOMAXCxZlZpRsqBHskBgIKu7Hl0tHtKqdwgX3GMeqA4=;
  b=npCyXuGHjHWDyZFVFnp4aUSVgqMrtFo9fZlR4arcSaYxRzb22rali5l0
   0FBLSzd56Kpt0GGeSK6vUdFMo+B7VMoJHwaZe4nD+A6HtST041sQAOanD
   oqKUuR3fTS2/H6UUjCtuCY6GS8K2xw8RhwPsOIVmp/q3fc3vE+vgq//c/
   c44wtuUNUQJW9wlsd/xGo+EDXgo6bRJB5ipveO4nVGZG7nzz3s09pSaaE
   ncc7TZAxbGmTxPFi/U1a7IDTKdITzKeMOgHFH8efmSbN0pBjtOXC1CMK4
   7uRTXUf47MTeEbcc1JruEMOF2ZSXklgvDinqNUV6/cPEzx3e6XfeNnBw0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="5698822"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="5698822"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 01:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="13047684"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2024 01:55:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlmIS-000G8L-2V;
	Sun, 17 Mar 2024 08:55:12 +0000
Date: Sun, 17 Mar 2024 16:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:drm-next 56/58]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Function
 parameter or struct member 'new_context' not described in
 'commit_minimal_transition_state_in_dc_update'
Message-ID: <202403171638.EzV0f7T7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   a0ce9e50f51ed759d7bd8886dae8696bd24c81e3
commit: 7bce9d1e39e573a5d90913357d955e257cdc3fc4 [56/58] drm/amd/display: Implement update_planes_and_stream_v3 sequence
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240317/202403171638.EzV0f7T7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171638.EzV0f7T7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171638.EzV0f7T7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Function parameter or struct member 'new_context' not described in 'commit_minimal_transition_state_in_dc_update'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Function parameter or struct member 'srf_updates' not described in 'commit_minimal_transition_state_in_dc_update'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Function parameter or struct member 'surface_count' not described in 'commit_minimal_transition_state_in_dc_update'
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Excess function parameter 'context' description in 'commit_minimal_transition_state_in_dc_update'


vim +4376 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

  4353	
  4354	/**
  4355	 * commit_minimal_transition_state_in_dc_update - Commit a minimal state based
  4356	 * on current or new context
  4357	 *
  4358	 * @dc: DC structure, used to get the current state
  4359	 * @context: New context
  4360	 * @stream: Stream getting the update for the flip
  4361	 *
  4362	 * The function takes in current state and new state and determine a minimal
  4363	 * transition state as the intermediate step which could make the transition
  4364	 * between current and new states seamless. If found, it will commit the minimal
  4365	 * transition state and update current state to this minimal transition state
  4366	 * and return true, if not, it will return false.
  4367	 *
  4368	 * Return:
  4369	 * Return True if the minimal transition succeeded, false otherwise
  4370	 */
  4371	static bool commit_minimal_transition_state_in_dc_update(struct dc *dc,
  4372			struct dc_state *new_context,
  4373			struct dc_stream_state *stream,
  4374			struct dc_surface_update *srf_updates,
  4375			int surface_count)
> 4376	{
  4377		bool success = commit_minimal_transition_based_on_new_context(
  4378					dc, new_context, stream, srf_updates,
  4379					surface_count);
  4380		if (!success)
  4381			success = commit_minimal_transition_based_on_current_context(dc,
  4382					new_context, stream);
  4383		if (!success)
  4384			DC_LOG_ERROR("Fail to commit a seamless minimal transition state between current and new states.\nThis pipe topology update is non-seamless!\n");
  4385		return success;
  4386	}
  4387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
