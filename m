Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A16B1A239A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 19:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120573; cv=none; b=fnpDczln/r8C85QVWUFrYCvpZUy5ZZsuCLu74dfIP5mT516eIsv+Jbzgp6t3Mplj81VhpSZta3vYn5Eba1xJ+CO+CdZiJsgMx03J/iLW6l4evfWLhAXbXFNWmtBl3XEswrdDqWeROZtMxScEs5u4SkccQylEQUsaNto76zomLw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120573; c=relaxed/simple;
	bh=dP4HXRIDYUSR15Nwgds/5wXJm0luZvRegrcYrhnfNy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=au3v+qu6n+mUkz7vH9R0dgoYUb7i36InLqnZl+PhAfE/fllrqHq15xpWMjLOBKi6gXWjUY/lQPgNIugybdjGPCYNRO3pNPoV6WQuFxonLKpWNXVoJ7h04uJJEXM6MCMeqEAgM/b9wNlc7rlcIO0NjTglzPI6tlfvej2fsldK+bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsgeVa7B; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsgeVa7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781120572; x=1812656572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dP4HXRIDYUSR15Nwgds/5wXJm0luZvRegrcYrhnfNy4=;
  b=dsgeVa7Bkc0R/SJuoEpX7xkdwwIvOupnbyYT+Wi/AohkLjQLg+wb7Dfm
   /RghFr2p3GPDgzVVCYkZ/T+ZjAN2MDi+veStU5o//qHcGgxwrQIWjfqIS
   CUlxag0gdlCxsjfA1o8Uxh/mROv9hkZ2iCy1M/Mn44d0lXNkNSczyS7SE
   7lJMmnGml6feyXJ+jAp1zLXsUcDzcXEtj3hiGfZmLMjaYqvdjv/DNpi3A
   E/28KmTd1VV7BJ5V8M2RQxSR3D1h+7pnZBwzqg0ny5ULavjgizD8hesAJ
   sRbxJ6vuHtvlObmfsCvoK+E/3Ah+ZBmz223r+9CovfRv4XXjO2f3DW0Fk
   Q==;
X-CSE-ConnectionGUID: u/JW5pyPRs63o6o5InI5Hw==
X-CSE-MsgGUID: 6858eMrPRPOZsMFUr2IaWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92243799"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92243799"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 12:42:51 -0700
X-CSE-ConnectionGUID: 3jQBOfo8Styw2yrTc2+UuA==
X-CSE-MsgGUID: h4L2fMvHR8umsHN+MGctDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241847089"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2026 12:42:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXOp3-00000000Lq2-2zVn;
	Wed, 10 Jun 2026 19:42:45 +0000
Date: Thu, 11 Jun 2026 03:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Bapat <abhishekbapat@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Hao Ge <hao.ge@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sourav Panda <souravpanda@google.com>,
	Abhishek Bapat <abhishekbapat@google.com>
Subject: Re: [PATCH v4 6/6] kselftest: alloc_tag: extend the allocinfo ioctl
 kselftest
Message-ID: <202606110300.R4LPBVBO-lkp@intel.com>
References: <d0a8308b4d0799876d24461a8ed9b5a71d3e1e89.1781042698.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0a8308b4d0799876d24461a8ed9b5a71d3e1e89.1781042698.git.abhishekbapat@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20260609]
[cannot apply to akpm-mm/mm-nonmm-unstable shuah-kselftest/next shuah-kselftest/fixes linus/master v7.1-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Bapat/alloc_tag-add-ioctl-to-proc-allocinfo/20260610-081508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/d0a8308b4d0799876d24461a8ed9b5a71d3e1e89.1781042698.git.abhishekbapat%40google.com
patch subject: [PATCH v4 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
config: sparc64-randconfig-r061-20260610 (https://download.01.org/0day-ci/archive/20260611/202606110300.R4LPBVBO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110300.R4LPBVBO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110300.R4LPBVBO-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/alloc_tag.c: In function 'allocinfo_compat_ioctl':
>> lib/alloc_tag.c:346:58: error: implicit declaration of function 'compat_ptr' [-Wimplicit-function-declaration]
     346 |         return allocinfo_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
         |                                                          ^~~~~~~~~~


vim +/compat_ptr +346 lib/alloc_tag.c

   341	
   342	#ifdef CONFIG_COMPAT
   343	static long allocinfo_compat_ioctl(struct file *file, unsigned int cmd,
   344					   unsigned long arg)
   345	{
 > 346		return allocinfo_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
   347	}
   348	#endif
   349	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
