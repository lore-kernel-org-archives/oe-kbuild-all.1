Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD063793A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768242409; cv=none; b=Y8jzDee6ebs8B3Hyhq/UtK7rzpHWTnhdrnViGPGtPiuGopufSh8NU9kptpnlT+2fcdyLrS6UatespUHI7Z1xWLQwBYZ6YJ1AjsWGG+i79l7a92iRqlTtjmiLUiHYQu0ntrLhnAvH0QfjM6GKz2p9VZ8bNch6lVRVx/rlOOI+IoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768242409; c=relaxed/simple;
	bh=+anT1yaNFS7+JZ5twIcq/I0wsdfkOEEx9Br5JJoOf6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hpRy0GfrxQLZjPqwSz9CVYT81xLeXRgNZo2WaaKjrcP6SfHCBma4QV8RytYIfbcyZF77cQZmoq62elEah5h16HDBZpAnC4MkaI0oF51ooA9buKqTItoGuk68Uxb1I3lPjvB3aewT1w5IJ5/AODs8Z0jQW/XCllLOsbfzFAqlDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y59jkznP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y59jkznP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768242407; x=1799778407;
  h=date:from:to:cc:subject:message-id;
  bh=+anT1yaNFS7+JZ5twIcq/I0wsdfkOEEx9Br5JJoOf6I=;
  b=Y59jkznPx+KHkKzv+5jX9Sj2I9IinEWqYskwxnp9VpFCpiFeCVM+4ywM
   s/6FoTau1Y3OHaCAJruNJD/NH4FMG9p0gRXhT5hIGHa4JQD83eJxiSxzz
   ybeZYK3OrUHHSq0Tj5btXpZ2MSE1SRDl+a1qNl9em1S4seod5TJ01Phc0
   gRkWAIsgJxuVIbCtRTVnoLf4sjpYzbWCyrepRn/FwNJXUJ8XPWrAFtpdY
   IUVRodH1tog+Af17bicsG+nQmG7E34uOnMRf4eVWah/DhcYkLzF1LRdbX
   t8E6tJL6t6f+5f+0HoLjO39Woyjuu5jDbK/0T6WnISQD2uBHd44BwV25H
   Q==;
X-CSE-ConnectionGUID: +PMul4ZVRjWS1tPrHfZBXw==
X-CSE-MsgGUID: IOlGWcaaQWq3IJihvP0eXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69447442"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69447442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 10:26:47 -0800
X-CSE-ConnectionGUID: +mnCVCiyQTuHtiCxJwgFjQ==
X-CSE-MsgGUID: rg/JvVwQRBqFPoqVXs1g5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204175320"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jan 2026 10:26:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfMck-00000000Dk2-3Bqc;
	Mon, 12 Jan 2026 18:26:42 +0000
Date: Tue, 13 Jan 2026 02:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Mikityanskiy <maxim@isovalent.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:max/vxlan-bigtcp 16/21]
 include/uapi/linux/byteorder/little_endian.h:43:50: warning: cast from
 pointer to integer of different size
Message-ID: <202601130213.jaGZOjR4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   de0493575c7f01a82c2b58b308fae122df5aa143
commit: f5e94535d68e170320fa3ee0da5bc9e0fea45023 [16/21] udp: Support BIG TCP GSO packets where they can occur
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260113/202601130213.jaGZOjR4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130213.jaGZOjR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130213.jaGZOjR4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:14,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/sh/include/uapi/asm/byteorder.h:6,
                    from arch/sh/include/asm/bitops.h:10,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/jiffies.h:7,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from net/netfilter/nf_conntrack_proto_udp.c:8:
   net/netfilter/nf_conntrack_proto_udp.c: In function 'udp_validate_len':
>> include/uapi/linux/byteorder/little_endian.h:43:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      43 | #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
         |                                                  ^
   include/uapi/linux/swab.h:105:38: note: in definition of macro '__swab16'
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:137:21: note: in expansion of macro '__be16_to_cpu'
     137 | #define ___ntohs(x) __be16_to_cpu(x)
         |                     ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: in expansion of macro '___ntohs'
     142 | #define ntohs(x) ___ntohs(x)
         |                  ^~~~~~~~
   net/netfilter/nf_conntrack_proto_udp.c:48:31: note: in expansion of macro 'ntohs'
      48 |         unsigned int udplen = ntohs(hdr);
         |                               ^~~~~
>> include/uapi/linux/byteorder/little_endian.h:43:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      43 | #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
         |                                                  ^
   include/uapi/linux/swab.h:15:19: note: in definition of macro '___constant_swab16'
      15 |         (((__u16)(x) & (__u16)0x00ffU) << 8) |                  \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: in expansion of macro '__swab16'
      43 | #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:137:21: note: in expansion of macro '__be16_to_cpu'
     137 | #define ___ntohs(x) __be16_to_cpu(x)
         |                     ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: in expansion of macro '___ntohs'
     142 | #define ntohs(x) ___ntohs(x)
         |                  ^~~~~~~~
   net/netfilter/nf_conntrack_proto_udp.c:48:31: note: in expansion of macro 'ntohs'
      48 |         unsigned int udplen = ntohs(hdr);
         |                               ^~~~~
>> include/uapi/linux/byteorder/little_endian.h:43:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      43 | #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
         |                                                  ^
   include/uapi/linux/swab.h:16:19: note: in definition of macro '___constant_swab16'
      16 |         (((__u16)(x) & (__u16)0xff00U) >> 8)))
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: in expansion of macro '__swab16'
      43 | #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:137:21: note: in expansion of macro '__be16_to_cpu'
     137 | #define ___ntohs(x) __be16_to_cpu(x)
         |                     ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: in expansion of macro '___ntohs'
     142 | #define ntohs(x) ___ntohs(x)
         |                  ^~~~~~~~
   net/netfilter/nf_conntrack_proto_udp.c:48:31: note: in expansion of macro 'ntohs'
      48 |         unsigned int udplen = ntohs(hdr);
         |                               ^~~~~
>> include/uapi/linux/byteorder/little_endian.h:43:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      43 | #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
         |                                                  ^
   include/uapi/linux/swab.h:107:19: note: in definition of macro '__swab16'
     107 |         __fswab16(x))
         |                   ^
   include/linux/byteorder/generic.h:137:21: note: in expansion of macro '__be16_to_cpu'
     137 | #define ___ntohs(x) __be16_to_cpu(x)
         |                     ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: in expansion of macro '___ntohs'
     142 | #define ntohs(x) ___ntohs(x)
         |                  ^~~~~~~~
   net/netfilter/nf_conntrack_proto_udp.c:48:31: note: in expansion of macro 'ntohs'
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
