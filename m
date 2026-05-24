Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53240158535
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779626288; cv=none; b=cbLpAKy1AK2Wok6fWEVLZGcYGgjzS2wUErBYBbGpQzrY+IU4yiIH2+6hiKGjX+KDCKZff2DSDSJoCwc8gb7JNGhfvaFwq5v5ShjrkeLyhZGx4TtgZHhMa6u/8cWnKe05bO2sU6FW8OVIxQc7PPjSu2KkQaZ598cPprb/Xk0CxVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779626288; c=relaxed/simple;
	bh=ZWzKf8jlvLHI6w6iY+GIeGUoXIpE4PDzgfunN4cd8ao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DSImWYYoq90T4Y50/OyMWmz/NPBKNBqoU3IaDWflAjk5hZYOo15ABnUxVOmd+T00aTX5AJv+FIeJMNZAa/QKpFyG0OXws4c9ccG+R4uwmDkGJ8Y0SDe0k1hrM9D7kdc9vTFpiuwFEa4QtpeDfTwqz7TPvjXtPlD0HAJTvR07WuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgRZmM0a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgRZmM0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779626285; x=1811162285;
  h=date:from:to:cc:subject:message-id;
  bh=ZWzKf8jlvLHI6w6iY+GIeGUoXIpE4PDzgfunN4cd8ao=;
  b=MgRZmM0aN3bCYOkPX9dofpAmOeoM7lL3hY461S+GxnVqsXCxrk5wzS3P
   GpnIIgjgsbABosEo6UcIMGU7Wg5mJOhWcRyCUfxGzRy52JpVD4eR+8IX2
   Vl2yFG3GpTyBejqiiCTUukpVHdDFbZjuWLoQBJDCgYjpGPZN20BzH7GFB
   ewFRNx/okPuiT8UdC/kSx/B9vWEARa0zgQbClE5oajQBLakZcCAWQcbX1
   hebDqWrQ4al3/o2MuJe0BUGxUn605MIK3OqnRm3C4+9+O+TWD0mt5ib0r
   KWdybXAbzM6uC3ez3FZS5kmruLAOlmxzWOXJVHa4a8/AoacHRlVYAbU88
   A==;
X-CSE-ConnectionGUID: y40P+pELQlKI83++oppUvg==
X-CSE-MsgGUID: Snq9aX3xQmKavHxQQ9C6HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91867160"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91867160"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 05:38:05 -0700
X-CSE-ConnectionGUID: BQH4eBXQSEGhypxmfsHMmQ==
X-CSE-MsgGUID: KNgj92drQ9W4RXeaTbiPXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="238784897"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 May 2026 05:38:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR85h-000000000Ev-0WxD;
	Sun, 24 May 2026 12:38:01 +0000
Date: Sun, 24 May 2026 20:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:bvec-iter-cleanups 1/1]
 include/linux/bvec.h:230:43: warning: passing argument 1 of
 'mp_bvec_iter_bvec' discards 'const' qualifier from pointer target type
Message-ID: <202605242053.TvET4znf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git bvec-iter-cleanups
head:   f63858e85ce2b2cc55d98747311fd65088d1577d
commit: f63858e85ce2b2cc55d98747311fd65088d1577d [1/1] bvec: make the bvec_iter helpers inline functions
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260524/202605242053.TvET4znf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605242053.TvET4znf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605242053.TvET4znf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from include/linux/io_uring_types.h:4,
                    from include/linux/io_uring/cmd.h:6,
                    from io_uring/rsrc.c:12:
   io_uring/rsrc.c: In function 'io_vec_fill_kern_bvec':
>> include/linux/bvec.h:230:43: warning: passing argument 1 of 'mp_bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     230 |                 ((bvl = mp_bvec_iter_bvec((bio_vec), (iter))), 1);      \
         |                                           ^~~~~~~~~
   io_uring/rsrc.c:1419:17: note: in expansion of macro 'for_each_mp_bvec'
    1419 |                 for_each_mp_bvec(bv, src_bvec, bi, bi)
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:140:35: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     140 | mp_bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                   ~~~~~~~~~~~~~~~~^~~~~
--
   lib/iov_iter.c: In function 'iov_iter_extract_bvec_pages':
>> lib/iov_iter.c:1633:53: warning: passing argument 1 of 'bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1633 |                 struct bio_vec bv = bvec_iter_bvec(i->bvec, bi);
         |                                                    ~^~~~~~
   In file included from lib/iov_iter.c:3:
   include/linux/bvec.h:171:32: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     171 | bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                ~~~~~~~~~~~~~~~~^~~~~


vim +230 include/linux/bvec.h

7e24969022cbd61 Ming Lei       2020-08-17  220  
8fc554552c9d89e Ming Lei       2016-06-09  221  #define for_each_bvec(bvl, bio_vec, iter, start)			\
8fc554552c9d89e Ming Lei       2016-06-09  222  	for (iter = (start);						\
8fc554552c9d89e Ming Lei       2016-06-09  223  	     (iter).bi_size &&						\
8fc554552c9d89e Ming Lei       2016-06-09  224  		((bvl = bvec_iter_bvec((bio_vec), (iter))), 1);	\
6b6667aa4d1e086 Pavel Begunkov 2020-11-24  225  	     bvec_iter_advance_single((bio_vec), &(iter), (bvl).bv_len))
8fc554552c9d89e Ming Lei       2016-06-09  226  
149974fdb8e186a Ming Lei       2025-03-25  227  #define for_each_mp_bvec(bvl, bio_vec, iter, start)			\
149974fdb8e186a Ming Lei       2025-03-25  228  	for (iter = (start);						\
149974fdb8e186a Ming Lei       2025-03-25  229  	     (iter).bi_size &&						\
149974fdb8e186a Ming Lei       2025-03-25 @230  		((bvl = mp_bvec_iter_bvec((bio_vec), (iter))), 1);	\
149974fdb8e186a Ming Lei       2025-03-25  231  	     bvec_iter_advance_single((bio_vec), &(iter), (bvl).bv_len))
149974fdb8e186a Ming Lei       2025-03-25  232  

:::::: The code at line 230 was first introduced by commit
:::::: 149974fdb8e186a1c72b87cee806373624a8a375 block: add for_each_mp_bvec()

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
