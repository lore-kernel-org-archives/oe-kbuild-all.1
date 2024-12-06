Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A88201014
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733491151; cv=none; b=CTZAS7uonDurzw/IU/VTiYzDUTf6Kp59SIGt/WpBznYkzgFL3B76T/ljG0fR497/4Z1zAdw/nmZ+EOdaV5Pti25LKGus3rMjYqWYvBs5NfCPIkM+dahGKhOj8asVDnifUkIvAAEySlP834F/YzazLvqE8ssgHXMnGV1YAVS2m90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733491151; c=relaxed/simple;
	bh=Z+fAPAbjEn4oPbae2PDo7Wn1aLYtcFboPdZjOYMN9Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYBQzhRQHFFrqnbyES1DHxD7sqiL27LSGucR5Oe9qTxV1tJ389h4QB1eUNDe9ipLT6VMicvm6fCBnD772ns0zE1jUAjGv7dmHJkj49UVLz5zXjMAgz6mRJHbbE8GT1/j+JiKjBCMxJwnGAPuPay3XGrUVBs9RHBtlgXB4EJ+0mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCxQH6db; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCxQH6db"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733491150; x=1765027150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z+fAPAbjEn4oPbae2PDo7Wn1aLYtcFboPdZjOYMN9Ys=;
  b=RCxQH6dblEL4pB8NiU+kFza6Vs276hiqndKWpLxMus2KdOS1wQdKJKfb
   Px2merfMAphsjd2xyYzR5U6p5EG9iZ/Z0djemIeLtv/rinPO0X7tlGW/n
   LHi2YD6aGjBEp9Y/qa5/UB5T0XL+byIId4NKuTRvm7t9te7bDincLICT6
   Ht8rx4h4IcUftCWCwdvpZQMEAfBvxfjzqKtn/PpuCBlXNcjrD+Ft68rur
   deMdqBUYHtBUw4OuRLTPCnHmGoSSO59j5qidLPkOJ60sVJUYxJ9OLCwhz
   rgIN85UVICSZcvkqzrD32n7vojcJQpxEUhbLRvINnG76Lmu0rUP0QETxf
   Q==;
X-CSE-ConnectionGUID: QqCRLITUQlOfUQk/IHhTAA==
X-CSE-MsgGUID: YOglGClKSXmxcMjXFS4hcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="34080511"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="34080511"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 05:19:09 -0800
X-CSE-ConnectionGUID: VbBXLwJaRyeS8lKBBbWmqA==
X-CSE-MsgGUID: RgqAX4/0QGK0pRbp6ke3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94766655"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Dec 2024 05:19:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJYEb-00015F-36;
	Fri, 06 Dec 2024 13:19:05 +0000
Date: Fri, 6 Dec 2024 21:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 10/16] mm: Map page tables with privileged pkey
Message-ID: <202412062006.C23V9ESs-lkp@intel.com>
References: <20241206101110.1646108-11-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101110.1646108-11-kevin.brodsky@arm.com>

Hi Kevin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc1]
[cannot apply to arm64/for-next/core akpm-mm/mm-everything kees/for-next/hardening next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Brodsky/mm-Introduce-kpkeys/20241206-181928
base:   linus/master
patch link:    https://lore.kernel.org/r/20241206101110.1646108-11-kevin.brodsky%40arm.com
patch subject: [RFC PATCH 10/16] mm: Map page tables with privileged pkey
config: i386-buildonly-randconfig-004 (https://download.01.org/0day-ci/archive/20241206/202412062006.C23V9ESs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412062006.C23V9ESs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412062006.C23V9ESs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kpkeys.h:8,
                    from include/linux/mm.h:34,
                    from arch/x86/include/asm/set_memory.h:5,
                    from arch/x86/kernel/idt.c:8:
   include/linux/set_memory.h: In function 'set_memory_rox':
>> include/linux/set_memory.h:20:19: error: implicit declaration of function 'set_memory_ro'; did you mean 'set_memory_rox'? [-Werror=implicit-function-declaration]
      20 |         int ret = set_memory_ro(addr, numpages);
         |                   ^~~~~~~~~~~~~
         |                   set_memory_rox
>> include/linux/set_memory.h:23:16: error: implicit declaration of function 'set_memory_x'; did you mean 'set_memory_rox'? [-Werror=implicit-function-declaration]
      23 |         return set_memory_x(addr, numpages);
         |                ^~~~~~~~~~~~
         |                set_memory_rox
   cc1: some warnings being treated as errors


vim +20 include/linux/set_memory.h

938f846492d668 Michael Ellerman 2017-07-06  16  
60463628c9e0a8 Peter Zijlstra   2022-10-29  17  #ifndef set_memory_rox
d48567c9a0d1e6 Peter Zijlstra   2022-10-26  18  static inline int set_memory_rox(unsigned long addr, int numpages)
d48567c9a0d1e6 Peter Zijlstra   2022-10-26  19  {
d48567c9a0d1e6 Peter Zijlstra   2022-10-26 @20  	int ret = set_memory_ro(addr, numpages);
d48567c9a0d1e6 Peter Zijlstra   2022-10-26  21  	if (ret)
d48567c9a0d1e6 Peter Zijlstra   2022-10-26  22  		return ret;
d48567c9a0d1e6 Peter Zijlstra   2022-10-26 @23  	return set_memory_x(addr, numpages);
d48567c9a0d1e6 Peter Zijlstra   2022-10-26  24  }
60463628c9e0a8 Peter Zijlstra   2022-10-29  25  #endif
d48567c9a0d1e6 Peter Zijlstra   2022-10-26  26  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
