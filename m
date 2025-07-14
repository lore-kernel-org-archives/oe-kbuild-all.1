Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66862F22
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499150; cv=none; b=A7gCiglSqQV/V6zQ/fpVzYsWvAxcfH+g8fmGYdjPDi0uK+X0jkkHlkJ3VpPJY8xGrdIVV9+YF0MyF1EHeujIDRcL1NebuNZcZ3b23AQFJbyz4JR2EhosRhT3lBFA5f3g1UXVJ4+LZwkvlWTmPIHHzTCs9D2d30Sq/hGmngVxII8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499150; c=relaxed/simple;
	bh=VvEQAyeut2xhpulsX8ibD/zBgyTfCsPtYAcmi41S1rI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ISkSz4zvg/1yIbWLsAlBCmBBNzyMLx/jPSdKFTMl6RGP6OwUEHc0Ii2cgWW1n2jduqFXW/6/G0ekMR+NptrKtDozftlMeMBDrQnleEDjAVRjJRMDvM7Jg3uRIvtv4YlVmg/hXA3NUwAzW3iC6FlWKPKQAHBoByBYksT4U3gqV5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CteQUhM1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CteQUhM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752499148; x=1784035148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VvEQAyeut2xhpulsX8ibD/zBgyTfCsPtYAcmi41S1rI=;
  b=CteQUhM1YX4+8RylJZBPJH1umNqemKwSjfYTh5u5KVimzlHRv4zZO4Kh
   U6Wym4wYQ1zamB8YlIryHSoHGjZvwLRt8DZslYRk9Mz+3NgSuo5qViipt
   6RGysP9+jC9/we7Zs8CizAO9sZU0e8THBcTqaDzWxvQScmo31NCvwtFl9
   jElCbkRtVFb3DI74BnzXyPSieV/QTYRyo5xkcZyMsryxx9DmODpfF/STB
   xyNby4qM0it9jFF0WJeU5P4cpsLByv93FSmls92Fr6xL/wn2gEgDUeRwd
   nDKBuqbw6edUgk/WuLH/Q5GqE/xqwyibaIcVNhnZwHZ9wq7s/XLydAUPs
   Q==;
X-CSE-ConnectionGUID: D0Uo1V0rTh6w8RsJqtIQ1w==
X-CSE-MsgGUID: FfeRv+L5SA2WoJjF7Rr7dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65391406"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="65391406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 06:19:08 -0700
X-CSE-ConnectionGUID: KhGC13GCQuuBZgF9eoZ12Q==
X-CSE-MsgGUID: IrewLb02Rk2zuFtC7v3MDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="161236924"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jul 2025 06:19:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubJ5E-0008tn-2A;
	Mon, 14 Jul 2025 13:19:04 +0000
Date: Mon, 14 Jul 2025 21:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Taotao Chen <chentaotao@didiglobal.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-6.17.misc 18/22]
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c:406:25: error: storage size of
 'iter' isn't known
Message-ID: <202507142128.Zr5StnYh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.17.misc
head:   0f235ca12321e6d38c99fa74251729c5b78e6d91
commit: dd09194ff58c4b551be9e9357d8ed20bbe62624b [18/22] drm/i915: Refactor shmem_pwrite() to use kiocb and write_iter
config: i386-buildonly-randconfig-003-20250714 (https://download.01.org/0day-ci/archive/20250714/202507142128.Zr5StnYh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507142128.Zr5StnYh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142128.Zr5StnYh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_shmem.c: In function 'shmem_pwrite':
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:406:25: error: storage size of 'iter' isn't known
     406 |         struct iov_iter iter;
         |                         ^~~~
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:439:9: error: implicit declaration of function 'iov_iter_ubuf' [-Werror=implicit-function-declaration]
     439 |         iov_iter_ubuf(&iter, ITER_SOURCE, (void __user *)user_data, size);
         |         ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:439:30: error: 'ITER_SOURCE' undeclared (first use in this function)
     439 |         iov_iter_ubuf(&iter, ITER_SOURCE, (void __user *)user_data, size);
         |                              ^~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_shmem.c:439:30: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:406:25: warning: unused variable 'iter' [-Wunused-variable]
     406 |         struct iov_iter iter;
         |                         ^~~~
   cc1: some warnings being treated as errors


vim +406 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

   398	
   399	static int
   400	shmem_pwrite(struct drm_i915_gem_object *obj,
   401		     const struct drm_i915_gem_pwrite *arg)
   402	{
   403		char __user *user_data = u64_to_user_ptr(arg->data_ptr);
   404		struct file *file = obj->base.filp;
   405		struct kiocb kiocb;
 > 406		struct iov_iter iter;
   407		ssize_t written;
   408		u64 size = arg->size;
   409	
   410		/* Caller already validated user args */
   411		GEM_BUG_ON(!access_ok(user_data, arg->size));
   412	
   413		if (!i915_gem_object_has_struct_page(obj))
   414			return i915_gem_object_pwrite_phys(obj, arg);
   415	
   416		/*
   417		 * Before we instantiate/pin the backing store for our use, we
   418		 * can prepopulate the shmemfs filp efficiently using a write into
   419		 * the pagecache. We avoid the penalty of instantiating all the
   420		 * pages, important if the user is just writing to a few and never
   421		 * uses the object on the GPU, and using a direct write into shmemfs
   422		 * allows it to avoid the cost of retrieving a page (either swapin
   423		 * or clearing-before-use) before it is overwritten.
   424		 */
   425		if (i915_gem_object_has_pages(obj))
   426			return -ENODEV;
   427	
   428		if (obj->mm.madv != I915_MADV_WILLNEED)
   429			return -EFAULT;
   430	
   431		if (size > MAX_RW_COUNT)
   432			return -EFBIG;
   433	
   434		if (!file->f_op->write_iter)
   435			return -EINVAL;
   436	
   437		init_sync_kiocb(&kiocb, file);
   438		kiocb.ki_pos = arg->offset;
 > 439		iov_iter_ubuf(&iter, ITER_SOURCE, (void __user *)user_data, size);
   440	
   441		written = file->f_op->write_iter(&kiocb, &iter);
   442		BUG_ON(written == -EIOCBQUEUED);
   443	
   444		if (written != size)
   445			return -EIO;
   446	
   447		if (written < 0)
   448			return written;
   449	
   450		return 0;
   451	}
   452	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
