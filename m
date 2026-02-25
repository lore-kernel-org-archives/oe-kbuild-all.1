Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DEB13D51E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 01:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984101; cv=none; b=ZLCnChPeiWp3a7VjnU7jP7d75MV8QNm0KSowSu+FZ25v57dHXPVJnyIo4oGRLDcAt5T4Vu07I1f0yRIb7cfyOv0BOvY+l1gcOZku6BGo9/2H+lvnn3TW+ypVYNpEzRTB+6BALuYjwYV46b6pc5rujvMHZoRuS/JvId5Q6vwEbRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984101; c=relaxed/simple;
	bh=oSji/meOflgdIiEQgLUdpwYgw9uTsWgxRM0vFj+kpoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nxv7BDxnT+8W62E4YH05eQ5al7EqB26muGStWG++cle9cMYz6KBTFMgzFSEYVv6rSmMXun0H1sPQ31L+wyTNEuLW1LL7XTYSmWDjihyp7qILlx7HP7l6VNeGowhhpu6l5hJgC5LnXLCxsexisCdVICFD1VgnuxyT9z1Xs098GS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4WiA1Bx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4WiA1Bx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771984099; x=1803520099;
  h=date:from:to:cc:subject:message-id;
  bh=oSji/meOflgdIiEQgLUdpwYgw9uTsWgxRM0vFj+kpoM=;
  b=m4WiA1BxrPWB+aQfhQl19ZKKWrTfDyJfLnHtR+DvZCHBi8nhL7TkWhUO
   +E8iYtXp3kVgUa7+aN+F6P6CeubA5qeivewV6Axyw+hnpYoFpavTm2Rby
   wZQALrC89TjM5BCrXG5cWp8fsE4GyrWD+iYUYCwS4YEoecfGdgBBZ7VGu
   6Vc+Tbmnrc1DobGNJtTg9kNfeJORFEwrT3sG3sc2xjF8EG9tR+OgQ4HC2
   PXUgfbpRr5u19f8RTlWQcJOZdU6wyuw0o4QJFJ9rnYb1CDWEh+47cnWse
   nfe4apqiDn6obMV+mHcGgnJObLOQxtPXd4xThZcS2YS59k7lt6pyb3l1Y
   g==;
X-CSE-ConnectionGUID: z7Ks2LbFSd2FJdIdr4+5CA==
X-CSE-MsgGUID: AjiYHPJOSzGMZy1EKSQuiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72716402"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72716402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 17:48:18 -0800
X-CSE-ConnectionGUID: KZYoEoiiQKmGnFrJBNb2gQ==
X-CSE-MsgGUID: JdOIIoBsQVOlpDHLI5pw5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="220583317"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Feb 2026 17:48:16 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv40c-000000003FR-0Oz6;
	Wed, 25 Feb 2026 01:48:14 +0000
Date: Wed, 25 Feb 2026 09:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 67/69] fs/nfsd/nfsfh.c:198:9: warning:
 'FH_MAC_WORDS' redefined
Message-ID: <202602250917.S6kF2mE6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   71197d3ca486848e7eadacb7c45285b7d6b41d2a
commit: d247fc9b77bc575fa9452ef48dd28cf7b3808d58 [67/69] NFSD: Sign filehandles
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260225/202602250917.S6kF2mE6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250917.S6kF2mE6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250917.S6kF2mE6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfsfh.c:198:9: warning: 'FH_MAC_WORDS' redefined
     198 | #define FH_MAC_WORDS sizeof(__le64)/4
         |         ^~~~~~~~~~~~
   fs/nfsd/nfsfh.c:145:9: note: this is the location of the previous definition
     145 | #define FH_MAC_WORDS (sizeof(__le64) / 4)
         |         ^~~~~~~~~~~~
   fs/nfsd/nfsfh.c:199:13: error: redefinition of 'fh_append_mac'
     199 | static bool fh_append_mac(struct svc_fh *fhp, struct net *net)
         |             ^~~~~~~~~~~~~
   fs/nfsd/nfsfh.c:147:13: note: previous definition of 'fh_append_mac' with type 'bool(struct svc_fh *, struct net *)' {aka '_Bool(struct svc_fh *, struct net *)'}
     147 | static bool fh_append_mac(struct svc_fh *fhp, struct net *net)
         |             ^~~~~~~~~~~~~
   fs/nfsd/nfsfh.c:231:13: error: redefinition of 'fh_verify_mac'
     231 | static bool fh_verify_mac(struct svc_fh *fhp, struct net *net)
         |             ^~~~~~~~~~~~~
   fs/nfsd/nfsfh.c:178:13: note: previous definition of 'fh_verify_mac' with type 'bool(struct svc_fh *, struct net *)' {aka '_Bool(struct svc_fh *, struct net *)'}
     178 | static bool fh_verify_mac(struct svc_fh *fhp, struct net *net)
         |             ^~~~~~~~~~~~~
>> fs/nfsd/nfsfh.c:178:13: warning: 'fh_verify_mac' defined but not used [-Wunused-function]
>> fs/nfsd/nfsfh.c:147:13: warning: 'fh_append_mac' defined but not used [-Wunused-function]
     147 | static bool fh_append_mac(struct svc_fh *fhp, struct net *net)
         |             ^~~~~~~~~~~~~


vim +/FH_MAC_WORDS +198 fs/nfsd/nfsfh.c

   146	
 > 147	static bool fh_append_mac(struct svc_fh *fhp, struct net *net)
   148	{
   149		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
   150		struct knfsd_fh *fh = &fhp->fh_handle;
   151		siphash_key_t *fh_key = nn->fh_key;
   152		__le64 hash;
   153	
   154		if (!fh_key)
   155			goto out_no_key;
   156		if (fh->fh_size + sizeof(hash) > fhp->fh_maxsize)
   157			goto out_no_space;
   158	
   159		hash = cpu_to_le64(siphash(&fh->fh_raw, fh->fh_size, fh_key));
   160		memcpy(&fh->fh_raw[fh->fh_size], &hash, sizeof(hash));
   161		fh->fh_size += sizeof(hash);
   162		return true;
   163	
   164	out_no_key:
   165		pr_warn_ratelimited("NFSD: unable to sign filehandles, fh_key not set.\n");
   166		return false;
   167	
   168	out_no_space:
   169		pr_warn_ratelimited("NFSD: unable to sign filehandles, fh_size %zu would be greater than fh_maxsize %d.\n",
   170				    fh->fh_size + sizeof(hash), fhp->fh_maxsize);
   171		return false;
   172	}
   173	
   174	/*
   175	 * Verify that the filehandle's MAC was hashed from this filehandle
   176	 * given the server's fh_key:
   177	 */
 > 178	static bool fh_verify_mac(struct svc_fh *fhp, struct net *net)
   179	{
   180		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
   181		struct knfsd_fh *fh = &fhp->fh_handle;
   182		siphash_key_t *fh_key = nn->fh_key;
   183		__le64 hash;
   184	
   185		if (!fh_key) {
   186			pr_warn_ratelimited("NFSD: unable to verify signed filehandles, fh_key not set.\n");
   187			return false;
   188		}
   189	
   190		hash = cpu_to_le64(siphash(&fh->fh_raw, fh->fh_size - sizeof(hash),  fh_key));
   191		return crypto_memneq(&fh->fh_raw[fh->fh_size - sizeof(hash)],
   192						&hash, sizeof(hash)) == 0;
   193	}
   194	
   195	/*
   196	 * Append an 8-byte MAC to the filehandle hashed from the server's fh_key:
   197	 */
 > 198	#define FH_MAC_WORDS sizeof(__le64)/4
   199	static bool fh_append_mac(struct svc_fh *fhp, struct net *net)
   200	{
   201		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
   202		struct knfsd_fh *fh = &fhp->fh_handle;
   203		siphash_key_t *fh_key = nn->fh_key;
   204		__le64 hash;
   205	
   206		if (!(fhp->fh_export->ex_flags & NFSEXP_SIGN_FH))
   207			return true;
   208	
   209		if (!fh_key) {
   210			pr_warn_ratelimited("NFSD: unable to sign filehandles, fh_key not set.\n");
   211			return false;
   212		}
   213	
   214		if (fh->fh_size + sizeof(hash) > fhp->fh_maxsize) {
   215			pr_warn_ratelimited("NFSD: unable to sign filehandles, fh_size %d would be greater"
   216				" than fh_maxsize %d.\n", (int)(fh->fh_size + sizeof(hash)), fhp->fh_maxsize);
   217			return false;
   218		}
   219	
   220		hash = cpu_to_le64(siphash(&fh->fh_raw, fh->fh_size, fh_key));
   221		memcpy(&fh->fh_raw[fh->fh_size], &hash, sizeof(hash));
   222		fh->fh_size += sizeof(hash);
   223	
   224		return true;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
