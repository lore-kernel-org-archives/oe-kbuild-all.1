Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372A917BAF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717834049; cv=none; b=RBQFl7ViNNLe1TXxDdhhFo8ZBu5ylpuYsIxd0YkKT9DZKBCJooPUNdyrtKIEWLGRi+FyKTKrXKmEmca86a0gEK9Paibae41GVHn9lVcrG5iDoBsMS5whI2m1jXshN5kCi779fE5DHTgWzuWESOkuIapyqvZwDY0/sponEBwyOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717834049; c=relaxed/simple;
	bh=AIABarjNxyZZC53ZbJJm7N5Ob7YA7spLdB7Y2xt6VWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwXpKJSrt89O82wY7COTuu/OCwVK9E53mfecX5nTZxJyNeVjhLgY6qbiP9KkaBYOu3V/VPvEb2xSr4aTyxc3+32ljYHydZ2J/0vHsXpmRNftJVo1ITfrNGIo6+kBOvDgLoUbd7wkQgz1N0ekYEO9HFkCf5SUwH143vmVoadLbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNZP5pIX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNZP5pIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717834047; x=1749370047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AIABarjNxyZZC53ZbJJm7N5Ob7YA7spLdB7Y2xt6VWQ=;
  b=eNZP5pIXr0UapV7/cG4vQI8TrxJh/hhqJ57WuwWlJbLTsRX8eT1ib8ql
   +0u1fGJYdHWgPhHkJxJLn7oLCvWl8+c7PHDEfbohtdCdZhAHriBWpeD3h
   Ucw+JDu+8Fkvgkb4gwU+gqTQODngcOrYS/Kzj4Ngmv2moEhgZa8Eexz62
   gqnVYk4Qk8jWTpBbCEwDld+grfU3BmGNQ6ksRX//fJeH+ZaVV32aYcbfK
   k5xUlmUZCNfnGQ0UAMhmj2j16hDzpaOi/mUZ0BPdBfoaM/zqDGiGMY175
   VW+6XLDANyQh1kAva0BH4IuVjhUUmObu9LnZbTI9WTe4jFWyGmpvhN5ub
   g==;
X-CSE-ConnectionGUID: sBSCBssBQ+2U7AqZsHwhgA==
X-CSE-MsgGUID: 9ePUNDzJQHq7ZA+kTOrE6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14364107"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14364107"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 01:07:26 -0700
X-CSE-ConnectionGUID: fjGiivc8RZS5r6Pu5+muVQ==
X-CSE-MsgGUID: Fv/teKF1Su6fWCpbdsu3KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="42992357"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2024 01:07:25 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFr6g-0001Ix-33;
	Sat, 08 Jun 2024 08:07:22 +0000
Date: Sat, 8 Jun 2024 16:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 30/48]
 arch/xtensa/include/uapi/asm/swab.h:24:5: warning: 'txchain' is used
 uninitialized
Message-ID: <202406081611.wxsbLzrp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   fae7f8f49987606a0ffa6103ab424f8baa3b76fe
commit: 6d2ed99880570a1311247abefd7dbf5b77af6e69 [30/48] [brcmfmac] Compute number of available antennas and set it in wiphy structure.
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240608/202406081611.wxsbLzrp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081611.wxsbLzrp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081611.wxsbLzrp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/swab.h:8,
                    from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/xtensa/include/uapi/asm/byteorder.h:8,
                    from arch/xtensa/include/asm/bitops.h:21,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:8:
   In function '__arch_swab32',
       inlined from '__fswab32' at include/uapi/linux/swab.h:60:9,
       inlined from 'brcmf_fil_iovar_int_get' at drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h:123:19,
       inlined from 'brcmf_setup_wiphybands' at drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7359:8:
>> arch/xtensa/include/uapi/asm/swab.h:24:5: warning: 'txchain' is used uninitialized [-Wuninitialized]
      24 |     __asm__("ssai     8           \n\t"
         |     ^~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c: In function 'brcmf_setup_wiphybands':
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7316:13: note: 'txchain' was declared here
    7316 |         u32 txchain;
         |             ^~~~~~~


vim +/txchain +24 arch/xtensa/include/uapi/asm/swab.h

8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  19  
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  20  static inline __attribute_const__ __u32 __arch_swab32(__u32 x)
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  21  {
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  22      __u32 res;
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  23      /* instruction sequence from Xtensa ISA release 2/2000 */
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07 @24      __asm__("ssai     8           \n\t"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  25  	    "srli     %0, %1, 16  \n\t"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  26  	    "src      %0, %0, %1  \n\t"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  27  	    "src      %0, %0, %0  \n\t"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  28  	    "src      %0, %1, %0  \n"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  29  	    : "=&a" (res)
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  30  	    : "a" (x)
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  31  	    );
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  32      return res;
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  33  }
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  34  #define __arch_swab32 __arch_swab32
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  35  

:::::: The code at line 24 was first introduced by commit
:::::: 8903709b054a8dafe4e8c6d9a6444034d7aba36f xtensa: introduce swab.h

:::::: TO: Harvey Harrison <harvey.harrison@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
