Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB24A33
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 03:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710559176; cv=none; b=Uu/LtRo3AzwK+srlPlM3iwKlTThR8Jxi2jgq79W6k+SrZ2rCzAbrAvVTamdH60i7KXWRmJV8gA5dH+WFtGRt3FjpjscEDXIrYfMn/sD2G1VqGBrKn1+QvPMK8n3KYmDddIK1ZXwGp9N59Ea0PSUryZJIeZTYEm+hOJRKyoTt/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710559176; c=relaxed/simple;
	bh=rjb7MdwCQ9HHWoEg7OSUI42DloDT8X57+D6p/cP5iHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=riEj9OPwsavbQ/KRpcfnLTY2yRiPofQuNgCewQ7pE74zuP4cjk4tyCqGapWafzuOLOps28N/TE+fcQOxpD/769gwfn6A9NCJuTIfROKajyVoU6pYWeqjZyWS1tkrlbYYb+gOCLQzrA8L4tXc26UST+0bwQ01LTtYS6LdflESHtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDBidK4R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDBidK4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710559174; x=1742095174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rjb7MdwCQ9HHWoEg7OSUI42DloDT8X57+D6p/cP5iHQ=;
  b=JDBidK4R6SkEqn7ExIjHeWQWD4ZM9cXFM6Fm3fOs94s/Ka8qO887pMzZ
   FNyACUN4B550iD58GwBKBAMc3RxNq0gFLkFSV7DEi3aq48VjHd8+or7g/
   ZgrreQwCeDhaRiRwKzxGA6Kb0oCiwhXE4RvvLMrlwCI3Wdd6Yvadqcybf
   yAYBbErqTMgjNBT9I3WmjBUpqLLVj4H2kyH/cC3b4NcHLEIVulVVSrD1V
   7ZUp6Buw0FdRgE5ehdGsORM6wFX9+z4FpvwuM5RR9Ucfi9ZOEMldimHSG
   mdqAHLc13u87GvTuskqCWQYW8tMwBQcyLa/pRju+SI9lBpfSIUYaJsi7t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5384363"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5384363"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 20:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="50313930"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2024 20:19:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlKa2-000F1L-1N;
	Sat, 16 Mar 2024 03:19:30 +0000
Date: Sat, 16 Mar 2024 11:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>
Subject: [agd5f:amd-staging-drm-next 1664/1667]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Function
 parameter or member 'new_context' not described in
 'commit_minimal_transition_state_in_dc_update'
Message-ID: <202403161131.dxq4D80e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   499a0313b53b2f712b4d60a5fe6fa38c52ebac8a
commit: 06653fc227525895ce25ab45c7ae652bd1359027 [1664/1667] drm/amd/display: Implement update_planes_and_stream_v3 sequence
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240316/202403161131.dxq4D80e-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161131.dxq4D80e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161131.dxq4D80e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Function parameter or member 'new_context' not described in 'commit_minimal_transition_state_in_dc_update'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Function parameter or member 'srf_updates' not described in 'commit_minimal_transition_state_in_dc_update'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Function parameter or member 'surface_count' not described in 'commit_minimal_transition_state_in_dc_update'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4376: warning: Excess function parameter 'context' description in 'commit_minimal_transition_state_in_dc_update'


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
