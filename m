Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88634BA39
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760427969; cv=none; b=V/G70VUzCMwC7lfG5MWcewtcil3IbNSke1NrECpd0aePxUAWxuzgShH/C7schA5yiIqiY5upfeJ7wpoAzZV7ZGYWjDic0JjiTuehTRTqFqfFYgC+B+avBhBt1XqsgFIUOpErYqe42sgluzeXnm8UVFt5foCD/K/Lv1w9Ey30NHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760427969; c=relaxed/simple;
	bh=iFJYQTkBWaoY4pIAww0vQxQDPCBD8wuuPAHi7opOEEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPMVjvmcJkzZxH18e7xmrShoeiN4To+udUl65d7OOkK6bo6hpz4gVCSZzmBsXHGI41uOuin30vuSRS8BKt0y8KGxkr9NsS4qmGUAt8OAjpOdm49iviX0WwHub0qIpcDPqSFGsldstiELI+jHTpLFUUUou+LWFmxzrLPGneJs7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhO0YY5Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhO0YY5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760427967; x=1791963967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iFJYQTkBWaoY4pIAww0vQxQDPCBD8wuuPAHi7opOEEk=;
  b=VhO0YY5ZMn3zDiHUawTji/ZBOlNtOPqVrcATgy4Ui/f2771LYGpix4B9
   IJkPqOHfnjIrGKjeA0ZMbod+xFiVB/ffEMzwm+4KENIgQ++H3qnDngSDi
   vfb7C9Lp3UqsMt54oV9iG9Czhc0VbSSGZauhBud9EjX6GhRc1lFiBkAvE
   cAQm6yCVzjeSFVJj9RGecrwzhxEQ+2q36XYV98Wmj7yIiyeuF32xTPiV5
   MoYZhWVMddaIXKn1X93BO4KrdXPWXAjfcXZewyz6zbzyIQcwVajZsjAs9
   xHZAXqBxmNglPvklLlByi2qIQSLv1CrRQhOUHqcwMbQan2KLTBaAeYnWA
   g==;
X-CSE-ConnectionGUID: CsvqFQSsSZCytpI0Bz8+MA==
X-CSE-MsgGUID: Trd4VclDQLy+eLXi+dzZjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62491022"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62491022"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:46:06 -0700
X-CSE-ConnectionGUID: EY2PmURNQxCAa5rG70wzCA==
X-CSE-MsgGUID: +7v7PKt4QT+5fOUN0+0aKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="185835316"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Oct 2025 00:46:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ZjO-0002Wp-1K;
	Tue, 14 Oct 2025 07:46:02 +0000
Date: Tue, 14 Oct 2025 15:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Kaplan <david.kaplan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 41/56] static_call: Add update_all_static_calls()
Message-ID: <202510141554.vfmmSbaY-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on a5652f0f2a69fadcfb2f687a11a737a57f15b28e]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Kaplan/Documentation-admin-guide-Add-documentation/20251013-231516
base:   a5652f0f2a69fadcfb2f687a11a737a57f15b28e
patch link:    https://lore.kernel.org/r/20251013143444.3999-42-david.kaplan%40amd.com
patch subject: [RFC PATCH 41/56] static_call: Add update_all_static_calls()
config: powerpc-randconfig-001-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141554.vfmmSbaY-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141554.vfmmSbaY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510141554.vfmmSbaY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/static_call_inline.c: In function 'update_all_static_calls':
>> kernel/static_call_inline.c:507:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     507 |   if (is_kernel_text((u64) site_addr) ||
         |                      ^
   kernel/static_call_inline.c:509:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     509 |        within_module_mem_type((u64) site_addr, mod, MOD_TEXT))) {
         |                               ^


vim +507 kernel/static_call_inline.c

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
 > 507			if (is_kernel_text((u64) site_addr) ||
   508			    (mod &&
   509			     within_module_mem_type((u64) site_addr, mod, MOD_TEXT))) {
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
