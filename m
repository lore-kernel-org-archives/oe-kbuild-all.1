Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB540BA50
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738168163; cv=none; b=BvILAO9uolAR8TEmAwLDxYmrOrp9bcCV21/X5A8kdHD7VHHIuqw8mX8dy5I9du75QmcgBx978sqhKwDp7VRcxQZm1SI3hwN/Saqswfv4ztHiDFk6WNCxxX9vTjNFXLk3LyL7y9uwIG91RIWu19d5OTfD5bt57Wl93a3b6CG31js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738168163; c=relaxed/simple;
	bh=sp6KTcziY31bB9VXy8ixZ/HPY3GsPU8bs56wtSCCvDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W4oH4v7+PUu2Lp4EoJ/UXDbjucY4ZCN2AvC3u1bNpFi/rZUJKHHpZpOTeJdHYRL0IHiNb0PaStIssENRJlao80WySNwYOHcA/diCb6eH1IIg0vyyno1YK5aHd+qxhH9G+nwlbsSpB0vZ+0kWXeCC2LV45AkrH3xrzZ7DUO0Rdus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8FIU7Y0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8FIU7Y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738168162; x=1769704162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sp6KTcziY31bB9VXy8ixZ/HPY3GsPU8bs56wtSCCvDY=;
  b=l8FIU7Y0Olgv4p7cN3pdVHCjrpufwLfdGxhS6Lcj9sydJOF/1dnKIwch
   CMIZKFEm8za0/ohe3rNJYhzLTXsYNmOegPBW5YdrH2acxXmwimY6HL54h
   /FpL01Sl9rVv9ftK/M/I5U1cDyQEe5rjbTDGWrTVR/W6IB4qhtDuZtHoq
   wTfnPKEbf2PTxAnV6wkNQ9qRXJn8oSgGJaD9F5Hh0nknKaqhS7qgKs4BB
   DjX/Gi5LIipCxcydQwDmhwUiKgCpI/V3av+GilBwNXZ0zv3R23FrPpLJe
   Z/DHAZhO8HMjRp9YHuu1n4yl/w9Sdvnz8H+2r0dvXuQYArpig6se9z0hA
   Q==;
X-CSE-ConnectionGUID: ymcmLkfWT9SH/Pca5fAOCQ==
X-CSE-MsgGUID: 6zl1n6k8T9SNBP/FKICzLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="64051749"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="64051749"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 08:29:21 -0800
X-CSE-ConnectionGUID: xaj32ZYmTS6w9hbdjxwGsw==
X-CSE-MsgGUID: oTR3G6AnR2eYJmp/aXYhoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="108893909"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jan 2025 08:29:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdAwI-000j8Z-0d;
	Wed, 29 Jan 2025 16:29:18 +0000
Date: Thu, 30 Jan 2025 00:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 19/43] net/ceph/databuf.c:143:23: error:
 implicit declaration of function 'alloc_pages_bulk_array'; did you mean
 'alloc_pages_bulk_noprof'?
Message-ID: <202501300015.q4h0q4T9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   99bca1b95b54b7a3e7260c2431b587639482a71d
commit: e4e0cb58c2b8c5d15293762a5dcc81d1de627c42 [19/43] libceph: Add a new data container type, ceph_databuf
config: arm-randconfig-001-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300015.q4h0q4T9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300015.q4h0q4T9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300015.q4h0q4T9-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ceph/databuf.c: In function 'ceph_databuf_reserve':
>> net/ceph/databuf.c:143:23: error: implicit declaration of function 'alloc_pages_bulk_array'; did you mean 'alloc_pages_bulk_noprof'? [-Wimplicit-function-declaration]
     143 |                 got = alloc_pages_bulk_array(gfp, want, pages);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       alloc_pages_bulk_noprof


vim +143 net/ceph/databuf.c

   118	
   119	/* Allocate enough pages for a dbuf to append the given amount
   120	 * of dbuf without allocating.
   121	 * Returns: 0 on success, -ENOMEM on error.
   122	 */
   123	int ceph_databuf_reserve(struct ceph_databuf *dbuf, size_t add_space,
   124				 gfp_t gfp)
   125	{
   126		struct bio_vec *bvec;
   127		size_t i, req_bvec = DIV_ROUND_UP(dbuf->iter.count + add_space, PAGE_SIZE);
   128		int ret;
   129	
   130		dbuf->put_pages = true;
   131		if (req_bvec > dbuf->max_bvec) {
   132			ret = ceph_databuf_expand(dbuf, req_bvec, gfp);
   133			if (ret < 0)
   134				return ret;
   135		}
   136	
   137		bvec = dbuf->bvec;
   138		while (dbuf->nr_bvec < req_bvec) {
   139			struct page *pages[16];
   140			size_t want = min(req_bvec, ARRAY_SIZE(pages)), got;
   141	
   142			memset(pages, 0, sizeof(pages));
 > 143			got = alloc_pages_bulk_array(gfp, want, pages);
   144			if (!got)
   145				return -ENOMEM;
   146			for (i = 0; i < got; i++)
   147				bvec_set_page(&bvec[dbuf->nr_bvec + i], pages[i],
   148					      PAGE_SIZE, 0);
   149			dbuf->iter.nr_segs += got;
   150			dbuf->nr_bvec += got;
   151			dbuf->limit = dbuf->nr_bvec * PAGE_SIZE;
   152		}
   153	
   154		return 0;
   155	}
   156	EXPORT_SYMBOL(ceph_databuf_reserve);
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
