Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20AD3F104F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932826; cv=none; b=USm1mgmwvrrZKFpqdjQNMMtKTumni29Sd4YGPtxbvspCDFcCtEgO6UMgGwAqufFi1nrdNo7NzxlyamMlKv6UtP7hlWzs9H94dZy1cef3HSFQVgPlDLA1VwNKuEgKhZkwz50NTZbyQxFSUDWbmsLgM+AIchfukrZeF87iRKQ/Owc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932826; c=relaxed/simple;
	bh=x/uERPTz4ozsNA8M9NrNyNa/MeNEOSJA7G9Wv07LNoM=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xg4apUMzCFwC8kmX0ERa5NhIYaNBIahenQH8AFNm51B1Pb/C3dotHjZcF8z229IC+pzMSAi5xnrqGvXxbrc7eNTSHUkowmVJ3D2SithAs/0JF+yQxiqRNvbguT32CgpdfToKP4drgloBl2pcKIjb6Tu66QTfhlodZvieMkHmIYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTo4DJbz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTo4DJbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790932825; x=1822468825;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=x/uERPTz4ozsNA8M9NrNyNa/MeNEOSJA7G9Wv07LNoM=;
  b=BTo4DJbzESkN3HU9zuUvVFBDTKj3crQ6ge8TN/jnR8j8VorfxZIYnJA+
   bwmW2coNAo3XJPE/NeDQDg84vxrYRBVbjVlwskne93mGHHZY/V6RZZi5E
   GXpEPXQGiuaj/pbbr3JxIlEs0rtaWnh86bVg8GPJgX0meJCAVtE5N8p40
   vrojTm9bCH0o8K944o7GRLrOCn3yJY6O4oH4/gHMpa+2JfRe3LUsbywV3
   gGHLMpAK3OtYt1aVtVb23Xm+DKBIMEeiIeWKfcgpOh2lRMs+iJ+hADbOl
   Nnuj5kDHq0rQl174GgUqJgSy0MFsQE3sJqXgeHPzPtVY9GToWUD1dod59
   A==;
X-CSE-ConnectionGUID: d8rF75rSRP2GyQoy14geGg==
X-CSE-MsgGUID: griZF11PSquefQTDLeFlJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90754393"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90754393"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:20:25 -0700
X-CSE-ConnectionGUID: 2rVRf/E6Rhmt8OtvqqNpLw==
X-CSE-MsgGUID: dTuYTHieSlSo0CxBUvKA9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="237981"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 02 Oct 2026 02:20:23 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCZRF-000000000U3-2CXI
	for oe-kbuild-all@lists.linux.dev;
	Fri, 02 Oct 2026 09:20:21 +0000
Date: Fri, 2 Oct 2026 11:19:27 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: bpf: Add gated tracepoints for skb life-cycle
Message-ID: <202610021152.f1jkk9kA-lkp@intel.com>
References: <202610021152.f1jkk9kA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610021152.f1jkk9kA-lkp@intel.com>

Hi Jakub,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Sitnicki/bpf-Add-gated-tracepoints-for-skb-life-cycle/20260928-134018
base:   
patch link:    https://lore.kernel.org/r/202610021152.f1jkk9kA-lkp%40intel.com
config: xtensa-randconfig-2000-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021152.f1jkk9kA-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021152.f1jkk9kA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021152.f1jkk9kA-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/skbuff.c: In function '__copy_skb_header':
>> net/core/skbuff.c:1610:9: error: implicit declaration of function 'skb_maybe_trace_copy'; did you mean 'skb_maybe_trace_free'? [-Werror=implicit-function-declaration]
    1610 |         skb_maybe_trace_copy(new, old);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         skb_maybe_trace_free
   cc1: some warnings being treated as errors


vim +1610 net/core/skbuff.c

  1609	
> 1610		skb_maybe_trace_copy(new, old);
  1611	}
  1612	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
