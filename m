Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CFF4175A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmeI7Ilh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696536208; x=1728072208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4dS+oGjb3CZr7FHGDL4sLaPhlOXMNtnvbLiV0XNUdY=;
  b=bmeI7IlhrhqchF5CaUvyDH9LETZ8X1tUxbr24bPylm+lmgFx0jKyc0zJ
   +UFSjZvDglggQiH+a5/K6DoOOFBWIdwJz4r3VQDgnm0VOr7cBhgRZZ9dl
   8FnxaArfoRW8LI1f9Wzw6u5N/9WdeekRGbjWU5o/nRsbo33Nk1Tv6ZBdU
   hED6nUFQxP4g1w8xs9x/b3GzMcCS4cWl+1WnBtOGsMUNX8iUyI78xh0bh
   nwXG65GIypBCFk279E8zvK4rA+p8LonL5xX1HLCB8Rqs2hgCGSLufl8Ji
   NSbAoHIYVUe/iPt26r24KhiEbJdrQ/k8Yqy6witMIMGsaHuew4B3zz50C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="380879948"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="380879948"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 13:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925706076"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="925706076"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Oct 2023 13:03:23 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoUZ6-000LqO-2i;
	Thu, 05 Oct 2023 20:03:20 +0000
Date: Fri, 6 Oct 2023 04:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/199 1/1]
 include/uapi/linux/byteorder/big_endian.h:34:26: warning: conversion from
 'unsigned int' to '__le16' {aka 'short unsigned int'} changes value from
 '50331648' to '0'
Message-ID: <202310060350.7DNg4oLb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/199
head:   47b3f0c2a4e23c60d04605d4086a29c0670b25de
commit: 47b3f0c2a4e23c60d04605d4086a29c0670b25de [1/1] Finish 6G support by supporting new scan structures
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231006/202310060350.7DNg4oLb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060350.7DNg4oLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060350.7DNg4oLb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:545,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/netdevice.h:24,
                    from drivers/net/wireless/broadcom/brcm80211/brcmfmac/pno.c:5:
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pno.c: In function 'brcmf_pno_config_v3':
>> include/uapi/linux/byteorder/big_endian.h:34:26: warning: conversion from 'unsigned int' to '__le16' {aka 'short unsigned int'} changes value from '50331648' to '0' [-Woverflow]
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                          ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pno.c:114:29: note: in expansion of macro 'cpu_to_le32'
     114 |         pfn_param.version = cpu_to_le32(BRCMF_PNO_VERSION_3);
         |                             ^~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:34:26: warning: conversion from 'unsigned int' to '__le16' {aka 'short unsigned int'} changes value from '469762048' to '0' [-Woverflow]
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                          ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pno.c:115:28: note: in expansion of macro 'cpu_to_le32'
     115 |         pfn_param.length = cpu_to_le32(sizeof(struct brcmf_pno_param_v3_le));
         |                            ^~~~~~~~~~~


vim +34 include/uapi/linux/byteorder/big_endian.h

5921e6f8809b16 David Howells 2012-10-13  15  
5921e6f8809b16 David Howells 2012-10-13  16  #define __constant_htonl(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  17  #define __constant_ntohl(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  18  #define __constant_htons(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  19  #define __constant_ntohs(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  20  #define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  21  #define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  22  #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  23  #define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  24  #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  25  #define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  26  #define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  27  #define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  28  #define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  29  #define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  30  #define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  31  #define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  32  #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  33  #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13 @34  #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  35  #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  36  #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  37  #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  39  #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  41  #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  43  #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  44  

:::::: The code at line 34 was first introduced by commit
:::::: 5921e6f8809b1616932ca4afd40fe449faa8fd88 UAPI: (Scripted) Disintegrate include/linux/byteorder

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
