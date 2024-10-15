Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3550F20EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 03:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728961888; cv=none; b=shCzGWu9rhNQrGAxRrgoIz6I9q6XexbLNHGs4m9bcBAvAkNhbXPzTW6hvKdnHIx8vD5vKbNizaMwqCwE56EPUD85iTdQ4RNAHFLpPyrdtmRcAZQeVfLMV8C9s8TejJqVYPRPuIVcWWGPQVOT1ivNPf6T44SsUVxZuaVQA8aEDPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728961888; c=relaxed/simple;
	bh=pa+DgQL1NqnzTFMU1tuH2g8P862XDpD23D6Ysw3MSSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLCZ3SSfn7R/sfHddzptQtOwkqx+7noUSyiHhpj8/nKxxP3znCmKu/OfKmHBfrsAJMSGNFhES1s4BkkbNdZ+CJQpKy+hBAjZyE/mR3hsXEvLn0m1v3d45bhDe10xuYJNbgvHtYtftVp+Ahc4azMjrNLg9WhMRIicgnZrLade1D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUFo+4Wx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUFo+4Wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728961888; x=1760497888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pa+DgQL1NqnzTFMU1tuH2g8P862XDpD23D6Ysw3MSSw=;
  b=bUFo+4Wx1I3TDcquzxp+JlMEsoh+3fWvnR8W+tQA5ldxLOd8jJDC0GN2
   EzVtomMzZS42nKC/R3F8k3xJN8ZoVz8BFwYdbPLaPAooLhAT/tApwly+N
   z/ACixgSuMTIW87VCxvCGpQENYvzxtCJHKNFchs9V0q906okk9tXT76gC
   5RzKOnRWqW7KmJ+qDv+GiTtZcG2nEXlWnZpfmErKYnDT+zGOhYT+Hgz2m
   AxUEFHfzYd1sQQ27ZNZ4KBY/aIGNbrJV8EAztWLiM0189fKfNksDhp9G3
   Dqv8nWt1dLz7qCvA/un8vLv6AfJugOSP1YDjvSvgc6MLqDAy1wu/C3EM6
   w==;
X-CSE-ConnectionGUID: cIHrNPQfS6akBBE4ZZUAIA==
X-CSE-MsgGUID: DlQ/K+jITfCKd2NGtTge3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28122413"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28122413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 20:11:26 -0700
X-CSE-ConnectionGUID: C/APTXIrSIa7U56zMxSwag==
X-CSE-MsgGUID: +5DReB2JQpySj8Z/GR0bHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="108528599"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2024 20:11:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Xxx-000HWt-2Z;
	Tue, 15 Oct 2024 03:11:21 +0000
Date: Tue, 15 Oct 2024 11:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Subject: [linux-next:master 2261/4178] fs/inode.c:2193:9: error: implicit
 declaration of function 'ktime_get_coarse_real_ts64_mg'; did you mean
 'ktime_get_coarse_real_ts64'?
Message-ID: <202410151125.xR9MOnLU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7f773fd61baa9b136faa5c4e6555aa64c758d07c
commit: 4e40eff0b5737c0de39e1ae5812509efbc0b986e [2261/4178] fs: add infrastructure for multigrain timestamps
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241015/202410151125.xR9MOnLU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151125.xR9MOnLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151125.xR9MOnLU-lkp@intel.com/

Note: the linux-next/master HEAD 7f773fd61baa9b136faa5c4e6555aa64c758d07c builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   fs/inode.c: In function 'current_time':
>> fs/inode.c:2193:9: error: implicit declaration of function 'ktime_get_coarse_real_ts64_mg'; did you mean 'ktime_get_coarse_real_ts64'? [-Werror=implicit-function-declaration]
    2193 |         ktime_get_coarse_real_ts64_mg(&now);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         ktime_get_coarse_real_ts64
   fs/inode.c: In function 'inode_set_ctime_current':
>> fs/inode.c:2686:25: error: implicit declaration of function 'ktime_get_real_ts64_mg'; did you mean 'ktime_get_real_ts64'? [-Werror=implicit-function-declaration]
    2686 |                         ktime_get_real_ts64_mg(&now);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         ktime_get_real_ts64
   cc1: some warnings being treated as errors


vim +2193 fs/inode.c

  2174	
  2175	/**
  2176	 * current_time - Return FS time (possibly fine-grained)
  2177	 * @inode: inode.
  2178	 *
  2179	 * Return the current time truncated to the time granularity supported by
  2180	 * the fs, as suitable for a ctime/mtime change. If the ctime is flagged
  2181	 * as having been QUERIED, get a fine-grained timestamp, but don't update
  2182	 * the floor.
  2183	 *
  2184	 * For a multigrain inode, this is effectively an estimate of the timestamp
  2185	 * that a file would receive. An actual update must go through
  2186	 * inode_set_ctime_current().
  2187	 */
  2188	struct timespec64 current_time(struct inode *inode)
  2189	{
  2190		struct timespec64 now;
  2191		u32 cns;
  2192	
> 2193		ktime_get_coarse_real_ts64_mg(&now);
  2194	
  2195		if (!is_mgtime(inode))
  2196			goto out;
  2197	
  2198		/* If nothing has queried it, then coarse time is fine */
  2199		cns = smp_load_acquire(&inode->i_ctime_nsec);
  2200		if (cns & I_CTIME_QUERIED) {
  2201			/*
  2202			 * If there is no apparent change, then get a fine-grained
  2203			 * timestamp.
  2204			 */
  2205			if (now.tv_nsec == (cns & ~I_CTIME_QUERIED))
  2206				ktime_get_real_ts64(&now);
  2207		}
  2208	out:
  2209		return timestamp_truncate(now, inode);
  2210	}
  2211	EXPORT_SYMBOL(current_time);
  2212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
