Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ECD1DA23
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750580424; cv=none; b=KSf1/MNWPehkh86glnO+53g9O+5WmJpVkU/0rVdN5kYPJyBXYKiV1SLr+Dov76jcw7eSj6H+F91wx/5gBh41TyZ3Gg//aqeNulIxXduHDnaGzSHKH7o8H1hiHqpGScauyxahW9XV9AatNvH3IEU4bgClqNmM49XKE4lS4a+IOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750580424; c=relaxed/simple;
	bh=NeXBz9nNBOXlkApA/4KDdYHxA5Hhev++8diE79qJpoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZE8AzcK8mINrzKXTNSBWiSoRUugob2hf/N4spubu2vzpzdR4caljDrsxSrwynGZycC7l9jUA2hRQqWfZPMg+Iu6fH/+Y62HqXz7jfav2HM7A3VBspz3rrjdFUMhEQVxR6in2KTh/dWvSXBf7F/NI/Xt1MP4Epr4IhYgu/cIK7Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1byJdxx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1byJdxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750580423; x=1782116423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NeXBz9nNBOXlkApA/4KDdYHxA5Hhev++8diE79qJpoU=;
  b=b1byJdxxDtro5bPMpePJvynE1jI0SvcBTekNbZll1o/FwU1VvaQ9m+PR
   LtDbUrcuH1s5N9ae0B8z1AfzxOporegPQXCUeTXUmvhynX8jQgzCm2Abh
   9ywSGXxLuAEjf69NG0ksNGr2zJBXCr06cudT864GbGsoX9hvy4OhfMZQJ
   2FxdDTMgu8QfvEYzYJXwGNEDqCW/dB3mnebvavsizOnIZ/3qQL1e9GxT+
   RsyGulSEayK8DbRF8OQ5400S+70aI7GfJKigzpPlnDCxHKJeKKFf9nzJ/
   w9+jdl0oqWZ5kms6ZE3HyB0TFLXOp6PH2aaYMvnr9j4YSEpIChEl57s1n
   Q==;
X-CSE-ConnectionGUID: PSuJrUG8R0+XLPrMmUj9Ww==
X-CSE-MsgGUID: 5T5teXFwRAqdG7wpTGdWjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52931055"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52931055"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 01:20:22 -0700
X-CSE-ConnectionGUID: rKLwxpTqQw+4NinhE8Z4KA==
X-CSE-MsgGUID: gkCxRMf6Sq6l4es3x1+ezQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="151822151"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jun 2025 01:20:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTFw3-000N9E-0D;
	Sun, 22 Jun 2025 08:20:19 +0000
Date: Sun, 22 Jun 2025 16:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chleroy:uaccess_masked 5/7] arch/powerpc/include/asm/kup.h:138:9:
 error: too few arguments to function 'allow_user_access'
Message-ID: <202506221638.BCo0KN5Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/chleroy/linux uaccess_masked
head:   ddfbac9ee97c521bcc7bc856f90384363f7e2f74
commit: d44b8feff873b271dc0adf11438e172c2345b0ce [5/7] powerpc: Remove unused size parametre to KUAP enabling/disabling functions
config: powerpc-randconfig-r112-20250622 (https://download.01.org/0day-ci/archive/20250622/202506221638.BCo0KN5Y-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250622/202506221638.BCo0KN5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221638.BCo0KN5Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:12:
   arch/powerpc/include/asm/kup.h: In function 'allow_read_from_user':
>> arch/powerpc/include/asm/kup.h:138:9: error: too few arguments to function 'allow_user_access'
     138 |         allow_user_access(NULL, from, KUAP_READ);
         |         ^~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kup.h:75:29: note: declared here
      75 | static __always_inline void allow_user_access(void __user *to, const void __user *from,
         |                             ^~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kup.h: In function 'allow_write_to_user':
   arch/powerpc/include/asm/kup.h:143:9: error: too few arguments to function 'allow_user_access'
     143 |         allow_user_access(to, NULL, KUAP_WRITE);
         |         ^~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kup.h:75:29: note: declared here
      75 | static __always_inline void allow_user_access(void __user *to, const void __user *from,
         |                             ^~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kup.h: In function 'allow_read_write_user':
   arch/powerpc/include/asm/kup.h:149:9: error: too few arguments to function 'allow_user_access'
     149 |         allow_user_access(to, from, KUAP_READ_WRITE);
         |         ^~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kup.h:75:29: note: declared here
      75 | static __always_inline void allow_user_access(void __user *to, const void __user *from,
         |                             ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/allow_user_access +138 arch/powerpc/include/asm/kup.h

   134	
   135	static __always_inline void allow_read_from_user(const void __user *from)
   136	{
   137		barrier_nospec();
 > 138		allow_user_access(NULL, from, KUAP_READ);
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
