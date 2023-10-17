Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC02347B1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 18:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAsLd/k1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697568449; x=1729104449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8O72VjfyLRZVHNnOBjlpsO9WnQYwnunCfne7omQ4Ok=;
  b=kAsLd/k1Blpld3bm4L8ir5TIJr0A5tkOARqiBVokrpWW1mxWsm6q6+CV
   qKCCoY8Nhc5hwiJeQbV15hrVEROZbAYP16HO1LQZ2WtJULhOBIIFx7gg3
   /uIlj2pj/YqjLFcSr6q+GtYjHajN/HInusK+RRTAUqkIhrnL/WX6qt86g
   63FTq4XlntoqWyJ9rl6hH8Lb4DgFksVikXOwP71WzTStnWHtswvr2Ato+
   U6flBDxKxAie9y1+ALTM06pULx157+3fuW0f/B4vXlnL9f8gRoH/w4lcT
   37cZ0bd2aTCVynP5yGAqRy3iQMVKdbraM4ac+Lg2zImCrX8FP5qxyulF4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="376227535"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="376227535"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 11:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="749782247"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="749782247"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Oct 2023 11:47:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsp6D-0009yB-2H;
	Tue, 17 Oct 2023 18:47:25 +0000
Date: Wed, 18 Oct 2023 02:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liu-song-6:bpf-fsverity-kfunc 2/5] fs/verity/measure.c:120:17:
 warning: no previous declaration for 'bpf_get_fsverity_digest'
Message-ID: <202310180204.ATtVPf1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/liu-song-6/linux.git bpf-fsverity-kfunc
head:   1dc94c536fe6c5f3da4712d746698a38fdce474e
commit: 985728b637a47855dbf4c23c3e346fc51b647fbf [2/5] bpf, fsverity: Add kfunc bpf_get_fsverity_digest
config: x86_64-buildonly-randconfig-006-20231018 (https://download.01.org/0day-ci/archive/20231018/202310180204.ATtVPf1Q-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180204.ATtVPf1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180204.ATtVPf1Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/verity/measure.c:120:17: warning: no previous declaration for 'bpf_get_fsverity_digest' [-Wmissing-declarations]
    __bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dynptr_kern *digest_ptr)
                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_get_fsverity_digest +120 fs/verity/measure.c

   105	
   106	/* bpf kfuncs */
   107	__diag_push();
   108	__diag_ignore_all("-Wmissing-prototypes",
   109			  "kfuncs which will be used in BPF programs");
   110	
   111	/**
   112	 * bpf_get_fsverity_digest: read fsverity digest of file
   113	 * @file: file to get digest from
   114	 * @digest_ptr: (out) dynptr for struct fsverity_digest
   115	 *
   116	 * Read fsverity_digest of *file* into *digest_ptr*.
   117	 *
   118	 * Return: 0 on success, a negative value on error.
   119	 */
 > 120	__bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dynptr_kern *digest_ptr)
   121	{
   122		const struct inode *inode = file_inode(file);
   123		struct fsverity_digest *arg = digest_ptr->data;
   124		const struct fsverity_info *vi;
   125		const struct fsverity_hash_alg *hash_alg;
   126		int out_digest_sz;
   127	
   128		if (__bpf_dynptr_size(digest_ptr) < sizeof(struct fsverity_digest))
   129			return -EINVAL;
   130	
   131		vi = fsverity_get_info(inode);
   132		if (!vi)
   133			return -ENODATA; /* not a verity file */
   134	
   135		hash_alg = vi->tree_params.hash_alg;
   136	
   137		arg->digest_algorithm = hash_alg - fsverity_hash_algs;
   138		arg->digest_size = hash_alg->digest_size;
   139	
   140		out_digest_sz = __bpf_dynptr_size(digest_ptr) - sizeof(struct fsverity_digest);
   141	
   142		/* copy digest */
   143		memcpy(arg->digest, vi->file_digest,  min_t(int, hash_alg->digest_size, out_digest_sz));
   144	
   145		/* fill the extra buffer with zeros */
   146		memset(arg->digest + arg->digest_size, 0, out_digest_sz - hash_alg->digest_size);
   147	
   148		return 0;
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
