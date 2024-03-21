Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0483CD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026169; cv=none; b=oVexo/DBh45sVe/wGWkeUOSkmRT0kK1kP5JMI5cUjKnXFu5BAC5N1fQYO6eP9YecctjnIjm5ICcOkJLjz5yy6SFJU5VIIkz/fmro9v53k2XnJMxzp/uNowOw5K5xyzKSM1GS1VQsSkd2TeMu2oKesvh/eoLXvKDh8TNMeJie1W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026169; c=relaxed/simple;
	bh=KXVBW62jTqtTWw03U9lOdQxrzdHclYbvPgwTt1VgHLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jx2VBlk+Q3Z3FD4pH+UXwdnJfHRg43B8aksG6++j/yd2xKXo3uQ8XwcD8VHFh0AfrbiGikWXTEvn3eVDmpZtZHGINsAqy0wOoNEPla9u8M0MVq8p8pQxtYl53G6rIEfDbt1AtfQbcrCMqw4W/yceYLtWEwrXxbGNLez5yGm1F4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pc6ybA4p; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pc6ybA4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711026168; x=1742562168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXVBW62jTqtTWw03U9lOdQxrzdHclYbvPgwTt1VgHLg=;
  b=Pc6ybA4pH8sNcHlxB8R7rOcOF0yIclJA+3uaohMZ9ILlp8VnYqeDtTvd
   gWdj2SBgBn5KcLfoLvJDnJhNs5LgT7g7x7xJ8t77HUTHDo8LrhnxxGBuR
   VpVzIMZX82JoHCD3+Vz04oUvZngXr0l8HeMCocMdKMph9eLPFU9TIw7ij
   bKMUKNQgbtiEA6vU5D1MBL/tiC8JeGk3eqgYrcLEvY7Lxs51J8TnOMye9
   Zw5pCRDNOfeeLBsREVO3c+dX5LJRHuGs0enq/tIHRiXuCs3cmpalxiKxd
   0mxhlW1CX1kito1l0hK1AAOsRZsJH39OpIVxPu3Lv3NPX09BUo3jnspjP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6618734"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6618734"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 06:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="14473772"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2024 06:02:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnI4B-000JQl-3D;
	Thu, 21 Mar 2024 13:02:43 +0000
Date: Thu, 21 Mar 2024 21:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:twf-hoist 568/627] fs/iomap/buffered-io.c:432:10:
 warning: return makes pointer from integer without a cast
Message-ID: <202403212006.omSDqbcm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git twf-hoist
head:   709c2aed7586c3ac6a9d636355c623611d5c14d1
commit: f0f93bf8ee6030bdb20d406b20b6632cac7aa8bc [568/627] iomap: dynamically allocate fsverity bioset
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240321/202403212006.omSDqbcm-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403212006.omSDqbcm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403212006.omSDqbcm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/iomap/buffered-io.c: In function 'iomap_read_bio_alloc':
   fs/iomap/buffered-io.c:432:10: error: implicit declaration of function 'iomap_fsverity_read_bio_alloc'; did you mean 'iomap_verity_read_bio_alloc'? [-Werror=implicit-function-declaration]
      return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             iomap_verity_read_bio_alloc
>> fs/iomap/buffered-io.c:432:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
      return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +432 fs/iomap/buffered-io.c

   425	
   426	static struct bio *iomap_read_bio_alloc(struct inode *inode,
   427			struct block_device *bdev, int nr_vecs, gfp_t gfp)
   428	{
   429		struct bio *bio;
   430	
   431		if (fsverity_active(inode))
 > 432			return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
   433	
   434		bio = bio_alloc(bdev, nr_vecs, REQ_OP_READ, gfp);
   435		if (bio)
   436			bio->bi_end_io = iomap_read_end_io;
   437		return bio;
   438	}
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
