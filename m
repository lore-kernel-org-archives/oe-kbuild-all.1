Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099331DF739
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 22:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386304; cv=none; b=IVQD9n3eZYXXGDOIhfZ6wY9q46qZ4qduehCOmwZ5h8CsrIaxo36tGTv9zTizav+N2xB60CPmVkwnSdhubop0IuiFlK0OBKm4ufOClP5cpqZ0skeY5VmXTt20I6OyUht3vdgFymjk+lEl5U+T7rIZYo3np3YxKhJhm9qUWJ3dSIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386304; c=relaxed/simple;
	bh=0ZcXn/PaT22Uta2T3qIfrgGJCpUBOqkk0nJeyPDaldY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5n7qFlxdPYYsphQ5FUSZSQIKGiGhvUlf83zbydQ/a7n+fkonCICvxfhnNMWMplK25EBBrjoyYYn68u6Mi+YxSg9cqNttfBTIqFXVbdarzBCoj5397YAYzOzuKE+ps1bnoy1A87Qe8+YnEywKgxD7FMpeE1mCUNF0qjXJoCQP7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KP9NcxhN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KP9NcxhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748386302; x=1779922302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZcXn/PaT22Uta2T3qIfrgGJCpUBOqkk0nJeyPDaldY=;
  b=KP9NcxhNYsJcrxC8vTTRD2x29Jo0xGGbBqxCvIuxcgV+yZDl2c2otwEp
   NgkNqpsuDd2akuR55rnp64MpTfknILXlwrOrQ7UM/DqlRi6ypoH9E+9+2
   Ss1KHx0I8qy/gt4Ck0mFjR22T6rqcpfWOH6LmPVyjGf6v9F+6dXMO98E7
   xM/wGfGiTO0eG9Jq2wvNFBimRKB3b+PFxpRaW5zICGCT0lh9DVRes+JdY
   qsQ/9+MC8NiA/HMwWrzn4Obh0pEN9H3uTnEKCCc+uyIQNL0qDIlAIWgnW
   VfNq0yIXMLBEBdG+FbsUmywewoYJt1SfTQ4AKBsz09w6G7Wrtg/tX19RO
   A==;
X-CSE-ConnectionGUID: xFxgPDQaQ3W9JBkc8PR4Gw==
X-CSE-MsgGUID: J3L3T3dmQqG9gJz6PXKHqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="38019898"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="38019898"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 15:51:41 -0700
X-CSE-ConnectionGUID: pJvb0VDhRieQfLx8xymxXA==
X-CSE-MsgGUID: J9J84txyS2G3J18B8plRFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143468680"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 May 2025 15:51:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK390-000V4k-1T;
	Tue, 27 May 2025 22:51:38 +0000
Date: Wed, 28 May 2025 06:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 310/312]
 include/linux/cleanup.h:258:2: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202505280605.5ZczLFaF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   6807dc9bb6605a9dd893c62cea15e8d6c8894b2e
commit: 2311cae7b64e69510c2f6a68965db4582ce13366 [310/312] bcachefs: Replace mutex_lock() with guards
config: sparc64-randconfig-001-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280605.5ZczLFaF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280605.5ZczLFaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280605.5ZczLFaF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:17,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/sparc/include/asm/cmpxchg_64.h:111,
                    from arch/sparc/include/asm/cmpxchg.h:5,
                    from arch/sparc/include/asm/atomic_64.h:12,
                    from arch/sparc/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sparc/include/asm/bitops_64.h:52,
                    from arch/sparc/include/asm/bitops.h:5,
                    from include/linux/bitops.h:68,
                    from include/linux/radix-tree.h:11,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:186,
                    from fs/bcachefs/buckets.c:8:
   fs/bcachefs/buckets.c: In function '__bch2_disk_reservation_add':
>> include/linux/cleanup.h:258:2: error: a label can only be part of a statement and a declaration is not a statement
     class_##_name##_t var __cleanup(class_##_name##_destructor) = \
     ^~~~~~
   include/linux/cleanup.h:319:2: note: in expansion of macro 'CLASS'
     CLASS(_name, __UNIQUE_ID(guard))
     ^~~~~
   fs/bcachefs/buckets.c:1239:2: note: in expansion of macro 'guard'
     guard(mutex)(&c->sectors_available_lock);
     ^~~~~


vim +258 include/linux/cleanup.h

54da6a0924311c Peter Zijlstra 2023-05-26  256  
54da6a0924311c Peter Zijlstra 2023-05-26  257  #define CLASS(_name, var)						\
54da6a0924311c Peter Zijlstra 2023-05-26 @258  	class_##_name##_t var __cleanup(class_##_name##_destructor) =	\
54da6a0924311c Peter Zijlstra 2023-05-26  259  		class_##_name##_constructor
54da6a0924311c Peter Zijlstra 2023-05-26  260  
54da6a0924311c Peter Zijlstra 2023-05-26  261  

:::::: The code at line 258 was first introduced by commit
:::::: 54da6a0924311c7cf5015533991e44fb8eb12773 locking: Introduce __cleanup() based infrastructure

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
