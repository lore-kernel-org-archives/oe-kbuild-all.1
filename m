Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C57A39844
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Dec 2023 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDjwWRyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703080915; x=1734616915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DjdXWZBMv29x7Gzg/tVHAvtQsGjtGeYXzjtBpEji6dE=;
  b=gDjwWRyBc+mtdBbIPwQ+fR13TNlRhIJIMfaKZDcNefaiSjo6B6aSHrRF
   sxetS7HNkThLzG60U1bDXRNxb197UcLn+RhROmsVPRIKJ4JbSL/f5uOCq
   TPoy1HsgYkSz/Qw1WHkKjS0KA8C27fsTMrsNZWV5RD/W1YIfZMhr6aQOB
   x7AlcaF6Al3jgHxy8Lc972LLh8Un0n0phTVdo3IY75CTYN0SH/amWBqLD
   lC6SvCjkTkXOXRbXZWvfrRlnNypg29Ral+FWDla6QjX6u13V0aaBNi0Ib
   NiorFUL8Vva8AECQH9iog+d9au7AEYsDivcNLwTEThQKGwMj7Du01ePLn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="395543674"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="395543674"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 06:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="769596247"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769596247"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Dec 2023 06:01:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFx8u-0006xe-1p;
	Wed, 20 Dec 2023 14:01:48 +0000
Date: Wed, 20 Dec 2023 21:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dillon Varone <dillon.varone@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Jun Lei <jun.lei@amd.com>
Subject: [linux-next:master 9130/9550]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:329: warning:
 Function parameter or struct member 'state' not described in
 'dc_state_rem_all_planes_for_stream'
Message-ID: <202312202105.vqJ5GA70-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d857259d7d10cd0d5e8b60608455986167cfad
commit: 09a4ec5da92c84952db117f0d576fdd8368c873a [9130/9550] drm/amd/display: Refactor dc_state interface
config: riscv-randconfig-r003-20220327 (https://download.01.org/0day-ci/archive/20231220/202312202105.vqJ5GA70-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312202105.vqJ5GA70-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312202105.vqJ5GA70-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:329: warning: Function parameter or struct member 'state' not described in 'dc_state_rem_all_planes_for_stream'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:329: warning: Excess function parameter 'context' description in 'dc_state_rem_all_planes_for_stream'
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:540: warning: Function parameter or struct member 'context' not described in 'populate_subvp_cmd_drr_info'


vim +329 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c

   313	
   314	/**
   315	 * dc_state_rem_all_planes_for_stream - Remove planes attached to the target stream.
   316	 *
   317	 * @dc: Current dc state.
   318	 * @stream: Target stream, which we want to remove the attached plans.
   319	 * @context: New context.
   320	 *
   321	 * Return:
   322	 * Return true if DC was able to remove all planes from the target
   323	 * stream, otherwise, return false.
   324	 */
   325	bool dc_state_rem_all_planes_for_stream(
   326			const struct dc *dc,
   327			struct dc_stream_state *stream,
   328			struct dc_state *state)
 > 329	{
   330		int i, old_plane_count;
   331		struct dc_stream_status *stream_status = NULL;
   332		struct dc_plane_state *del_planes[MAX_SURFACE_NUM] = { 0 };
   333	
   334		for (i = 0; i < state->stream_count; i++)
   335			if (state->streams[i] == stream) {
   336				stream_status = &state->stream_status[i];
   337				break;
   338			}
   339	
   340		if (stream_status == NULL) {
   341			dm_error("Existing stream %p not found!\n", stream);
   342			return false;
   343		}
   344	
   345		old_plane_count = stream_status->plane_count;
   346	
   347		for (i = 0; i < old_plane_count; i++)
   348			del_planes[i] = stream_status->plane_states[i];
   349	
   350		for (i = 0; i < old_plane_count; i++)
   351			if (!dc_state_remove_plane(dc, stream, del_planes[i], state))
   352				return false;
   353	
   354		return true;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
