Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269B62594
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754875299; cv=none; b=cVmDaaBNvy5EBS7BLIaoBcVgqgfG+Ke/gc54esIIFf+nq+EDTuNS/vhWEG8ULY/DcFISwKPSnQ7A5C1Tw9iochL5OAFE11akp6Lp71HVnHJOKqkuJU7wIJaZZa7anYN9eMISU5DMOYCtABUmUh2m2xBbgx5zrOIWEbyeid31O3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754875299; c=relaxed/simple;
	bh=rWP2GMlC3iinoZd9CyZCcYdUSxIhjYxl+ueY82y5XIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdO7QDDAZzXmF1p6Fi/CcbG/1q9y5OOhvuqvZN/13JWN6lxa6vb0LRzIwIrXQ6niAfurNKszwji0IE4Z6q8/uiWSN9ZSPHP/Nl5HwtP4GQfLiieB+rtReTll/n5gbfYIyeBlOJ9bNCti5SXNSXLr/MxwoxAUh7h8ho/nc2N8ykk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCJayMVY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCJayMVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754875297; x=1786411297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rWP2GMlC3iinoZd9CyZCcYdUSxIhjYxl+ueY82y5XIw=;
  b=XCJayMVYeBGakZCzew+MV11XC1UvGgq4xb1mW453vbA3lWETjowqCb4k
   UZMPqtIwxJpTDNT7hUL8bQVG0sboEshnLXh6wv2deWQZl6pyJvW3n7+/S
   AP31u3asGJxqXUG13t380qhpD+tPvebzMKONzGWkSzNF2betLUxwjWVbZ
   zsmVYoOIB5oHLKG2HoEivYvO247lUmGVPQICskTjISv/mwS0lzD/nQ8Jj
   fLhGWQG77L0jbERtD1nwiqvdxOf3RuRVHiXRuSST890zxn3qGVnurpGaF
   v1lZ2HaObNEwFf4rIIf7ZK8JpbwEwJ1xqqMsVsdgHfmR2woKf0KXd8PE2
   g==;
X-CSE-ConnectionGUID: 2Wmtwk+5QUqlyl49JpUmVQ==
X-CSE-MsgGUID: Nq93GFrkSM+lot3UV5v3Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68577157"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68577157"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 18:21:36 -0700
X-CSE-ConnectionGUID: UOGfTTFqTKGQGPkpK3qxhw==
X-CSE-MsgGUID: 7zxqemIuSq2cYMA9RAUOoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166576964"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Aug 2025 18:21:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulHE0-0005Um-33;
	Mon, 11 Aug 2025 01:21:25 +0000
Date: Mon, 11 Aug 2025 09:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 14/34] fs/nfsd/filecache.c:386:12: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202508110952.G3Y6Wtro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   98fda891f0626192fd4d782d5483e7298ae5b061
commit: 7550ab865bc73e6365cbcf09e09d0a6a58d9afcd [14/34] rcu: Support Clang's capability analysis
config: x86_64-randconfig-123-20250810 (https://download.01.org/0day-ci/archive/20250811/202508110952.G3Y6Wtro-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508110952.G3Y6Wtro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508110952.G3Y6Wtro-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/filecache.c:386:12: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct nfsd_file *nf @@     got void @@
   fs/nfsd/filecache.c:386:12: sparse:     expected struct nfsd_file *nf
   fs/nfsd/filecache.c:386:12: sparse:     got void
--
>> net/ipv4/cipso_ipv4.c:1979:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct ip_options_rcu *[assigned] opt @@     got void @@
   net/ipv4/cipso_ipv4.c:1979:13: sparse:     expected struct ip_options_rcu *[assigned] opt
   net/ipv4/cipso_ipv4.c:1979:13: sparse:     got void

vim +386 fs/nfsd/filecache.c

65294c1f2c5e72 Jeff Layton  2019-08-18  372  
a61e147e6be6e7 Mike Snitzer 2024-09-05  373  /**
b33f7dec3a6721 Mike Snitzer 2024-11-15  374   * nfsd_file_put_local - put nfsd_file reference and arm nfsd_net_put in caller
c840b8e1f039e9 Mike Snitzer 2024-11-13  375   * @nf: nfsd_file of which to put the reference
a61e147e6be6e7 Mike Snitzer 2024-09-05  376   *
c840b8e1f039e9 Mike Snitzer 2024-11-13  377   * First save the associated net to return to caller, then put
c840b8e1f039e9 Mike Snitzer 2024-11-13  378   * the reference of the nfsd_file.
a61e147e6be6e7 Mike Snitzer 2024-09-05  379   */
c840b8e1f039e9 Mike Snitzer 2024-11-13  380  struct net *
c25a89770d1f21 NeilBrown    2025-05-09  381  nfsd_file_put_local(struct nfsd_file __rcu **pnf)
a61e147e6be6e7 Mike Snitzer 2024-09-05  382  {
c25a89770d1f21 NeilBrown    2025-05-09  383  	struct nfsd_file *nf;
c25a89770d1f21 NeilBrown    2025-05-09  384  	struct net *net = NULL;
a61e147e6be6e7 Mike Snitzer 2024-09-05  385  
c25a89770d1f21 NeilBrown    2025-05-09 @386  	nf = unrcu_pointer(xchg(pnf, NULL));
c25a89770d1f21 NeilBrown    2025-05-09  387  	if (nf) {
c25a89770d1f21 NeilBrown    2025-05-09  388  		net = nf->nf_net;
a61e147e6be6e7 Mike Snitzer 2024-09-05  389  		nfsd_file_put(nf);
c25a89770d1f21 NeilBrown    2025-05-09  390  	}
c840b8e1f039e9 Mike Snitzer 2024-11-13  391  	return net;
a61e147e6be6e7 Mike Snitzer 2024-09-05  392  }
a61e147e6be6e7 Mike Snitzer 2024-09-05  393  

:::::: The code at line 386 was first introduced by commit
:::::: c25a89770d1f216dcedfc2d25d56b604f62ce0bd nfs_localio: change nfsd_file_put_local() to take a pointer to __rcu pointer

:::::: TO: NeilBrown <neil@brown.name>
:::::: CC: Anna Schumaker <anna.schumaker@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
