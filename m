Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9763B42F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 20:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785443890; cv=none; b=Z5//ZXLgzFfS5ngvrzScT/I4lqNWQNLIfGTq5sjxPdctVDeEziCtpEmu15D9p/tDLaRU3W+Rf3rCeMb0Tmpi1ovoLDd/P0U09KkE+KP20GJNMLM+TXA8Ig6Z2JOhqDAqi8Ixejh6BDMBfw0wz6tQKjcWPCmcV9wIrBK2Jp5pRbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785443890; c=relaxed/simple;
	bh=mecl6yT3RV+w/l4XJTnmZtboflffxd13kHhFpBke5no=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UvBZIpKlQer8Ge9xNcART+j63+TYzAK2kvYfxjfTAndUY1Epq8vuh7B66AfJFDg8UdebQEgWDsMcCGoeIR1WRaxv9cZjNIUa7ySFe4nwl7Q83GMhxCMdt+d1T82IsINOk3OZyYdq7V02V7YrIX6McPaw0ncYIPZmt1fyoCOqMx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ag33AFDL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ag33AFDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785443886; x=1816979886;
  h=date:from:to:cc:subject:message-id;
  bh=mecl6yT3RV+w/l4XJTnmZtboflffxd13kHhFpBke5no=;
  b=ag33AFDLbCC6cpXU9PqYmHN+XL5vkWhnLofzV719YP1vte3m3bMOpY0P
   i29Iy0Hdj+B3GH5Jq1eE5PKuPFJL8RRqU7pJZB0aAN0SkGKGX4lDed6x6
   TGc5lMFyBfWSW9qDbAaCGpdEGyqY1PP1Jvatq/AjkteFNeYueDrmFi0sT
   233C6ANO3a0I0DZdNvntJjEh69TSQ14GHBa0efUitKfUS0/iM+kWHXqGm
   BJECA0yij9y4JsLCJ9830oKOFyB6E4bNCVuj/SXb1emq6fTX+2Jyzvght
   pIbitklCEbT0AYyQMU6o4N8vxo/050fQXB+S2jfE2ERyuwrt2vzuT9TYn
   Q==;
X-CSE-ConnectionGUID: Eh9WNZkAR8Cr4NKA9JP0ng==
X-CSE-MsgGUID: jGXOrNCBRierzFFlYaT8Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86151570"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86151570"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 13:38:05 -0700
X-CSE-ConnectionGUID: YRl0xAv8TTSWrQ9xTJnhzw==
X-CSE-MsgGUID: 9pIUbZbnTvCu3I5xLqJnHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="264201686"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Jul 2026 13:38:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpXVx-00000000hZl-3Rt4;
	Thu, 30 Jul 2026 20:38:01 +0000
Date: Fri, 31 Jul 2026 04:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <cel@kernel.org>
Subject: [cel:nfsd-testing 110/222] fs/nfsd/nfs4xdr.c:4200:18:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202607310455.AT0GoC5j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   67be65963a6470b667125cc648b56161ed3dfdce
commit: 4b64b811f368bcd98a5a11f7079f863db3a2e1c5 [110/222] nfsd: add notification handlers for dir events
config: m68k-randconfig-r122-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310455.AT0GoC5j-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310455.AT0GoC5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310455.AT0GoC5j-lkp@intel.com/

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
