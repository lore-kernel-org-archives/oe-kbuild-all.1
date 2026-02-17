Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16663191A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321835; cv=none; b=t5Muj2Xe0UbkJRGvIZ/0xTImvQextLXxuvIATcYG1eZaYrYpXE/1jWqMaDDj2+hb7nXFcUlYf+N7jW3rl1ucjbTS4q/j222W+k0gnzHXeNS/tU0D2ARL2uqnjXgthvAKjn+krNnWNqeub2D7kZg8nKcFlM5nFjDe/aBybfGgbKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321835; c=relaxed/simple;
	bh=Yk5hcvtQv0o+gk6T6LwZ3vgMD8h+KtDZDL2IXitLEjM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vCRUdMggvBUjR4U4UISi0kTvJgqOElKr/pqcDsdtGaWCqcV1VNBeENbkTwcFmFBQHFn1lxXYCEYpWR53Y2lpC5Is/nm0wvOpMHGRImGLplJSMneq5WaKL1XA3zxKlLqIIhb5d9LIzwpkf5wGEfoYd5ciDwjHqaWeyupiZ2Y4xtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nciltnab; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nciltnab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771321834; x=1802857834;
  h=date:from:to:cc:subject:message-id;
  bh=Yk5hcvtQv0o+gk6T6LwZ3vgMD8h+KtDZDL2IXitLEjM=;
  b=nciltnabdYyEXpdMEEmodUv2Xn60eHhs9PiA7L/5TJgQBWYYZDDTKMr0
   IldLE/Ahi43PE+MIz51c1buTMwsZMU1EsXWAMl+i7HKwbCigHEHOdvH2A
   oqNteJ0lkrniVZvyQmiyH8QljGOboEn4Xhz5USSuX0LckVvXKcOmdYX4y
   FH2srY9cJJWxekiURJnB90pzy1tuZGiF15WBDjAiTbaiXrRcEQKrjbJWU
   EiQW/2Rol1FMXmWG3t2O82YnbqIvsKBa031nrQpLy2uoTItuZ+PM2h9qg
   mzzDaFWrX8xZKlD/ofETksKCbL+dncsrQkijqlRE6CRC5orOMCP/Z0eWr
   A==;
X-CSE-ConnectionGUID: ngwEF686TzGRdBhZdYNL+Q==
X-CSE-MsgGUID: s9/LweXQQWaefdIJKrJiiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89800158"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="89800158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 01:50:33 -0800
X-CSE-ConnectionGUID: 5/K0e9rUT2ayDhhGSxbpWw==
X-CSE-MsgGUID: L7brBVhSSpGp41sxOdqbDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="217974277"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Feb 2026 01:50:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsHiv-000000010oY-1FOq;
	Tue, 17 Feb 2026 09:50:29 +0000
Date: Tue, 17 Feb 2026 17:50:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:fscrypt-cleanups 3/9] fs/iomap/direct-io.c:331:33:
 error: use of undeclared identifier 'inode'
Message-ID: <202602171714.zRWkLYLz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git fscrypt-cleanups
head:   af3ddc7f7251efaa3de8e2cfd065b48f626ec07c
commit: 354fa3379b4323e3e65859da85e4b5c9b80184f3 [3/9] fscrypt: pass a byte offset to fscrypt_set_bio_crypt_ctx
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260217/202602171714.zRWkLYLz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171714.zRWkLYLz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171714.zRWkLYLz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/iomap/direct-io.c:331:33: error: use of undeclared identifier 'inode'
     331 |         fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_KERNEL);
         |                                        ^~~~~
   1 error generated.


vim +/inode +331 fs/iomap/direct-io.c

   316	
   317	static ssize_t iomap_dio_bio_iter_one(struct iomap_iter *iter,
   318			struct iomap_dio *dio, loff_t pos, unsigned int alignment,
   319			blk_opf_t op)
   320	{
   321		unsigned int nr_vecs;
   322		struct bio *bio;
   323		ssize_t ret;
   324	
   325		if (dio->flags & IOMAP_DIO_BOUNCE)
   326			nr_vecs = bio_iov_bounce_nr_vecs(dio->submit.iter, op);
   327		else
   328			nr_vecs = bio_iov_vecs_to_alloc(dio->submit.iter, BIO_MAX_VECS);
   329	
   330		bio = iomap_dio_alloc_bio(iter, dio, nr_vecs, op);
 > 331		fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_KERNEL);
   332		bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
   333		bio->bi_write_hint = iter->inode->i_write_hint;
   334		bio->bi_ioprio = dio->iocb->ki_ioprio;
   335		bio->bi_private = dio;
   336		bio->bi_end_io = iomap_dio_bio_end_io;
   337	
   338		if (dio->flags & IOMAP_DIO_BOUNCE)
   339			ret = bio_iov_iter_bounce(bio, dio->submit.iter);
   340		else
   341			ret = bio_iov_iter_get_pages(bio, dio->submit.iter,
   342						     alignment - 1);
   343		if (unlikely(ret))
   344			goto out_put_bio;
   345		ret = bio->bi_iter.bi_size;
   346	
   347		/*
   348		 * An atomic write bio must cover the complete length.  If it doesn't,
   349		 * error out.
   350		 */
   351		if ((op & REQ_ATOMIC) && WARN_ON_ONCE(ret != iomap_length(iter))) {
   352			ret = -EINVAL;
   353			goto out_put_bio;
   354		}
   355	
   356		if (dio->flags & IOMAP_DIO_WRITE)
   357			task_io_account_write(ret);
   358		else if ((dio->flags & IOMAP_DIO_USER_BACKED) &&
   359			 !(dio->flags & IOMAP_DIO_BOUNCE))
   360			bio_set_pages_dirty(bio);
   361	
   362		/*
   363		 * We can only poll for single bio I/Os.
   364		 */
   365		if (iov_iter_count(dio->submit.iter))
   366			dio->iocb->ki_flags &= ~IOCB_HIPRI;
   367		iomap_dio_submit_bio(iter, dio, bio, pos);
   368		return ret;
   369	
   370	out_put_bio:
   371		bio_put(bio);
   372		return ret;
   373	}
   374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
