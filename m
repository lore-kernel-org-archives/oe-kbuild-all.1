Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D1133A03F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779626291; cv=none; b=ff6cWG1agzK90mMUjM2Jq0/X2lCu41d7auNkQbrSEv/dVAptHI2AMuvIWIOJcRFqM6AtH5k9mxKehaKe+JCttswXtRnCL4SddtC9RSFOFO5iGRRmpG/tj/SU+JG2LMwG1BbsxVfdebQJQ9NcHnNzCM5W71BgoQqxTQc+iKaPvvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779626291; c=relaxed/simple;
	bh=Km1xPGYWLb1lckXebbHWKPwFdjw4bb23xYWBqf0DW3o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pJ7AV8MsGNi1cpn2w1vzgZo24rcHF+Lcfim0yFGWjULv3kDMayX92QtFhYFPtHC3aYm/0OkN/PQjetFWh+FWH+ztnXaJzjrIFrfgkVdGKmxvnTzomTqAL6bSW8p1MLzTYfDkTD+XoRmFKT/6qEwCjO76kO0Sm7iq+D6pDvCFH6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBjKDaek; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBjKDaek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779626289; x=1811162289;
  h=date:from:to:cc:subject:message-id;
  bh=Km1xPGYWLb1lckXebbHWKPwFdjw4bb23xYWBqf0DW3o=;
  b=jBjKDaekpSvgrTZhiJ8f7//SlurbVx8bpYd5/tIGWBFDRygLMLfka1Rv
   gOrgGy4f/CtKyZTEsh/alClNNETZynqa8P3CV7NNjoroWjxHPdTK1EDCz
   PC89yC+a0WYLHO/jGWQrAbJ6fP7OFdJyGXVZzjBjSW6lKRAQXO/ih4WLC
   RDlXcuFlrsVZv81BEbOlaqKmTc6BDU9Rlu8xMIW7gpJIKKG39YCpTbW0P
   SxUu7Wo8igjxp4Pr1XPllS+zCvpmeQm+ppd3qhJl7dj78yqHjPt0UNnnY
   FMO6m38O4CVukyw0wv5yCJqelFJBSMZHdy8XMl+RTwhx1LM2FSBjxclGj
   A==;
X-CSE-ConnectionGUID: wruQpoWNQlike54PuLE3RA==
X-CSE-MsgGUID: eVm5pNmeS6i5/VdSDrRIkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91867158"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91867158"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 05:38:05 -0700
X-CSE-ConnectionGUID: 0YJ1QbefQY+wkysJH5KYLw==
X-CSE-MsgGUID: aKddMdRhSbuuogajJxAO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="238784895"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 May 2026 05:38:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR85h-000000000Ex-0eD9;
	Sun, 24 May 2026 12:38:01 +0000
Date: Sun, 24 May 2026 20:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:bvec-iter-cleanups 1/1] io_uring/rsrc.c:1419:3:
 error: passing 'const struct bio_vec *' to parameter of type 'struct bio_vec
 *' discards qualifiers
Message-ID: <202605242048.qJi3urOO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git bvec-iter-cleanups
head:   f63858e85ce2b2cc55d98747311fd65088d1577d
commit: f63858e85ce2b2cc55d98747311fd65088d1577d [1/1] bvec: make the bvec_iter helpers inline functions
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260524/202605242048.qJi3urOO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605242048.qJi3urOO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605242048.qJi3urOO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/rsrc.c:1419:3: error: passing 'const struct bio_vec *' to parameter of type 'struct bio_vec *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1419 |                 for_each_mp_bvec(bv, src_bvec, bi, bi)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bvec.h:230:29: note: expanded from macro 'for_each_mp_bvec'
     230 |                 ((bvl = mp_bvec_iter_bvec((bio_vec), (iter))), 1);      \
         |                                           ^~~~~~~~~
   include/linux/bvec.h:140:35: note: passing argument to parameter 'bvecs' here
     140 | mp_bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                                   ^
   1 error generated.
--
>> lib/iov_iter.c:1633:38: error: passing 'const struct bio_vec *' to parameter of type 'struct bio_vec *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1633 |                 struct bio_vec bv = bvec_iter_bvec(i->bvec, bi);
         |                                                    ^~~~~~~
   include/linux/bvec.h:171:32: note: passing argument to parameter 'bvecs' here
     171 | bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                                ^
   1 error generated.


vim +1419 io_uring/rsrc.c

9ef4cbbcb4ac378 Pavel Begunkov 2025-03-07  1398  
1045afae4b8892d Ming Lei       2025-03-25  1399  static int io_vec_fill_kern_bvec(int ddir, struct iov_iter *iter,
1045afae4b8892d Ming Lei       2025-03-25  1400  				 struct io_mapped_ubuf *imu,
1045afae4b8892d Ming Lei       2025-03-25  1401  				 struct iovec *iovec, unsigned nr_iovs,
1045afae4b8892d Ming Lei       2025-03-25  1402  				 struct iou_vec *vec)
1045afae4b8892d Ming Lei       2025-03-25  1403  {
1045afae4b8892d Ming Lei       2025-03-25  1404  	const struct bio_vec *src_bvec = imu->bvec;
1045afae4b8892d Ming Lei       2025-03-25  1405  	struct bio_vec *res_bvec = vec->bvec;
1045afae4b8892d Ming Lei       2025-03-25  1406  	unsigned res_idx = 0;
1045afae4b8892d Ming Lei       2025-03-25  1407  	size_t total_len = 0;
1045afae4b8892d Ming Lei       2025-03-25  1408  	unsigned iov_idx;
1045afae4b8892d Ming Lei       2025-03-25  1409  
1045afae4b8892d Ming Lei       2025-03-25  1410  	for (iov_idx = 0; iov_idx < nr_iovs; iov_idx++) {
1045afae4b8892d Ming Lei       2025-03-25  1411  		size_t offset = (size_t)(uintptr_t)iovec[iov_idx].iov_base;
1045afae4b8892d Ming Lei       2025-03-25  1412  		size_t iov_len = iovec[iov_idx].iov_len;
1045afae4b8892d Ming Lei       2025-03-25  1413  		struct bvec_iter bi = {
1045afae4b8892d Ming Lei       2025-03-25  1414  			.bi_size        = offset + iov_len,
1045afae4b8892d Ming Lei       2025-03-25  1415  		};
1045afae4b8892d Ming Lei       2025-03-25  1416  		struct bio_vec bv;
1045afae4b8892d Ming Lei       2025-03-25  1417  
1045afae4b8892d Ming Lei       2025-03-25  1418  		bvec_iter_advance(src_bvec, &bi, offset);
1045afae4b8892d Ming Lei       2025-03-25 @1419  		for_each_mp_bvec(bv, src_bvec, bi, bi)
1045afae4b8892d Ming Lei       2025-03-25  1420  			res_bvec[res_idx++] = bv;
1045afae4b8892d Ming Lei       2025-03-25  1421  		total_len += iov_len;
1045afae4b8892d Ming Lei       2025-03-25  1422  	}
1045afae4b8892d Ming Lei       2025-03-25  1423  	iov_iter_bvec(iter, ddir, res_bvec, res_idx, total_len);
1045afae4b8892d Ming Lei       2025-03-25  1424  	return 0;
1045afae4b8892d Ming Lei       2025-03-25  1425  }
1045afae4b8892d Ming Lei       2025-03-25  1426  

:::::: The code at line 1419 was first introduced by commit
:::::: 1045afae4b8892dab99d320b17bff3b9c1f407d8 io_uring: support vectored kernel fixed buffer

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
