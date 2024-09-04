Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D214F602
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443891; cv=none; b=nGk3Q1d/yTnzTzjqFJ+S5RhpB6LRZGevHb1AFYwhb3VUoZlW6nZD8XoywRF37kWVtaPRmPFV4QxvXW4ht24dF1ijEdWdelhKrd0N0NzO3bJnyz2XX1Xsh4a5q/T2q7KKAusEtv0L8Hv7zjmOiFxbBZsEhUsf7czUq7Wj/hDTdhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443891; c=relaxed/simple;
	bh=sY5IceILDEus7xyNNnOt+5TlMVgXGJ6OHTQRiiC/708=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HfuoHkPaOxAQDO6SoOHiqU/ZBiUAZE/CR02C7kpm3A5U/zNZuTTVfbsEeQT3/NtQIMsfxqADtpC13mJKa8O7i4Lt3r7hCNiTcYF4xq3WAiRRJo606dRv8YYrpaH1DQqUBALhVtd/Sy40qmT4TZuUyfWQcoksQ1YhK3Yfc0z5Dt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSMOOLpS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSMOOLpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725443889; x=1756979889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sY5IceILDEus7xyNNnOt+5TlMVgXGJ6OHTQRiiC/708=;
  b=MSMOOLpSat8iT02D+hglpoWq+hgzqV0kz0iLhiiy5My85T2SyeobCSBl
   kptqofexCL/9hj5gaUpbKMAjARLypB2cL8URv/s2Kgm7g3IlZJwgcgIvo
   iS/1kB/Cdt8zMMVQHoIsz7jO0WqJjXw93+ssz/qoym0wogduoU7S+ulSk
   58Tm5JwzO6xVlHQYCNinJja1lJLiLZFWJC/mPIrAMMIP3DNfEaW5nJtAH
   ejtMU+O11x12YtkytIqSnbX92VGp+3RPCo4/1GmugXfBi6JkHgQDqqUuc
   aybFfelp3+yECp0EzODJLTkV29FlGkyDqy+O9opzs1y7pvh3QwpXzCVaq
   w==;
X-CSE-ConnectionGUID: FmDWUq/tRe2U1L9GDdVTLg==
X-CSE-MsgGUID: 9SLCGudLS32wD3iJYnYtPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46623576"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="46623576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 02:58:08 -0700
X-CSE-ConnectionGUID: lN+s0zyeQkWwOmj/jQXQ1g==
X-CSE-MsgGUID: dXyVpOfgTOq1H42piNmPwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="88463548"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Sep 2024 02:58:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slmm5-0007qD-1G;
	Wed, 04 Sep 2024 09:58:05 +0000
Date: Wed, 4 Sep 2024 17:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:deleg-ace 1/1] fs/nfsd/nfs4xdr.c:4147:52: error: invalid
 type argument of '->' (have 'struct nfs4_stid')
Message-ID: <202409041752.6xekQhS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git deleg-ace
head:   f9306e1825450ef6983cf1ae3cf03cfe115424ba
commit: f9306e1825450ef6983cf1ae3cf03cfe115424ba [1/1] nfsd: add a real ACE to the returned delegation
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240904/202409041752.6xekQhS5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041752.6xekQhS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041752.6xekQhS5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nfsd/nfs4xdr.c: In function 'nfsd4_open_nfsace4_type_and_mask':
>> fs/nfsd/nfs4xdr.c:4147:52: error: invalid type argument of '->' (have 'struct nfs4_stid')
    4147 |         struct inode *inode = open->op_stp->st_stid->sc_file->fi_inode;
         |                                                    ^~
>> fs/nfsd/nfs4xdr.c:4151:27: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    4151 |         if (inode->i_mode & S_IRUGO == S_IRUGO)
         |                           ^
>> fs/nfsd/nfs4xdr.c:4152:26: error: 'ACE4_READ_DATA' undeclared (first use in this function); did you mean 'D_REAL_DATA'?
    4152 |                 *mask |= ACE4_READ_DATA;
         |                          ^~~~~~~~~~~~~~
         |                          D_REAL_DATA
   fs/nfsd/nfs4xdr.c:4152:26: note: each undeclared identifier is reported only once for each function it appears in
>> fs/nfsd/nfs4xdr.c:4153:38: error: 'OPEN4_SHARE_ACCESS_WRITE' undeclared (first use in this function); did you mean 'NFS4_SHARE_ACCESS_WRITE'?
    4153 |         if ((open->op_share_access & OPEN4_SHARE_ACCESS_WRITE) &&
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                      NFS4_SHARE_ACCESS_WRITE
   fs/nfsd/nfs4xdr.c:4154:27: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    4154 |             inode->i_mode & S_IWUGO == S_IWUGO)
         |                           ^
>> fs/nfsd/nfs4xdr.c:4155:26: error: 'ACE4_WRITE_DATA' undeclared (first use in this function)
    4155 |                 *mask |= ACE4_WRITE_DATA;
         |                          ^~~~~~~~~~~~~~~
>> fs/nfsd/nfs4xdr.c:4148:26: warning: unused variable 'rqstp' [-Wunused-variable]
    4148 |         struct svc_rqst *rqstp = open->op_rqstp;
         |                          ^~~~~
   fs/nfsd/nfs4xdr.c: In function 'nfsd4_encode_open_nfsace4':
   fs/nfsd/nfs4xdr.c:4168:20: error: 'ACE4_READ_DATA' undeclared (first use in this function); did you mean 'D_REAL_DATA'?
    4168 |         u32 mask = ACE4_READ_DATA;
         |                    ^~~~~~~~~~~~~~
         |                    D_REAL_DATA
   fs/nfsd/nfs4xdr.c:4182:25: error: 'ACE4_WRITE_DATA' undeclared (first use in this function)
    4182 |                 mask |= ACE4_WRITE_DATA;
         |                         ^~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c: In function 'nfsd4_encode_open_read_delegation4':
>> fs/nfsd/nfs4xdr.c:4207:16: error: too few arguments to function 'nfsd4_encode_open_nfsace4'
    4207 |         return nfsd4_encode_open_nfsace4(xdr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c:4166:1: note: declared here
    4166 | nfsd4_encode_open_nfsace4(struct xdr_stream *xdr, struct nfsd4_open *open)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c: In function 'nfsd4_encode_open_write_delegation4':
   fs/nfsd/nfs4xdr.c:4238:16: error: too few arguments to function 'nfsd4_encode_open_nfsace4'
    4238 |         return nfsd4_encode_open_nfsace4(xdr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c:4166:1: note: declared here
    4166 | nfsd4_encode_open_nfsace4(struct xdr_stream *xdr, struct nfsd4_open *open)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4xdr.c: In function 'nfsd4_encode_open_read_delegation4':
>> fs/nfsd/nfs4xdr.c:4208:1: warning: control reaches end of non-void function [-Wreturn-type]
    4208 | }
         | ^
   fs/nfsd/nfs4xdr.c: In function 'nfsd4_encode_open_write_delegation4':
   fs/nfsd/nfs4xdr.c:4239:1: warning: control reaches end of non-void function [-Wreturn-type]
    4239 | }
         | ^
   fs/nfsd/nfs4xdr.c: At top level:
>> fs/nfsd/nfs4xdr.c:4145:1: warning: 'nfsd4_open_nfsace4_type_and_mask' defined but not used [-Wunused-function]
    4145 | nfsd4_open_nfsace4_type_and_mask(struct nfsd4_open *open, u32 *mask)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +4147 fs/nfsd/nfs4xdr.c

  4143	
  4144	static int
> 4145	nfsd4_open_nfsace4_type_and_mask(struct nfsd4_open *open, u32 *mask)
  4146	{
> 4147		struct inode *inode = open->op_stp->st_stid->sc_file->fi_inode;
> 4148		struct svc_rqst *rqstp = open->op_rqstp;
  4149	
  4150		*mask = 0;
> 4151		if (inode->i_mode & S_IRUGO == S_IRUGO)
> 4152			*mask |= ACE4_READ_DATA;
> 4153		if ((open->op_share_access & OPEN4_SHARE_ACCESS_WRITE) &&
> 4154		    inode->i_mode & S_IWUGO == S_IWUGO)
> 4155			*mask |= ACE4_WRITE_DATA;
  4156	
  4157		if (*mask)
  4158			return NFS4_ACL_WHO_EVERYONE;
  4159	}
  4160	
  4161	/*
  4162	 * This implementation does not yet support returning an ACE in an
  4163	 * OPEN that offers a delegation.
  4164	 */
  4165	static __be32
  4166	nfsd4_encode_open_nfsace4(struct xdr_stream *xdr, struct nfsd4_open *open)
  4167	{
> 4168		u32 mask = ACE4_READ_DATA;
  4169		__be32 status;
  4170	
  4171		/* type */
  4172		status = nfsd4_encode_acetype4(xdr, NFS4_ACE_ACCESS_ALLOWED_ACE_TYPE);
  4173		if (status != nfs_ok)
  4174			return nfserr_resource;
  4175		/* flag */
  4176		status = nfsd4_encode_aceflag4(xdr, 0);
  4177		if (status != nfs_ok)
  4178			return nfserr_resource;
  4179	
  4180		/* access mask */
  4181		if (open->op_share_access & NFS4_SHARE_ACCESS_WRITE)
  4182			mask |= ACE4_WRITE_DATA;
  4183	
  4184		status = nfsd4_encode_acemask4(xdr, mask);
  4185		if (status != nfs_ok)
  4186			return nfserr_resource;
  4187		/* who - empty for now */
  4188		if (xdr_stream_encode_u32(xdr, 0) != XDR_UNIT)
  4189			return nfserr_resource;
  4190		return nfs_ok;
  4191	}
  4192	
  4193	static __be32
  4194	nfsd4_encode_open_read_delegation4(struct xdr_stream *xdr, struct nfsd4_open *open)
  4195	{
  4196		__be32 status;
  4197	
  4198		/* stateid */
  4199		status = nfsd4_encode_stateid4(xdr, &open->op_delegate_stateid);
  4200		if (status != nfs_ok)
  4201			return status;
  4202		/* recall */
  4203		status = nfsd4_encode_bool(xdr, open->op_recall);
  4204		if (status != nfs_ok)
  4205			return status;
  4206		/* permissions */
> 4207		return nfsd4_encode_open_nfsace4(xdr);
> 4208	}
  4209	
  4210	static __be32
  4211	nfsd4_encode_nfs_space_limit4(struct xdr_stream *xdr, u64 filesize)
  4212	{
  4213		/* limitby */
  4214		if (xdr_stream_encode_u32(xdr, NFS4_LIMIT_SIZE) != XDR_UNIT)
  4215			return nfserr_resource;
  4216		/* filesize */
  4217		return nfsd4_encode_uint64_t(xdr, filesize);
  4218	}
  4219	
  4220	static __be32
  4221	nfsd4_encode_open_write_delegation4(struct xdr_stream *xdr,
  4222					    struct nfsd4_open *open)
  4223	{
  4224		__be32 status;
  4225	
  4226		/* stateid */
  4227		status = nfsd4_encode_stateid4(xdr, &open->op_delegate_stateid);
  4228		if (status != nfs_ok)
  4229			return status;
  4230		/* recall */
  4231		status = nfsd4_encode_bool(xdr, open->op_recall);
  4232		if (status != nfs_ok)
  4233			return status;
  4234		/* space_limit */
  4235		status = nfsd4_encode_nfs_space_limit4(xdr, 0);
  4236		if (status != nfs_ok)
  4237			return status;
> 4238		return nfsd4_encode_open_nfsace4(xdr);
  4239	}
  4240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
