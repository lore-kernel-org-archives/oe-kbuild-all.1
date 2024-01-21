Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2E72A1D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 04:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705813147; cv=none; b=GecM7QUswBUfJWQ1uifJQU59RE31MwCjrclY6jI6sxupPQL5y5KZkWwfglrrHJ9w8eLZv7UDznySZB8E+NFSqTVLsXIJI/S+rgil7zWW3ssJsI6TmezRqZ9ZvyD5Wkz6MtV9Rf+CvXixXUcbucbbph5RMfZ/UAkGI5P+j6+2rvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705813147; c=relaxed/simple;
	bh=DvYwDmIb6TRvdfFKB4HOT5R/NTs78E1nd6RmPJjGxFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvaoN1Kpqwq3srLa7KegW386iVGIcFr61JKNg+Nx9upKwNV0iW+HZtsaYmzurbcE3ZB0O7TtBFhSExBJYjPznoeu4y0J+lyNfT4u1RZxGKabEd7NBlMMxtzVCStaK/T/6IArIcBFFD/bMyCxkjZWMPv3lpHaSBfNi+4/5gRBboo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMuohVpK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMuohVpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705813144; x=1737349144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DvYwDmIb6TRvdfFKB4HOT5R/NTs78E1nd6RmPJjGxFw=;
  b=GMuohVpKBCnyGFGy9dab3jjqD5qvFGax57HwtaPReWZduWqvqw7w+bAf
   WigMXdglx3tdaHA3d7F+B7XuIqjfkts2IOgCJD73zg5plqXwd2C/WbVuH
   lwzqV8yJ7NVnKOSKcRV6vg4FeWe0UiZ88I47Nnj5bBHPVP8Zuhs9+8bEw
   C9EGc6Qp4ChU+6A3fulTSFdT1IPYt76OUOnUXveEuNZ/fyO9aLlghKR5i
   qfYUiPwGkSOhsIIysSVtKP0y7n6CnbUMqi6FJTVElOweoodwY8tczwR3q
   olNM7oXG2kOjG79EU0i9I5Ut4uu1h+raJJVzPa/vsw639+kxFCUtLVecU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="14343612"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="14343612"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 20:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="928716179"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="928716179"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2024 20:59:01 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRPv9-0005gS-1y;
	Sun, 21 Jan 2024 04:58:59 +0000
Date: Sun, 21 Jan 2024 12:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/amd/display: Simplify the calculation of variables
Message-ID: <202401211234.CSxqyME8-lkp@intel.com>
References: <20240118022315.107671-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118022315.107671-1-jiapeng.chong@linux.alibaba.com>

Hi Jiapeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiapeng-Chong/drm-amd-display-Simplify-the-calculation-of-variables/20240118-102628
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240118022315.107671-1-jiapeng.chong%40linux.alibaba.com
patch subject: [PATCH] drm/amd/display: Simplify the calculation of variables
config: powerpc64-randconfig-001-20240121 (https://download.01.org/0day-ci/archive/20240121/202401211234.CSxqyME8-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401211234.CSxqyME8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401211234.CSxqyME8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_dc_resource_mgmt.c: In function 'free_unused_pipes_for_plane':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_dc_resource_mgmt.c:685:25: error: expected identifier before '!' token
     685 |                         !is_pipe_used(pool, state->res_ctx.pipe_ctx[i].pipe_idx) {
         |                         ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_dc_resource_mgmt.c: At top level:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_dc_resource_mgmt.c:669:13: warning: 'free_pipe' defined but not used [-Wunused-function]
     669 | static void free_pipe(struct pipe_ctx *pipe)
         |             ^~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_dc_resource_mgmt.c:655:13: warning: 'is_pipe_used' defined but not used [-Wunused-function]
     655 | static bool is_pipe_used(const struct dc_plane_pipe_pool *pool, unsigned int pipe_idx)
         |             ^~~~~~~~~~~~


vim +/free_pipe +669 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_dc_resource_mgmt.c

7966f319c66d94 Qingqing Zhuo 2023-07-28  654  
7966f319c66d94 Qingqing Zhuo 2023-07-28 @655  static bool is_pipe_used(const struct dc_plane_pipe_pool *pool, unsigned int pipe_idx)
7966f319c66d94 Qingqing Zhuo 2023-07-28  656  {
7966f319c66d94 Qingqing Zhuo 2023-07-28  657  	int i, j;
7966f319c66d94 Qingqing Zhuo 2023-07-28  658  
7966f319c66d94 Qingqing Zhuo 2023-07-28  659  	for (i = 0; i < pool->num_pipes_assigned_to_plane_for_odm_combine; i++) {
7966f319c66d94 Qingqing Zhuo 2023-07-28  660  		for (j = 0; j < pool->num_pipes_assigned_to_plane_for_mpcc_combine; j++) {
7966f319c66d94 Qingqing Zhuo 2023-07-28  661  			if (pool->pipes_assigned_to_plane[i][j] == pipe_idx && pool->pipe_used[i][j])
7966f319c66d94 Qingqing Zhuo 2023-07-28  662  				return true;
7966f319c66d94 Qingqing Zhuo 2023-07-28  663  		}
7966f319c66d94 Qingqing Zhuo 2023-07-28  664  	}
7966f319c66d94 Qingqing Zhuo 2023-07-28  665  
7966f319c66d94 Qingqing Zhuo 2023-07-28  666  	return false;
7966f319c66d94 Qingqing Zhuo 2023-07-28  667  }
7966f319c66d94 Qingqing Zhuo 2023-07-28  668  
7966f319c66d94 Qingqing Zhuo 2023-07-28 @669  static void free_pipe(struct pipe_ctx *pipe)
7966f319c66d94 Qingqing Zhuo 2023-07-28  670  {
7966f319c66d94 Qingqing Zhuo 2023-07-28  671  	memset(pipe, 0, sizeof(struct pipe_ctx));
7966f319c66d94 Qingqing Zhuo 2023-07-28  672  }
7966f319c66d94 Qingqing Zhuo 2023-07-28  673  
e47d7ca7574a12 Sung Joon Kim 2023-08-09  674  static void free_unused_pipes_for_plane(struct dml2_context *ctx, struct dc_state *state,
35c1d9664cbfa3 Sung Joon Kim 2023-10-11  675  	const struct dc_plane_state *plane, const struct dc_plane_pipe_pool *pool, unsigned int stream_id, int plane_index)
7966f319c66d94 Qingqing Zhuo 2023-07-28  676  {
7966f319c66d94 Qingqing Zhuo 2023-07-28  677  	int i;
35c1d9664cbfa3 Sung Joon Kim 2023-10-11  678  	bool is_plane_duplicate = ctx->v20.scratch.plane_duplicate_exists;
35c1d9664cbfa3 Sung Joon Kim 2023-10-11  679  
7966f319c66d94 Qingqing Zhuo 2023-07-28  680  	for (i = 0; i < ctx->config.dcn_pipe_count; i++) {
e47d7ca7574a12 Sung Joon Kim 2023-08-09  681  		if (state->res_ctx.pipe_ctx[i].plane_state == plane &&
e47d7ca7574a12 Sung Joon Kim 2023-08-09  682  			state->res_ctx.pipe_ctx[i].stream->stream_id == stream_id &&
972e9cc65f78f2 Jiapeng Chong 2024-01-18  683  			(!is_plane_duplicate ||
35c1d9664cbfa3 Sung Joon Kim 2023-10-11  684  			ctx->v20.scratch.dml_to_dc_pipe_mapping.dml_pipe_idx_to_plane_index[state->res_ctx.pipe_ctx[i].pipe_idx] == plane_index)) &&
972e9cc65f78f2 Jiapeng Chong 2024-01-18 @685  			!is_pipe_used(pool, state->res_ctx.pipe_ctx[i].pipe_idx) {
7966f319c66d94 Qingqing Zhuo 2023-07-28  686  			free_pipe(&state->res_ctx.pipe_ctx[i]);
7966f319c66d94 Qingqing Zhuo 2023-07-28  687  		}
7966f319c66d94 Qingqing Zhuo 2023-07-28  688  	}
7966f319c66d94 Qingqing Zhuo 2023-07-28  689  }
7966f319c66d94 Qingqing Zhuo 2023-07-28  690  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
