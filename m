Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB7C3A3E71
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985022; cv=none; b=Ls5HJVhfHgGJ3R3vzR4wfcRsXebCBhZ8db2f4GuXzNn2Kt+ptRy01G+FizWOHIzcMP7rMN8JoFezlOuccLQ58SFthkoHSIHh4b/7AUWthbMNGeIAm62uOyQYqIlNU1RPpTN17lD6t5x3LnN2r7xu0iu9BnQaErZJ0g3hw2UWvzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985022; c=relaxed/simple;
	bh=LoU2DQSWCzbNkbhtXNtuH80aGbaEp19bsbtmGr1cx5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mW0scZ5ubCabxzPyJjJmSqOcS0sgHRo7snZUpIAoB950Gouqy75et50v+iBXaCGh2enZ/8EnHURQ4yHiKbpB6HT5visDiZRFUMlNfTnJQqX0wePOt0d8CI5j4NuZ07wO/eoUtnEYPI7gkLYgy218PkN8Z+9U9avX+9OzlKCoTbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VF7vRixl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VF7vRixl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774985021; x=1806521021;
  h=date:from:to:cc:subject:message-id;
  bh=LoU2DQSWCzbNkbhtXNtuH80aGbaEp19bsbtmGr1cx5w=;
  b=VF7vRixl9JRJXhI+dmnaWxQkz5MO5bhC5kHX2+VkE+pUCKB4KnnqNYw9
   ebU74ORjBA+bHrtGoAuX0UUblfvp2YLqJfKUBwik1IFUb2RD2iUrX1kGa
   RF7qFsPaiK9ghU2mPguzF9SPKe3oHI50fvmhNbVBDS8C9hyNglYddCSP7
   G/kTWB4BvC8Q03fzVSsaCMkD45O4s6mPiU7uOeJko4cQ3QrRPYmTCblcp
   e8fHZWyFZ0lfotN5kAg6y6zm/doQnyYRFykyaEkxfJf26BTVYxV+4UohM
   aTbVGMXFhZWKa2yhu7b63E/bFAs/dcv+nh1NaPr+ujsFduZdkOLaO0wgs
   Q==;
X-CSE-ConnectionGUID: pdMsJm7KSSSfqlWq29ONYA==
X-CSE-MsgGUID: y1WDBL4RSiiyJ4cL1br4rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86709921"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86709921"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 12:23:40 -0700
X-CSE-ConnectionGUID: nVKKL2zVR4q3P7GcxqtrjA==
X-CSE-MsgGUID: qsZbAsfRSaqtBXR4RQ98iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="256956595"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Mar 2026 12:23:39 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ega-000000004BP-1re9;
	Tue, 31 Mar 2026 19:23:36 +0000
Date: Wed, 01 Apr 2026 03:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 15/26] fs/nfsd/nfs4xdr.c:4109:18: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202604010359.hffRSjbm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   23dab10e6368fed23984781ef9a247fc242498da
commit: 17ead909b8fe2314cec2ea3ffe9ccc2492c9c3c9 [15/26] nfsd: add notification handlers for dir events
config: csky-randconfig-r111-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010359.hffRSjbm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010359.hffRSjbm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010359.hffRSjbm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfs4xdr.c:4109:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] *attrmask @@     got restricted __be32 [usertype] * @@
   fs/nfsd/nfs4xdr.c:4109:18: sparse:     expected unsigned int [usertype] *attrmask
   fs/nfsd/nfs4xdr.c:4109:18: sparse:     got restricted __be32 [usertype] *

vim +4109 fs/nfsd/nfs4xdr.c

  4100	
  4101	static bool
  4102	nfsd4_setup_notify_entry4(struct notify_entry4 *ne, struct xdr_stream *xdr,
  4103				  struct dentry *dentry, struct nfs4_delegation *dp,
  4104				  struct nfsd_file *nf, char *name, u32 namelen)
  4105	{
  4106		uint32_t *attrmask;
  4107	
  4108		/* Reserve space for attrmask */
> 4109		attrmask = xdr_reserve_space(xdr, 3 * sizeof(uint32_t));
  4110		if (!attrmask)
  4111			return false;
  4112	
  4113		ne->ne_file.data = name;
  4114		ne->ne_file.len = namelen;
  4115		ne->ne_attrs.attrmask.element = attrmask;
  4116	
  4117		attrmask[0] = 0;
  4118		attrmask[1] = 0;
  4119		attrmask[2] = 0;
  4120		ne->ne_attrs.attr_vals.data = NULL;
  4121		ne->ne_attrs.attr_vals.len = 0;
  4122		ne->ne_attrs.attrmask.count = 1;
  4123		return true;
  4124	}
  4125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
