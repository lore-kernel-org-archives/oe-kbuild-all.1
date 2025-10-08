Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D5134BA3B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Oct 2025 18:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759946865; cv=none; b=DQwlh57M9hh08Gz8MklWWbBArnIeUHYIUMRjYWTB86Mu/M4cc2XvBZkze90BRE0z/zlwywWspl3su9AiGJ34dnv4f+84CN/LXpQ8rVmCQ6gIbO537+sJZY6tb8EZcznV/z1D5dhQoYmyiePc0w6SJEPSgkBQaai+5FyOC3slbiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759946865; c=relaxed/simple;
	bh=4iq3jWAFlmQloWEUQbA61+59OMMOfZxjupYs3lYpOGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ue/Oe598iSO0XsG6fAo9ZP/n5iCj6JP3cL5AEEVHhLM++IZEWrFlR+xVJTpFw080YGINHZ5yw7iNk16JsphKE4fPYv4P5JkPy+Ob02hATwOqMhL52tW/0VfjBsGZYsgHvV0CCXbQ6fdh78CIJBjKKjDm51axpjBykBfd0XWSmeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cI7gNvS7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cI7gNvS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759946863; x=1791482863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4iq3jWAFlmQloWEUQbA61+59OMMOfZxjupYs3lYpOGM=;
  b=cI7gNvS7svsk9TVJh8TPlg8VpKkynvcCGh8rUsU8FpPvLbcB66k4WwZl
   1UPojS0NY42iHbT10jeArXFKAoBmAWN/h3tV2oWddolvKXRm8h2Iae0aS
   OrldnSCCr4sdevt+iszFHkZ+ojV1NZ/7OH1XYdIOzcHNtZ+56vwPoWU3Q
   LjBzkDwPKlGdopXW37RriMmLF5fgdEbgRFWB51zWd9D33eWcg6HTQScZk
   HhWqQ5ADqIckehGomnnYpN9DozknurHpvIbOzStKQc3h0jzHdJ3J1URgA
   6zcveTfURPSgF9F3F/06cVFi74Mv9/eVB0rgvw6iH8VVxC+E4uPelNkJP
   w==;
X-CSE-ConnectionGUID: eMsmlXZrReGF7dx2eL/o4w==
X-CSE-MsgGUID: GhIlVebzQze/wnNMNk1ZSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="64766513"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="64766513"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 11:07:43 -0700
X-CSE-ConnectionGUID: cci9ojCaT4SIWlKaPD3zAg==
X-CSE-MsgGUID: 4grb7YayQ4SFMb+mIWwzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="185628765"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2025 11:07:43 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6YZg-0000000083V-0jFa;
	Wed, 08 Oct 2025 18:07:40 +0000
Date: Wed, 8 Oct 2025 20:06:59 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:always-kfence 1/1] mm/slub.c:4207:24: error: implicit
 declaration of function '__kfence_alloc'; did you mean 'kfence_alloc'?
Message-ID: <202510082044.JulQCumd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git always-kfence
head:   90a1fd620f839dfd87e82ec5482b27e364b1b5b9
commit: 90a1fd620f839dfd87e82ec5482b27e364b1b5b9 [1/1] mm: add a way to always do a kfence allocation in a slabcache
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251008/202510082044.JulQCumd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251008/202510082044.JulQCumd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510082044.JulQCumd-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'slab_kfence_alloc':
>> mm/slub.c:4207:24: error: implicit declaration of function '__kfence_alloc'; did you mean 'kfence_alloc'? [-Wimplicit-function-declaration]
    4207 |                 return __kfence_alloc(s, orig_size, gfpflags);
         |                        ^~~~~~~~~~~~~~
         |                        kfence_alloc
>> mm/slub.c:4207:24: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
    4207 |                 return __kfence_alloc(s, orig_size, gfpflags);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +4207 mm/slub.c

  4203	
  4204	static void *slab_kfence_alloc(struct kmem_cache *s, size_t orig_size, gfp_t gfpflags)
  4205	{
  4206		if (s->flags & SLAB_ALWAYS_KFENCE)
> 4207			return __kfence_alloc(s, orig_size, gfpflags);
  4208		return kfence_alloc(s, orig_size, gfpflags);
  4209	}
  4210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
