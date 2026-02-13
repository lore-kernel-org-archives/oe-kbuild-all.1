Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A326CE2B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 05:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770961940; cv=none; b=mx5JdsjcTJuvCcArZQt/fUrOTYRCPASdA3jSPKEu81nPIzgPZ47hh8qgfrqLin2XdVHU0LahZF/AFYP9H0vNASysXoGEbSlCthhseTXHRK7qUYIbs68SDZtRYkFDgH8/YGAcvjaqUje12cH0JSF+IrJtjdBK7Pzrk0LLjM9m5Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770961940; c=relaxed/simple;
	bh=MWzI6YSu+b3ttAZ95Yt6sR1JqTMjb7mRuDBXmEn+JwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYhtP68Zp2PqMExSzzLfrcIJXkSx3Oi8/chGnXFUS/H9AnZtFEngIrfp2258JtZjHtlTHD9/sb8jdN8wfSFcX2ZAjLeAqF2EqABKd3csl1+Ulk5n/9Hi3oU8uVKWCfxA3eFrtLK4qDS+DMR0KKPptFr7N/Kj54D+ggljAzN5rng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F05lSPyx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F05lSPyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770961939; x=1802497939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MWzI6YSu+b3ttAZ95Yt6sR1JqTMjb7mRuDBXmEn+JwM=;
  b=F05lSPyxUePj0iVbmEGWW8I4sScrD5sQl/YwyOHlNGhpINgif5o1zfHZ
   7G1LPkFdfsx5Tkogn4k+hGdkv1BrcvNFU/3YXr/McyiiYKCC9exo1qyfW
   Obgw894szT+kxt08wbvyW1mOP0oCEITJE3sGX43CCcZx9w6AnLM+Xa4//
   8t1s8XNcg4DD4q9THn2Znw34mR3kusayGha5ize2C30vwarfZPCaGaQOx
   PX+EqpiRE9hP9Ti7YKqexAqQ2bE5bYetpoN+Gyd8BSbFioOJFwQcC/MZI
   6lqxRRV005YH44xRDm6reFyp0Zh7Mqzt/FCHm1zQ9GdP8JdjAaUumRQCZ
   A==;
X-CSE-ConnectionGUID: ouj95RFdSlWl2+StOBlpdA==
X-CSE-MsgGUID: s8QAxrsmSvy1cT2+7jRBYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75990989"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="75990989"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 21:52:17 -0800
X-CSE-ConnectionGUID: JyWWuxsvTRCcUjwWPfafMg==
X-CSE-MsgGUID: UVCR0Cf5SuWUr1A0emYHHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211744044"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Feb 2026 21:52:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqm69-00000000v8K-2sU8;
	Fri, 13 Feb 2026 05:52:13 +0000
Date: Fri, 13 Feb 2026 13:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Ferguson <ethan.ferguson@zetier.com>, luisbg@kernel.org,
	salah.triki@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethan.ferguson@zetier.com>
Subject: Re: [PATCH 1/2] befs: Add FS_IOC_GETFSLABEL ioctl
Message-ID: <202602131301.1CCwgtrL-lkp@intel.com>
References: <20260212231339.644714-2-ethan.ferguson@zetier.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212231339.644714-2-ethan.ferguson@zetier.com>

Hi Ethan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 541c43310e85dbf35368b43b720c6724bc8ad8ec]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Ferguson/befs-Add-FS_IOC_GETFSLABEL-ioctl/20260213-071516
base:   541c43310e85dbf35368b43b720c6724bc8ad8ec
patch link:    https://lore.kernel.org/r/20260212231339.644714-2-ethan.ferguson%40zetier.com
patch subject: [PATCH 1/2] befs: Add FS_IOC_GETFSLABEL ioctl
config: sparc-randconfig-002-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131301.1CCwgtrL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131301.1CCwgtrL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131301.1CCwgtrL-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/befs/linuxvfs.c: In function 'befs_generic_compat_ioctl':
>> fs/befs/linuxvfs.c:985:61: error: implicit declaration of function 'compat_ptr' [-Werror=implicit-function-declaration]
     985 |         return befs_generic_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
         |                                                             ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/compat_ptr +985 fs/befs/linuxvfs.c

   979	
   980	#ifdef CONFIG_COMPAT
   981	static long befs_generic_compat_ioctl(struct file *filp, unsigned int cmd,
   982					      unsigned long arg)
   983	
   984	{
 > 985		return befs_generic_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
   986	}
   987	#endif
   988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
