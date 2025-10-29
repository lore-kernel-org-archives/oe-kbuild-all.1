Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B031E5B70
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 03:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761709853; cv=none; b=Mv/xhlOAK7EcLMXg8QO5OT0nHvtb94fwp38hvTYfs72Qql7XV1xffEpzWkB7M/WfnR6Nty3jfLXkj2hm68R6AO5hH1N/2ZeRap2MB7ZwLBv8CK+QGTi2+rxiY4LTx0XksWLnwhr+O55hMDdwVXutS6Ipa0H19S9snpblcLgw8CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761709853; c=relaxed/simple;
	bh=xq2TpwAp2eg2EILIMv/mue1KdqrhaVrQSz3EMltXP8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fg5yx6vaAIthTrG7zCi0jrbg6chucM0GCU69uH9Csp0iO+ejwE0lGGGeGTMAsvc6IedyQ8q7lwtHY+s2QTjHh/6WviMjyvF/+0YzkJ1S69a+h6kEM7Ozen6pngyi1roW4wjVJ3kJ/s1xHYb+4jVRhgGm+PHPbi0ZyWIvcuM05lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIDQA4wJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIDQA4wJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761709851; x=1793245851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xq2TpwAp2eg2EILIMv/mue1KdqrhaVrQSz3EMltXP8Y=;
  b=eIDQA4wJ2dS0qFJ7C6G1RdYMpqtRKYUNpCAx7jSwjOscYgZiif//j2mo
   +oKlyjLLke/nlfEsa1TmpxIva92Gcr+pDDqd4VMDkEgqogA5avSPlTHsz
   ML93H8iLnpSRZJEU3MuYwI0z4ugq5WjaYw4nsFu/6IMUUZudGb4C8NKXn
   QfNfLmrihpOVzP8N6GAAH5fn/Z0pXI0xjwqei3vstutisAWTnB5GHhVG/
   K5DHE5a4cZ/FTfWi4Z/2ltqugvkZ8J2eXPr7DnLoCbBFlV1mSoxfyjjCN
   BTyJENsL/UKfNJ+Rn5zRoS7ll7WBT/Z9KllShGLpZUdZzDtRcQSoSr7mF
   g==;
X-CSE-ConnectionGUID: 1dDzSKX6RNi1ko3Vnyq+AQ==
X-CSE-MsgGUID: z2Um+KFwSsOydosEaaTNuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67658866"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67658866"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 20:50:50 -0700
X-CSE-ConnectionGUID: bhE9ZO8wQ7ue7awIBX5dVQ==
X-CSE-MsgGUID: EXWV9Z7yQ92TW697igoscA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185232365"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2025 20:50:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDxCa-000K7R-0N;
	Wed, 29 Oct 2025 03:50:30 +0000
Date: Wed, 29 Oct 2025 11:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:must-be-lval 9/9] drivers/acpi/acpica/evglock.c:217:3: error:
 expression is not assignable
Message-ID: <202510291135.Fz2Z2hQN-lkp@intel.com>
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
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251029/202510291135.Fz2Z2hQN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291135.Fz2Z2hQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291135.Fz2Z2hQN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/acpica/evglock.c:217:3: error: expression is not assignable
     217 |                 ACPI_ACQUIRE_GLOBAL_LOCK(acpi_gbl_FACS, acquired);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/platform/acenv.h:248:70: note: expanded from macro 'ACPI_ACQUIRE_GLOBAL_LOCK'
     248 | #define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) __lvalue(acquired) = 1
         |                                                   ~~~~~~~~~~~~~~~~~~ ^
   drivers/acpi/acpica/evglock.c:285:3: error: expression is not assignable
     285 |                 ACPI_RELEASE_GLOBAL_LOCK(acpi_gbl_FACS, pending);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/platform/acenv.h:252:68: note: expanded from macro 'ACPI_RELEASE_GLOBAL_LOCK'
     252 | #define ACPI_RELEASE_GLOBAL_LOCK(Glptr, pending) __lvalue(pending) = 0
         |                                                  ~~~~~~~~~~~~~~~~~ ^
   2 errors generated.


vim +217 drivers/acpi/acpica/evglock.c

0f6896f195df01 Bob Moore 2011-04-13  147  
0f6896f195df01 Bob Moore 2011-04-13  148  /******************************************************************************
0f6896f195df01 Bob Moore 2011-04-13  149   *
0f6896f195df01 Bob Moore 2011-04-13  150   * FUNCTION:    acpi_ev_acquire_global_lock
0f6896f195df01 Bob Moore 2011-04-13  151   *
ba494beeaa69bc Bob Moore 2012-07-12  152   * PARAMETERS:  timeout         - Max time to wait for the lock, in millisec.
0f6896f195df01 Bob Moore 2011-04-13  153   *
0f6896f195df01 Bob Moore 2011-04-13  154   * RETURN:      Status
0f6896f195df01 Bob Moore 2011-04-13  155   *
0f6896f195df01 Bob Moore 2011-04-13  156   * DESCRIPTION: Attempt to gain ownership of the Global Lock.
0f6896f195df01 Bob Moore 2011-04-13  157   *
0f6896f195df01 Bob Moore 2011-04-13  158   * MUTEX:       Interpreter must be locked
0f6896f195df01 Bob Moore 2011-04-13  159   *
0f6896f195df01 Bob Moore 2011-04-13  160   * Note: The original implementation allowed multiple threads to "acquire" the
0f6896f195df01 Bob Moore 2011-04-13  161   * Global Lock, and the OS would hold the lock until the last thread had
0f6896f195df01 Bob Moore 2011-04-13  162   * released it. However, this could potentially starve the BIOS out of the
0f6896f195df01 Bob Moore 2011-04-13  163   * lock, especially in the case where there is a tight handshake between the
0f6896f195df01 Bob Moore 2011-04-13  164   * Embedded Controller driver and the BIOS. Therefore, this implementation
0f6896f195df01 Bob Moore 2011-04-13  165   * allows only one thread to acquire the HW Global Lock at a time, and makes
0f6896f195df01 Bob Moore 2011-04-13  166   * the global lock appear as a standard mutex on the OS side.
0f6896f195df01 Bob Moore 2011-04-13  167   *
0f6896f195df01 Bob Moore 2011-04-13  168   *****************************************************************************/
0f6896f195df01 Bob Moore 2011-04-13  169  
0f6896f195df01 Bob Moore 2011-04-13  170  acpi_status acpi_ev_acquire_global_lock(u16 timeout)
0f6896f195df01 Bob Moore 2011-04-13  171  {
0f6896f195df01 Bob Moore 2011-04-13  172  	acpi_cpu_flags flags;
0f6896f195df01 Bob Moore 2011-04-13  173  	acpi_status status;
0f6896f195df01 Bob Moore 2011-04-13  174  	u8 acquired = FALSE;
0f6896f195df01 Bob Moore 2011-04-13  175  
0f6896f195df01 Bob Moore 2011-04-13  176  	ACPI_FUNCTION_TRACE(ev_acquire_global_lock);
0f6896f195df01 Bob Moore 2011-04-13  177  
0f6896f195df01 Bob Moore 2011-04-13  178  	/*
0f6896f195df01 Bob Moore 2011-04-13  179  	 * Only one thread can acquire the GL at a time, the global_lock_mutex
0f6896f195df01 Bob Moore 2011-04-13  180  	 * enforces this. This interface releases the interpreter if we must wait.
0f6896f195df01 Bob Moore 2011-04-13  181  	 */
0f6896f195df01 Bob Moore 2011-04-13  182  	status =
0f6896f195df01 Bob Moore 2011-04-13  183  	    acpi_ex_system_wait_mutex(acpi_gbl_global_lock_mutex->mutex.
0f6896f195df01 Bob Moore 2011-04-13  184  				      os_mutex, timeout);
0f6896f195df01 Bob Moore 2011-04-13  185  	if (ACPI_FAILURE(status)) {
0f6896f195df01 Bob Moore 2011-04-13  186  		return_ACPI_STATUS(status);
0f6896f195df01 Bob Moore 2011-04-13  187  	}
0f6896f195df01 Bob Moore 2011-04-13  188  
0f6896f195df01 Bob Moore 2011-04-13  189  	/*
0f6896f195df01 Bob Moore 2011-04-13  190  	 * Update the global lock handle and check for wraparound. The handle is
0f6896f195df01 Bob Moore 2011-04-13  191  	 * only used for the external global lock interfaces, but it is updated
0f6896f195df01 Bob Moore 2011-04-13  192  	 * here to properly handle the case where a single thread may acquire the
0f6896f195df01 Bob Moore 2011-04-13  193  	 * lock via both the AML and the acpi_acquire_global_lock interfaces. The
0f6896f195df01 Bob Moore 2011-04-13  194  	 * handle is therefore updated on the first acquire from a given thread
0f6896f195df01 Bob Moore 2011-04-13  195  	 * regardless of where the acquisition request originated.
0f6896f195df01 Bob Moore 2011-04-13  196  	 */
0f6896f195df01 Bob Moore 2011-04-13  197  	acpi_gbl_global_lock_handle++;
0f6896f195df01 Bob Moore 2011-04-13  198  	if (acpi_gbl_global_lock_handle == 0) {
0f6896f195df01 Bob Moore 2011-04-13  199  		acpi_gbl_global_lock_handle = 1;
0f6896f195df01 Bob Moore 2011-04-13  200  	}
0f6896f195df01 Bob Moore 2011-04-13  201  
0f6896f195df01 Bob Moore 2011-04-13  202  	/*
0f6896f195df01 Bob Moore 2011-04-13  203  	 * Make sure that a global lock actually exists. If not, just
0f6896f195df01 Bob Moore 2011-04-13  204  	 * treat the lock as a standard mutex.
0f6896f195df01 Bob Moore 2011-04-13  205  	 */
0f6896f195df01 Bob Moore 2011-04-13  206  	if (!acpi_gbl_global_lock_present) {
0f6896f195df01 Bob Moore 2011-04-13  207  		acpi_gbl_global_lock_acquired = TRUE;
0f6896f195df01 Bob Moore 2011-04-13  208  		return_ACPI_STATUS(AE_OK);
0f6896f195df01 Bob Moore 2011-04-13  209  	}
0f6896f195df01 Bob Moore 2011-04-13  210  
0f6896f195df01 Bob Moore 2011-04-13  211  	flags = acpi_os_acquire_lock(acpi_gbl_global_lock_pending_lock);
0f6896f195df01 Bob Moore 2011-04-13  212  
0f6896f195df01 Bob Moore 2011-04-13  213  	do {
0f6896f195df01 Bob Moore 2011-04-13  214  
0f6896f195df01 Bob Moore 2011-04-13  215  		/* Attempt to acquire the actual hardware lock */
0f6896f195df01 Bob Moore 2011-04-13  216  
0f6896f195df01 Bob Moore 2011-04-13 @217  		ACPI_ACQUIRE_GLOBAL_LOCK(acpi_gbl_FACS, acquired);
0f6896f195df01 Bob Moore 2011-04-13  218  		if (acquired) {
0f6896f195df01 Bob Moore 2011-04-13  219  			acpi_gbl_global_lock_acquired = TRUE;
0f6896f195df01 Bob Moore 2011-04-13  220  			ACPI_DEBUG_PRINT((ACPI_DB_EXEC,
0f6896f195df01 Bob Moore 2011-04-13  221  					  "Acquired hardware Global Lock\n"));
0f6896f195df01 Bob Moore 2011-04-13  222  			break;
0f6896f195df01 Bob Moore 2011-04-13  223  		}
0f6896f195df01 Bob Moore 2011-04-13  224  
0f6896f195df01 Bob Moore 2011-04-13  225  		/*
0f6896f195df01 Bob Moore 2011-04-13  226  		 * Did not get the lock. The pending bit was set above, and
0f6896f195df01 Bob Moore 2011-04-13  227  		 * we must now wait until we receive the global lock
0f6896f195df01 Bob Moore 2011-04-13  228  		 * released interrupt.
0f6896f195df01 Bob Moore 2011-04-13  229  		 */
0f6896f195df01 Bob Moore 2011-04-13  230  		acpi_gbl_global_lock_pending = TRUE;
0f6896f195df01 Bob Moore 2011-04-13  231  		acpi_os_release_lock(acpi_gbl_global_lock_pending_lock, flags);
0f6896f195df01 Bob Moore 2011-04-13  232  
0f6896f195df01 Bob Moore 2011-04-13  233  		ACPI_DEBUG_PRINT((ACPI_DB_EXEC,
0f6896f195df01 Bob Moore 2011-04-13  234  				  "Waiting for hardware Global Lock\n"));
0f6896f195df01 Bob Moore 2011-04-13  235  
0f6896f195df01 Bob Moore 2011-04-13  236  		/*
0f6896f195df01 Bob Moore 2011-04-13  237  		 * Wait for handshake with the global lock interrupt handler.
0f6896f195df01 Bob Moore 2011-04-13  238  		 * This interface releases the interpreter if we must wait.
0f6896f195df01 Bob Moore 2011-04-13  239  		 */
0f6896f195df01 Bob Moore 2011-04-13  240  		status =
0f6896f195df01 Bob Moore 2011-04-13  241  		    acpi_ex_system_wait_semaphore
0f6896f195df01 Bob Moore 2011-04-13  242  		    (acpi_gbl_global_lock_semaphore, ACPI_WAIT_FOREVER);
0f6896f195df01 Bob Moore 2011-04-13  243  
0f6896f195df01 Bob Moore 2011-04-13  244  		flags = acpi_os_acquire_lock(acpi_gbl_global_lock_pending_lock);
0f6896f195df01 Bob Moore 2011-04-13  245  
0f6896f195df01 Bob Moore 2011-04-13  246  	} while (ACPI_SUCCESS(status));
0f6896f195df01 Bob Moore 2011-04-13  247  
0f6896f195df01 Bob Moore 2011-04-13  248  	acpi_gbl_global_lock_pending = FALSE;
0f6896f195df01 Bob Moore 2011-04-13  249  	acpi_os_release_lock(acpi_gbl_global_lock_pending_lock, flags);
0f6896f195df01 Bob Moore 2011-04-13  250  
0f6896f195df01 Bob Moore 2011-04-13  251  	return_ACPI_STATUS(status);
0f6896f195df01 Bob Moore 2011-04-13  252  }
0f6896f195df01 Bob Moore 2011-04-13  253  

:::::: The code at line 217 was first introduced by commit
:::::: 0f6896f195df014064014493c8287a8e2d18f938 ACPICA: Split all internal Global Lock functions to new file - evglock

:::::: TO: Bob Moore <robert.moore@intel.com>
:::::: CC: Len Brown <len.brown@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
