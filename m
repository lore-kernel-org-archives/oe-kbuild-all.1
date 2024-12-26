Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87871CCEE7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735218861; cv=none; b=BtDuXNN3JfVE0UuCKZz3q1w+mEHK8HLCxhEJO93uTPVW+NEu2nY9QWcVgZRruKKH+Q+qXpKWYovRhc0DZM5WSWjbckexwhNH7eKJuU/C8IF0vfHMwK3jTOK16yEM/zvjupTyvjs7K1cO8W0UcOSKWCdW25sSjEaV5eH2zrO8hSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735218861; c=relaxed/simple;
	bh=NJ088dU9Oy6Rn1CUxJQ4CtMbHRp4Kf3Lw5sWnodbrrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hw6uAV8FW1n2+E8ds+g3ZZS4HlgenvPh4IUsmuwf0tzzEf9MCYE+UVl+HtQMJsNXjYNbkWZUbsTgGN+gdrkdQ/RG2ljtIOdHwyYK5qehkbrKTGQvwLv7PIh0msKb+OZvZEW2UlVdyWpqWGgFmixQcmNrrGbJzqwqplRGt8Cd8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNBYTLCc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNBYTLCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735218858; x=1766754858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJ088dU9Oy6Rn1CUxJQ4CtMbHRp4Kf3Lw5sWnodbrrg=;
  b=jNBYTLCc44tOXrCrD9gijPwo9A+83uCe6lnX2WlqE3U/Ny5Ro6JdEumV
   nMoyppXyquANlNwseziQpNxurP5wlCFCHvMN+2JqOzhZOMP8GRdot+Zhb
   BGcP/B/1ytwuCgkl/dhgOrVeYKIky3QOI7+OEw7yg3HgzgfmdsRzUCai2
   PHxzaf3fMOZMd3aImyvqfOCAR53+BjwMggCgw+IrvifjI6nzkAL2NE85a
   gVXZXVlBT98TBsM6wWCyt0OZGLMbUlLw2mdtEFZcop1x82dCeavm1asos
   FdQh92gTOLnRzqiTvBpkH7rbzrOf51DK8+4H7pIStPmyQ7s5DZHdzHlgA
   g==;
X-CSE-ConnectionGUID: uGPwAZP8THCbrRiQiZ6jeQ==
X-CSE-MsgGUID: R+NxpwiASEGGDF8+/qcZdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35773082"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="35773082"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 05:14:18 -0800
X-CSE-ConnectionGUID: sWDZAvcsQnaF7oCLst3wHA==
X-CSE-MsgGUID: wU6dLRrCQ3OkSb2cooduQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100399438"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Dec 2024 05:14:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQngs-0002aj-27;
	Thu, 26 Dec 2024 13:14:14 +0000
Date: Thu, 26 Dec 2024 21:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 3610/5236] io_uring/io_uring.h:229:27: error:
 implicit declaration of function 'io_cache_alloc'; did you mean
 'kmem_cache_alloc'?
Message-ID: <202412262106.bjOOaZcE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 694022b01368387cc1ed8485e279dfe27939ee43 [3610/5236] io_uring: Add generic helper to allocate async data
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241226/202412262106.bjOOaZcE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412262106.bjOOaZcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412262106.bjOOaZcE-lkp@intel.com/

Note: the linux-next/master HEAD 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:82:
   io_uring/io_uring.h: In function 'io_uring_alloc_async_data':
>> io_uring/io_uring.h:229:27: error: implicit declaration of function 'io_cache_alloc'; did you mean 'kmem_cache_alloc'? [-Werror=implicit-function-declaration]
     229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
         |                           ^~~~~~~~~~~~~~
         |                           kmem_cache_alloc
   io_uring/io_uring.h:229:25: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
         |                         ^
   In file included from io_uring/io_uring.c:104:
   io_uring/alloc_cache.h: At top level:
>> io_uring/alloc_cache.h:33:21: error: conflicting types for 'io_cache_alloc'; have 'void *(struct io_alloc_cache *, gfp_t,  void (*)(void *))' {aka 'void *(struct io_alloc_cache *, unsigned int,  void (*)(void *))'}
      33 | static inline void *io_cache_alloc(struct io_alloc_cache *cache, gfp_t gfp,
         |                     ^~~~~~~~~~~~~~
   io_uring/io_uring.h:229:27: note: previous implicit declaration of 'io_cache_alloc' with type 'int()'
     229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
         |                           ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from io_uring/opdef.c:11:
   io_uring/io_uring.h: In function 'io_uring_alloc_async_data':
>> io_uring/io_uring.h:229:27: error: implicit declaration of function 'io_cache_alloc'; did you mean 'kmem_cache_alloc'? [-Werror=implicit-function-declaration]
     229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
         |                           ^~~~~~~~~~~~~~
         |                           kmem_cache_alloc
   io_uring/io_uring.h:229:25: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
         |                         ^
   cc1: some warnings being treated as errors


vim +229 io_uring/io_uring.h

   224	
   225	static inline void *io_uring_alloc_async_data(struct io_alloc_cache *cache,
   226						      struct io_kiocb *req,
   227						      void (*init_once)(void *obj))
   228	{
 > 229		req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
   230		if (req->async_data)
   231			req->flags |= REQ_F_ASYNC_DATA;
   232		return req->async_data;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
