Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959023BF9F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954567; cv=none; b=MUE5xS+JbIUEctN7OC3vhYlVnCwGXrDXTdebgcET2YMbR397EnoF6I75mL3QhMBpvv2Ki3Qs9qUBZv4DLCnZnl1zWueRdQbzVdlMf8qibt8pL9to+F6vFOt1nxobxzGp/Ia2H/lEFZOEu8u3m9BddJ34VXjDQziTVDUsTxD3+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954567; c=relaxed/simple;
	bh=gQq/jF1HucVczUn/DpKjKtHn9tDY+JB9Vf+q/Pxy4so=;
	h=Date:From:To:Cc:Subject:Message-ID; b=koUtzbOMT1Z+qdcli9pPMPGqHSJrZBX03v/7E9JZr7cb0FPpMQoDG3mvkpDvYWCpUTg7xVJnUDD4YNCr+3I2gVfEvXF88OVQqhryd3i5dtAcTeHxAhDUbSbibA4kvj3TjtWRprC9Vvi8HSEbAoBAneGEW30MdiUG70Hqm/qz0Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzYFnf95; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzYFnf95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767954565; x=1799490565;
  h=date:from:to:cc:subject:message-id;
  bh=gQq/jF1HucVczUn/DpKjKtHn9tDY+JB9Vf+q/Pxy4so=;
  b=YzYFnf95JQjOglHg2miBSiPT4EAb45YRh3nnyS195KGWezONOdymtJFj
   YWNCCGCUm1+qaWHx8TENfg19qcnCRuijJPHA/o0ZtqoiHJUmeEFU6ASfM
   TISCzvtTdLLXp3yALpV6TyDGx0xiq3vugUdCARTWUOMQVLVrlxmOpO4xV
   31jFlCQp+iTsEIwg+VJgHPVEHEPKY9hkmIt4i8o1a9n5fiyVLVZP2+HdN
   L4jQ534wIQpKm3EMLQsAmdyPKb9Y9ktbm+0srZCKz2KF+7DQt5XeULUc5
   Bnu0rTXftFg6nVpSdXsijURbKXxzVrjl96RI0MwFBPdR69c2WVuwraWG3
   A==;
X-CSE-ConnectionGUID: 67ymR/xRQuyNpyiB+859UA==
X-CSE-MsgGUID: 9q8kgn7MRBW/a41mTs2DAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69319296"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69319296"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 02:29:24 -0800
X-CSE-ConnectionGUID: zASW3tOZSyOmU9GHNzSjyQ==
X-CSE-MsgGUID: 416BGufpRuCeTlLcjWXmnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="202555325"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Jan 2026 02:29:22 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve9k7-0000000023I-3EYR;
	Fri, 09 Jan 2026 10:29:19 +0000
Date: Fri, 09 Jan 2026 11:29:04 +0100
From: kernel test robot <lkp@intel.com>
To: Maxim Mikityanskiy <maxim@isovalent.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:max/vxlan-bigtcp 16/21]
 include/uapi/linux/byteorder/little_endian.h:43:50: warning: cast from
 pointer to integer of different size
Message-ID: <202601091129.7xTghKSS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   de0493575c7f01a82c2b58b308fae122df5aa143
commit: f5e94535d68e170320fa3ee0da5bc9e0fea45023 [16/21] udp: Support BIG TCP GSO packets where they can occur
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260109/202601091129.7xTghKSS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091129.7xTghKSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091129.7xTghKSS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:14,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/qrwlock_types.h:6,
                    from arch/x86/include/asm/spinlock_types.h:7,
                    from include/linux/spinlock_types_raw.h:7,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/timer.h:5,
                    from net/netfilter/nf_conntrack_proto_udp.c:8:
   net/netfilter/nf_conntrack_proto_udp.c: In function 'udp_validate_len':
>> include/uapi/linux/byteorder/little_endian.h:43:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      43 | #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
         |                                                  ^
   include/uapi/linux/swab.h:102:54: note: in definition of macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
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
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:14,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/qrwlock_types.h:6,
                    from arch/x86/include/asm/spinlock_types.h:7,
                    from include/linux/spinlock_types_raw.h:7,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/timer.h:5,
                    from nf_conntrack_proto_udp.c:8:
   nf_conntrack_proto_udp.c: In function 'udp_validate_len':
>> include/uapi/linux/byteorder/little_endian.h:43:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      43 | #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
         |                                                  ^
   include/uapi/linux/swab.h:102:54: note: in definition of macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:137:21: note: in expansion of macro '__be16_to_cpu'
     137 | #define ___ntohs(x) __be16_to_cpu(x)
         |                     ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: in expansion of macro '___ntohs'
     142 | #define ntohs(x) ___ntohs(x)
         |                  ^~~~~~~~
   nf_conntrack_proto_udp.c:48:31: note: in expansion of macro 'ntohs'
      48 |         unsigned int udplen = ntohs(hdr);
         |                               ^~~~~


vim +43 include/uapi/linux/byteorder/little_endian.h

5921e6f8809b16 David Howells 2012-10-13  15  
5921e6f8809b16 David Howells 2012-10-13  16  #define __constant_htonl(x) ((__force __be32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  17  #define __constant_ntohl(x) ___constant_swab32((__force __be32)(x))
5921e6f8809b16 David Howells 2012-10-13  18  #define __constant_htons(x) ((__force __be16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  19  #define __constant_ntohs(x) ___constant_swab16((__force __be16)(x))
5921e6f8809b16 David Howells 2012-10-13  20  #define __constant_cpu_to_le64(x) ((__force __le64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  21  #define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  22  #define __constant_cpu_to_le32(x) ((__force __le32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  23  #define __constant_le32_to_cpu(x) ((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  24  #define __constant_cpu_to_le16(x) ((__force __le16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  25  #define __constant_le16_to_cpu(x) ((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  26  #define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  27  #define __constant_be64_to_cpu(x) ___constant_swab64((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  28  #define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  29  #define __constant_be32_to_cpu(x) ___constant_swab32((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  30  #define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  31  #define __constant_be16_to_cpu(x) ___constant_swab16((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  32  #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  33  #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  34  #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  35  #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  36  #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  37  #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  39  #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  41  #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13 @43  #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  44  

:::::: The code at line 43 was first introduced by commit
:::::: 5921e6f8809b1616932ca4afd40fe449faa8fd88 UAPI: (Scripted) Disintegrate include/linux/byteorder

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
