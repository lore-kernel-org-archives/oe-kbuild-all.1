Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1929B305E2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 19:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755026366; cv=none; b=boQ4lud6PP/fYUmnvGWpSl84g8giHgtHtFWfRgeNu2jet3u0d9pCjA3HfyiugjdfI+AeTmO47R2JgUe5daKvYRQGRlGD6DKEFdMxTEkFG1BgEwUn6sqJPqQawihlrArFaw7VTG4fOLLeeXZkpfS/CQdlesA3js6DNQOTYjkh4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755026366; c=relaxed/simple;
	bh=wKZSIOIOZfPkghyhZrUty6ABp+P8I2Ez76y7sLg1gfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kryVDAYiEc5KVC4ifoSeczpj0OWVVmhlfiiPmPtJnK70ZWqBsxz4DrIxqrGQAa/xzNt+bsIr1ccpXj3CEAZXj+OLtUCmzgVQyq8n9BNHLt7dScBWhbmXjrJi2Iibw4lTTNQlEB5Tr7DLyUKeJUODfKRrr7be4hqW89a3bsCN8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7fauFhn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7fauFhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755026365; x=1786562365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wKZSIOIOZfPkghyhZrUty6ABp+P8I2Ez76y7sLg1gfg=;
  b=I7fauFhnq3Snqb/JzKA6o/rkQVkWZqfnwwcIyS0edWjWk0ws1dMeS9rt
   PZZj0/Mtsizwu37e3VD5xroCNyl3IM+KgXgMuJ8E8wFOT3qPfRe18u/Dq
   bgphgKqdMG56H9Rnzf3EJpcOMHvN7QpRSChZuHu2orG+H8OyGlIut1cEQ
   kxgGbaQqiBFvkBBrG5Pk1TVKYh2oNhttStJL1h0qyjGOI3w81H0Ad31O7
   00ChRDs4T48rC5vKJMSGOgcUB2JL6Adnp05753qfMvZplUFCTlimNdSNr
   dES6rOaCXVFbcnWd4tOlSHxsSJB/ZGbx99TTioui7ZeD918IF10YiXomH
   Q==;
X-CSE-ConnectionGUID: N8eXLptHTJSnvUwt11jIxw==
X-CSE-MsgGUID: w9A9HyqxSKSXBna3A8eFAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56522153"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56522153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 12:19:24 -0700
X-CSE-ConnectionGUID: dE42r0ZdT0Ga3sNJgDNJQg==
X-CSE-MsgGUID: PnGuOHJMT/u+hTk5WawtNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170408963"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2025 12:19:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uluWn-00090i-17;
	Tue, 12 Aug 2025 19:19:21 +0000
Date: Wed, 13 Aug 2025 03:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 04/18] x86: Add arch specific kasan functions
Message-ID: <202508130301.cL08gHbD-lkp@intel.com>
References: <b8d16cb57dc7ebfdcd0652eab030af4c6a3d0d63.1755004923.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8d16cb57dc7ebfdcd0652eab030af4c6a3d0d63.1755004923.git.maciej.wieczor-retman@intel.com>

Hi Maciej,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arm64/for-next/core tip/x86/mm linus/master v6.17-rc1 next-20250812]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-sw_tags-Use-arithmetic-shift-for-shadow-computation/20250812-213257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/b8d16cb57dc7ebfdcd0652eab030af4c6a3d0d63.1755004923.git.maciej.wieczor-retman%40intel.com
patch subject: [PATCH v4 04/18] x86: Add arch specific kasan functions
config: i386-buildonly-randconfig-003-20250813 (https://download.01.org/0day-ci/archive/20250813/202508130301.cL08gHbD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130301.cL08gHbD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130301.cL08gHbD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kasan-tags.h:5,
                    from include/linux/kasan.h:7,
                    from include/linux/slab.h:260,
                    from lib/test_bitops.c:12:
   arch/x86/include/asm/kasan.h: In function '__tag_set':
>> arch/x86/include/asm/kasan.h:46:20: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
      46 |         u64 addr = (u64)__addr;
         |                    ^
>> arch/x86/include/asm/kasan.h:51:16: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
      51 |         return (void *)addr;
         |                ^
   cc1: all warnings being treated as errors


vim +46 arch/x86/include/asm/kasan.h

    43	
    44	static inline void *__tag_set(const void *__addr, u8 tag)
    45	{
  > 46		u64 addr = (u64)__addr;
    47	
    48		addr &= ~__tag_shifted(KASAN_TAG_MASK);
    49		addr |= __tag_shifted(tag);
    50	
  > 51		return (void *)addr;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
