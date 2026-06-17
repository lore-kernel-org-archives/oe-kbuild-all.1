Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B42A1ACED5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 04:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781668966; cv=none; b=Ya8ODLWBdviPlAqpKBGwmyNkfj8DyRWMLqCr+RzJgAJfa1sNpo9Iul+Ic0zGpdR3pHeaZWVl/GM+SW/BYiGzKRQ+wjX6Oo6n+/ERM5j1NU/YMzVpQ9NTuoGnWv5umlaaLSKQEDD/Gnkr/z5zJ1K0Qsdusn/jKkRXMyVQvawC2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781668966; c=relaxed/simple;
	bh=elIMoUAJ1afdZwXY4OTqTktk7wQE4msHIkxcBRL7DWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sCq6fu80xOdagh66vp+AGcpu1J0vo0L5rm/D1FzU2ACwN12R2mvPZla83J9SkVg3qxujuw/7ooV9Z+Heg4MrfpNnOMmmm5pmwvh2r+0gcAP8tTLh7SR19T1fkQvWyr1Ls9jNzPgpMH+rN1NfHv9BxBWZ6WyLXfOJr34R6FPvYqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4kMB6v9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4kMB6v9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781668965; x=1813204965;
  h=date:from:to:cc:subject:message-id;
  bh=elIMoUAJ1afdZwXY4OTqTktk7wQE4msHIkxcBRL7DWY=;
  b=Z4kMB6v9NQjkFknbMw/DvR1EO3L5sBO6Y9OG/kj+4JplX4TIia5EoAmz
   CvaSUGCTGe07gwN4bGZlghcCLGxS5aG+wf8615tIP/yDSANtQI2kGemNP
   YwyHUd0LusmsatLVkbI105ma+zb+QuReRdOnmuqaYZlWH80hb+QZtQa+R
   To1q4Izm7gtQ9MZwlxFaLSHbxwlSHkVC/c5QdDLjnlJ/5J0lDb4xJWJ+T
   TY3u7yGQf6mw0tMKW1SUbsVY6SooCqCcDnX0hyUyb+69uX4HqQGeFD3sI
   kpSSdwV2WtNGMN8LoOZwvg3rx8986mHS9DvF3mjqWY/lplXCmhZKQ/0Kg
   w==;
X-CSE-ConnectionGUID: LzQ3v5sNQqqcerhRk2nBRw==
X-CSE-MsgGUID: oUy1W7vYQzamPZdUgjXmFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93121072"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="93121072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 21:02:45 -0700
X-CSE-ConnectionGUID: nzM9FmXhReuDNGvHlpWTZw==
X-CSE-MsgGUID: u6Gc0qpHTU2GdTu9bnxsvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="248022876"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jun 2026 21:02:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZhU8-00000000U4q-3iGj;
	Wed, 17 Jun 2026 04:02:40 +0000
Date: Wed, 17 Jun 2026 12:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 11/21] fs/nfsd/nfs4xdr.c:4200:18: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202606171135.OcFv7J1R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   a27e573c1ea56ce3263c4336b5f83af2e4ebc108
commit: 69b624a2f2a27a92dff8dcc659789117ffedb2fd [11/21] nfsd: add notification handlers for dir events
config: i386-randconfig-061-20260616 (https://download.01.org/0day-ci/archive/20260617/202606171135.OcFv7J1R-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171135.OcFv7J1R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171135.OcFv7J1R-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfs4xdr.c:4200:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] *attrmask @@     got restricted __be32 [usertype] * @@
   fs/nfsd/nfs4xdr.c:4200:18: sparse:     expected unsigned int [usertype] *attrmask
   fs/nfsd/nfs4xdr.c:4200:18: sparse:     got restricted __be32 [usertype] *

vim +4200 fs/nfsd/nfs4xdr.c

  4191	
  4192	static bool
  4193	nfsd4_setup_notify_entry4(struct notify_entry4 *ne, struct xdr_stream *xdr,
  4194				  struct dentry *dentry, struct nfs4_delegation *dp,
  4195				  struct nfsd_file *nf, char *name, u32 namelen)
  4196	{
  4197		uint32_t *attrmask;
  4198	
  4199		/* Reserve space for attrmask */
> 4200		attrmask = xdr_reserve_space(xdr, 3 * sizeof(uint32_t));
  4201		if (!attrmask)
  4202			return false;
  4203	
  4204		ne->ne_file.data = name;
  4205		ne->ne_file.len = namelen;
  4206		ne->ne_attrs.attrmask.element = attrmask;
  4207	
  4208		attrmask[0] = 0;
  4209		attrmask[1] = 0;
  4210		attrmask[2] = 0;
  4211		ne->ne_attrs.attr_vals.data = NULL;
  4212		ne->ne_attrs.attr_vals.len = 0;
  4213		ne->ne_attrs.attrmask.count = 1;
  4214		return true;
  4215	}
  4216	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
