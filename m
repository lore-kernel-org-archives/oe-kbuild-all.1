Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB131B4243
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 01:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739237933; cv=none; b=pXYTAKbLEspCdSNoov+ttQYbXPvDYeo2BmHJLt/BnRVZ7uNgeK0gQ6pwMwh1nLuQwr7G/z1MnjnozLYbIA08yXf+MCDpKbEJlU2gC0IMMs6hNvk8YrP52fCunhRnML1vX/SuAn5mC3cuLfQJnrDpFU7hmlbNHHn51YRwYv2sjss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739237933; c=relaxed/simple;
	bh=B3tsxzK/hOhJxnfccOYIPJfMP5JVaxNMiAmhkUQiozI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QF6xCZ0Ap43nryQS8+1OpUDmLO+pOyfUA4ouC1HWL3A27XIuaw3B195aOdPNJOFtplRewYmYnRiwhvmVWtKP5Rp0xUIhvgeFKnqlS3PHrWxlflDRRQJXoLw14gC3ffiZknxba022rx9GIKugRNBrlHOAzUERGTODzOStDXHF6zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLutqzdE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLutqzdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739237931; x=1770773931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B3tsxzK/hOhJxnfccOYIPJfMP5JVaxNMiAmhkUQiozI=;
  b=aLutqzdEPhsub3DqowJruuyx+HYnnc7fpmAkiF/YOAQ3H+GZwR0QIf9U
   yHDtHvd1NIdIk4sWqtNMiFImfW0n25qHyDXu0pEGLeg2/GJCpIui/SL2e
   x/KCcdtHx9Tic6WnvTVaQpmj3TkqhwBeYS2oyOiNBXO7Ulv2GzCJ5rDg4
   BZ5rZLqkKWH8rxR2WHqUV9CA12oRU+R5kGICmhUFqBoZ+kQcM4ZR9l5xV
   kIoPQAj2UgOmiZeifJ6Rgp6IS1hGYQ1aqsC3ZwxEHgqLLkBEIRJ05J720
   nrrLZWMqjoM/6lYDgg8Q9eA2i03PiMsgg9p/V5YohGHvdgRnaW7+wWrGV
   g==;
X-CSE-ConnectionGUID: oI4PhxNGSoGoRgIREIiUCw==
X-CSE-MsgGUID: 63GC965ORLqzkC7Yd0d4XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50073237"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="50073237"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 17:38:50 -0800
X-CSE-ConnectionGUID: pTopSPJYS+O/huuMYGtSeQ==
X-CSE-MsgGUID: 8pQVFbD5Rdyp6x5v+CCn7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="112577152"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Feb 2025 17:38:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thfEd-0013d7-0R;
	Tue, 11 Feb 2025 01:38:47 +0000
Date: Tue, 11 Feb 2025 09:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] ACPI/MRRM: Create /sys/devices/system/memory/rangeX
 ABI
Message-ID: <202502110932.b4YMqAlr-lkp@intel.com>
References: <20250210211223.6139-3-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210211223.6139-3-tony.luck@intel.com>

Hi Tony,

kernel test robot noticed the following build errors:

[auto build test ERROR on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Luck/ACPICA-Define-MRRM-ACPI-table/20250211-051427
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250210211223.6139-3-tony.luck%40intel.com
patch subject: [PATCH 2/4] ACPI/MRRM: Create /sys/devices/system/memory/rangeX ABI
config: i386-buildonly-randconfig-004-20250211 (https://download.01.org/0day-ci/archive/20250211/202502110932.b4YMqAlr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110932.b4YMqAlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110932.b4YMqAlr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/vmcore_info.c:13:
   include/linux/memory.h: In function 'mrrm_max_mem_region':
>> include/linux/memory.h:196:55: error: 'EONENT' undeclared (first use in this function); did you mean 'ENOENT'?
     196 | static inline int mrrm_max_mem_region(void) { return -EONENT; }
         |                                                       ^~~~~~
         |                                                       ENOENT
   include/linux/memory.h:196:55: note: each undeclared identifier is reported only once for each function it appears in


vim +196 include/linux/memory.h

   191	
   192	#ifdef CONFIG_ACPI_MRRM
   193	int mrrm_max_mem_region(void);
   194	int memory_subsys_device_register(struct device *dev);
   195	#else
 > 196	static inline int mrrm_max_mem_region(void) { return -EONENT; }
   197	static inline int memory_subsys_device_register(struct device *dev) { return -EINVAL; }
   198	#define memory_subsys_device_register memory_subsys_device_register
   199	#endif
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
