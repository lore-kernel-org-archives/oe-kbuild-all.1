Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DD81F1302
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758905219; cv=none; b=pm33Pe4TPUuEY1/ceEtZnsH0Cj+xbyHf2+sRp2DdjL2zZSyIxhDsNwdfZjEI8ftvFFLPfIvryXsc3zOmAB3ngktus3jbKeIUejwV2CJSQcvsEpLtsnTY8FE8UKdl1xIDhWe4n3MNUrrHqKJXWYYrJa3vy7ol/x+0JT3n0PDqiA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758905219; c=relaxed/simple;
	bh=VVuF0UeGszbi5w5YRaGgQVX1wHytPM3oY4kRsdxL9K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KChpoQ+RyxvJR679ee2BvC2vDUVhxgsboO+pRdbUSo0+6nwTQC/3kJPMfqXNv1W7vsKTl7MOC9rjuWxL8CkAksLeDumrzMv22+kAYGW68lfmf29yd0jvB72VXXzaUomlmIAt58XDk/DFujMTSOClhXRwwpQu9g8JEEbrJu301zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sfyt9cRK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sfyt9cRK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758905218; x=1790441218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VVuF0UeGszbi5w5YRaGgQVX1wHytPM3oY4kRsdxL9K0=;
  b=Sfyt9cRKST37oI87jDhEbQzLZMuf6XAcLM+Qx73g8Y5mU+Mw5rdSQQ4f
   H2tM6CxErBh8ZiG2P8dPr3G+0unq3MFIRSQeNWpUAw1vmEo1chmrHZSQZ
   NMtYhkXCmgrAs0srx+xa54EHKHtel4w1Xyb3WfGL7f+bNvjVWvHEN72tp
   Pz1ILeX2qRCove7HYHI4ljO2O0F5bSYl2w0rc6cRd+UUGV3LB0Kn0060R
   JY5yIbUjf5cIG0lMvGu4moB0EJvYY3YfFcTfxNYuBaINzQcrMiPcTYC91
   9t1AyiQaiXkjxFK0Xbdv8y0CPmRMfDzKPbp8PtNLpfDT//XHGSV2DeBBN
   Q==;
X-CSE-ConnectionGUID: ODZ5+SgTQ2WJXiUs6m0ZFA==
X-CSE-MsgGUID: 3xfcI1MTQ1a/+tMK7GlE0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61410328"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="61410328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 09:46:58 -0700
X-CSE-ConnectionGUID: AA/i5poxT0C3CBRUqnZCOQ==
X-CSE-MsgGUID: gBCmhMP+Q/C630SrxX8JiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="176924563"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Sep 2025 09:46:57 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Bad-0006Rf-2j;
	Fri, 26 Sep 2025 16:46:41 +0000
Date: Sat, 27 Sep 2025 00:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 27/38] nfsd: add notification handlers for dir events
Message-ID: <202509270005.wbvF4f6R-lkp@intel.com>
References: <20250924-dir-deleg-v3-27-9f3af8bc5c40@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-dir-deleg-v3-27-9f3af8bc5c40@kernel.org>

Hi Jeff,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 36c204d169319562eed170f266c58460d5dad635]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/filelock-push-the-S_ISREG-check-down-to-setlease-handlers/20250925-022057
base:   36c204d169319562eed170f266c58460d5dad635
patch link:    https://lore.kernel.org/r/20250924-dir-deleg-v3-27-9f3af8bc5c40%40kernel.org
patch subject: [PATCH v3 27/38] nfsd: add notification handlers for dir events
config: x86_64-randconfig-122-20250926 (https://download.01.org/0day-ci/archive/20250927/202509270005.wbvF4f6R-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270005.wbvF4f6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270005.wbvF4f6R-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfs4xdr.c:3763:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] *attrmask @@     got restricted __be32 [usertype] * @@
   fs/nfsd/nfs4xdr.c:3763:18: sparse:     expected unsigned int [usertype] *attrmask
   fs/nfsd/nfs4xdr.c:3763:18: sparse:     got restricted __be32 [usertype] *

vim +3763 fs/nfsd/nfs4xdr.c

  3754	
  3755	static bool
  3756	nfsd4_setup_notify_entry4(struct notify_entry4 *ne, struct xdr_stream *xdr,
  3757				  struct dentry *dentry, struct nfs4_delegation *dp,
  3758				  char *name, u32 namelen)
  3759	{
  3760		uint32_t *attrmask;
  3761	
  3762		/* Reserve space for attrmask */
> 3763		attrmask = xdr_reserve_space(xdr, 3 * sizeof(uint32_t));
  3764		if (!attrmask)
  3765			return false;
  3766	
  3767		ne->ne_file.data = name;
  3768		ne->ne_file.len = namelen;
  3769		ne->ne_attrs.attrmask.element = attrmask;
  3770	
  3771		attrmask[0] = 0;
  3772		attrmask[1] = 0;
  3773		attrmask[2] = 0;
  3774		ne->ne_attrs.attr_vals.data = NULL;
  3775		ne->ne_attrs.attr_vals.len = 0;
  3776		ne->ne_attrs.attrmask.count = 1;
  3777		return true;
  3778	}
  3779	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
