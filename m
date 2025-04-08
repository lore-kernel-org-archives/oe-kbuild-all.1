Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9161DA21
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744077009; cv=none; b=fDf/iO06iyf1SWv1rbpfd7Ln43YZ4ssUflN2CqQY/SeJaewZrB301IFVun4fHHIeaMp+bsu1rNov4biPAshtBF9nkYkAl2TStRlYnspspSgQjs8KN0vgxNwNzS+mWI4F9BBrHh7f4U8U8SKIvSehEEX8F2upCbKoqAN1MUgqspY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744077009; c=relaxed/simple;
	bh=RnWtgBItDo9WUhszHHwMetRdU/U/uhwSXmDswp9zyB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJJyqgc2C0mzpOLBx1WQAVj+iEq/+kuGUq3+O2qGGicjRAa8lQdD3dlf4lpXmCGGuKdUgQBhqxLfY6nHhwqnXed11erwlGInXAeBl5r0MNGLrNFfwaR1u+AMYtvjmMxYuAAVTxVwCK5c9DNkzmpWUTVrFfWJxqSZo1z4Udq9rwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gh7gAiPW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gh7gAiPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744077007; x=1775613007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RnWtgBItDo9WUhszHHwMetRdU/U/uhwSXmDswp9zyB0=;
  b=Gh7gAiPWHYWHN0QNHsvixkDAQ5RBNS8eqzsmw+6JuXjvNr0oiBhZeFFZ
   WDzMaPmosZwIEFQ3YRCr6MNCdUeIqd/FnqI5hq1jYAzKUkNzGT9haIK8y
   yLbIWo0W6nWY7MN0phWH0xuspfQ90TZq7NiN9q5fia786hfrCm3YDHive
   /nLy2eXXs76toppCmoBGFIi3q2ckWzaEg9XRYON2ZqIHIGp2jYwYiWniK
   GhCRwzydpI19S7L20n2XUcavmzKQJ7sOZrhMmQ8zk+EZ7B3sntzqUogaH
   GUiXTl23+Eh2c/lWU5plxODvj0zDrK0ktzKkM77ibNAfmwSk4z6X6d0sO
   g==;
X-CSE-ConnectionGUID: iHpxt4b7R4GvAfANppKIvw==
X-CSE-MsgGUID: B+NMKg2oRN216/5vhuRJ2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48201053"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="48201053"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:50:07 -0700
X-CSE-ConnectionGUID: kdfJdWYKQwOTFvb3iNqH7w==
X-CSE-MsgGUID: +bMsrVfuQKuMqhxLoglajQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="128634706"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2025 18:50:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1y6D-0003z9-2r;
	Tue, 08 Apr 2025 01:50:01 +0000
Date: Tue, 8 Apr 2025 09:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 21/32] drm/gpusvm: Make drm_gpusvm_for_each_* macros
 public
Message-ID: <202504080922.7Yz1JvEt-lkp@intel.com>
References: <20250407101719.3350996-22-himal.prasad.ghimiray@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-22-himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[cannot apply to linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/drm-xe-Introduce-xe_vma_op_prefetch_range-struct-for-prefetch-of-ranges/20250407-215536
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250407101719.3350996-22-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v2 21/32] drm/gpusvm: Make drm_gpusvm_for_each_* macros public
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250408/202504080922.7Yz1JvEt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080922.7Yz1JvEt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080922.7Yz1JvEt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/drm/drm_gpusvm.h:586: warning: Function parameter or struct member 'gpusvm__' not described in 'drm_gpusvm_for_each_notifier'
>> include/drm/drm_gpusvm.h:603: warning: Function parameter or struct member 'gpusvm__' not described in 'drm_gpusvm_for_each_notifier_safe'


vim +586 include/drm/drm_gpusvm.h

   573	
   574	/**
   575	 * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
   576	 * @notifier__: Iterator variable for the notifiers
   577	 * @notifier__: Pointer to the GPU SVM notifier
   578	 * @start__: Start address of the notifier
   579	 * @end__: End address of the notifier
   580	 *
   581	 * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
   582	 */
   583	#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
   584		for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
   585		     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
 > 586		     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
   587	
   588	/**
   589	 * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
   590	 * @notifier__: Iterator variable for the notifiers
   591	 * @next__: Iterator variable for the notifiers temporay storage
   592	 * @notifier__: Pointer to the GPU SVM notifier
   593	 * @start__: Start address of the notifier
   594	 * @end__: End address of the notifier
   595	 *
   596	 * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
   597	 * removing notifiers from it.
   598	 */
   599	#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
   600		for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
   601		     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
   602		     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
 > 603		     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
   604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
