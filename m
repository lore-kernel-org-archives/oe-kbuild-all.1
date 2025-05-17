Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D57E18DB29
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 04:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747457106; cv=none; b=rY+nVWHxiwpKkVdw7B9NsI5WRt9h7+4mwGd0inx+xUGsubRc7Ut9w2tyPfRjxdAIlSvXrqICBBjuolYSQu4yuFZyM4BVmOjS1c8L0s0kgcmcx/W5ZGVAWj2r0Gg5vBCn8BbuSbohXZc10rTxgr8lBa4KQoj19B6W1kLxY4LUNF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747457106; c=relaxed/simple;
	bh=nLONp9OnbgmX/ElhVjnU9cE65rjhiA/FRcEAQvpyrr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4uw93iIzkecX2+hS7Xn5tuy/1QtD1j8Z6nD7bNAgRAqh6976aY8ncbI2TCNuhzJ2BoI7fUI3ZisNCQMlZY+sVQYMBdqsFaGqaMKMXnmkIlgu5+JG+6UZWVY4KMvJykrh8DLdWvIJv+Uc5R3bwVdgDDBWVhQrHTF0zv/hU51tI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0WhhpXw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0WhhpXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747457105; x=1778993105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLONp9OnbgmX/ElhVjnU9cE65rjhiA/FRcEAQvpyrr4=;
  b=l0WhhpXwlzA2wZ4bgGr+2Rx81KnBfh6K6XNZBPmpIk5+nAnptEyUrunW
   GhgxkOkfACpmRaIVq6qJtp9gg8BX3TSILZj8JviEo/DZxSUDrfJPVWeJ7
   A8WvFUaGU+ouPR6T9jMn2aZBJY47oUT2DxB43RWQD/bFjnzaAqR5BCBE/
   XNwBEt8BACA2C9hoIDXfSc84SbPkpMGtDAVD5jYvjOHeBvljUhMoHzaLi
   9mebpth7TG1mJ2RPydxVeZLiDbsvpirFORkfq5pZNlBtdfCPXDp2kZ6TM
   T3Hr4pIOf6501WNBs8SZ5r3e6AT7m6RV4htLrwNnPEj+TaqpQfHA8s6hX
   A==;
X-CSE-ConnectionGUID: A0wZWHJVSzeFquBo0V2WBA==
X-CSE-MsgGUID: EmYTlRJ8SJOzKjFjY0H6pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49363378"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="49363378"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 21:45:04 -0700
X-CSE-ConnectionGUID: oE3j8kRqQC+4xLFGDsIzpQ==
X-CSE-MsgGUID: mgiN3AK6QnWhqD0fxamQqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="144121728"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 May 2025 21:45:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG9Pw-000Jw5-1d;
	Sat, 17 May 2025 04:45:00 +0000
Date: Sat, 17 May 2025 12:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Rick Macklem <rmacklem@uoguelph.ca>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 76/93] fs/nfsd/nfs4xdr.c:426
 nfsd4_decode_posixace4() warn: inconsistent indenting
Message-ID: <202505171239.vpzVYBWW-lkp@intel.com>
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
commit: ba7bba09df72ffb43309b9f76e7078d8018d8a58 [76/93] Add handling of the XDR for the POSIX draft ACL attributes
config: i386-randconfig-141-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171239.vpzVYBWW-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171239.vpzVYBWW-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4xdr.c:426 nfsd4_decode_posixace4() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:3662 xdr_nfs4ace_stream_encode() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:3706 encode_stream_posixacl() warn: inconsistent indenting

Old smatch warnings:
include/linux/sunrpc/xdr.h:804 xdr_stream_decode_uint32_array() warn: potential user controlled sizeof overflow 'len * 4' '0-u32max * 4'
fs/nfsd/nfs4xdr.c:2661 nfsd4_decode_compound() warn: potential spectre issue 'nfsd4_dec_ops' [r]
fs/nfsd/nfs4xdr.c:3682 xdr_nfs4ace_stream_encode() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:3694 xdr_nfs4ace_stream_encode() warn: inconsistent indenting
fs/nfsd/nfs4xdr.c:3719 encode_stream_posixacl() warn: inconsistent indenting

vim +426 fs/nfsd/nfs4xdr.c

   412	
   413	static __be32
   414	nfsd4_decode_posixace4(struct nfsd4_compoundargs *argp,
   415				struct posix_acl_entry *ace)
   416	{
   417		u32 val;
   418		__be32 *p, status;
   419	
   420		status = nfsacl4_posix_xdrtotag(argp->xdr, &val);
   421		if (status != nfs_ok)
   422			return status;
   423		ace->e_tag = val;
   424		if (xdr_stream_decode_u32(argp->xdr, &val) < 0)
   425			return nfserr_bad_xdr;
 > 426	dprintk("perm=%d\n", val);
   427		if (val & ~S_IRWXO)
   428			return nfserr_bad_xdr;
   429		ace->e_perm = val;
   430	
   431		if (xdr_stream_decode_u32(argp->xdr, &val) < 0)
   432			return nfserr_bad_xdr;
   433		p = xdr_inline_decode(argp->xdr, val);
   434		if (!p)
   435			return nfserr_bad_xdr;
   436		switch(ace->e_tag) {
   437		case ACL_USER:
   438			status = nfsd_map_name_to_uid(argp->rqstp,
   439					(char *)p, val, &ace->e_uid);
   440			break;
   441		case ACL_GROUP:
   442			status = nfsd_map_name_to_gid(argp->rqstp,
   443					(char *)p, val, &ace->e_gid);
   444		}
   445	
   446		return status;
   447	}
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
