Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA326ED3C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 05:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791178400; cv=none; b=MoWsp0eUfRoa3LgJDjgQaA5+Tc7sis8UH4y/xAHUNBAwKDyBr224o3LJdrJfo4xEd9YOHr2DVNJFvZ2l0lkbLqerIc4kE9DqEk/PtlbEu2awzrqnZ8y3/7F6rum6laSX944Xv4+XalN4wc2FAnx3Ed4fetx2jrmaU3vDEyzlZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791178400; c=relaxed/simple;
	bh=mww/VzZvRvPh9jrnmSW1LP1LO3kmfbKmMFaHLnlOzRw=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WST01AElaNXQ9ZG+PPKXZ2vl0iZ3eiVc5VRARfLluqinwa3Dt1+7sntlGshdQ5bdIKcRxq0fymT0x6OTsdRKZJP/eDdlzM578l29B6xJdCXeljZ6X8WwwQJSbRXoR7GwuKJE+5nbKPFNn35Le+v9p7PEyK0MVsKvM8EzBuWoBn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kD7A4CW2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kD7A4CW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791178399; x=1822714399;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=mww/VzZvRvPh9jrnmSW1LP1LO3kmfbKmMFaHLnlOzRw=;
  b=kD7A4CW23dTkB+RVCOHGeqY2etwfn4UrZ9hxgiBZSw3LCQ6O0drg0/mb
   WuxwXPAGbhppZ/WCZQsJSO0M3KzlsGvQPdO0g/l1sX45FrEG5E1nF3+OL
   USthGL9kECNSwXJ2/iDlD3jU2vVIXMJqMoa2RwFaSj8uBx5onL9IOPgKa
   FA+gaIjpOCfsLr31QD7YkThR1QaJxaYvPm9K3xR8UJ6t1Qp6fKifFCerZ
   izP/rO8f3CLQ8CM32XTHy8GGtGkeVvkSrvOS8rUBd7AIQn/V5oYZ3IeJ/
   k4aasQFGfnUubte/DjLfcBfa4kQVVtdzt5aaewLTpoG4LQ7G99zKD+kkn
   Q==;
X-CSE-ConnectionGUID: 5tVgPE2STwCBYn2SrgKqyg==
X-CSE-MsgGUID: AdzDTLjyTCer0Kftdi7dOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91947070"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91947070"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 22:33:18 -0700
X-CSE-ConnectionGUID: E1vB+DZURjy/kNJJ7MMYoQ==
X-CSE-MsgGUID: unYwMjtbTcegAIkXjjl8Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="280001310"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Oct 2026 22:33:17 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDbK7-000000000ZH-1Zxs
	for oe-kbuild-all@lists.linux.dev;
	Mon, 05 Oct 2026 05:33:15 +0000
Date: Mon, 5 Oct 2026 07:32:26 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: ACPI: Add stub for acpi_has_method() for !CONFIG_ACPI
Message-ID: <202610050754.HpDCeeIT-lkp@intel.com>
References: <202610050754.HpDCeeIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610050754.HpDCeeIT-lkp@intel.com>

Hi Bowen,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Bowen-Yu/ACPI-Add-stub-for-acpi_has_method-for-CONFIG_ACPI/20260929-201347
base:   
patch link:    https://lore.kernel.org/r/202610050754.HpDCeeIT-lkp%40intel.com
config: microblaze-randconfig-r2200-20261005 (https://download.01.org/0day-ci/archive/20261005/202610050754.HpDCeeIT-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050754.HpDCeeIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610050754.HpDCeeIT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:31:
>> include/linux/acpi.h:1033:20: error: redefinition of 'acpi_has_method'
    1033 | static inline bool acpi_has_method(acpi_handle handle, char *name)
         |                    ^~~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:28,
                    from init/main.c:31:
   include/acpi/acpi_bus.h:957:20: note: previous definition of 'acpi_has_method' was here
     957 | static inline bool acpi_has_method(acpi_handle handle, char *name)
         |                    ^~~~~~~~~~~~~~~


vim +/acpi_has_method +1033 include/linux/acpi.h

  1032	
> 1033	static inline bool acpi_has_method(acpi_handle handle, char *name)
  1034	{
  1035		return false;
  1036	}
  1037	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
