Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F3B11CAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710587267; cv=none; b=QKO/BivhXnF4YbbRo8epTFZVAQOu2Ml2IeqHbej3GjcFTAbXmq1vlOoqvYWl+ZiL/DfWpVLtHEE8BdJ3xNyv5qcusMh+YnkVRysUJez5tISRHgm4EzkRIfHhzN+p5icGWgcLdKdKBSpD2XTmMdGgNczG6ZIVdNp85cqIJiGhNGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710587267; c=relaxed/simple;
	bh=ym6lI3AHuWeZEeQfFosF718gDI/QWLDGEPOmQTAPRSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fz3PQcKPIV7IIhWWv6cMzLMsHTi8gwNjMyeXxz7v9EqRrfrfeVAlVz4aPXQ2bIvSBeP9Tu6K9FIy5stqY0eyOZvlyqU2hDTPJVMpcLzddQio5EtU5Cfd49z95EbuaHBtoo3r7hKYrP+f48vfg6yIOGwDzTMW9wyZ7Aa6I9t/BBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xhso5RM0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xhso5RM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710587265; x=1742123265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ym6lI3AHuWeZEeQfFosF718gDI/QWLDGEPOmQTAPRSo=;
  b=Xhso5RM0D2wLTtiZOiiiaFsg+h2N4Urj5o0PTrUYeBttntYWykMDMl1u
   JK2xQ/xw+4bgP84bseQUK47GmwFl+8TiHsYcDgwur5VYvLMH428za4msP
   c73UNpUHye3EJVHHbtWRVBATnN1e1BYBVdKYDsyKAjcKUcYlI2PtWusvU
   3ndajLb+irv5kUNTnaVqhNtRrJ3fHzuhfc6B38dm06xwnj1IpDMO2GiCE
   NZOOscNB7XGvAR2MuFqfXgJSQVpERBxIm/FtsSYja7xdO8KWaDmKDHwDZ
   7GsDUrmQP4yfnPRvrRhYLcNQS9xOAG6FBynwC9c8S0ECIBhMXO8XtxLNx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16859703"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="16859703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 04:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="17417978"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2024 04:07:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlRt7-000FLB-0Y;
	Sat, 16 Mar 2024 11:07:41 +0000
Date: Sat, 16 Mar 2024 19:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 24/27] fs/nfs/nfs4xdr.c:6569:12: warning:
 'nfs4_xdr_dec_gdd_getattr' defined but not used
Message-ID: <202403161848.iBJdExuj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   97dd4397677db6898e2534608c52b9c0e774aa89
commit: 2e5a6b3250f71288bf15c4c943a93d28a7b0f628 [24/27] nfs: add a GDD_GETATTR rpc operation
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240316/202403161848.iBJdExuj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161848.iBJdExuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161848.iBJdExuj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfs/nfs4xdr.c: In function 'nfs4_xdr_enc_gdd_getattr':
   fs/nfs/nfs4xdr.c:2403:9: error: implicit declaration of function 'encode_get_dir_delegation' [-Werror=implicit-function-declaration]
    2403 |         encode_get_dir_delegation(xdr, &hdr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4xdr.c: In function 'nfs4_xdr_dec_gdd_getattr':
   fs/nfs/nfs4xdr.c:6585:18: error: implicit declaration of function 'decode_get_dir_delegation'; did you mean 'decode_no_delegation'? [-Werror=implicit-function-declaration]
    6585 |         status = decode_get_dir_delegation(xdr, res);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                  decode_no_delegation
   fs/nfs/nfs4xdr.c: At top level:
>> fs/nfs/nfs4xdr.c:6569:12: warning: 'nfs4_xdr_dec_gdd_getattr' defined but not used [-Wunused-function]
    6569 | static int nfs4_xdr_dec_gdd_getattr(struct rpc_rqst *rqstp, struct xdr_stream *xdr,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfs4xdr.c:2392:13: warning: 'nfs4_xdr_enc_gdd_getattr' defined but not used [-Wunused-function]
    2392 | static void nfs4_xdr_enc_gdd_getattr(struct rpc_rqst *req, struct xdr_stream *xdr,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/nfs4_xdr_dec_gdd_getattr +6569 fs/nfs/nfs4xdr.c

  6565	
  6566	/*
  6567	 * Decode GDD_GETATTR response
  6568	 */
> 6569	static int nfs4_xdr_dec_gdd_getattr(struct rpc_rqst *rqstp, struct xdr_stream *xdr,
  6570					    void *data)
  6571	{
  6572		struct nfs4_getattr_res *res = data;
  6573		struct compound_hdr hdr;
  6574		int status;
  6575	
  6576		status = decode_compound_hdr(xdr, &hdr);
  6577		if (status)
  6578			goto out;
  6579		status = decode_sequence(xdr, &res->seq_res, rqstp);
  6580		if (status)
  6581			goto out;
  6582		status = decode_putfh(xdr);
  6583		if (status)
  6584			goto out;
  6585		status = decode_get_dir_delegation(xdr, res);
  6586		if (status)
  6587			goto out;
  6588		status = decode_getfattr(xdr, res->fattr, res->server);
  6589	out:
  6590		return status;
  6591	}
  6592	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
