Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71072D5C74
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 02:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772158418; cv=none; b=igjE+i0fnfNTpjqeAxFkjXMDq9d5yf4t/jsA9dnlPmi82LUjF8JhJBFL8JHrZAiOXQZy2kusZAWPohKhpMyLRSHB9TE+6uPTjI7iKW995gfkqFVJINbPO2li3zGcHMNWA7KoCYWFP4/Oh6Yy4jWxJywxqAE4lKOJyKmxgqNrqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772158418; c=relaxed/simple;
	bh=eII0Kt2t591P6CtL3ijbGSBIo7AchzHNR+Tc3/tlhlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFVRbqy1hWzL38ieGvWWatZ2P7sbYVSpqmhdv0n/DGtVk7A7ARzMtmP3STD5U1UCqMSwZieu2BS9XqaMQqJQlV72enYMY2Tl3/Kp+etYsK9DKMI+9em3/V4eXQiBCLU0lbWr6Refxz6aA1az++da31JylBjOFOeqvvODGnDr+94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ar5AjxSd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ar5AjxSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772158417; x=1803694417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eII0Kt2t591P6CtL3ijbGSBIo7AchzHNR+Tc3/tlhlo=;
  b=Ar5AjxSdslvpwYMGm0BwKIMC7vE+LmkR9bphekq/yYxoB5zbv4mId9qc
   Kwp9oxSo1uowUi18bHl9e0SZqnmaAxorjCVeGSnSSumkoIZtGut877HFe
   Hf1GEBRK1W21MIOuHxh8oRp2M71aVQ/7RxaS0DI5KsRHc2dkKdMPsEKhg
   jAIFvHyxb/eTGz73OKeQn2cVNykhdtu4kDZn0LhFYOK8ku9ggKXxiyOMf
   YOk1+botMveFJDmNB0lxkbWGKGmOu1JqQNDUncBXDPA2QRLvcDycVAm4o
   IQR0T5XcVyvuHGid+JWlY0l6zEm6RaqJIYTQCR7rdUbI+1xV2QSpicpou
   g==;
X-CSE-ConnectionGUID: kvmzM+PeTeyFxidVh4jDyQ==
X-CSE-MsgGUID: i2cB2vmPSiWivn5BV3D4qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77103756"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="77103756"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 18:13:36 -0800
X-CSE-ConnectionGUID: ztSgV7fxQKGa4zhZXG4W+w==
X-CSE-MsgGUID: BYN/pRaVSUKKKSOsQ/0ivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="244220111"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Feb 2026 18:13:35 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvnLf-00000000A6d-0d7E;
	Fri, 27 Feb 2026 02:13:12 +0000
Date: Fri, 27 Feb 2026 10:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next 1/5] bpf: Introduce local storage for sk_buff
Message-ID: <202602271043.OPCcB1AR-lkp@intel.com>
References: <20260226-skb-local-storage-v1-1-4ca44f0dd9d1@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-skb-local-storage-v1-1-4ca44f0dd9d1@cloudflare.com>

Hi Jakub,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Sitnicki/bpf-Introduce-local-storage-for-sk_buff/20260227-051847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260226-skb-local-storage-v1-1-4ca44f0dd9d1%40cloudflare.com
patch subject: [PATCH RFC bpf-next 1/5] bpf: Introduce local storage for sk_buff
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260227/202602271043.OPCcB1AR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271043.OPCcB1AR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271043.OPCcB1AR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/core/bpf_skb_storage.c:129 function parameter 'map__map' not described in 'bpf_skb_storage_get'
>> Warning: net/core/bpf_skb_storage.c:129 function parameter 'value__nullable' not described in 'bpf_skb_storage_get'
>> Warning: net/core/bpf_skb_storage.c:129 function parameter 'value__szk' not described in 'bpf_skb_storage_get'
>> Warning: net/core/bpf_skb_storage.c:178 function parameter 'map__map' not described in 'bpf_skb_storage_delete'
>> Warning: net/core/bpf_skb_storage.c:129 function parameter 'map__map' not described in 'bpf_skb_storage_get'
>> Warning: net/core/bpf_skb_storage.c:129 function parameter 'value__nullable' not described in 'bpf_skb_storage_get'
>> Warning: net/core/bpf_skb_storage.c:129 function parameter 'value__szk' not described in 'bpf_skb_storage_get'
>> Warning: net/core/bpf_skb_storage.c:178 function parameter 'map__map' not described in 'bpf_skb_storage_delete'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
