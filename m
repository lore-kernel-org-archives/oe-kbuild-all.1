Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AFE2580CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354696; cv=none; b=jcBUj9T1G4Y0heB8SqVtyXd19kMOzWIbfKI+tS+vOFaDau5vDqeiUJp7Sh1ldWovrtfiw+JIHF7mP/cB5lxcd2G9dtEO22GFnGWiQJpMT3oSkB78+t/Vep7/ZMcUbuYWnCfXovMNr6/koPJiDxTsO/CcCroMtz44k0sTBRULqYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354696; c=relaxed/simple;
	bh=6L/Jv2WHwO7Gc0bmhdfRDaOrG2oFf32wP3HtWg3bktA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4FRgkF7HvAZCsXimKGc1lrCQ08ru9y8TQ6XldGIBZ2tUjFBWNpMXo8/gj1zKluRbHqe0a8ZUSHeDSFWVMiNFf+4xDEkZBC8hzI6/FOuf5WlY0I7gAB5iLMSiqRKXeHgUOmKr+JjguRafHXDuZXKO6f8hjo+RF7FrEVm55f8bMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmwq3JVm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmwq3JVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753354694; x=1784890694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6L/Jv2WHwO7Gc0bmhdfRDaOrG2oFf32wP3HtWg3bktA=;
  b=dmwq3JVm7WTCoOCqBqf8Ae+9XF01b0oAyAJ45tAJlXI3L75DUy6Nf+Tj
   C69cMi0DOxXZaH13K6H96QMgghvH0e1LUWR5zoRC901tOE3cWuoUfKQb2
   VgU4gCZMypywUyEbsbrMdf5vRrwBkSMxAIUsz2oG6Jz6doZ/hCmIvMc7J
   x/Mc4UROFiHFe92Sh+r5l4YVorlljxWCEV8lvNoQPi5UlFQcc2BFOUNBR
   d0pHjZsmz1QLoI1PKUp2dKSo63lLLff/LnlTg0yMhb6ZDYvFelH/IAdER
   KT6m9UNkxlJCqyioavuWknBUR0ynVY6PlkzRTS9P9CNcsNONx57rezeeg
   Q==;
X-CSE-ConnectionGUID: sCDYcq/kTLKeQEE4qA8wog==
X-CSE-MsgGUID: NCnRYXVgTqmTLNwuGnaLjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="58281031"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="58281031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 03:58:14 -0700
X-CSE-ConnectionGUID: Vhi4AO0uRqaJchF1rdb5xA==
X-CSE-MsgGUID: ekQQiAYASYatZK09tqZeww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="159378213"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jul 2025 03:58:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueteM-000KLn-21;
	Thu, 24 Jul 2025 10:58:10 +0000
Date: Thu, 24 Jul 2025 18:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V3 2/4] Drivers: hv: Allow vmbus message synic
 interrupt injected from Hyper-V
Message-ID: <202507241811.sZa8qahb-lkp@intel.com>
References: <20250723190308.5945-3-ltykernel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723190308.5945-3-ltykernel@gmail.com>

Hi Tianyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master v6.16-rc7 next-20250724]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/x86-Hyper-V-Not-use-hv-apic-driver-when-Secure-AVIC-is-available/20250724-030630
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250723190308.5945-3-ltykernel%40gmail.com
patch subject: [RFC PATCH V3 2/4] Drivers: hv: Allow vmbus message synic interrupt injected from Hyper-V
config: x86_64-buildonly-randconfig-001-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241811.sZa8qahb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241811.sZa8qahb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241811.sZa8qahb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/hv_apic.c: In function 'hv_enable_coco_interrupt':
>> arch/x86/hyperv/hv_apic.c:58:9: error: implicit declaration of function 'apic_update_vector'; did you mean 'lapic_update_tsc_freq'? [-Werror=implicit-function-declaration]
      58 |         apic_update_vector(cpu, vector, set);
         |         ^~~~~~~~~~~~~~~~~~
         |         lapic_update_tsc_freq
   arch/x86/hyperv/hv_apic.c: In function 'hv_apic_init':
   arch/x86/hyperv/hv_apic.c:301:28: error: 'CC_ATTR_SNP_SECURE_AVIC' undeclared (first use in this function); did you mean 'CC_ATTR_GUEST_SNP_SECURE_TSC'?
     301 |        if (cc_platform_has(CC_ATTR_SNP_SECURE_AVIC))
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                            CC_ATTR_GUEST_SNP_SECURE_TSC
   arch/x86/hyperv/hv_apic.c:301:28: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +58 arch/x86/hyperv/hv_apic.c

    55	
    56	void hv_enable_coco_interrupt(unsigned int cpu, unsigned int vector, bool set)
    57	{
  > 58		apic_update_vector(cpu, vector, set);
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
