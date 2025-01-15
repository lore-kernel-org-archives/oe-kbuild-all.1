Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94422E3E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 04:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736916765; cv=none; b=GojArSFJNTbtdEZM9fT5TcblTry/R628137Z4BIFYotn62LWH19EWJqQlTl7Rhyw+AONQuuc4MfmOaFc7Myd7hz/eNaEqK0YIIrMiDX4yy9AIKYIRVHN8xj+69rhnMvuQE6cB0OuSQtPEMWQO3sW9zUVVENIUc+6rHrj9u8yYqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736916765; c=relaxed/simple;
	bh=KqQUNNRDJWa9wlxm6Z8/KXg+D3oeD6DyFjoCIqPr9B8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFuQLNsz3TA/WG92er8Cl+PwBQkV8G3pzfUU31kYuyhPL24liDHlLHn9SZwejZSZ4s4Kww06CbeBdm9C9Ybu3MCdju1J+X4DPGGc9ODsdjto++wfgL8XKJpKYF6MBeh6EexCs02H43UDfLSW8mP+DCvQ8+Jxha2zEYpxjUJ9cPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1g1lPMb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1g1lPMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736916763; x=1768452763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KqQUNNRDJWa9wlxm6Z8/KXg+D3oeD6DyFjoCIqPr9B8=;
  b=l1g1lPMbKGF1uHr+oVKMhIHDBenBRLssT3iJytidW5EQRE4HgGEGXKuf
   LDYIZxgcZ48DhkPcDDbhSRl4VDXKTnV8JrsEHTpL+ywduC6QAdRbQq0sO
   V9rllUlmfbblvnT3aPqKR7t/zqNiB/cPI5bedCR03vmUwoz19cxZlVN3v
   Sip6RyVX4w90VTMngWUy06r01VUtztDHZHsf50USErg7+urBb1VHMZFqC
   aDYevEo/McY6i04tgGRLSQswKs68UE9YGs5baOqZjEbi/4Z84CodY/fdb
   zfuKcpYdVQZWkxcBTGxqCmWKEcAYV2ExqyrUU2iLaL0I6qAKt7qV0wAH/
   w==;
X-CSE-ConnectionGUID: 7B2Q/ttrRiGNt4wrW2XRbA==
X-CSE-MsgGUID: U/5EHdadSS2hHstkANo/1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48236221"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="48236221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 20:52:41 -0800
X-CSE-ConnectionGUID: ZjRErHfEQQGSwFOxUU6YCg==
X-CSE-MsgGUID: QwKV3wSDS4qQsOLrebHuGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="105613377"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2025 20:52:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXvOO-000PTY-2t;
	Wed, 15 Jan 2025 04:52:36 +0000
Date: Wed, 15 Jan 2025 12:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: drivers/gpu/drm/i915/gem/i915_gem_context.c:2162:9-16: WARNING
 opportunity for memdup_user
Message-ID: <202501151212.S309qHCR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
commit: 0f1bb41bf39695c84c83ce6f69e125b562d1d7ab drm/i915: Support replaying GPU hangs with captured context image
date:   8 months ago
config: x86_64-randconfig-101-20250115 (https://download.01.org/0day-ci/archive/20250115/202501151212.S309qHCR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501151212.S309qHCR-lkp@intel.com/

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
