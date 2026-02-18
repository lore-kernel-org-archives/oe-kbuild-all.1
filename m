Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823DD2F691C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 04:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771388257; cv=none; b=PDBuC6LIbMwv25XmC1fbzlzKF1N2Jg+v0q9qLqWDWQT2yhbNgUfsI7GfOZrHbOHY2cEyVLRpRidLOZSLOoB3HGj+FF0Hl4oFQ9KXh5Cw/P4Ze1RM5f1a0KdGC81uHJ653eD/pz8pm1q0ZLCUkoVg17ocfcnl5Fb8iEMh7N9Tt2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771388257; c=relaxed/simple;
	bh=DQf/cXwqrmIWO8h1ljYqX7wGt192wHM97EhLOmXxY3E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fEqZ0kVxbPJ5WGYUuucTe/EIiqwOY8zG1NPMHqBtPPAAUrDbOVR4S9SG9tJIF2mZ8zQ4l+Z3Vm1h84TCXBVUiTNbpOQYnoTegFONuF15PiQxlCZv+bs7uX1GmyifUQ6D6gLVlMgKb/+R4DQxr7vw+9jvUMJFpc7CjkXQ6IKnBsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyA+CQ8q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyA+CQ8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771388256; x=1802924256;
  h=date:from:to:cc:subject:message-id;
  bh=DQf/cXwqrmIWO8h1ljYqX7wGt192wHM97EhLOmXxY3E=;
  b=gyA+CQ8qFs+GM7MDkodfPoyaVkvNsp3BdjdWwSnyapgEahZ6QF2JXIfy
   j4Td+AVLyHuN5SouKaDIi5P7DfDduUfdYBiy0asc0N/6fqcKQ72kZl4+u
   aySsqfSC04iSI+78uGO02RhuOApbjQobxrAobOAwZbx/xSaM7bPAW57uF
   GMus+5kREhc16JTl+V8/bXC3/cQQ/ghBDmh6z8+bo7hBZzlk35/fUR7WP
   qWc4ucoAqNxVUrFXmbP2gT8SFFrsiPPD6iHU1pgT5uPf6re4UXfj3dnLA
   ChUHYAbqs+gE21T/QjPL/+7ZxbUfRBciZv9gz9Xp/ijKFjsL13E9zaxOp
   w==;
X-CSE-ConnectionGUID: i8e8pKlZSUSJyGrJbsiYJg==
X-CSE-MsgGUID: oJqdvYckSpOmCHY+Z9Av7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83087943"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83087943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 20:17:35 -0800
X-CSE-ConnectionGUID: RmBHj8wLQwGoLlTTHuG47Q==
X-CSE-MsgGUID: 6BumMEY5QGGl7bE6O8QSiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="217956719"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Feb 2026 20:17:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsZ0F-0000000122a-1IgX;
	Wed, 18 Feb 2026 04:17:31 +0000
Date: Wed, 18 Feb 2026 12:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 13/24] fs/nfsd/nfs4xdr.c:3773:18: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202602181258.R2HSeL9C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   ab82ce180a346bc50223092e6d94b2aa7c863322
commit: a0638944d0de668162a22ef2e5e5723df61e1112 [13/24] nfsd: add notification handlers for dir events
config: i386-randconfig-061-20260218 (https://download.01.org/0day-ci/archive/20260218/202602181258.R2HSeL9C-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181258.R2HSeL9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181258.R2HSeL9C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfs4xdr.c:3773:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] *attrmask @@     got restricted __be32 [usertype] * @@
   fs/nfsd/nfs4xdr.c:3773:18: sparse:     expected unsigned int [usertype] *attrmask
   fs/nfsd/nfs4xdr.c:3773:18: sparse:     got restricted __be32 [usertype] *

vim +3773 fs/nfsd/nfs4xdr.c

  3764	
  3765	static bool
  3766	nfsd4_setup_notify_entry4(struct notify_entry4 *ne, struct xdr_stream *xdr,
  3767				  struct dentry *dentry, struct nfs4_delegation *dp,
  3768				  char *name, u32 namelen)
  3769	{
  3770		uint32_t *attrmask;
  3771	
  3772		/* Reserve space for attrmask */
> 3773		attrmask = xdr_reserve_space(xdr, 3 * sizeof(uint32_t));
  3774		if (!attrmask)
  3775			return false;
  3776	
  3777		ne->ne_file.data = name;
  3778		ne->ne_file.len = namelen;
  3779		ne->ne_attrs.attrmask.element = attrmask;
  3780	
  3781		attrmask[0] = 0;
  3782		attrmask[1] = 0;
  3783		attrmask[2] = 0;
  3784		ne->ne_attrs.attr_vals.data = NULL;
  3785		ne->ne_attrs.attr_vals.len = 0;
  3786		ne->ne_attrs.attrmask.count = 1;
  3787		return true;
  3788	}
  3789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
