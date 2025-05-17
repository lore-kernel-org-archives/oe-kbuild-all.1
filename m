Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AFF15E8B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747462212; cv=none; b=Y9oywtMM86pXYbVeeUpBv6FGe+C7vsgIVqW/br30UziGD01QEfBQrvYlN8tFOHjY8JpCCV6VRvtdsL5aipNrG6LhlnWEtPqUpTIHRxrtSUZ6gYQ3TiOuxpKEkACT5Z95a6d4JFsGrVDZi6O8O1OANDb4IRT1ouMfhWlzz3g6pU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747462212; c=relaxed/simple;
	bh=vr/OQXv5auzSd8yGAeN/8MTRxSAxiD162eiNQKoj9A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qjpCIKC5lJVQH18ReVh/AMQ6aXBaBzcJ6u0EUu2Hi7ZAf/TJwoUiEeMmLqyOzv0C3RZmStY4RJyP8koZGijIl7rUmDigD0XWjRDTu3i0hUqSabZZ/xokVtU/nvero5/d1j7BusMTnJHTI3syoD3wzpTf+V3Dvkqs/Gc6KLzzEqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CD6MSrvT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CD6MSrvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747462211; x=1778998211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vr/OQXv5auzSd8yGAeN/8MTRxSAxiD162eiNQKoj9A0=;
  b=CD6MSrvT0xGnPBBzPHLFRYVoLm9U6Wjxuuty5UBZA65ak77GsHWarWXm
   s/CiGnmIRRXO5pzVTLTUKRAcVZhBnHhWerQ/tO7voOcUnHwXKJ6+JoKCN
   Y8rt1UQYULT3tw/gK6q/Pw0e+VxKOGn5t1Zjvb76WfdQ7MzxYgsA/hF13
   2ZoTtISWfKgCbWBTHMp7o3PqZxchszSJgpDHPFgC3s2U2G/VvAbdYnEcP
   LFdkg+DutH0Il0bIuzvakby0Fov4sVEcJi7j0lEg97+NN1LfGitjHmOO3
   eZQb+Ru81Ki1ovs7gCgj7K4v89RjsLkgX+dnlZ3906/nYnn1bEndxTdZr
   g==;
X-CSE-ConnectionGUID: Nkx4DyJYTOKh4igfPtDbcw==
X-CSE-MsgGUID: I7Cf85kpTDqVIHGDKNl3Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="37054599"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="37054599"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 23:10:10 -0700
X-CSE-ConnectionGUID: oymk3vIKQ5GhJ4jMpYlpJw==
X-CSE-MsgGUID: CsmZpXFtQ6G1YGeaC4e6Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="143762080"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2025 23:10:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGAkI-000JyF-2O;
	Sat, 17 May 2025 06:10:06 +0000
Date: Sat, 17 May 2025 14:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rick Macklem <rmacklem@uoguelph.ca>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 83/93] fs/nfsd/nfs4xdr.c:464
 nfsd4_decode_posix_acl() warn: inconsistent indenting
Message-ID: <202505171414.T5mIIxsT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   d868e4920c3f4feefcbc17c5812bbe1a48af8c6f
commit: 65d0479dacdaaec44d2e94765633cbc4c29ff64d [83/93] Fix a couple of bugs in POSIX ACL decoding
config: i386-randconfig-141-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171414.T5mIIxsT-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171414.T5mIIxsT-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4xdr.c:464 nfsd4_decode_posix_acl() warn: inconsistent indenting

Old smatch warnings:
include/linux/sunrpc/xdr.h:804 xdr_stream_decode_uint32_array() warn: potential user controlled sizeof overflow 'len * 4' '0-u32max * 4'
fs/nfsd/nfs4xdr.c:421 nfsd4_decode_posixace4() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:427 nfsd4_decode_posixace4() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:434 nfsd4_decode_posixace4() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:467 nfsd4_decode_posix_acl() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:484 nfsd4_decode_posix_acl() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:2672 nfsd4_decode_compound() warn: potential spectre issue 'nfsd4_dec_ops' [r]
fs/nfsd/nfs4xdr.c:3673 xdr_nfs4ace_stream_encode() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:3693 xdr_nfs4ace_stream_encode() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:3705 xdr_nfs4ace_stream_encode() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:3717 encode_stream_posixacl() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:3730 encode_stream_posixacl() warn: inconsistent indenting

vim +464 fs/nfsd/nfs4xdr.c

   456	
   457	static noinline __be32
   458	nfsd4_decode_posix_acl(struct nfsd4_compoundargs *argp, struct posix_acl **acl)
   459	{
   460		struct posix_acl_entry *ace;
   461		__be32 status;
   462		u32 count;
   463	
 > 464	dprintk("in nfsd4_decode_posix_acl\n");
   465		if (xdr_stream_decode_u32(argp->xdr, &count) < 0)
   466			return nfserr_bad_xdr;
   467	dprintk("count=%d rem=%d\n", count, xdr_stream_remaining(argp->xdr));
   468	
   469		if (count > xdr_stream_remaining(argp->xdr) / 12)
   470			/*
   471			 * Even with 0-byte names there wouldn't be
   472			 * space for that many aces; something fishy is
   473			 * going on:
   474			 */
   475			return nfserr_bad_xdr;
   476	
   477		*acl = posix_acl_alloc(count, GFP_NOFS);
   478		if (*acl == NULL)
   479			return nfserr_resource;
   480	
   481		(*acl)->a_count = count;
   482		for (ace = (*acl)->a_entries; ace < (*acl)->a_entries + count; ace++) {
   483			status = nfsd4_decode_posixace4(argp, ace);
   484	dprintk("decode_posixace4=%d\n", status);
   485			if (status) {
   486				posix_acl_release(*acl);
   487				*acl = NULL;
   488				return status;
   489			}
   490		}
   491	
   492		return nfs_ok;
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
