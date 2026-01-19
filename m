Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B531500972
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 22:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768863025; cv=none; b=ZPi/gGcgU0+X/XCXPPTlnAM/ZAmv8RGwjzMzySn4Ir4fu4Tx/TyfWzwVjzr0X6G/TNOn6W8pqinXqIkEgvnYJgZxWaf6EMDEa3d6yojVX0kMB2dJrImNU1hwleYV2Epz4vtp+2Osmkv9VuctFSFO1PXGCu8H6Z2l86Cv0mRTHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768863025; c=relaxed/simple;
	bh=shuI98kf3EXyDV7V4LCARdp7GfQKTZgsndPYTnq6NZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUutZS91Z7IaosErKFM9EhofXpNcZIooPRiMO36aqrcTHuM65stdMj1Q9BrXEjxyUfpQNUuAGp7muPhLKOwAtXdmb52a/W/TIp+WiCeWTHtkMUIN8KBez+PhjsjUFL+t32LnoZYdMYjHgaTaEl7esdio36J8KFYCCYfwYYmqh9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gyw/4e5m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gyw/4e5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768863024; x=1800399024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=shuI98kf3EXyDV7V4LCARdp7GfQKTZgsndPYTnq6NZY=;
  b=Gyw/4e5mNJs4PalLml4cfBnHDSUBjIzKPUNjMYd6ZwKlopD6P5PEz8Ya
   Oq36Bqa9LgHEVWuJe2jagmz9A/2ZwSZlJDO3C7qf820YTGYk2sQrSfLbc
   drgupDIIR35W+qdCiyDwesFJdoV+J78BK0ILC+zf87xVd3sT+I8y/zMPl
   9xhgHfrrNBNrfWrG6sXZNgXA7eG2oVNUpdqULss+ys+m6+kfox0zfZE3Y
   0mbwKBwMatnc76XFepskDQr43n8TmQKTqOQjdlGXqIYePYrXS0zLn0az9
   L2gVhVIJymVUtXv2dhc7yiuRWEu8phGxwcncwsuooLJyDH4ENfRuFLZ5F
   A==;
X-CSE-ConnectionGUID: Bi87AbNIRNmvyRA2vB6mxA==
X-CSE-MsgGUID: TakLgZ42Ty2pl1rkIO3fQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73698954"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="73698954"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 14:50:24 -0800
X-CSE-ConnectionGUID: fP0NQUzaQk+zxRVc+KX3xg==
X-CSE-MsgGUID: 3gqHIpWtQqS8Fcua+DXhKQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2026 14:50:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhy4g-00000000OML-1fif;
	Mon, 19 Jan 2026 22:50:18 +0000
Date: Tue, 20 Jan 2026 06:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>, chuck.lever@oracle.com,
	jlayton@kernel.org, neil@brown.name, okorniev@redhat.com,
	tom@talpey.com, hch@lst.de, alex.aring@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: [PATCH 1/1] NFSD: Enforce recall timeout for layout conflict
Message-ID: <202601200621.KNAnUu7y-lkp@intel.com>
References: <20260119174737.3619599-1-dai.ngo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119174737.3619599-1-dai.ngo@oracle.com>

Hi Dai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.19-rc6 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dai-Ngo/NFSD-Enforce-recall-timeout-for-layout-conflict/20260120-015237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260119174737.3619599-1-dai.ngo%40oracle.com
patch subject: [PATCH 1/1] NFSD: Enforce recall timeout for layout conflict
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601200621.KNAnUu7y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200621.KNAnUu7y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200621.KNAnUu7y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/nfs4layouts.c:793 expecting prototype for nfsd_layout_breaker_timedout(). Prototype was for nfsd4_layout_lm_breaker_timedout() instead
>> Warning: fs/nfsd/nfs4layouts.c:828 function parameter 'fl' not described in 'nfsd4_layout_lm_retry'
>> Warning: fs/nfsd/nfs4layouts.c:828 function parameter 'ctx' not described in 'nfsd4_layout_lm_retry'
>> Warning: fs/nfsd/nfs4layouts.c:828 expecting prototype for nfsd4_layout_lm_conflict(). Prototype was for nfsd4_layout_lm_retry() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
