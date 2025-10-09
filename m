Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9944521CC79
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760028544; cv=none; b=nVUFSTIUGLXp4AOWEtD6i2AfceDjxQ6nzJ+umdlJz476e1cjPzM0JnJVCJFik8vmUOcuLuRUAPZwUpMbXjjoU3sdHFmPz9+2uCOawswbjIpaHjAPBbKocLgCs8nIxeeoM8O1Uj7KSaUeLESPn5i5BNjc/NBDw6IeY0UDPZEem0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760028544; c=relaxed/simple;
	bh=Pl9Hq/vM+6feRl2LaKUS4Oli+fOh6lHYXnAI5R4rKKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoeH8d2Cmm15xCMpMrWUknd5rnifDwNHQMF8wpDTWU3HoukiF5m8k89fQJD9TfCu303t5SDlStCzt7DKWuAwY7tGkgnO57Mt37iGcMSDGcRDOqm/UVEtbSMwE4QK0m67SyX4XgFtrqeAsjm4bKFG3NrFpKqcAlmbKOI29P497vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzFSESIc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzFSESIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760028542; x=1791564542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pl9Hq/vM+6feRl2LaKUS4Oli+fOh6lHYXnAI5R4rKKE=;
  b=YzFSESIcuIW/HlYAntDPlTrgOjwxan0V10Qm6XBzsMuJmsmgqQKfBMSn
   255CIGjDBKhlCSSLY1aGZo+WRix03zanqqmwzJ9asHDYw43WCcI6IFZVA
   cHm3nIZEN52rdLrbTeu2K0CW0RSzXJBm+UNCtuertZ3WQ+ZVpX6FdSMs6
   1t+JErO9DbDWfbTGzvUPrRJCW6nTRLGNjigCpcrVsf5CCavghDuV0h+QG
   jBxBfMCxqB0UOOrdqIvpYdfEXY7qq+2HQR4txIeHG3pyHLmWn4h+eRgon
   OknervpDN6ji9BiuQSylGzM5pgvTdELcaFdHBqzTQkoidR5QochEk0MMC
   g==;
X-CSE-ConnectionGUID: DMlqQPEcQ7CkXt7t+H86zQ==
X-CSE-MsgGUID: GQG7oonvTtKIy7HHeUnqxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62147470"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="62147470"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:49:01 -0700
X-CSE-ConnectionGUID: OAt+czjeTTij9J9ZeCWiLA==
X-CSE-MsgGUID: LIj3DmcMTCC3FDD4zYzawA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="185145920"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2025 09:49:00 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6tp4-00012D-0D;
	Thu, 09 Oct 2025 16:48:58 +0000
Date: Fri, 10 Oct 2025 00:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] drm/gpusvm, drm/xe: Fix userptr to not allow device
 private pages
Message-ID: <202510100044.fDyGwTie-lkp@intel.com>
References: <20250930122752.96034-1-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930122752.96034-1-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on linus/master]
[cannot apply to drm-tip/drm-tip v6.17 next-20251009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-gpusvm-drm-xe-Fix-userptr-to-not-allow-device-private-pages/20250930-203135
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250930122752.96034-1-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2] drm/gpusvm, drm/xe: Fix userptr to not allow device private pages
config: x86_64-randconfig-077-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100044.fDyGwTie-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100044.fDyGwTie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100044.fDyGwTie-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/drm/drm_managed.h:6,
                    from drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:7:
   drivers/gpu/drm/xe/xe_svm.h: In function 'xe_svm_init':
>> include/linux/stddef.h:8:14: error: passing argument 5 of 'drm_gpusvm_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/gpu/drm/xe/xe_svm.h:217:38: note: in expansion of macro 'NULL'
     217 |                                NULL, NULL, 0, 0, 0, NULL, NULL, 0);
         |                                      ^~~~
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:11,
                    from drivers/gpu/drm/xe/xe_bo.h:11,
                    from drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:18:
   include/drm/drm_gpusvm.h:254:35: note: expected 'long unsigned int' but argument is of type 'void *'
     254 |                     unsigned long mm_start, unsigned long mm_range,
         |                     ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/stddef.h:8:14: error: passing argument 10 of 'drm_gpusvm_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/gpu/drm/xe/xe_svm.h:217:59: note: in expansion of macro 'NULL'
     217 |                                NULL, NULL, 0, 0, 0, NULL, NULL, 0);
         |                                                           ^~~~
   include/drm/drm_gpusvm.h:257:59: note: expected 'int' but argument is of type 'void *'
     257 |                     const unsigned long *chunk_sizes, int num_chunks);
         |                                                       ~~~~^~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_res_cursor.h:38,
                    from drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:23:
>> drivers/gpu/drm/xe/xe_svm.h:216:16: error: too many arguments to function 'drm_gpusvm_init'
     216 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
         |                ^~~~~~~~~~~~~~~
   include/drm/drm_gpusvm.h:251:5: note: declared here
     251 | int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
         |     ^~~~~~~~~~~~~~~


vim +/drm_gpusvm_init +8 include/linux/stddef.h

^1da177e4c3f415 Linus Torvalds   2005-04-16  6  
^1da177e4c3f415 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f415 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e2182874324727 Richard Knutsson 2006-09-30  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
