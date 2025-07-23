Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE8A19E7E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753242565; cv=none; b=hnK6JkmRlNob1LJknlaRQ2+ZQaRBCjZ60Kb1nhfglWsXQzOghqnSfPXlZljiPBItI0mnLyPmYuh6JhBc9yG8/5rjPYvGlDyYemBYXZnIJIefhzjBiDXfcjln90W1I6GtC/jhy8xvbFIAvsJFTetpEZtYNWuPs3ieIJMqWio/OJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753242565; c=relaxed/simple;
	bh=6aRhEMaANS7oSdHZaoh2TDytS+D+X2CyXgkFMhKe4SA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F0NZoAheg+J6+L7NIhpkdXCo9+1L9TxfzZ41++zVdWlXCQ7/Vk7LX5WHUzHgnTDwoupcKoUuYpX7gAU/sNVDajp2EWVwEncozdSEfAIlf5bi0dB1nvCMass4cAfnGJ9BbQI7f6+UoLwjdz4gEouM/86lv5mueH9akgd7DgdNXKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBScxs2f; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBScxs2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753242564; x=1784778564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6aRhEMaANS7oSdHZaoh2TDytS+D+X2CyXgkFMhKe4SA=;
  b=kBScxs2fLMFfUQ5GAfl8vSK46phQ27W6b8po5CKcGQKxf9pzOap90s/t
   2DIWDOn3kCJ0K5KWcjsd7MlR7fjWzDfSo0rnuTem0KQufAxC4BXVDCRzn
   Fp3X/cOxh60Hmnaxm/zDQOseCPz0guRQdOWaJ2mxCMJdunaIak6MkcSwI
   5t/S7z6DrfH1h+jFy8ay0vEejaswtQr1LZqn4mhmxmEupIdt9Fv19Otsb
   XGRS1jnmCzfdcuGpaoRd4pHHbFiCaELSo0O2ikf1kHBeL6m1FQRC9BGUG
   QN+kgKHiHG/PUZAVp566yq35g3OBC7zMJmvbkFNj3C4wqCvTliTGSldvG
   A==;
X-CSE-ConnectionGUID: Xc5VX+5ARrumDZLku4c5MA==
X-CSE-MsgGUID: 9OFD7E/fRPy6QawnzNgzDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59312436"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="59312436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 20:49:22 -0700
X-CSE-ConnectionGUID: E2mDjykyQW22y8ZI8UHknw==
X-CSE-MsgGUID: f8FK6bIIQtu7K4SvcXpvcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="163592288"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 20:49:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueQTm-000Ivn-1m;
	Wed, 23 Jul 2025 03:49:18 +0000
Date: Wed, 23 Jul 2025 11:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: [thomas-weissschuh:vdso/unaligned 1/3]
 include/vdso/unaligned.h:21:9: warning: '__builtin_memcpy' reading 4 bytes
 from a region of size 1
Message-ID: <202507231135.OtEGYfnQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/unaligned
head:   d826530fc107faa320a7a88b939b72fa5f6734b5
commit: 3e7bf09e7bd5dce36df14f6770211fd1bc98a538 [1/3] vdso: Switch get/put unaligned from packed struct to memcpy
config: parisc-randconfig-002-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231135.OtEGYfnQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231135.OtEGYfnQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231135.OtEGYfnQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/parisc/include/uapi/asm/byteorder.h:5,
                    from arch/parisc/include/asm/bitops.h:11,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:9,
                    from arch/parisc/boot/compressed/misc.c:7:
   In function 'get_unaligned_le32',
       inlined from 'decompress_kernel' at arch/parisc/boot/compressed/misc.c:312:16:
>> include/vdso/unaligned.h:21:9: warning: '__builtin_memcpy' reading 4 bytes from a region of size 1 [-Wstringop-overread]
      21 |         __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                          sizeof(__get_unaligned_val));                  \
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   include/linux/unaligned.h:23:28: note: in expansion of macro '__get_unaligned_t'
      23 |         return le32_to_cpu(__get_unaligned_t(__le32, p));
         |                            ^~~~~~~~~~~~~~~~~
   arch/parisc/boot/compressed/misc.c: In function 'decompress_kernel':
   arch/parisc/boot/compressed/misc.c:29:13: note: source object 'output_len' of size 1
      29 | extern char output_len;
         |             ^~~~~~~~~~


vim +/__builtin_memcpy +21 include/vdso/unaligned.h

     6	
     7	/**
     8	 * __get_unaligned_t - read an unaligned value from memory.
     9	 * @type:	the type to load from the pointer.
    10	 * @ptr:	the pointer to load from.
    11	 *
    12	 * Use memcpy to affect an unaligned type sized load avoiding undefined behavior
    13	 * from approaches like type punning that require -fno-strict-aliasing in order
    14	 * to be correct. As type may be const, use __unqual_scalar_typeof to map to a
    15	 * non-const type - you can't memcpy into a const type. The void* cast silences
    16	 * ubsan warnings.
    17	 */
    18	#define __get_unaligned_t(type, ptr) ({					\
    19		type __get_unaligned_ctrl_type __always_unused = { 0 };			\
    20		__unqual_scalar_typeof(__get_unaligned_ctrl_type) __get_unaligned_val; \
  > 21		__builtin_memcpy(&__get_unaligned_val, (void *)(ptr),		\
    22				 sizeof(__get_unaligned_val));			\
    23		__get_unaligned_val;						\
    24	})
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
