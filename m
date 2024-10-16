Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B601B395B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083445; cv=none; b=O3egaWfsqvEbjedSjUhI2yNAz6i3rZ2OznEB2ge0HaSjrrEc2zm65wCWkV9cs6dtkPk6Nbrv6twtaJRrr5rdosNTvZn87FOlpHI6CPLnH7lWpsSb2v5e30xJjDyf6UuB8HaEhUrQHIl1edJxEGyMYMUWjymYvyqM4GBuVZDWBQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083445; c=relaxed/simple;
	bh=jQV6G5+9Rp0B9cqrWqCUhrZnRDc7/X5WZ1/lj9PH0oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6LH8FL2JFMAxBp2zU7uMvO9nFtiYSxVpYr9faLUoOWe8DePqBYqQMs/61Gg7LJjUtMygduAkcu5zQevRP7kA2a1I3+fh7lzlcmJ0HoB3JFVDeINITHuWBNjE8IYqg82SbdQOgGRajfwA71834FBGrFP7ZwvQUs4piVoBNmgODM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mze1YjzS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mze1YjzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729083443; x=1760619443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jQV6G5+9Rp0B9cqrWqCUhrZnRDc7/X5WZ1/lj9PH0oY=;
  b=Mze1YjzSPJ2fUjZrgJdVXfMzOj+cBk/pvT0ZU50a07+jLDQV6GeUcN/i
   HO+ua7Z61dCJGSe847HyBT88aCOBjKDSfxYLmJCOMIPDHFdHftksw5+KY
   1yi3kf460iax6TFkBOMUcRDpNMy8bUqEZFWi6Qry6VEQJNjeNYwKXqrai
   5IQHnmdfrTC0HgA5k8sCIHXOjqtzAEBWVkDqaQaEZTeTewQJMIjQYbjMC
   kwP4pjmERM+jwIlIcGNEFZU5kbUfp6S+TUMGFaQ4jCMQn8Lhv+RO2IiiB
   /uvzcoCDL+k7zM+Xv/pDIbSHGeZI/VUu2lVI+vNjRIxkve3TYhRfwgXFh
   w==;
X-CSE-ConnectionGUID: vSU11VUnQ9uEa46pdKPzWQ==
X-CSE-MsgGUID: euedq3AdRRS4IELWqxvV5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51064113"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51064113"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 05:57:20 -0700
X-CSE-ConnectionGUID: CFwtNkfsRoy6Jt/UuHNYPQ==
X-CSE-MsgGUID: hgDJz/YRQbqA3C46LlSOog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="101551397"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Oct 2024 05:57:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t13aT-000Kuh-0X;
	Wed, 16 Oct 2024 12:57:13 +0000
Date: Wed, 16 Oct 2024 20:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm/prime: introduce DRM_PRIME_FD_TO_HANDLE_NO_MOVE
Message-ID: <202410162242.Y6KhusD7-lkp@intel.com>
References: <20241013133431.1356874-1-contact@emersion.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013133431.1356874-1-contact@emersion.fr>

Hi Simon,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next linus/master v6.12-rc3 next-20241016]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Ser/drm-prime-introduce-DRM_PRIME_FD_TO_HANDLE_NO_MOVE/20241013-213609
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241013133431.1356874-1-contact%40emersion.fr
patch subject: [RFC PATCH] drm/prime: introduce DRM_PRIME_FD_TO_HANDLE_NO_MOVE
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241016/202410162242.Y6KhusD7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410162242.Y6KhusD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410162242.Y6KhusD7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:906: warning: Function parameter or struct member 'flags' not described in 'dma_buf_dynamic_attach'
--
>> drivers/gpu/drm/drm_prime.c:298: warning: Function parameter or struct member 'flags' not described in 'drm_gem_prime_fd_to_handle'
>> drivers/gpu/drm/drm_prime.c:949: warning: Function parameter or struct member 'flags' not described in 'drm_gem_prime_import_dev'
>> drivers/gpu/drm/drm_prime.c:1019: warning: Function parameter or struct member 'flags' not described in 'drm_gem_prime_import'
--
   drivers/gpu/drm/vmwgfx/vmwgfx_surface.c: In function 'vmw_buffer_prime_to_surface_base':
>> drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:974:15: error: too few arguments to function 'drm_gem_prime_fd_to_handle'
     974 |         ret = drm_gem_prime_fd_to_handle(&dev_priv->drm, file_priv, fd, handle);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_file.h:39,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:38,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:30:
   include/drm/drm_prime.h:70:5: note: declared here
      70 | int drm_gem_prime_fd_to_handle(struct drm_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/vmwgfx/vmwgfx_prime.c: In function 'vmw_prime_fd_to_handle':
>> drivers/gpu/drm/vmwgfx/vmwgfx_prime.c:83:23: error: too few arguments to function 'drm_gem_prime_fd_to_handle'
      83 |                 ret = drm_gem_prime_fd_to_handle(dev, file_priv, fd, handle);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_file.h:39,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:38,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_prime.c:34:
   include/drm/drm_prime.h:70:5: note: declared here
      70 | int drm_gem_prime_fd_to_handle(struct drm_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/virtio/virtgpu_prime.c: In function 'virtgpu_gem_prime_import':
>> drivers/gpu/drm/virtio/virtgpu_prime.c:162:16: error: too few arguments to function 'drm_gem_prime_import'
     162 |         return drm_gem_prime_import(dev, buf);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/virtio/virtgpu_prime.c:25:
   include/drm/drm_prime.h:108:24: note: declared here
     108 | struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
         |                        ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/virtio/virtgpu_prime.c:163:1: warning: control reaches end of non-void function [-Wreturn-type]
     163 | }
         | ^


vim +/drm_gem_prime_fd_to_handle +974 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c

d6667f0ddf46c6 Zack Rusin       2024-07-22   962  
d6667f0ddf46c6 Zack Rusin       2024-07-22   963  static int vmw_buffer_prime_to_surface_base(struct vmw_private *dev_priv,
d6667f0ddf46c6 Zack Rusin       2024-07-22   964  					    struct drm_file *file_priv,
d6667f0ddf46c6 Zack Rusin       2024-07-22   965  					    u32 fd, u32 *handle,
d6667f0ddf46c6 Zack Rusin       2024-07-22   966  					    struct ttm_base_object **base_p)
d6667f0ddf46c6 Zack Rusin       2024-07-22   967  {
d6667f0ddf46c6 Zack Rusin       2024-07-22   968  	struct ttm_base_object *base;
d6667f0ddf46c6 Zack Rusin       2024-07-22   969  	struct vmw_bo *bo;
d6667f0ddf46c6 Zack Rusin       2024-07-22   970  	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
d6667f0ddf46c6 Zack Rusin       2024-07-22   971  	struct vmw_user_surface *user_srf;
d6667f0ddf46c6 Zack Rusin       2024-07-22   972  	int ret;
d6667f0ddf46c6 Zack Rusin       2024-07-22   973  
d6667f0ddf46c6 Zack Rusin       2024-07-22  @974  	ret = drm_gem_prime_fd_to_handle(&dev_priv->drm, file_priv, fd, handle);
d6667f0ddf46c6 Zack Rusin       2024-07-22   975  	if (ret) {
d6667f0ddf46c6 Zack Rusin       2024-07-22   976  		drm_warn(&dev_priv->drm,
d6667f0ddf46c6 Zack Rusin       2024-07-22   977  			 "Wasn't able to find user buffer for fd = %u.\n", fd);
d6667f0ddf46c6 Zack Rusin       2024-07-22   978  		return ret;
d6667f0ddf46c6 Zack Rusin       2024-07-22   979  	}
d6667f0ddf46c6 Zack Rusin       2024-07-22   980  
d6667f0ddf46c6 Zack Rusin       2024-07-22   981  	ret = vmw_user_bo_lookup(file_priv, *handle, &bo);
d6667f0ddf46c6 Zack Rusin       2024-07-22   982  	if (ret) {
d6667f0ddf46c6 Zack Rusin       2024-07-22   983  		drm_warn(&dev_priv->drm,
d6667f0ddf46c6 Zack Rusin       2024-07-22   984  			 "Wasn't able to lookup user buffer for handle = %u.\n", *handle);
d6667f0ddf46c6 Zack Rusin       2024-07-22   985  		return ret;
d6667f0ddf46c6 Zack Rusin       2024-07-22   986  	}
d6667f0ddf46c6 Zack Rusin       2024-07-22   987  
d6667f0ddf46c6 Zack Rusin       2024-07-22   988  	user_srf = vmw_lookup_user_surface_for_buffer(dev_priv, bo, *handle);
d6667f0ddf46c6 Zack Rusin       2024-07-22   989  	if (WARN_ON(!user_srf)) {
d6667f0ddf46c6 Zack Rusin       2024-07-22   990  		drm_warn(&dev_priv->drm,
d6667f0ddf46c6 Zack Rusin       2024-07-22   991  			 "User surface fd %d (handle %d) is null.\n", fd, *handle);
d6667f0ddf46c6 Zack Rusin       2024-07-22   992  		ret = -EINVAL;
d6667f0ddf46c6 Zack Rusin       2024-07-22   993  		goto out;
d6667f0ddf46c6 Zack Rusin       2024-07-22   994  	}
d6667f0ddf46c6 Zack Rusin       2024-07-22   995  
d6667f0ddf46c6 Zack Rusin       2024-07-22   996  	base = &user_srf->prime.base;
d6667f0ddf46c6 Zack Rusin       2024-07-22   997  	ret = ttm_ref_object_add(tfile, base, NULL, false);
d6667f0ddf46c6 Zack Rusin       2024-07-22   998  	if (ret) {
d6667f0ddf46c6 Zack Rusin       2024-07-22   999  		drm_warn(&dev_priv->drm,
d6667f0ddf46c6 Zack Rusin       2024-07-22  1000  			 "Couldn't add an object ref for the buffer (%d).\n", *handle);
d6667f0ddf46c6 Zack Rusin       2024-07-22  1001  		goto out;
d6667f0ddf46c6 Zack Rusin       2024-07-22  1002  	}
d6667f0ddf46c6 Zack Rusin       2024-07-22  1003  
d6667f0ddf46c6 Zack Rusin       2024-07-22  1004  	*base_p = base;
d6667f0ddf46c6 Zack Rusin       2024-07-22  1005  out:
d6667f0ddf46c6 Zack Rusin       2024-07-22  1006  	vmw_user_bo_unref(&bo);
d6667f0ddf46c6 Zack Rusin       2024-07-22  1007  
d6667f0ddf46c6 Zack Rusin       2024-07-22  1008  	return ret;
d6667f0ddf46c6 Zack Rusin       2024-07-22  1009  }
adebcb20e4ca93 Thomas Hellstrom 2014-03-18  1010  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
