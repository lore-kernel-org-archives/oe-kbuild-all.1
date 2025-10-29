Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F012721ABDC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723519; cv=none; b=n84TW42v2+GB0t/Ei+6dO+S8ZZf713TBMvENaozhVA4IkYzPeaVPwCMrq2TWQM8teh4lcoyk+r8yCrQJvEe1hLyHM55+Y0UPGyEjEmESle2pvBcEOD23f6TExnaBpRgICnTNyP8tVFyKrxfAsQk1IRMYHm5JC6Y8fT4I/T6ZBJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723519; c=relaxed/simple;
	bh=GsxeVkQRzuebJV8rFYaYA1CbisdWaLv7xW8qLPwW0Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iflSXMn4CTDTrqmWZ90m9nJuH+kxwLCGplQo2eLPnrGjhIuAUEqFbGX3MQcW6s/IZzd0lt57WdI5bT+KOqKjnjui5pHnmUFMxTXTUPi+CiNEFviqmgyDd2IgzFqY+UPDQUVf+k8sgfOYLZQvQf0WY5SLeZY35+6wUnHrSTkCBFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n32URVjR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n32URVjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761723517; x=1793259517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GsxeVkQRzuebJV8rFYaYA1CbisdWaLv7xW8qLPwW0Wg=;
  b=n32URVjRBkIZpw2u2uHdc1/CA9KLoerEzardmG21F3Qio+JI6MdD5NsJ
   2BMBHa1KvCjvDUGuEo+j2o/is367gwxvtuyGEhdkRRnUoD/Tf6k3jYEqL
   nvr07aOfvzvsWKph6u34bH53U+5v6ubs+A/5Q8OBGHGmXvAMw5Sfk1Hgf
   BMMmC2Qp6+kwpd3GbJKrq8iXsnh3P1GuQVv74smenTUkdTHW16oucf0a5
   XKxYSgmDG9/GKT91Yct9ms83sVVRpZMj39dtuMLKxYZbTGy7SjB4S0y3X
   9+WNI8TEURwvRw0ahKAiHn+6359csyn71p6jJkwrvrgHG5L7ECI8eh58k
   g==;
X-CSE-ConnectionGUID: EzBIbmsMTg2XHGqr2IxibA==
X-CSE-MsgGUID: 394Y6pWYSpW59PRp+6XLXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74513045"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="74513045"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 00:38:36 -0700
X-CSE-ConnectionGUID: ZMhLFz02QXS5fWvcrQlLJQ==
X-CSE-MsgGUID: KGUa9pMGTLys6qRDkJdb+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185279805"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2025 00:38:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE0lM-000KMN-2K;
	Wed, 29 Oct 2025 07:38:32 +0000
Date: Wed, 29 Oct 2025 15:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:must-be-lval 9/9] include/acpi/platform/acenv.h:248:70: error:
 lvalue required as left operand of assignment
Message-ID: <202510291513.WRJGPeB7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git must-be-lval
head:   4d474d2b2fcc8b3042f44be3c29c4c27d3be78e4
commit: 4d474d2b2fcc8b3042f44be3c29c4c27d3be78e4 [9/9] acpi/**/acenv.h: Use __lvalue() in ACPI_ACQUIRE_GLOBAL_LOCK - RFC
config: loongarch-randconfig-r052-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291513.WRJGPeB7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291513.WRJGPeB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291513.WRJGPeB7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/acpi/acpi.h:22,
                    from drivers/acpi/acpica/evglock.c:10:
   drivers/acpi/acpica/evglock.c: In function 'acpi_ev_acquire_global_lock':
>> include/acpi/platform/acenv.h:248:70: error: lvalue required as left operand of assignment
     248 | #define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) __lvalue(acquired) = 1
         |                                                                      ^
   drivers/acpi/acpica/evglock.c:217:17: note: in expansion of macro 'ACPI_ACQUIRE_GLOBAL_LOCK'
     217 |                 ACPI_ACQUIRE_GLOBAL_LOCK(acpi_gbl_FACS, acquired);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/evglock.c: In function 'acpi_ev_release_global_lock':
   include/acpi/platform/acenv.h:252:68: error: lvalue required as left operand of assignment
     252 | #define ACPI_RELEASE_GLOBAL_LOCK(Glptr, pending) __lvalue(pending) = 0
         |                                                                    ^
   drivers/acpi/acpica/evglock.c:285:17: note: in expansion of macro 'ACPI_RELEASE_GLOBAL_LOCK'
     285 |                 ACPI_RELEASE_GLOBAL_LOCK(acpi_gbl_FACS, pending);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~


vim +248 include/acpi/platform/acenv.h

   246	
   247	#ifndef ACPI_ACQUIRE_GLOBAL_LOCK
 > 248	#define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) __lvalue(acquired) = 1
   249	#endif
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
