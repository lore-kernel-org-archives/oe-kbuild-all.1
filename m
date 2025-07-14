Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B70233712
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 22:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752533375; cv=none; b=tosrh9oMuRXfJNSx6jTik5gM4McLTuzn4osRvM5zVgwzhKHSOmODDxUO1NaBug36hMk5S/FYji6E6Y5EgyFbbJgvJO63hxbyXARG1nuhxWQOcJqsDDgpn3VfNrVE4XJPWMIduHbUFUrsP6sEHLIW7qn9bGJ3dInTPq2ut2x5D6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752533375; c=relaxed/simple;
	bh=l6UDni9DuYqBURD9Ew8aIuj1tCLmtAiWwS9gvje41OA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=He1zDG1cbmko9If8HpVELOKu31cKZ4+i+t4RiW233l4XHgDIuP+qG0P7/ZgRB/lpqQjCD9rY7Pg4RMB8Vn34dKaij0q9+BeFQwtk5LRiBTLV8YqcemO/XN/opSlGQHU0h/yiFEe54zgifJ0r2KujY5yvHhTZi9+y3cazxe2WiWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbSqJ2qZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbSqJ2qZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752533373; x=1784069373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l6UDni9DuYqBURD9Ew8aIuj1tCLmtAiWwS9gvje41OA=;
  b=LbSqJ2qZ7bf8zYA4K2Y2jBJlIxHLnkPFQcfg0QZfCIEYhYIqXZuR0u8x
   6lhXszA3gFuH6WnLzipNPyLpeqEodZVUTiRKM3WF1kahdUodAz601nCQk
   s6OCdL2Lyn6p5HQVMQzeo5y8rxeZvUHviNGZVEM9y9eZLkiVMk56VO0s6
   ccOSKufYeaWS7Eik3tE3hYxkpmu+Leb7BXJF/Xo/6yDb4r9ao8TswRCQz
   ubYYThzpZQvKs9r1cvzXcDvA0ECSFqtVpJiAd8daf65wyAheBIwy80bF9
   r3kqc/iFl71+ZlOO7oW0HwKcUH0FDoh1P/Y/d2urJi7Eip6+enSs8Ox17
   Q==;
X-CSE-ConnectionGUID: FEIQvapmQgWj2BGGVmGqxQ==
X-CSE-MsgGUID: OMIOKZyxRty0SyGYvP7R8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="80180646"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="80180646"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 15:49:32 -0700
X-CSE-ConnectionGUID: Iwd9f5IzQESvVg3IQtJPbw==
X-CSE-MsgGUID: AMc66lrAT8q0Mb0sX6XD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="161069989"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jul 2025 15:49:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubRzF-0009Q5-1P;
	Mon, 14 Jul 2025 22:49:29 +0000
Date: Tue, 15 Jul 2025 06:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 142/167] include/linux/cleanup.h:277:2:
 error: a label can only be part of a statement and a declaration is not a
 statement
Message-ID: <202507150642.hTzHnoN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   682a2b74b475e6c88226463a4679ec820c56a29e
commit: 0d58694b02635821a42baea7a8c540e76a3aa505 [142/167] bcachefs: convert buckets.c to CLASS/guards
config: arm-randconfig-002-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150642.hTzHnoN9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150642.hTzHnoN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150642.hTzHnoN9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:17,
                    from arch/arm/include/asm/bitops.h:28,
                    from include/linux/bitops.h:67,
                    from include/linux/radix-tree.h:11,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:196,
                    from fs/bcachefs/buckets.c:8:
   fs/bcachefs/buckets.c: In function '__bch2_disk_reservation_add':
>> include/linux/cleanup.h:277:2: error: a label can only be part of a statement and a declaration is not a statement
     277 |  class_##_name##_t var __cleanup(class_##_name##_destructor) = \
         |  ^~~~~~
   include/linux/cleanup.h:338:2: note: in expansion of macro 'CLASS'
     338 |  CLASS(_name, __UNIQUE_ID(guard))
         |  ^~~~~
   fs/bcachefs/buckets.c:1231:2: note: in expansion of macro 'guard'
    1231 |  guard(mutex)(&c->sectors_available_lock);
         |  ^~~~~


vim +277 include/linux/cleanup.h

54da6a0924311c Peter Zijlstra 2023-05-26  275  
54da6a0924311c Peter Zijlstra 2023-05-26  276  #define CLASS(_name, var)						\
54da6a0924311c Peter Zijlstra 2023-05-26 @277  	class_##_name##_t var __cleanup(class_##_name##_destructor) =	\
54da6a0924311c Peter Zijlstra 2023-05-26  278  		class_##_name##_constructor
54da6a0924311c Peter Zijlstra 2023-05-26  279  
54da6a0924311c Peter Zijlstra 2023-05-26  280  

:::::: The code at line 277 was first introduced by commit
:::::: 54da6a0924311c7cf5015533991e44fb8eb12773 locking: Introduce __cleanup() based infrastructure

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
