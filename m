Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A49145A1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 21:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779572272; cv=none; b=BTSZSzmyNFsu2xOyN1Bl30U6S75GwV+MU6MDJlVo/KYHkkGx7rj9JkQrvWd/pXPTD/dh8z/Q+se6yjApd+fA9qU/cuZ1h4tCC5DZLRRPNzOpqOyo3AwWlaHwIqWyoQ/6Ai80G/VZ+uNyhRNoVw+0hLbJJt95nMqXQPuhirJEKjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779572272; c=relaxed/simple;
	bh=0TStYGg8C/uQXUQhzK2UMTmfwRIGRXd5e1IF1vxLFlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwUpnSmU3sP224kxU7W5oClurdOzX8XnijM8NmwJjc49M+1qSDru8fHpvaNVgbvJWeMTtMjz9baYPQFe7WH0J9DRHKC6m+ewnMGL6ZWgk6ltsjgVNcP46EzMaNqX5fVHw44Kf9xrWMlGZB3oaXOqFsVYCnSFIcF6urNXIjvdSiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uh/bB4q4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uh/bB4q4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779572271; x=1811108271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0TStYGg8C/uQXUQhzK2UMTmfwRIGRXd5e1IF1vxLFlk=;
  b=Uh/bB4q4stLzUQtA8elrH0PVDzphryxssc1ZYGbdknnvY7dIob4ImgYV
   DAuv5C4K29jlQT6JpQTFZBoA46uy8o9WSjj00uMym+LBPL3N7+7i3xcjy
   Tz6xDaXmQd1a7KxOD+Q8fkz3Q8yRhyfgCAdw077HtL4TqB8vtP82RvH65
   kSIdiAQKOh1Pqlf74ckTgn7NG+vHpKc+HZLhoDlUiOSUuNv76KunrUMvE
   h/2/U1tPcE5Gxt+MrujmsMwUA4uZTPGSgNgNv3SCVml4yzLUhz6eVKJMh
   LXeEQ487PplYl8GwSP69mfMKBjKm5bCXMNp1OA7pUc4T27GjZwmFsjib6
   w==;
X-CSE-ConnectionGUID: h6yDaOZbQYu71JCFGMo09A==
X-CSE-MsgGUID: mBYmjyMySemcV2bL1ClemQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="90755131"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="90755131"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 14:37:51 -0700
X-CSE-ConnectionGUID: FmoOfpavQ+aJiq95m7ahCw==
X-CSE-MsgGUID: BX2AiEwDRO2LVzMGfeyhMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="240391306"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 May 2026 14:37:49 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQu2V-000000000MP-2DCj;
	Sat, 23 May 2026 21:37:47 +0000
Date: Sun, 24 May 2026 05:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm/vmalloc: add vmalloc_decrypted() and
 vzalloc_decrypted()
Message-ID: <202605240514.9070PvRp-lkp@intel.com>
References: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>

Hi Kameron,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e9add7501ad3297dad9b90ce201266830a68ab47]

url:    https://github.com/intel-lab-lkp/linux/commits/Kameron-Carr/mm-vmalloc-add-vmalloc_decrypted-and-vzalloc_decrypted/20260522-050151
base:   e9add7501ad3297dad9b90ce201266830a68ab47
patch link:    https://lore.kernel.org/r/20260521205834.1012925-1-kameroncarr%40linux.microsoft.com
patch subject: [RFC PATCH] mm/vmalloc: add vmalloc_decrypted() and vzalloc_decrypted()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260524/202605240514.9070PvRp-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240514.9070PvRp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240514.9070PvRp-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmalloc.c: In function '__vm_pages_enc_dec':
>> mm/vmalloc.c:3430:29: error: implicit declaration of function 'set_memory_encrypted' [-Wimplicit-function-declaration]
    3430 |         int err = encrypt ? set_memory_encrypted(addr, nr) :
         |                             ^~~~~~~~~~~~~~~~~~~~
>> mm/vmalloc.c:3431:29: error: implicit declaration of function 'set_memory_decrypted' [-Wimplicit-function-declaration]
    3431 |                             set_memory_decrypted(addr, nr);
         |                             ^~~~~~~~~~~~~~~~~~~~


vim +/set_memory_encrypted +3430 mm/vmalloc.c

  3418	
  3419	/*
  3420	 * Transition a single contiguous block of @nr pages at index @idx in
  3421	 * @area->pages to encrypted or decrypted state.  On failure, the block's
  3422	 * page-pointer slots are cleared so the standard free path will not return
  3423	 * the pages to the allocator (they are leaked).
  3424	 */
  3425	static int __vm_pages_enc_dec(struct vm_struct *area, unsigned int idx,
  3426				      unsigned int nr, bool encrypt)
  3427	{
  3428		unsigned long addr =
  3429			(unsigned long)kasan_reset_tag(page_address(area->pages[idx]));
> 3430		int err = encrypt ? set_memory_encrypted(addr, nr) :
> 3431				    set_memory_decrypted(addr, nr);
  3432	
  3433		if (err)
  3434			memset(&area->pages[idx], 0, nr * sizeof(*area->pages));
  3435		return err;
  3436	}
  3437	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
