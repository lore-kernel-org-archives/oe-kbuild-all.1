Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710C4D9E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 23:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710285268; cv=none; b=KMG4d22zD511x5WHhR29RdB3/ojH00VVTAskKfX7ditaQGCL6Q+waOiHAOJQRIUT2cWnakE7q4BVap0R9T1ZNZv+IzKRhZ1pzDcJ+e5akFFcCv32qKv/oA7d+1rTpfTbqoun/jLuwd+JjXxksqXSOzvuEDWKRsSZE9K/1GKqFio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710285268; c=relaxed/simple;
	bh=j9xm9iA0hXWZqGtPldOmsSGtULMdbConLLmKKHTPdzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b74X/7FR9/eZWJJydbK1RYNTSV8Aaggt8BdhwfogJ9RTU+zzd/8LejhNu8KGmaLkpJFaPb4pOEcw2hdf5NsbN9kTv7q9RwUtb9WhWBRkCJQc3d4m41WcFYIZAgnWatQ5jNkO9xY5CqMRigi2r9xwe/19Pt8U2zdVYPDM2zhn2Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCqUPbt6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCqUPbt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710285266; x=1741821266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j9xm9iA0hXWZqGtPldOmsSGtULMdbConLLmKKHTPdzU=;
  b=nCqUPbt67JnhIHYLokDTY+4mOOUkzoek0lNuoAI0kUsEUcIIsxywUQgc
   jw3vzBsk3xi2opfNKEn8Hm6nZHlxgriXZZbXsqkx8uuzGwmq0Yg0IrJ0q
   DxYojoLVr8bljmMebwnxiINCuWfvlk3pdkc4s+7YY1m9IO3E+PBsEq5hb
   dnN2gdfhpYd55FNN7EbIwv4R7+0cXnckkpRMR2Jw0MXIG3/yY/miGqVgx
   xnRe5FECt/jA5T/5hVPgjo+WgPYQME1LTaoAPDuNVwjg0+BWYb4uZ9Bcq
   5Bx71uE3jglYkMFtqUuS/T8Xp5ivkb9wRFh8oNZkKm0FaYrcg4aUG1Db+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5213640"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5213640"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 16:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16434298"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2024 16:14:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkBKA-000BmR-1o;
	Tue, 12 Mar 2024 23:14:22 +0000
Date: Wed, 13 Mar 2024 07:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 23/26] fs/nfs/nfs4xdr.c:6450:12: warning:
 'nfs4_xdr_dec_gdd_lookup' defined but not used
Message-ID: <202403130726.dowekG3q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   244db11a7d6835249946adae4255d53cb0edf7f6
commit: d37041e8bb417db3d3403e6a0cf5d899651e6e59 [23/26] nfs: create a new GDD_LOOKUP procedure
config: powerpc-fsp2_defconfig (https://download.01.org/0day-ci/archive/20240313/202403130726.dowekG3q-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403130726.dowekG3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130726.dowekG3q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfs/nfs4xdr.c: In function 'nfs4_xdr_enc_gdd_lookup':
   fs/nfs/nfs4xdr.c:2304:9: error: implicit declaration of function 'encode_get_dir_delegation' [-Werror=implicit-function-declaration]
    2304 |         encode_get_dir_delegation(xdr, &hdr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c: In function 'nfs4_xdr_dec_gdd_lookup':
   fs/nfs/nfs4xdr.c:6466:18: error: implicit declaration of function 'decode_get_dir_delegation'; did you mean 'decode_no_delegation'? [-Werror=implicit-function-declaration]
    6466 |         status = decode_get_dir_delegation(xdr, res);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                  decode_no_delegation
   fs/nfs/nfs4xdr.c: At top level:
>> fs/nfs/nfs4xdr.c:6450:12: warning: 'nfs4_xdr_dec_gdd_lookup' defined but not used [-Wunused-function]
    6450 | static int nfs4_xdr_dec_gdd_lookup(struct rpc_rqst *rqstp, struct xdr_stream *xdr,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c:4489:12: warning: 'decode_dir_delegation_stateid' defined but not used [-Wunused-function]
    4489 | static int decode_dir_delegation_stateid(struct xdr_stream *xdr, nfs4_stateid *stateid)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfs4xdr.c:2293:13: warning: 'nfs4_xdr_enc_gdd_lookup' defined but not used [-Wunused-function]
    2293 | static void nfs4_xdr_enc_gdd_lookup(struct rpc_rqst *req, struct xdr_stream *xdr,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/nfs4_xdr_dec_gdd_lookup +6450 fs/nfs/nfs4xdr.c

  6446	
  6447	/*
  6448	 * Decode GDD_LOOKUP response
  6449	 */
> 6450	static int nfs4_xdr_dec_gdd_lookup(struct rpc_rqst *rqstp, struct xdr_stream *xdr,
  6451					   void *data)
  6452	{
  6453		struct nfs4_lookup_res *res = data;
  6454		struct compound_hdr hdr;
  6455		int status;
  6456	
  6457		status = decode_compound_hdr(xdr, &hdr);
  6458		if (status)
  6459			goto out;
  6460		status = decode_sequence(xdr, &res->seq_res, rqstp);
  6461		if (status)
  6462			goto out;
  6463		status = decode_putfh(xdr);
  6464		if (status)
  6465			goto out;
  6466		status = decode_get_dir_delegation(xdr, res);
  6467		if (status)
  6468			goto out;
  6469		status = decode_lookup(xdr);
  6470		if (status)
  6471			goto out;
  6472		status = decode_getfh(xdr, res->fh);
  6473		if (status)
  6474			goto out;
  6475		status = decode_getfattr(xdr, res->fattr, res->server);
  6476	out:
  6477		return status;
  6478	}
  6479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
