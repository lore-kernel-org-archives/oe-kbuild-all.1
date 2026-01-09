Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03B43328EA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961827; cv=none; b=VxzHfb1fg3gR6HxFegRE6DqWRcueDxerR50c9+LTv8ZZisW4bKESlBtmge0sNikLqv+h+N6GVdUaKuHTQEK8fkRHHMlAWa/NhxDMkRmAjzuhe4XYbFP6Ew2N6FBCCK/rybCYoRuif468IQ67QIRqVamKOUuxP1eDWs0JpMG98as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961827; c=relaxed/simple;
	bh=OyheUqcLiM6OK5T8ILvtunFSbdpZUCtqXfR76OA37ko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ebyjNzxq/9DzPjkbnz0VeQae0zyYqC6oDAom0slUBd8XlIJO9ud+qPxNPRtqK1MKjQpH5sknAeqvVqiA5RZsKDdRpahHJ8NQGczEoQQkhwBLhE2CP/EObstW0PBkj4viPQMqPb+xPaWwMesYg97/xrgUsShxHsfrm4fMqx+8eWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7tyQnta; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7tyQnta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767961826; x=1799497826;
  h=date:from:to:cc:subject:message-id;
  bh=OyheUqcLiM6OK5T8ILvtunFSbdpZUCtqXfR76OA37ko=;
  b=P7tyQntawe64CsfvS86zceVxgqWtMkx1+K0MiHuljwHErQfztUIQMIqq
   cNWpaG+p4PLjUQ5HfGjw6lwdGKoDCNCV06N3kHbR8DqbugGuGt3xhbP1r
   Foi11hZcaYNXDiR7Ztb34/p/uG0isT7mLPei6sRBAbs0Qc99v3QWxU8hJ
   7FEmPlcQvqkcZctU/Bzz1gZZWVEDFwheTN0CatZDw5xh4d1axQ62C79Q0
   3UGgK2F5NpPJRUSI6YXF8IQjz4QOnBPykIsiTD7uc3rtMfvNocZGlzRwf
   xMToWySbo3NlWbYfxxqk89Lem79DxPTgqDt7OyA/1z50Uu64Q/cqrUxSF
   A==;
X-CSE-ConnectionGUID: hHAejhyrTxqDSYrb1R0D1w==
X-CSE-MsgGUID: AVZchp/JSF687RwYLuLRJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68541195"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="68541195"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:30:25 -0800
X-CSE-ConnectionGUID: MuCUuAf+TNqbgfCRBcFgfQ==
X-CSE-MsgGUID: RDy8h4AMQaGv5cS9bY5R6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203481028"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Jan 2026 04:30:24 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veBdF-0000000025Q-1fj8;
	Fri, 09 Jan 2026 12:30:21 +0000
Date: Fri, 09 Jan 2026 13:30:08 +0100
From: kernel test robot <lkp@intel.com>
To: Maxim Mikityanskiy <maxim@isovalent.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:max/vxlan-bigtcp 16/21]
 ./include/uapi/linux/byteorder/big_endian.h:43:42: warning: cast from pointer
 to integer of different size
Message-ID: <202601091333.xHFYoZOw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   de0493575c7f01a82c2b58b308fae122df5aa143
commit: f5e94535d68e170320fa3ee0da5bc9e0fea45023 [16/21] udp: Support BIG TCP GSO packets where they can occur
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260109/202601091333.xHFYoZOw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091333.xHFYoZOw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091333.xHFYoZOw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./include/linux/byteorder/big_endian.h:5,
                    from ./arch/s390/include/uapi/asm/byteorder.h:5,
                    from ./include/asm-generic/bitops/le.h:6,
                    from ./arch/s390/include/asm/bitops.h:213,
                    from ./include/linux/bitops.h:67,
                    from ./arch/s390/include/asm/machine.h:25,
                    from ./arch/s390/include/asm/lowcore.h:13,
                    from ./arch/s390/include/asm/current.h:13,
                    from ./arch/s390/include/asm/preempt.h:5,
                    from ./include/linux/preempt.h:79,
                    from ./arch/s390/include/asm/timex.h:13,
                    from ./include/linux/timex.h:67,
                    from ./include/linux/time32.h:13,
                    from ./include/linux/time.h:60,
                    from ./include/linux/jiffies.h:10,
                    from ./include/linux/ktime.h:25,
                    from ./include/linux/timer.h:6,
                    from net/netfilter/nf_conntrack_proto_udp.c:8:
   net/netfilter/nf_conntrack_proto_udp.c: In function 'udp_validate_len':
>> ./include/uapi/linux/byteorder/big_endian.h:43:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      43 | #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
         |                                          ^
   ./include/linux/byteorder/generic.h:137:21: note: in expansion of macro '__be16_to_cpu'
     137 | #define ___ntohs(x) __be16_to_cpu(x)
         |                     ^~~~~~~~~~~~~
   ./include/linux/byteorder/generic.h:142:18: note: in expansion of macro '___ntohs'
     142 | #define ntohs(x) ___ntohs(x)
         |                  ^~~~~~~~
   net/netfilter/nf_conntrack_proto_udp.c:48:31: note: in expansion of macro 'ntohs'
      48 |         unsigned int udplen = ntohs(hdr);
         |                               ^~~~~


vim +43 ./include/uapi/linux/byteorder/big_endian.h

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
