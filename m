Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A413439846
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710091462; cv=none; b=ohjo+B05Z1bm59G9ULT18FYLkK7eM37xCNR37SxBVK8kUn57jDS9YzyZNew2ybfM8liCVHql0GveuBve/z1QDA6TMxk+TvCcTpjZQVZPA6Ko2LwZ/bwrpfzyCezXjvLP2hPxPFGVwv0Ibyuq24JVgNIpU+yCAI9qL43REwDsRPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710091462; c=relaxed/simple;
	bh=32VnVopofD3lJHwTAs//DIlX+7FI3UyIGY+c1iaKqm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iF/lwWTT3/72lzcmBsagNNEoZ5pyJjRbiDpkNyEtRxHmIobYn5B8iFJ1CsG0zXAUlxZM6rNx0Guzwce6qBudc2v5J//ACjT23bGpYJpL78NT98WX+y5aijKVSHEhE6DGaNWbImnN1aGqLHIZA8sqmStBxwA66Ex/2mhYYhh1Oe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMjoQe7w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMjoQe7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710091459; x=1741627459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32VnVopofD3lJHwTAs//DIlX+7FI3UyIGY+c1iaKqm8=;
  b=eMjoQe7wR5zSdSiJ7TvXrnMLHABlUhCM7QerN7RcMSyD2Poma1EO/opE
   32eoVtex4v45Rq83Q6MeK5V5fz8LEBrztHArGnZbnua3u37oFdtZt9lYH
   3kU9yB6fUjTmH6hdqEOxhrGVYUL+koO2T/XRQIrtx7ruGfm4s9MAoz609
   sAbadVdlm/LMEYygNsYDLVU83gPuuIj/pMG/GgTYhmI65e1ujbj8tjuF6
   +kHEUHQmoovaWqTM1wnTOiBhqV3PYz/JtFdNYZ2sgCLH+NV1K7gcZC3o4
   BEz2gjFNac5pMSaX4o8eMnnwLFTrqTXeP++YMDCVVIx0MhwYdzqihtbg3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8506498"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="8506498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 10:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="41871480"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2024 10:24:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjMuE-0008Ql-2r;
	Sun, 10 Mar 2024 17:24:14 +0000
Date: Mon, 11 Mar 2024 01:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [samba-ksmbd:ksmbd-for-next-next 4/4] fs/smb/server/oplock.c:1508:
 warning: Excess function parameter 'is_dir' description in
 'parse_lease_state'
Message-ID: <202403110144.cDrtOmgD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   f4ab0ca366e96a297b511d020a7fcd212f0268c9
commit: 74b8c7501e13353ad71b93aaf88aae65381593bc [4/4] ksmbd: add support for durable handles v1/v2
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240311/202403110144.cDrtOmgD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110144.cDrtOmgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110144.cDrtOmgD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/oplock.c:1508: warning: Excess function parameter 'is_dir' description in 'parse_lease_state'


vim +1508 fs/smb/server/oplock.c

e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1499  
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1500  /**
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1501   * parse_lease_state() - parse lease context containted in file open request
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1502   * @open_req:	buffer containing smb2 file open(create) request
eb547407f3572d fs/smb/server/oplock.c Namjae Jeon 2023-12-05  1503   * @is_dir:	whether leasing file is directory
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1504   *
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1505   * Return:  oplock state, -ENOENT if create lease context not found
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1506   */
74b8c7501e1335 fs/smb/server/oplock.c Namjae Jeon 2024-03-10  1507  struct lease_ctx_info *parse_lease_state(void *open_req)
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16 @1508  {
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1509  	struct create_context *cc;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1510  	struct smb2_create_req *req = (struct smb2_create_req *)open_req;
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1511  	struct lease_ctx_info *lreq;
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1512  
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1513  	cc = smb2_find_context_vals(req, SMB2_CREATE_REQUEST_LEASE, 4);
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1514  	if (IS_ERR_OR_NULL(cc))
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1515  		return NULL;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1516  
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1517  	lreq = kzalloc(sizeof(struct lease_ctx_info), GFP_KERNEL);
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1518  	if (!lreq)
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1519  		return NULL;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1520  
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1521  	if (sizeof(struct lease_context_v2) == le32_to_cpu(cc->DataLength)) {
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1522  		struct create_lease_v2 *lc = (struct create_lease_v2 *)cc;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1523  
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1524  		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1525  		lreq->req_state = lc->lcontext.LeaseState;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1526  		lreq->flags = lc->lcontext.LeaseFlags;
d045850b628aaf fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1527  		lreq->epoch = lc->lcontext.Epoch;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1528  		lreq->duration = lc->lcontext.LeaseDuration;
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1529  		memcpy(lreq->parent_lease_key, lc->lcontext.ParentLeaseKey,
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1530  				SMB2_LEASE_KEY_SIZE);
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1531  		lreq->version = 2;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1532  	} else {
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1533  		struct create_lease *lc = (struct create_lease *)cc;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1534  
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1535  		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1536  		lreq->req_state = lc->lcontext.LeaseState;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1537  		lreq->flags = lc->lcontext.LeaseFlags;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1538  		lreq->duration = lc->lcontext.LeaseDuration;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1539  		lreq->version = 1;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1540  	}
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1541  	return lreq;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1542  }
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1543  

:::::: The code at line 1508 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
