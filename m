Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586116DC28
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426093; cv=none; b=ExaWtkVndTBt36itFLDcCPeaIyRWAKdi/UG0F2oBT3xlJt76NMH3uljRZhJL07MzAOR57J7KhHIlggFguoncQw5ABmnLmxcLHN2Q9+7UgKP250PZ3Myvz4xiWr+NLJEwKF8pR6jtw5FX5WrDR6lydcUXllQhOCQDLRmBQmS+gSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426093; c=relaxed/simple;
	bh=hZDANshQTLTa8k4Ess4Mgj06oH1Hy7w9ujvasKlD+dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijsFL7mmLkNDC4xB9WlUAC+a6I2wqokfgVulxzbUJn21845QD4+RImK57s/EVstSlvTQ1jGetJ7eT++PNjN7NpzWnOjq0XedDCFy3w/4505iyhI8jWgjuIkbFosHqFzE7ZMz7TnsvxbFB9WDi4VNkhuX5ar8q2LPoerXMRdIabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4Q2w6ul; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4Q2w6ul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426091; x=1791962091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hZDANshQTLTa8k4Ess4Mgj06oH1Hy7w9ujvasKlD+dU=;
  b=R4Q2w6ul3fztoFs4hOhuDc4hNb6tmlg4HAOsYIpxB1p1diVU2sApiUr3
   hPs8X7HKtEjGKn8QoHaD+KIBZ1SeTOj44sCnvHEMRSRbbsIU6YnbYfhE6
   by/vJad1/qtFln1KrNBAuC2Q4O3AbEObcFjlOEa5CTPa5WB0MdTeYwLzS
   7E+tayJxJms/abb6latNcGZ1ptJrOt4h9qt7TMD6sx9Gg1xwW4LtVeQsE
   LzdGkgQj6J7b7nA6frvh7vxvIxokMDfM7KEEp8Zk+kS/4v0TWnf25PTeR
   ytHQ3pT05EGQZW5LSyF7aTc2kymZZueE88XEDXh3Xs5rYmGDaxL0+q0cN
   A==;
X-CSE-ConnectionGUID: K3isHa8rR/eVc379p4zkwQ==
X-CSE-MsgGUID: XBj3/R+OQDuuftrc1KlQXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="65201779"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="65201779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:50 -0700
X-CSE-ConnectionGUID: L4mOxB6PSh6mjvn/p38eGw==
X-CSE-MsgGUID: vHN3AWifRKamzqIrE09DoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="181605678"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Oct 2025 00:14:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ZF2-0002VL-2D;
	Tue, 14 Oct 2025 07:14:42 +0000
Date: Tue, 14 Oct 2025 15:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Kaplan <david.kaplan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 41/56] static_call: Add update_all_static_calls()
Message-ID: <202510141536.UM7BtSOF-lkp@intel.com>
References: <20251013143444.3999-42-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013143444.3999-42-david.kaplan@amd.com>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on a5652f0f2a69fadcfb2f687a11a737a57f15b28e]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Kaplan/Documentation-admin-guide-Add-documentation/20251013-231516
base:   a5652f0f2a69fadcfb2f687a11a737a57f15b28e
patch link:    https://lore.kernel.org/r/20251013143444.3999-42-david.kaplan%40amd.com
patch subject: [RFC PATCH 41/56] static_call: Add update_all_static_calls()
config: x86_64-buildonly-randconfig-003-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141536.UM7BtSOF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141536.UM7BtSOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510141536.UM7BtSOF-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/static_call_inline.c: In function 'update_all_static_calls':
>> kernel/static_call_inline.c:509:22: error: implicit declaration of function 'within_module_mem_type'; did you mean 'within_module_init'? [-Wimplicit-function-declaration]
     509 |                      within_module_mem_type((u64) site_addr, mod, MOD_TEXT))) {
         |                      ^~~~~~~~~~~~~~~~~~~~~~
         |                      within_module_init

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +509 kernel/static_call_inline.c

   495	
   496	void update_all_static_calls(struct static_call_site *start,
   497				     struct static_call_site *stop,
   498				     struct module *mod)
   499	{
   500		struct static_call_site *site;
   501		struct static_call_key *key;
   502	
   503		for (site = start; site < stop; site++) {
   504			void *site_addr = static_call_addr(site);
   505	
   506			/* All init code is gone when this function is called. */
   507			if (is_kernel_text((u64) site_addr) ||
   508			    (mod &&
 > 509			     within_module_mem_type((u64) site_addr, mod, MOD_TEXT))) {
   510				key = static_call_key(site);
   511				arch_static_call_transform(site_addr, NULL, key->func,
   512						static_call_is_tail(site));
   513			}
   514		}
   515	}
   516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
