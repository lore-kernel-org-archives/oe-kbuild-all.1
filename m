Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F113959D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395233; cv=none; b=JRO6al0cYCr9H15TARvQ6MAbjmqYOtIhFpgJzhaXOZT+0WkwqmDrAGjpfw5MdcukLT3IJ67ts3kT0mKx91D3w9LXl/ykwWR5FYK+USzgJzlXdNg2MLma/LucwXtaIuiUXMseYzc8nb4MS3Rdp7VxWPsChbCjkK4YiAofA4b4ZEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395233; c=relaxed/simple;
	bh=sjJ/aV4I2zw+5pTKbq2KmAQsFDEIhFJopXbFmE+8LKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oNiURO564aTWMl5tz74F1LoT5boLP5SqohyNJtMVRFrPEWCU1Fe2aBFURaVU06HtwlX/6+i92srh7pWfN5bFW80+jeAS39iCOn2EyooATnA4zOrQwP8UzAlLoMTQNomWW/BTrGavqLxNxRNjQOwuXkVRbMkDphakaukC5JJ6IN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ms1I4Jin; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ms1I4Jin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766395232; x=1797931232;
  h=date:from:to:cc:subject:message-id;
  bh=sjJ/aV4I2zw+5pTKbq2KmAQsFDEIhFJopXbFmE+8LKk=;
  b=Ms1I4JinejQ0dUK2oa1W2UpO3ifEwLilv/PIH+L8Cq1QTI1AE3nRDGae
   J8KujhJaWpCmrZnFSjctXVzYIZJHmzQjUd9HzFFjaX5mh3PqQdLEBXR0a
   zlq+Y50d+LXAHv+jD9G9jX5ROpMwNJ6QDMFg3EwLJjS0UVITaXseR8EVn
   8gylmCXC8XKLw/P/7n7IgD7mgQHDsa9jWsGNPKOUxP+ZV6q5NeOnNxLGV
   7GmIDRDZ2QvqKHqJL2SqKVV7V7oJcf0Ix/3VQoFkeGwJmvIk7KCjjE3U5
   IfjLisGkDsDWbgh869omINRkQikqzQZx32Q+RpxVumGDEEsIQU9/UF9H7
   Q==;
X-CSE-ConnectionGUID: XsR7fIiGQE+9GpTu6EOCAQ==
X-CSE-MsgGUID: z5qEOY1UT466CgxtLtrUMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="71880390"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="71880390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:20:31 -0800
X-CSE-ConnectionGUID: 9sDSD439QkaHjKZc/pPcPQ==
X-CSE-MsgGUID: AA3/JxU6SC6385EKv2NrtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="204010695"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2025 01:20:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXc5S-000000000Jl-0JIZ;
	Mon, 22 Dec 2025 09:20:19 +0000
Date: Mon, 22 Dec 2025 17:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 928/1155]
 fs/bcachefs/data/compress.c:91:13: warning: 'bio_phys_contig' defined but not
 used
Message-ID: <202512221725.LaWJl1D6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   4f049ce84e68ab1195439b4a3ed394d7363d60b5
commit: 9d8c0abd05770eb55042839e565e3cf44302af44 [928/1155] bcachefs: kill off bvec.bv_page uses
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251222/202512221725.LaWJl1D6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221725.LaWJl1D6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221725.LaWJl1D6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/compress.c:91:13: warning: 'bio_phys_contig' defined but not used [-Wunused-function]
      91 | static bool bio_phys_contig(struct bio *bio, struct bvec_iter start)
         |             ^~~~~~~~~~~~~~~


vim +/bio_phys_contig +91 fs/bcachefs/data/compress.c

2fa23a10a54b61f fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30   90  
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  @91  static bool bio_phys_contig(struct bio *bio, struct bvec_iter start)
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   92  {
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   93  	struct bio_vec bv;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   94  	struct bvec_iter iter;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   95  	void *expected_start = NULL;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   96  
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   97  	__bio_for_each_bvec(bv, bio, iter, start) {
9d8c0abd05770eb fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17   98  		void *bv_addr = bvec_virt(&bv);
9d8c0abd05770eb fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17   99  
9d8c0abd05770eb fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17  100  		if (expected_start && expected_start != bv_addr)
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  101  			return false;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  102  
9d8c0abd05770eb fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17  103  		expected_start = bv_addr + bv.bv_len;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  104  	}
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  105  
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  106  	return true;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  107  }
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  108  

:::::: The code at line 91 was first introduced by commit
:::::: c4dd7871ef71a7327b6b3834e2cdf6777e03eb0a bcachefs: Some compression improvements

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
