Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850F033062
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 23:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157735; cv=none; b=CamnhNr9ApsS52AQe8Rv0s8eNbRdOEfEuuCvD/do+PqDlATTtWFhmKb9fhaLUlew4OID69jR3pbRlxgIT7Z8bL4fwyaEkXkAR8ZjQOPBCkRSEwvHC2OR7UUCO3icuQEMPLE5n26K1oYRXvsdEh/bTD/YjvuuLrh9NHUTc7WxTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157735; c=relaxed/simple;
	bh=h45gl2kfK5lW5rJpXZmuo1hVDs1sutTjAyYpEiE5WpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VCwi6DPZM2WU2sA+gAMjYyg0b6r3mK3zDTWDBZa4gCEi8CFPPpSP6sYZ3cLtstUZnoB1ZbXjICd0mlrw+bmiAXpoyYG2RBR1pzBCWrL1zLdfCtuSerusGdayVnJLgkT4LqYYputmgRaCvhdDXvzcQfGwmLc4LLhsfRB7K+HmnOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ab4fHfqv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ab4fHfqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737157733; x=1768693733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h45gl2kfK5lW5rJpXZmuo1hVDs1sutTjAyYpEiE5WpI=;
  b=ab4fHfqv9JXlvqPSf9dmj4heLnYZijdl9baH2FD7vTxgkvUTFyZvSVw0
   Y9J4lwLO6fK25eHKVmIrHDavUST3v4otfEJL0B36FpTZ7Xlo76vzWmo1l
   s5dUEL0Oazlir3mWPvv6028z/U60opIIy1HfJslod5nUAXXcPIeHh1GuZ
   Rgf4VLEvnRo2l3bjVpS4PSVIy6a+rXIArdLeyGp1ExKMw8zsZN/jwh7pj
   2eSoxr8hQXKQZbAj5UlWESSS1l/46minNKsLaO/rEoW1h+pkJ8EXjB+ju
   RrWFH2EGfdBjfLu84SPPwJz0CtIo8JAJIzbJ+bnDEq1VC2w7ksGKaUHGP
   w==;
X-CSE-ConnectionGUID: RhUCFsWORM26yh/iQrYoYQ==
X-CSE-MsgGUID: WcdkB9gYSAaW0WziRGVl6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49022114"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49022114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 15:48:52 -0800
X-CSE-ConnectionGUID: +WEo6V+pRn6kigUzcI20Ow==
X-CSE-MsgGUID: tWISXuQhQxytn9QtTIst6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="106118564"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2025 15:48:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYw52-000TrE-32;
	Fri, 17 Jan 2025 23:48:48 +0000
Date: Sat, 18 Jan 2025 07:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1826/1826] mm/page_alloc.c:4110:9: error: call to
 undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202501180715.zDIl6KOU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5cbe5b715d9cac271b2c6175e728f0c4167f675
commit: fd855715f24e3eeadaa56de5fde21c55a14aeea0 [1826/1826] mm/mem_reliable: Fallback to dpool if reliable memory is not enough
config: arm64-randconfig-r123-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180715.zDIl6KOU-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250118/202501180715.zDIl6KOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180715.zDIl6KOU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:4110:9: error: call to undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
                  ^
   1 error generated.


vim +/dynamic_pool_should_alloc +4110 mm/page_alloc.c

  4101	
  4102	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4103	{
  4104		if (!reliable_allow_fb_enabled())
  4105			return false;
  4106	
  4107		if (!(gfp_mask & GFP_RELIABLE))
  4108			return false;
  4109	
> 4110		return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
  4111	}
  4112	#else
  4113	static inline struct zone *mem_reliable_fallback_zone(gfp_t gfp_mask,
  4114							      struct alloc_context *ac)
  4115	{
  4116		return NULL;
  4117	}
  4118	static inline void mem_reliable_fallback_slowpath(gfp_t gfp_mask,
  4119							  struct alloc_context *ac) {}
  4120	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4121	{
  4122		return false;
  4123	}
  4124	#endif
  4125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
