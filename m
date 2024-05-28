Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031AC45C14
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716919602; cv=none; b=QcI92mnQXuCmLao1ljoGdP1IuT5uwMLC0wCZQK9ARXCyhoW4L8yxk2rASE/TDnSIMTR1BUs5WTEoNCCCIzkJK1e694pEtUpXxPz6m+QPyXEBIiDwezqMpNqBhwNFeitwCJKp/jkUfyyapfsUdJNv8t5Xxuh7v7DzNIwaAItLdH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716919602; c=relaxed/simple;
	bh=syZkqlxrx4+Mx21iPZ8VlBgIJ4Q00s7BXOSEpb2REWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcA1U4Mz6DMUNz+kv4XlF3C9+FevIKcNTKfvTFq4hMANqDl38663bevXcsnUj5x+7zIbgNiISGrPXlM7PzgnTaTQ+a/odm2sb5fyfLjbK8hPZX4wPc/yzOQsAz81/QsvCFiajhMMarJp2cfoO5No9d0d56WZVdwwbRHmKvWHsoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlkgr/eF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlkgr/eF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716919601; x=1748455601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=syZkqlxrx4+Mx21iPZ8VlBgIJ4Q00s7BXOSEpb2REWo=;
  b=dlkgr/eFMzeNZ0PQfH8uc9ek6cZotHJjBiYH+bCyGdAf8M4GU/UX+uuw
   AcEeqtotGgWPgGccbEFmaTsH7CcwGwi+6wDvNsMUwSpQOAgxJIIYS7doQ
   NIo9ZRrRGQxnFSptKehD5XvS5DD02nn0MW+CecH06Y65MiF17DXQ7iU+1
   MhVhqGXW15yih6y17iFqZwLiQsXoZFshfs56VNvynN7NKO06eydQ9dMD5
   gTOf1EwX7gU8IGw5+qI7aW23s3O/zOMagxJpt4FXIM8aXWE9/nmvGF2W9
   XKWnkM/X3NNQfKaGugphYtaJnKNOdGwnBr7DgWB+YB3VN0u0uV5/O/+bW
   g==;
X-CSE-ConnectionGUID: FY+VgmTYS5KNyCFzdA+gCA==
X-CSE-MsgGUID: BbLw7/4bRBOQiKJuBah01Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13470357"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="13470357"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 11:06:38 -0700
X-CSE-ConnectionGUID: FcWOSAEXTOOrF1s0tWFHMQ==
X-CSE-MsgGUID: ZY7rhbVjQ+SgqJHFPk6c6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="35180159"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2024 11:06:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC1DW-000Cab-2S;
	Tue, 28 May 2024 18:06:34 +0000
Date: Wed, 29 May 2024 02:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-drm-intel:for-linux-next-gt 3/3]
 drivers/gpu/drm/i915/gem/i915_gem_context.c:2162:9-16: WARNING opportunity
 for memdup_user
Message-ID: <202405290220.VYoVFWkp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-intel for-linux-next-gt
head:   a09d2327a9ba8e3f5be238bc1b7ca2809255b464
commit: 0f1bb41bf39695c84c83ce6f69e125b562d1d7ab [3/3] drm/i915: Support replaying GPU hangs with captured context image
config: x86_64-randconfig-101-20240528 (https://download.01.org/0day-ci/archive/20240529/202405290220.VYoVFWkp-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290220.VYoVFWkp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gem/i915_gem_context.c:2162:9-16: WARNING opportunity for memdup_user

vim +2162 drivers/gpu/drm/i915/gem/i915_gem_context.c

  2108	
  2109	static int set_context_image(struct i915_gem_context *ctx,
  2110				     struct drm_i915_gem_context_param *args)
  2111	{
  2112		struct i915_gem_context_param_context_image user;
  2113		struct intel_context *ce;
  2114		struct file *shmem_state;
  2115		unsigned long lookup;
  2116		void *state;
  2117		int ret = 0;
  2118	
  2119		if (!IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API))
  2120			return -EINVAL;
  2121	
  2122		if (!ctx->i915->params.enable_debug_only_api)
  2123			return -EINVAL;
  2124	
  2125		if (args->size < sizeof(user))
  2126			return -EINVAL;
  2127	
  2128		if (copy_from_user(&user, u64_to_user_ptr(args->value), sizeof(user)))
  2129			return -EFAULT;
  2130	
  2131		if (user.mbz)
  2132			return -EINVAL;
  2133	
  2134		if (user.flags & ~(I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX))
  2135			return -EINVAL;
  2136	
  2137		lookup = 0;
  2138		if (user.flags & I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX)
  2139			lookup |= LOOKUP_USER_INDEX;
  2140	
  2141		ce = lookup_user_engine(ctx, lookup, &user.engine);
  2142		if (IS_ERR(ce))
  2143			return PTR_ERR(ce);
  2144	
  2145		if (user.size < ce->engine->context_size) {
  2146			ret = -EINVAL;
  2147			goto out_ce;
  2148		}
  2149	
  2150		if (drm_WARN_ON_ONCE(&ctx->i915->drm,
  2151				     test_bit(CONTEXT_ALLOC_BIT, &ce->flags))) {
  2152			/*
  2153			 * This is racy but for a debug only API, if userspace is keen
  2154			 * to create and configure contexts, while simultaneously using
  2155			 * them from a second thread, let them suffer by potentially not
  2156			 * executing with the context image they just raced to apply.
  2157			 */
  2158			ret = -EBUSY;
  2159			goto out_ce;
  2160		}
  2161	
> 2162		state = kmalloc(ce->engine->context_size, GFP_KERNEL);
  2163		if (!state) {
  2164			ret = -ENOMEM;
  2165			goto out_ce;
  2166		}
  2167	
  2168		if (copy_from_user(state, u64_to_user_ptr(user.image),
  2169				   ce->engine->context_size)) {
  2170			ret = -EFAULT;
  2171			goto out_state;
  2172		}
  2173	
  2174		shmem_state = shmem_create_from_data(ce->engine->name,
  2175						     state, ce->engine->context_size);
  2176		if (IS_ERR(shmem_state)) {
  2177			ret = PTR_ERR(shmem_state);
  2178			goto out_state;
  2179		}
  2180	
  2181		if (intel_context_set_own_state(ce)) {
  2182			ret = -EBUSY;
  2183			fput(shmem_state);
  2184			goto out_state;
  2185		}
  2186	
  2187		ce->default_state = shmem_state;
  2188	
  2189		args->size = sizeof(user);
  2190	
  2191	out_state:
  2192		kfree(state);
  2193	out_ce:
  2194		intel_context_put(ce);
  2195		return ret;
  2196	}
  2197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
