Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF75E757F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 13:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026891; cv=none; b=XQF95pdZZ60zutjtzUzGl4nYEtImkvRUn8btbpGB2QzWjNQtevm/IOKKBL8mrBkKQd9m+LMmP2z0vIm7WbUlcEy093h0pcGxHGOA9R/ncECp/+P6aMEE5uyjm43XiaR9NQWvpzrmvi61469KwErLFzP+lirBGI13m4mr1UChNmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026891; c=relaxed/simple;
	bh=/PaL1FfqLc9oQAbyMNJOrHv4JfGrJC32t5kkki8HCaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=euX2IqDlQdvJT3X2YdB/I26vWVFVKrMJjoZCjUr+F0UqKlmjtwAB8VkEcRWSXff0kxQVn6D7oyxGXLD/2gpw214QGncLYGEVSJao33ryiXY9GyUFJCi6AYsvJuBzSxuFzef8ISL880lyzh3y1ZlAyaDGJQBoAcf0x6VNSOPUD9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLlWJS0Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLlWJS0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711026889; x=1742562889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/PaL1FfqLc9oQAbyMNJOrHv4JfGrJC32t5kkki8HCaQ=;
  b=aLlWJS0Z9C1Cj5mtGbliXuP1ssGGbcStZhHM+VrOI1udEzgLwaWk47xx
   5+LlnX6uN3AEMTPJFO/ShF7bkB5BytltdZjzf1bJsjeWr7zgdiMZk08IL
   QbaMgGs1/v2bvMdyMRHBsc0b73dbXzmPw9yxxQoIffdEMWr8fP9FXWbwa
   haibJ5g1UhO/oIusskbuxyxBBfRAegJ6JY2KUoEqe4dvMchtovsLa95Mn
   9cOvyhmEBwW15RJX17+R5mS7YJEigA8bF1htKBCcTjT/aqT80Wp87wRye
   MoNdIrXgWMUqkxoJYTuxua8NbpSHsH2bgssJ0wqe9FColj6D8opJzo9MC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5904346"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5904346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 06:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="18974595"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Mar 2024 06:14:47 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnIFo-000JRd-1Y;
	Thu, 21 Mar 2024 13:14:44 +0000
Date: Thu, 21 Mar 2024 21:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:twf-hoist 568/627] fs/iomap/buffered-io.c:432:10:
 warning: incompatible integer to pointer conversion returning 'int' from a
 function with result type 'struct bio *'
Message-ID: <202403212150.OEzH3SSX-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240321/202403212150.OEzH3SSX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403212150.OEzH3SSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403212150.OEzH3SSX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/iomap/buffered-io.c:432:10: error: implicit declaration of function 'iomap_fsverity_read_bio_alloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
                          ^
   fs/iomap/buffered-io.c:432:10: note: did you mean 'iomap_read_bio_alloc'?
   fs/iomap/buffered-io.c:426:20: note: 'iomap_read_bio_alloc' declared here
   static struct bio *iomap_read_bio_alloc(struct inode *inode,
                      ^
>> fs/iomap/buffered-io.c:432:10: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct bio *' [-Wint-conversion]
                   return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


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
