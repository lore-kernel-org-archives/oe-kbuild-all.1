Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B58285CA4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782300075; cv=none; b=RKJNUyqPlT6oFKb1sM6qJiJwHnp4Qxp3ois6gfwZBS+nMngchKCQEEPCXydOnonOu2+/qcHxW/z2AsCJWxMTQ6YgSGyjeZa/Vf+438wlqSJcWNF/jHfu0phGkcQ1PXGoe7TCPYM7+cLMQbQJSxkfDTFlw7QpB+XlXRg1oqaSdOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782300075; c=relaxed/simple;
	bh=/Sa3uEScwp/MNTQEiEfGnCgJlCslkKJwH54oJdcb26Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DLkj2hZ9DNJVvbA7JQUd49S0JaCWD/ykPiDotgWda10hvk/v/7UqyyO+CPHO9ENCLljuPWhf/Dty4AtXQfzE6IKn0vWSXaLjFbnpjBDq+vI1jaIsD3HFcnDdS2qQ+5QHE+hpGV69+/hvOTRrNXbDnEbrviIOvHqSIz2zgqyKnzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/nVJAy3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/nVJAy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782300074; x=1813836074;
  h=date:from:to:cc:subject:message-id;
  bh=/Sa3uEScwp/MNTQEiEfGnCgJlCslkKJwH54oJdcb26Y=;
  b=i/nVJAy36AGkUW6BTmT0OtNhe5v1XPKgwg75fjmG38DZ3xHODqX/ZfsZ
   nQP7XY1E5RJSjuCWn9z9eYlCg3EZqdcNPgi/CwRakDepe00mWDnXjSKF3
   KX3W2Cheo+JLBFX9ehl2RIGhBgVsJGY9lMAolMmSv2Jy1NcuUcoy9f6Ag
   7/6S6iFi831AM5p8oJ6OaKA7UuAkbsHOcjdAKA2pMLhJUCpvn0Xd1iwaQ
   m0eybqI0suZgJEEU+GQZGj4MztseEEft+OoXFW7KWgb1q36zV4cBQJSCl
   XDaNtz7tAlZ3luClf8TECN1NTIcEfgNr9/F1dskIy5lwRUe7pSZoHlkAy
   g==;
X-CSE-ConnectionGUID: oXNgi2l5Q8qxqei0asBkdA==
X-CSE-MsgGUID: ScxVLpHTRPiiydXNaL2Aow==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82039231"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="82039231"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 04:21:13 -0700
X-CSE-ConnectionGUID: TvL8Tg2LTxyHbNBTM1gjxQ==
X-CSE-MsgGUID: QpJSNKlQSA6U4qOrCMq8oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="287932897"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Jun 2026 04:21:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcLf9-000000003J7-0u43;
	Wed, 24 Jun 2026 11:21:04 +0000
Date: Wed, 24 Jun 2026 19:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:fscrypt-pending 21/22] fs/crypto/block.c:361:17:
 sparse: sparse: cast from restricted blk_status_t
Message-ID: <202606241906.ozL5jpWr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git fscrypt-pending
head:   458617e964eabfd201862b2ebdc538e7906ddf15
commit: db7c0e5b6866c3230c97157ddf48e548f6ae476b [21/22] fscrypt: Merge bio.c and inline_crypt.c into block.c
config: parisc-randconfig-r121-20260624 (https://download.01.org/0day-ci/archive/20260624/202606241906.ozL5jpWr-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241906.ozL5jpWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241906.ozL5jpWr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/block.c:361:17: sparse: sparse: cast from restricted blk_status_t
>> fs/crypto/block.c:361:17: sparse: sparse: cast from restricted blk_status_t
>> fs/crypto/block.c:361:17: sparse: sparse: cast to restricted blk_status_t

vim +361 fs/crypto/block.c

   355	
   356	static void fscrypt_zeroout_range_end_io(struct bio *bio)
   357	{
   358		struct fscrypt_zero_done *done = bio->bi_private;
   359	
   360		if (bio->bi_status)
 > 361			cmpxchg(&done->status, 0, bio->bi_status);
   362		fscrypt_zeroout_range_done(done);
   363		bio_put(bio);
   364	}
   365	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
