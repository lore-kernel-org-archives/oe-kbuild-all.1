Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C11A137E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 01:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752802682; cv=none; b=Txk/akTrO1UvH3EXOCAa8RMTmPqsgL5iPQ9DIPwpyM4JdRUt4DDbCXCy+i9o/5E94DlpCvodm25ltTi8L7+6xtu0bnvH6GjGkW1fCXB1HIQSZiT8eO0KB2b5PflKepkoEWHqucMCfbA0zGdhwrp6JHXXMa0ICJRctXaeK20llMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752802682; c=relaxed/simple;
	bh=EJA8B3lfGCqTeL43aNoKncVQBQlIlHtfCGqlf4mn5hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PO6ASwCDL6ZEcFbwtYs75pq6OrKuuKLQT08JqyDE15eDXqJMeAmgpIWGLCcfRffWkyaacUsbAImOAtDpV97hnXXyd6e0XgX7fHHQTOtn7yl4F33wor3x3Uf1hdvxcGimY1HFleEcAhoOdn/9xRF5cHpwks9Ttfu11qaY2J/lXmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7oUpFWv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7oUpFWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752802681; x=1784338681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJA8B3lfGCqTeL43aNoKncVQBQlIlHtfCGqlf4mn5hc=;
  b=R7oUpFWvgswKiU8Gti84Ws7iw6Vt/6ImD+G9AlRuzfFcyxDF/HyM/aRr
   aZPynJ8WOAe1HDZcN8XnuZELYd1fcfQ7wHRw8UGspXuM0KdHBGcm9fvWc
   S/9onTh/BCb9xMn6qnQVByzpjzhWe/fcFpcNAUw+ziuXZFO+ebt9MSAFT
   U5wAv1lfOGUpxAOVPVa+qCZhf04YJOyEGB3gLNOGjQCVmy1VQ81R4UsLj
   K0GvvXvROzAq0ATQg9YQ7/DYtJbcuJ7qKg3mODVZv0zjkJBT0jMEftxFI
   dk0bIFiOLtsxSbcafhcXqDy895RrMs6drgUZulSvNCVqy92X1LBRw/uxz
   g==;
X-CSE-ConnectionGUID: p3xka4DdQ4+Y4lc+7KBUqQ==
X-CSE-MsgGUID: dnGGk5jNQ82U16s/xR0OKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72661776"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="72661776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 18:38:00 -0700
X-CSE-ConnectionGUID: byjaMlEvT4KY5aYLHyW54A==
X-CSE-MsgGUID: RB+7T23DTf+Nn1GcCt77vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="162216195"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2025 18:37:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uca2u-000ECt-2K;
	Fri, 18 Jul 2025 01:37:56 +0000
Date: Fri, 18 Jul 2025 09:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 48/51] fs/fuse/iomap_cache.h:80:40:
 error: passing argument 3 of 'fuse_iext_get_extent' from incompatible
 pointer type
Message-ID: <202507180922.IDnSuYOP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   8d9ad793abc024194fa099a58b6264b25d0487b1
commit: 703ff795782367828436b3f9f0f2d6d00ee8bcd5 [48/51] fuse: cache iomaps
config: arm-randconfig-002-20250718 (https://download.01.org/0day-ci/archive/20250718/202507180922.IDnSuYOP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180922.IDnSuYOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180922.IDnSuYOP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/fuse/dev.c:12:
   fs/fuse/iomap_cache.h:40:51: warning: 'struct fuse_iomap_cache' declared inside parameter list will not be visible outside of this definition or declaration
    struct fuse_ifork *fuse_iext_state_to_fork(struct fuse_iomap_cache *ip,
                                                      ^~~~~~~~~~~~~~~~
   fs/fuse/iomap_cache.h:47:17: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
       const struct fuse_iomap *irec);
                    ^~~~~~~~~~
   fs/fuse/iomap_cache.h:44:35: warning: 'struct fuse_iomap_cache' declared inside parameter list will not be visible outside of this definition or declaration
    void  fuse_iext_insert_raw(struct fuse_iomap_cache *ip,
                                      ^~~~~~~~~~~~~~~~
   fs/fuse/iomap_cache.h:50:17: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
       const struct fuse_iomap *, int);
                    ^~~~~~~~~~
   fs/fuse/iomap_cache.h:48:31: warning: 'struct fuse_iomap_cache' declared inside parameter list will not be visible outside of this definition or declaration
    void  fuse_iext_insert(struct fuse_iomap_cache *,
                                  ^~~~~~~~~~~~~~~~
   fs/fuse/iomap_cache.h:51:31: warning: 'struct fuse_iomap_cache' declared inside parameter list will not be visible outside of this definition or declaration
    void  fuse_iext_remove(struct fuse_iomap_cache *,
                                  ^~~~~~~~~~~~~~~~
   fs/fuse/iomap_cache.h:59:11: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
       struct fuse_iomap *gotp);
              ^~~~~~~~~~
   fs/fuse/iomap_cache.h:56:38: warning: 'struct fuse_iomap_cache' declared inside parameter list will not be visible outside of this definition or declaration
    bool  fuse_iext_lookup_extent(struct fuse_iomap_cache *ip,
                                         ^~~~~~~~~~~~~~~~
   fs/fuse/iomap_cache.h:63:11: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
       struct fuse_iomap *gotp);
              ^~~~~~~~~~
   fs/fuse/iomap_cache.h:60:45: warning: 'struct fuse_iomap_cache' declared inside parameter list will not be visible outside of this definition or declaration
    bool  fuse_iext_lookup_extent_before(struct fuse_iomap_cache *ip,
                                                ^~~~~~~~~~~~~~~~
   fs/fuse/iomap_cache.h:66:11: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
       struct fuse_iomap *gotp);
              ^~~~~~~~~~
   fs/fuse/iomap_cache.h:69:11: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
       struct fuse_iomap *gotp);
              ^~~~~~~~~~
   fs/fuse/iomap_cache.h:67:38: warning: 'struct fuse_iomap_cache' declared inside parameter list will not be visible outside of this definition or declaration
    void  fuse_iext_update_extent(struct fuse_iomap_cache *ip, int state,
                                         ^~~~~~~~~~~~~~~~
   fs/fuse/iomap_cache.h:77:40: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
      struct fuse_iext_cursor *cur, struct fuse_iomap *gotp)
                                           ^~~~~~~~~~
   fs/fuse/iomap_cache.h: In function 'fuse_iext_next_extent':
>> fs/fuse/iomap_cache.h:80:40: error: passing argument 3 of 'fuse_iext_get_extent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return fuse_iext_get_extent(ifp, cur, gotp);
                                           ^~~~
   fs/fuse/iomap_cache.h:66:23: note: expected 'struct fuse_iomap *' but argument is of type 'struct fuse_iomap *'
       struct fuse_iomap *gotp);
       ~~~~~~~~~~~~~~~~~~~^~~~
   fs/fuse/iomap_cache.h: At top level:
   fs/fuse/iomap_cache.h:84:40: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
      struct fuse_iext_cursor *cur, struct fuse_iomap *gotp)
                                           ^~~~~~~~~~
   fs/fuse/iomap_cache.h: In function 'fuse_iext_prev_extent':
   fs/fuse/iomap_cache.h:87:40: error: passing argument 3 of 'fuse_iext_get_extent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return fuse_iext_get_extent(ifp, cur, gotp);
                                           ^~~~
   fs/fuse/iomap_cache.h:66:23: note: expected 'struct fuse_iomap *' but argument is of type 'struct fuse_iomap *'
       struct fuse_iomap *gotp);
       ~~~~~~~~~~~~~~~~~~~^~~~
   fs/fuse/iomap_cache.h: At top level:
   fs/fuse/iomap_cache.h:94:40: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
      struct fuse_iext_cursor *cur, struct fuse_iomap *gotp)
                                           ^~~~~~~~~~
   fs/fuse/iomap_cache.h: In function 'fuse_iext_peek_next_extent':
   fs/fuse/iomap_cache.h:99:42: error: passing argument 3 of 'fuse_iext_get_extent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return fuse_iext_get_extent(ifp, &ncur, gotp);
                                             ^~~~
   fs/fuse/iomap_cache.h:66:23: note: expected 'struct fuse_iomap *' but argument is of type 'struct fuse_iomap *'
       struct fuse_iomap *gotp);
       ~~~~~~~~~~~~~~~~~~~^~~~
   fs/fuse/iomap_cache.h: At top level:
   fs/fuse/iomap_cache.h:106:40: warning: 'struct fuse_iomap' declared inside parameter list will not be visible outside of this definition or declaration
      struct fuse_iext_cursor *cur, struct fuse_iomap *gotp)
                                           ^~~~~~~~~~
   fs/fuse/iomap_cache.h: In function 'fuse_iext_peek_prev_extent':
   fs/fuse/iomap_cache.h:111:42: error: passing argument 3 of 'fuse_iext_get_extent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return fuse_iext_get_extent(ifp, &ncur, gotp);
                                             ^~~~
   fs/fuse/iomap_cache.h:66:23: note: expected 'struct fuse_iomap *' but argument is of type 'struct fuse_iomap *'
       struct fuse_iomap *gotp);
       ~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/fuse_iext_get_extent +80 fs/fuse/iomap_cache.h

    75	
    76	static inline bool fuse_iext_next_extent(struct fuse_ifork *ifp,
    77			struct fuse_iext_cursor *cur, struct fuse_iomap *gotp)
    78	{
    79		fuse_iext_next(ifp, cur);
  > 80		return fuse_iext_get_extent(ifp, cur, gotp);
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
