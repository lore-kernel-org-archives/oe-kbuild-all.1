Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3B31104
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685345683; x=1716881683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bxPf68CUbjgTJoI8oe0yZRn5IXZ6jf460WkIlv2rs6c=;
  b=kqeJDmhsGBKOm5aqkiEOuCrcrjdadmDp+R9KYdOvdwgFsjZ6hVhapgoC
   6yWU4QfdmfCIPzyIOWpyMvsSvD8qG1Puiu3JnRrMUxPSuZ6oKJViVor0S
   v6yB09sDt6HiCvusZw9iPEdDqWKkEFd4gja5g/if/KBSsgesTo/fKLAHG
   Xym3g+dP3Hp4HII8GBs4R34fc6l4KGiYck8D6BIi7M0pGI7VXTPBBMfb5
   tOiEFFMCbmD2J9EiHbHVlgnuMIh54OB3UcgOlEHHnQ41S67ayTtDBrDFG
   +Kp6rUuBpSE0P/QJMprk0Cnb1RU+ZD3votQtaUT6FnFAcqAiHzGxRKYNY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="339230677"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="339230677"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 00:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="830291736"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="830291736"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 May 2023 00:34:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3XOq-000Kvs-2S;
	Mon, 29 May 2023 07:34:40 +0000
Date: Mon, 29 May 2023 15:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Bersenev <bay@hackerdom.ru>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:queue/5.4 162/169]
 include/uapi/linux/byteorder/big_endian.h:33:26: warning: conversion from
 'unsigned int' to '__le16' {aka 'short unsigned int'} changes value from
 '402653184' to '0'
Message-ID: <202305291511.4WH7CMbR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   2892d1676c18849cfbf4d2ed89f537d299e19af0
commit: d5bf05856227bffc60f12b7ce4fc20f8b2170436 [162/169] cdc_ncm: Implement the 32-bit version of NCM Transfer Block
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230529/202305291511.4WH7CMbR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=d5bf05856227bffc60f12b7ce4fc20f8b2170436
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout d5bf05856227bffc60f12b7ce4fc20f8b2170436
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305291511.4WH7CMbR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/s390/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/s390/include/asm/bitops.h:426,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/net/usb/cdc_ncm.c:41:
   drivers/net/usb/cdc_ncm.c: In function 'cdc_ncm_ndp32':
>> include/uapi/linux/byteorder/big_endian.h:33:26: warning: conversion from 'unsigned int' to '__le16' {aka 'short unsigned int'} changes value from '402653184' to '0' [-Woverflow]
      33 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                          ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/net/usb/cdc_ncm.c:1177:26: note: in expansion of macro 'cpu_to_le32'
    1177 |         ndp32->wLength = cpu_to_le32(sizeof(struct usb_cdc_ncm_ndp32) + sizeof(struct usb_cdc_ncm_dpe32));
         |                          ^~~~~~~~~~~


vim +33 include/uapi/linux/byteorder/big_endian.h

5921e6f8809b16 David Howells 2012-10-13  14  
5921e6f8809b16 David Howells 2012-10-13  15  #define __constant_htonl(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  16  #define __constant_ntohl(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  17  #define __constant_htons(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  18  #define __constant_ntohs(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  19  #define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  20  #define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  21  #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  22  #define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  23  #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  24  #define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  25  #define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  26  #define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  27  #define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  28  #define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  29  #define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  30  #define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  31  #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  32  #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13 @33  #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  34  #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  35  #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  36  #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  37  #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  39  #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  41  #define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  43  

:::::: The code at line 33 was first introduced by commit
:::::: 5921e6f8809b1616932ca4afd40fe449faa8fd88 UAPI: (Scripted) Disintegrate include/linux/byteorder

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
