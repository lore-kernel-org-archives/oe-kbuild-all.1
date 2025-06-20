Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A09B227E87
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 07:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402926; cv=none; b=fB1eNuBijKeDaVDJYeNMEk0TkrBDXjggkQXgYrb+ps0QzYORnk5sGBqgV8HvXCr/GCkRJHwr/Fjp+YkKslpu7MA0ZV6RGJj0R8GFvv8habMM2HdoqdBUWbnab7W2aIA+zpapra3rf+Ho8t2DyVzkJUB7iQ85vLeN1iwbr+EyxKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402926; c=relaxed/simple;
	bh=B8GoHqqJPdSTR0JjHz+8XE9/72C0C57y+XfAzIQXD7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKDJXFJgnLy7bLJUoUQ/ga/bQzZ/HwUthtn5KvyUXgKklRGjf2+ekdOukLcujnOAT88+N/yJ1WpHQF2Yj14N7Oc6RkVs/PY8yBJx/E1BmTJVaqhsDdGfF/uB8Cok6Qew7cFjqKLnmxaYSl2YJmErtVEX8TD+1LJh/DVBn+LjxDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCQgQa4M; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCQgQa4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750402924; x=1781938924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B8GoHqqJPdSTR0JjHz+8XE9/72C0C57y+XfAzIQXD7s=;
  b=KCQgQa4MqB2fwz/vz9RnxL4CJBzGRMHOqmi9nPcRMEf4Kz+juqV4h4W+
   RRCLW99N2dMs49dBd8HxYCRw8VXy+A5qnXRJw/ZvRzRfGkxFocOSpu/Il
   bUFHUeoacdtJXHO3eWJ94RkJLNVI9V8RuilowtjwFZOJlxqkCCiW7dHiV
   9IiT2wQso43oRziFhT65JvlyJJIkdKxIUmmxCLSRI7wmeiVfiG9iL+Fxt
   sCdj99AZvEdr4ASp8K4BitABzY5Xk2bN+vRljdSmdKHuSLuB7M0ZBoRKC
   dNNMlPFJjn6ygMU8r4r9e7K6RZbqpNva7pKHvf2IQYMd/Xx3qJv89EeDF
   Q==;
X-CSE-ConnectionGUID: 7+ppnTjeRBuC5RXislOMoA==
X-CSE-MsgGUID: l0NmnjMBTRmI8SAS11iibA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52582108"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="52582108"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 00:01:41 -0700
X-CSE-ConnectionGUID: b+0iv9LYTn+GNGFQh6pPDw==
X-CSE-MsgGUID: qQt2QkI/Sj+JCAtQBJBHnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="155116976"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2025 00:01:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSVko-000LSu-1o;
	Fri, 20 Jun 2025 07:01:38 +0000
Date: Fri, 20 Jun 2025 15:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 173/173]
 include/linux/fortify-string.h:70:33: warning: '__builtin_memcpy' writing 1
 byte into a region of size 0 overflows the destination
Message-ID: <202506201444.fVDEZyug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   2f3b34fb365020c9c916f0e0c4f2bd82f7cfd1c6
commit: beb260292232956605c97414369a880d90cf9f56 [173/173] CHROMIUM: fortify: Downgrade to FORTIFY=2
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250620/202506201444.fVDEZyug-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201444.fVDEZyug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201444.fVDEZyug-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:295,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/pinctrl/aspeed/pinctrl-aspeed.c:7:
   In function 'strlcat',
       inlined from 'strcat' at include/linux/fortify-string.h:447:6,
       inlined from 'get_defined_attribute' at drivers/pinctrl/aspeed/pinctrl-aspeed.c:186:4:
   include/linux/fortify-string.h:421:19: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     421 |         p[actual] = '\0';
         |         ~~~~~~~~~~^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c: In function 'get_defined_attribute':
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:175:36: note: at offset -2 into destination object of size [0, 2147483647] allocated by 'krealloc'
     175 |                         expanded = krealloc(found, len + delta + 1, GFP_KERNEL);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'strlcat',
       inlined from 'strcat' at include/linux/fortify-string.h:447:6,
       inlined from 'get_defined_attribute' at drivers/pinctrl/aspeed/pinctrl-aspeed.c:186:4:
>> include/linux/fortify-string.h:70:33: warning: '__builtin_memcpy' writing 1 byte into a region of size 0 overflows the destination [-Wstringop-overflow=]
      70 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:420:9: note: in expansion of macro '__underlying_memcpy'
     420 |         __underlying_memcpy(p + p_len, q, copy_len);
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c: In function 'get_defined_attribute':
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:175:36: note: at offset -3 into destination object of size [0, 2147483647] allocated by 'krealloc'
     175 |                         expanded = krealloc(found, len + delta + 1, GFP_KERNEL);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__builtin_memcpy +70 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  59  
78a498c3a227f2 Alexander Potapenko 2022-10-24  60  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2 Alexander Potapenko 2022-10-24  61  /*
78a498c3a227f2 Alexander Potapenko 2022-10-24  62   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2 Alexander Potapenko 2022-10-24  63   * corresponding __msan_XXX functions.
78a498c3a227f2 Alexander Potapenko 2022-10-24  64   */
78a498c3a227f2 Alexander Potapenko 2022-10-24  65  #include <linux/kmsan_string.h>
78a498c3a227f2 Alexander Potapenko 2022-10-24  66  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2 Alexander Potapenko 2022-10-24  67  #define __underlying_memmove	__msan_memmove
78a498c3a227f2 Alexander Potapenko 2022-10-24  68  #define __underlying_memset	__msan_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  69  #else
a28a6e860c6cf2 Francis Laniel      2021-02-25 @70  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  71  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel      2021-02-25  72  #define __underlying_memset	__builtin_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  73  #endif
78a498c3a227f2 Alexander Potapenko 2022-10-24  74  

:::::: The code at line 70 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
