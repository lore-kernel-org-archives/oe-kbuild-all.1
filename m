Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6605F1D547
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLPuJcHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701259318; x=1732795318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3pn44Kj47LNgObZQbru0FfxwsfemenWCri62eJC3UA=;
  b=VLPuJcHlpOswwJzJfduOx1L5uBk9V8evK3VneLtwzeg/PEqr5gx4McxK
   NTfOFOh/p8qm/8O3x8G0gt2vGHzStHoFR3CzB0A/RJvAFdEmYeOmTvPEx
   +ro4+KPo+YnWxDODXp9/JmWxyZNO16Eotcsn0jn++tIVLY+up7qzKOMfq
   DY7VsAmWK9MB9fliL62GKNtIAi5/eqhFR69nc8eJCdHzdsEV39zOXw4Ym
   tASDIDpAQInU01tCG61B95JHv6tXJooCEe9xVbTCXuuOs+Hrn2p6f1UDf
   M1BI25NtNp7bvyw6PJB8esr5KAa+lD+EJphKLK9Fqr+qzrCpAgmdRSXeY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372515847"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="372515847"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762295538"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762295538"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Nov 2023 04:01:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8JGH-0000CE-2f;
	Wed, 29 Nov 2023 12:01:49 +0000
Date: Wed, 29 Nov 2023 20:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nhat Pham <nphamcs@gmail.com>
Subject: [akpm-mm:mm-unstable 179/192] mm/zswap.c:298:22: warning:
 pointer/integer type mismatch in conditional expression ('int' and 'void *')
Message-ID: <202311291908.1zT6gOHh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   cb1d236cb1038fa1bbae9913803f1c655b86d931
commit: 70dd375afcfe1839321ea8a65749404a99f0e773 [179/192] zswap: make shrinking memcg-aware
config: s390-randconfig-r071-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291908.1zT6gOHh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291908.1zT6gOHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291908.1zT6gOHh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zswap.c:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from mm/zswap.c:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from mm/zswap.c:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   mm/zswap.c:298:24: error: call to undeclared function 'obj_cgroup_memcg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
                                 ^
   mm/zswap.c:298:24: note: did you mean 'obj_cgroup_put'?
   include/linux/memcontrol.h:1352:20: note: 'obj_cgroup_put' declared here
   static inline void obj_cgroup_put(struct obj_cgroup *objcg)
                      ^
>> mm/zswap.c:298:22: warning: pointer/integer type mismatch in conditional expression ('int' and 'void *') [-Wconditional-type-mismatch]
           return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   ~~~~
   mm/zswap.c:825:17: error: incomplete definition of type 'struct mem_cgroup'
                   css_get(&memcg->css);
                            ~~~~~^
   include/linux/mm_types.h:33:8: note: forward declaration of 'struct mem_cgroup'
   struct mem_cgroup;
          ^
   13 warnings and 2 errors generated.


vim +298 mm/zswap.c

   294	
   295	/* should be called under RCU */
   296	static inline struct mem_cgroup *mem_cgroup_from_entry(struct zswap_entry *entry)
   297	{
 > 298		return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
