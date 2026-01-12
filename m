Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076C930E82B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 17:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240488; cv=none; b=cGVAg59cpHuc6WvyKARiZUrZOJWBnELuf2D8yJw7AxJnQpdauzbe2D76nzypj6/UJSTCIT7x+1uZo+3agjk/IVOHplz8ZY5CBcchwdwIqyhUUED9dQmw0W07Q90lpecNeYOWHEO16d0Nc9Y3kqqKeWGpBRdRu4OMQzPErMD+cn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240488; c=relaxed/simple;
	bh=tX3KH/EQZtzmJlhL/zBCKm1risPa0SygRvNX0zpCHUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=exLPM0n8e35Lv6v/rlYeF4fARTgv++wtF7XmZ3QczwgCk+az92CDTx0/rCxxLQZZB30B+AX/3f49C6AVqz8MVt7XeoDuJAUfIVgdxXpDI5kLKRssHmeE8ysdqkt+rqju2QYD4gnhWBInvPPCrx9F1M1cJGAc13YbchRG/b58kDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bn0ZlTyw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bn0ZlTyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768240486; x=1799776486;
  h=date:from:to:cc:subject:message-id;
  bh=tX3KH/EQZtzmJlhL/zBCKm1risPa0SygRvNX0zpCHUo=;
  b=Bn0ZlTyw48H1lhNCJ91ZPA1CXc4dkTVnM37Zqf+68aQQJ/8lhsyOrtJe
   PvTiu1Tsmn0H/dAu95AR5GEgev7FWmeF4LKNhMzCs2DAxLAS6NUk9sd7R
   eJFTOvvg4/sotG/lLqadNNltG9fOuN6bCmBZdm42mXSVCyWi+9jk4T35t
   40jVC7E5qTPG//OTA20TK1+fCfjqoR5TFunQmAyjPf46A7aCD3hJE01oG
   jLr5RiNkLxVdp5cv58Nk+XZ0Od+f1SyAcuPed7Vl7jsvgokbzElYxlUkB
   Z4ATpQ1ubVW25ZOAaaUOyHaUjBCbS29kR1vTxnHBy4UqaxL7C9BJLwY18
   Q==;
X-CSE-ConnectionGUID: /4rfvKn4TFGx8z3uwFOwQg==
X-CSE-MsgGUID: jpGUkK8LS5GgHklCK2L6yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69574895"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69574895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 09:54:45 -0800
X-CSE-ConnectionGUID: X1bdJ0pWQ8qTmrU0xWvZMA==
X-CSE-MsgGUID: h86GSYkOSPCy4EEe9Tfg9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204239761"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jan 2026 09:54:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfM7k-00000000DhE-2u4t;
	Mon, 12 Jan 2026 17:54:40 +0000
Date: Tue, 13 Jan 2026 01:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Mikityanskiy <maxim@isovalent.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:max/vxlan-bigtcp 16/21]
 include/uapi/linux/byteorder/big_endian.h:43:42: warning: cast from pointer
 to integer of different size
Message-ID: <202601130123.lS8duxrn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   de0493575c7f01a82c2b58b308fae122df5aa143
commit: f5e94535d68e170320fa3ee0da5bc9e0fea45023 [16/21] udp: Support BIG TCP GSO packets where they can occur
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601130123.lS8duxrn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130123.lS8duxrn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130123.lS8duxrn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:569,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from net/netfilter/nf_conntrack_proto_udp.c:8:
   net/netfilter/nf_conntrack_proto_udp.c: In function 'udp_validate_len':
>> include/uapi/linux/byteorder/big_endian.h:43:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      43 | #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
         |                                          ^
   include/linux/byteorder/generic.h:137:21: note: in expansion of macro '__be16_to_cpu'
     137 | #define ___ntohs(x) __be16_to_cpu(x)
         |                     ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: in expansion of macro '___ntohs'
     142 | #define ntohs(x) ___ntohs(x)
         |                  ^~~~~~~~
   net/netfilter/nf_conntrack_proto_udp.c:48:31: note: in expansion of macro 'ntohs'
      48 |         unsigned int udplen = ntohs(hdr);
         |                               ^~~~~
--
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:569,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from nf_conntrack_proto_udp.c:8:
   nf_conntrack_proto_udp.c: In function 'udp_validate_len':
>> include/uapi/linux/byteorder/big_endian.h:43:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      43 | #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
         |                                          ^
   include/linux/byteorder/generic.h:137:21: note: in expansion of macro '__be16_to_cpu'
     137 | #define ___ntohs(x) __be16_to_cpu(x)
         |                     ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: in expansion of macro '___ntohs'
     142 | #define ntohs(x) ___ntohs(x)
         |                  ^~~~~~~~
   nf_conntrack_proto_udp.c:48:31: note: in expansion of macro 'ntohs'
      48 |         unsigned int udplen = ntohs(hdr);
         |                               ^~~~~


vim +43 include/uapi/linux/byteorder/big_endian.h

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
5921e6f8809b16 David Howells 2012-10-13  34  #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  35  #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  36  #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  37  #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  39  #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  41  #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13 @43  #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  44  

:::::: The code at line 43 was first introduced by commit
:::::: 5921e6f8809b1616932ca4afd40fe449faa8fd88 UAPI: (Scripted) Disintegrate include/linux/byteorder

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
